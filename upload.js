import { writeFile, mkdir } from "fs/promises";
import path from "path";
import formidable from "formidable";

export const config = {
  api: {
    bodyParser: false,
  },
};

export default async (req, res) => {
  if (req.method !== "POST") {
    res.status(405).json({ error: "Método não permitido" });
    return;
  }

  const uploadDir = path.join("/tmp", "uploads");
  await mkdir(uploadDir, { recursive: true });

  const form = formidable({ multiples: false, uploadDir });
  form.parse(req, async (err, fields, files) => {
    if (err) {
      res.status(500).json({ error: "Erro no upload" });
      return;
    }

    const ipaFile = files.ipa;
    if (!ipaFile) {
      res.status(400).json({ error: "Nenhum arquivo enviado" });
      return;
    }

    const fileName = ipaFile.originalFilename;
    const ipaPath = path.join(uploadDir, fileName);

    await writeFile(ipaPath, await ipaFile.toBuffer());

    // URL pública simulada - na Vercel, /tmp não é persistente
    const ipaUrl = `https://${req.headers.host}/api/download?file=${encodeURIComponent(fileName)}`;

    // Criar manifest.plist
    const manifest = `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>items</key>
  <array>
    <dict>
      <key>assets</key>
      <array>
        <dict>
          <key>kind</key>
          <string>software-package</string>
          <key>url</key>
          <string>${ipaUrl}</string>
        </dict>
      </array>
      <key>metadata</key>
      <dict>
        <key>bundle-identifier</key>
        <string>com.seudominio.dynamic</string>
        <key>bundle-version</key>
        <string>1.0</string>
        <key>kind</key>
        <string>software</string>
        <key>title</key>
        <string>Meu App</string>
      </dict>
    </dict>
  </array>
</dict>
</plist>`;

    const manifestPath = path.join(uploadDir, `${fileName}.plist`);
    await writeFile(manifestPath, manifest);

    const manifestUrl = `itms-services://?action=download-manifest&url=https://${req.headers.host}/api/download?file=${encodeURIComponent(fileName)}.plist`;

    res.status(200).json({ installUrl: manifestUrl });
  });
};
