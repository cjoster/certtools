# Troubleshooting Typical TLS Certificate issues


| Error Message | What's wrong | How to fix it |
| - | - | - |
| Certificate is expired | The certificate has expired. | <ol><li>Double check system-clock.</li><li>Use `view_cert` to verify the dates on the certificate</li><li>Submit your CSR or regenerate your certificate with correct dates.</lu></ol> |
| Certificate is not yet valid | You somehow have managed to get a future-valid certificate | Check system clocks |
