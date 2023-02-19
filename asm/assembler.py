class Instruction:
    def __init__(self, word):
        self.word = word
        match word:
            case "swp":
                self.opcode = '0'
            case "add":
                self.opcode = '1'
            case "sub":
                self.opcode = '2'
            case "and":
                self.opcode = '3'
            case "or":
                self.opcode = '4'
            case "inc":
                self.opcode = '5'
            case "not":
                self.opcode = '6'
            case "lsl":
                self.opcode = '7'
            case "lsr":
                self.opcode = '8'
            case "jmp":
                self.opcode = '9'
            case "jz":
                self.opcode = 'A'
            case "jnz":
                self.opcode = 'B'
            case "jn":
                self.opcode = 'C'
            case "jnn":
                self.opcode = 'D'
            case "ld":
                self.opcode = 'E'
            case "st":
                self.opcode = 'F'
            case _:
                raise Exception("Invalid instruction")

# turn a list of words into a list of instructions
def generate_instr(words):
    instructions = []

    for i, word in enumerate(words):
        try:
            instructions.append(Instruction(word.lower()))
        except Exception as e:
            print("Error on line {}: {} '{}'".format(i + 1, e, word))

    return instructions

if __name__ == "__main__":
    with open("./in.asm") as f:
        words = f.read().split()
        instructions = generate_instr(words)
        with open("out.hex", "w") as f:
            for instruction in instructions:
                f.write(instruction.opcode + " \\\\ {}\n".format(instruction.word))