from fastcore.script import call_parse

@call_parse
def main(
    source_model: str = "gpt2",  # model to run
    layer_no: int = 0,  # layer to extract
    head_no: int = 0,  # head to extract
    greetings: bool = False,  # do you send greetings?
):
    pass
