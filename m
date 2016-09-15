Return-Path: <elfring@users.sourceforge.net>
Subject: Re: [PATCH 3/4] clk/Renesas-MSTP: Less function calls in
 cpg_mstp_clocks_init() after error detection
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
 <CAMuHMdX=We-N--Fc0KWD_p8AmnBMYDW9b560VGKi+SZ5k85e9A@mail.gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <50646b53-663f-f77f-a79e-2422b5687688@users.sourceforge.net>
Date: Thu, 15 Sep 2016 22:40:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX=We-N--Fc0KWD_p8AmnBMYDW9b560VGKi+SZ5k85e9A@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

> It's perfectly legal to call kfree() on a NULL pointer.

I know this function property well.


>> * Split a condition check for memory allocation failures so that
>>   each pointer from these function calls will be checked immediately.
>>
>>   See also background information:
>>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>>   Link: https://cwe.mitre.org/data/definitions/754.html
>>
>> * Return directly after a call of the function "kzalloc" failed
>>   at the beginning.
> 
> Both calls are already close together.

Can it be that an other software development concern is eventually
overlooked because of this "neighbourship" (or is categorised with
a lower priority)?

I suggest to reconsider this design detail if it is really acceptable
for the safe implementation of such a software module.

* How much will it matter in general that one function call was performed
  in this use case without checking its return values immediately?

* Should it usually be determined quicker if a required resource like
  memory could be acquired before trying the next allocation?


> In addition, your patch increases the LoC, IMHO without improving the code.

I find this consequence still debatable.


>> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
>> index 1fdc44b..6c82e0e 100644
>> --- a/drivers/clk/renesas/clk-mstp.c
>> +++ b/drivers/clk/renesas/clk-mstp.c
>> @@ -167,10 +167,12 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
>>         unsigned int i;
>>
>>         group = kzalloc(sizeof(*group), GFP_KERNEL);
>> +       if (!group)
>> +               return;
>> +
>>         clks = kmalloc_array(MSTP_MAX_CLOCKS, sizeof(*clks), GFP_KERNEL);
>> -       if (group == NULL || clks == NULL) {
>> +       if (!clks) {
>>                 kfree(group);
>> -               kfree(clks);
>>                 return;
>>         }

Is this update suggestion worth for another look?

Regards,
Markus
