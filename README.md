# **Explicação do Script de Limpeza para HD-Player**  

Este arquivo `.bat` foi criado para **limpar silenciosamente** rastros deixados pelo **HD-Player.exe** (um emulador Android) e programas portáteis associados. Ele remove arquivos temporários, cache, logs, entradas de registro e outros resíduos sem exibir mensagens na tela.  

---

## **Como o Script Funciona**  

### **1. Configuração Inicial**  
```batch
@echo off
setlocal enabledelayedexpansion
```  
- **`@echo off`** → Desativa a exibição dos comandos no prompt.  
- **`setlocal enabledelayedexpansion`** → Permite o uso de variáveis dinâmicas (não essencial aqui, mas útil em scripts mais complexos).  

---

### **2. Limpeza de Arquivos Temporários**  
```batch
del /f /q "%TEMP%\*" >nul 2>&1
del /f /q "%TEMP%\*.*" >nul 2>&1
```  
- **`del /f /q`** → Exclui arquivos forçadamente (`/f`) e silenciosamente (`/q`).  
- **`%TEMP%`** → Pasta temporária do Windows.  
- **`>nul 2>&1`** → Redireciona erros e saídas para evitar mensagens.  

---

### **3. Remoção de Arquivos Relacionados ao HD-Player**  
```batch
del /f /q "%APPDATA%\*HD-Player*" >nul 2>&1
del /f /q "%LOCALAPPDATA%\*HD-Player*" >nul 2>&1
```  
- **`%APPDATA%` e `%LOCALAPPDATA%`** → Pastas onde programas armazenam configurações e cache.  
- Remove qualquer arquivo com **"HD-Player"** no nome.  

---

### **4. Limpeza de Histórico Recente**  
```batch
del /f /q "%USERPROFILE%\Recent\*.lnk" >nul 2>&1
del /f /q "%USERPROFILE%\Recent\CustomDestinations\*.customDestinations-ms" >nul 2>&1
del /f /q "%USERPROFILE%\Recent\AutomaticDestinations\*.automaticDestinations-ms" >nul 2>&1
```  
- **`%USERPROFILE%\Recent`** → Armazena atalhos de arquivos abertos recentemente.  
- Remove **Jump Lists** (histórico de programas usados).  

---

### **5. Limpeza do Prefetch (Rastros de Execução)**  
```batch
del /f /q "C:\Windows\Prefetch\HD-PLAYER*.pf" >nul 2>&1
```  
- **Prefetch** → Otimiza a inicialização de programas, mas guarda rastros.  
- Remove arquivos `.pf` relacionados ao **HD-Player**.  

---

### **6. Exclusão de Pastas Residuais**  
```batch
rd /s /q "%APPDATA%\HD-Player" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\HD-Player" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Temp\HD-Player" >nul 2>&1
```  
- **`rd /s /q`** → Remove pastas recursivamente (`/s`) sem confirmação (`/q`).  

---

### **7. Limpeza do Registro do Windows**  
```batch
reg delete "HKCU\Software\HD-Player" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "HD-Player" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v "HD-Player" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /v "HD-Player" /f >nul 2>&1
```  
- **`HKCU`** → Registro do usuário atual.  
- **`HKLM`** → Registro global da máquina.  
- Remove:  
  - Chaves do **HD-Player** no registro.  
  - Entradas de **inicialização automática** (Run).  
  - Histórico de comandos executados (**RunMRU**).  
  - Cache de nomes de programas (**MuiCache**).  

---

### **8. Finalização**  
```batch
exit
```  
- Encerra o script sem mensagens.  

---

## **Observações Importantes**  
✅ **Execução Silenciosa**: Todas as operações são feitas sem exibir mensagens.  
⚠ **Privilégios Administrativos**: Alguns comandos (como limpar `HKLM` ou `Prefetch`) exigem **Admin**.  
🔒 **Segurança**: Não afeta outros programas, apenas rastros do **HD-Player**.  

Para usar, **salve como `.bat` e execute como Administrador** para máxima eficiência.
