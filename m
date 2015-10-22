Return-Path: <yorksun@freescale.com>
Subject: Re: [Patch v6] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
To: Michael Turquette <mturquette@baylibre.com>, <sboyd@codeaurora.org>
References: <1444240750-30842-1-git-send-email-yorksun@freescale.com>
 <20151022164642.20687.57688@quantum>
CC: <linux-clk@vger.kernel.org>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	"Andrey Filippov" <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
From: York Sun <yorksun@freescale.com>
Message-ID: <5629163B.7010708@freescale.com>
Date: Thu, 22 Oct 2015 10:00:43 -0700
MIME-Version: 1.0
In-Reply-To: <20151022164642.20687.57688@quantum>
Content-Type: text/plain; charset="utf-8"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>



On 10/22/2015 09:46 AM, Michael Turquette wrote:
> Hello York Sun,
> 
> Quoting York Sun (2015-10-07 10:59:10)
>> +static const struct clk_ops si5338_xtal_ops = {
>> +       .prepare = si5338_xtal_prepare,
> 
> There are many instances of .prepare where there is no matching
> .unprepare. Why is that? And what are these .prepare callbacks doing?
> Are they changing rates or just enabling the clock signals?

These prepare functions set hardware according to their parent clock rate. For
example, xtal has different setting if the oscillator frequency is above 26MHz,
under 11MHz, and between.

There is no need to unprepare them.

> 
>> +static const struct clk_ops si5338_clkout_ops = {
>> +       .prepare = si5338_clkout_prepare,
>> +       .unprepare = si5338_clkout_unprepare,
>> +       .enable = si5338_clkout_enable,
>> +       .disable = si5338_clkout_disable,
> 
> This is an i2c device, so I'm confused how an .enable or .disable
> callback is appropriate.

This clock chip can disable individual clock output, and internal module. User
can select various state for disabled clock, i.e. high, low, high-Z, etc. At
least, disabling unused clkout saves power. Make sense?

> 
>> +       /*
>> +        * To form clock names, concatentate name prefix with each name.
>> +        * The result string is up to MAX_NAME_LENGTH including termination.
>> +        */
>> +
>> +       /* Register xtal input clock */
>> +       if (!IS_ERR_OR_NULL(drvdata->pxtal)) {
>> +               strlcpy(register_name, drvdata->name_prefix, MAX_NAME_PREFIX);
>> +               strncat(register_name, si5338_input_names[4], STRNCAT_LENGTH);
>> +               drvdata->pxtal_name = __clk_get_name(drvdata->pxtal);
> 
> I don't really understand what's going on here. Why is this necessary?
> Are you not able to get this info from DT?

I write this driver with two things in mind. One is device tree, the other is
platform data. If device tree is used, everything comes from device tree.
Otherwise, the data has to come from platform data. The code you are seeing is
to create unique clock names with prefix, passed from either device tree, or
platform data. This is needed when multiple chips exist. I am using a system
with four identical si5338 chips on one card, with up to 15 cards per system.

I am open to suggestion to do things other ways.

York
