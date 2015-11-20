Return-Path: <jacob@teenage.engineering>
MIME-Version: 1.0
In-Reply-To: <564E386F.9020209@gmail.com>
References: <1447940410-9728-1-git-send-email-jacob@teenage.engineering> <564E386F.9020209@gmail.com>
From: Jacob Siverskog <jacob@teenage.engineering>
Date: Fri, 20 Nov 2015 09:31:05 +0100
Message-ID: <CAEnXRPvwaLpxrK33PaKhbhttEFs2njn-Tmf6WKzT7b2LyyEpFA@mail.gmail.com>
Subject: Re: [PATCH] clk: si5351: Add setup steps
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Jens Rudberg <jens@teenage.engineering>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sebastian!

On Thu, Nov 19, 2015 at 10:00 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:
> On 19.11.2015 14:40, Jacob Siverskog wrote:
>> This is according to figure 12 ("I2C Programming Procedure") in
>> "Si5351A/B/C Data Sheet"
>> (https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf).
>>
>> Without the PLL soft reset, we were unable to get three outputs
>> working at the same time.
>>
>> According to Silicon Labs support, performing PLL soft reset will only
>> be noticable if the PLL parameters have been changed.
>>
>> Signed-off-by: Jacob Siverskog <jacob@teenage.engineering>
>> Signed-off-by: Jens Rudberg <jens@teenage.engineering>
>> ---
>>  drivers/clk/clk-si5351.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>
> Jacob,
>
> thanks for the patches! However, besides Mareks comments I have
> some more below.
>
>> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
>> index e346b22..110de35 100644
>> --- a/drivers/clk/clk-si5351.c
>> +++ b/drivers/clk/clk-si5351.c
>> @@ -1091,6 +1091,11 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
>>       si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
>>                       SI5351_CLK_POWERDOWN, 0);
>>
>> +     /* do a pll soft reset on both plls, needed in some cases to get all
>> +      * outputs running */
>> +     si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
>> +                      SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
>> +
>>       dev_dbg(&hwdata->drvdata->client->dev,
>>               "%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
>>               __func__, clk_hw_get_name(hw), (1 << rdiv),
>> @@ -1359,6 +1364,14 @@ static int si5351_i2c_probe(struct i2c_client *client,
>>               return PTR_ERR(drvdata->regmap);
>>       }
>>
>> +     /* Disable outputs */
>> +     si5351_reg_write(drvdata, SI5351_OUTPUT_ENABLE_CTRL, 0xff);
>> +
>> +     /* Power down all output drivers */
>> +     for (n = 0; n < 8; n++) {
>> +             si5351_reg_write(drvdata, SI5351_CLK0_CTRL + n, 0x80);
>> +     }
>
> Is disabling outputs and clock drivers required?
>
> If we disable the clocks here unconditionally, it will
> break those systems that require specific outputs to be always
> enabled. Consider one clock output driving your SoC or similar.
>
> If it is really required, you'll have to mention that in the
> patch description and we need to find a way to tag specific
> outputs to be never disabled.

The only change that we needed in order to get our setup working
was the PLL soft reset. I added the other bits to conform more to
the recommended programming procedure. Let's skip the output
disabling and power down in order to not break the use case you're
mentioning.


Thanks, Jacob

>
> Sebastian
>
>>       /* Disable interrupts */
>>       si5351_reg_write(drvdata, SI5351_INTERRUPT_MASK, 0xf0);
>>       /* Ensure pll select is on XTAL for Si5351A/B */
>>
>
