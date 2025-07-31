# kotlinrun
![](./Icon.png)

A convenient shell script to compile and run Kotlin files directly with automatic file watching and recompilation.

![](./Slide1.png)

## Features

- 🚀 **One-command execution**: Compile and run Kotlin files in a single command
- 👀 **File watching**: Automatically recompiles and runs when the source file changes  
- 🔔 **macOS notifications**: Get notified when compilation succeeds or fails
- 🔊 **Voice feedback**: Audio feedback during build process (macOS only)
- 🧹 **Auto cleanup**: Automatically removes generated JAR files on exit
- ⚡ **Fast iteration**: Perfect for quick testing and development

## Requirements

- **Kotlin compiler** (`kotlinc`) - Install via [Kotlin official website](https://kotlinlang.org/docs/command-line.html)
- **Java Runtime Environment** (JRE) - To run the compiled JAR files
- **fswatch** (for file watching) - Install via `brew install fswatch` on macOS
- **macOS** (for notifications and voice feedback - optional features)

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd kotlinrun
   ```

2. Make the script executable:
   ```bash
   chmod +x kotlinrun.sh
   ```

3. (Optional) Add to your PATH for global usage:
   ```bash
   cp kotlinrun.sh /usr/local/bin/kotlinrun
   ```

## Usage

### Basic Usage
```bash
./kotlinrun.sh main.kt
```

### Global Usage (if added to PATH)
```bash
kotlinrun main.kt
```

### What happens when you run it:
1. The script compiles your Kotlin file into a JAR
2. Runs the compiled application
3. Starts watching the file for changes
4. Automatically recompiles and runs when you save changes
5. Press `Ctrl+C` to stop watching and exit

### Example Output
```
2024-01-15 10:30:15 OK> Target file : "main.kt"
2024-01-15 10:30:15 Ready to compile kotlin file "main.kt"
2024-01-15 10:30:15 Compiling kotlin file main.kt
2024-01-15 10:30:16 OK> Compiling kotlin file ^_^b
2024-01-15 10:30:16 Run the application main.jar
2024-01-15 10:30:16 <START> ===================================================

Hello World!

2024-01-15 10:30:16 <END> =====================================================
```

![](./demo.gif)

## Error Handling

The script includes comprehensive error handling:
- Validates that the input file exists
- Checks compilation success before running
- Provides clear error messages with timestamps
- Automatically cleans up on interruption (Ctrl+C)

