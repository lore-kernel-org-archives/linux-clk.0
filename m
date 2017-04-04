Return-Path: <Alexey_Firago@mentor.com>
Subject: Re: [PATCH 2/2] clk: vc5: Add support for IDT VersaClock 5P49V5935
To: Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut
	<marek.vasut@gmail.com>
References: <1491311788-31905-1-git-send-email-alexey_firago@mentor.com>
 <1491311788-31905-3-git-send-email-alexey_firago@mentor.com>
 <72c66927-0acf-c888-2b4b-906a6c27e15c@gmail.com>
 <CAMuHMdUOtY5i0_BoS7cKYzWKpA_fF3VssN4bZnNyFB117EpacQ@mail.gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
From: Alexey Firago <alexey_firago@mentor.com>
Message-ID: <4f4bb110-7870-c5b3-9051-47ae8eece9df@mentor.com>
Date: Tue, 4 Apr 2017 16:36:45 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUOtY5i0_BoS7cKYzWKpA_fF3VssN4bZnNyFB117EpacQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 04.04.2017 16:23, Geert Uytterhoeven wrote:
> On Tue, Apr 4, 2017 at 3:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 04/04/2017 03:16 PM, Alexey Firago wrote:
>>> +     switch (vc5->model) {
>>> +     case IDT_VC5_5P49V5923:
>>> +     case IDT_VC5_5P49V5933:
>>> +             vc5->clk_fod_cnt = 2;
>>> +             vc5->clk_out_cnt = 3;
>>> +             break;
>>> +     case IDT_VC5_5P49V5935:
>>> +             vc5->clk_fod_cnt = 4;
>>> +             vc5->clk_out_cnt = 5;
>>> +             break;
>>> +     default:
>>> +             /* Should never go here */
>>> +             dev_err(&client->dev, "unsupported IDT VC5 ID specified\n");
>>> +             return -EINVAL;
>>> +     }
>>> +
>>>       vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>>>       if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
>>>               return -EPROBE_DEFER;
>
>>> @@ -744,7 +772,7 @@ static int vc5_probe(struct i2c_client *client,
>>>       return 0;
>>>
>>>  err_clk:
>>> -     if (vc5->model == IDT_VC5_5P49V5933)
>>> +     if (vc5->model == IDT_VC5_5P49V5933 || vc5->model == IDT_VC5_5P49V5935)
>>
>> Maybe we should introduce some sort of flags to describe the VC
>> properties instead of using the model all over the place ?
>
> Yep, a structure describing the features (incl. fod_cnt and out_cnt), to be
> pointed to by clk_vc5_of_match[].data.

Ok, will rework and resend.

Thanks,
Alexey
