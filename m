Return-Path: <yorksun@freescale.com>
Subject: Re: [Patch v5] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
To: Guenter Roeck <linux@roeck-us.net>, <sboyd@codeaurora.org>
References: <1443141970-21084-1-git-send-email-yorksun@freescale.com>
 <5604A9F0.2050600@roeck-us.net>
CC: <linux-clk@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrey Filippov
	<andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
From: York Sun <yorksun@freescale.com>
Message-ID: <56056268.2010507@freescale.com>
Date: Fri, 25 Sep 2015 08:04:08 -0700
MIME-Version: 1.0
In-Reply-To: <5604A9F0.2050600@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>



On 09/24/2015 06:57 PM, Guenter Roeck wrote:
> On 09/24/2015 05:46 PM, York Sun wrote:
>> SI5338 is a programmable clock generator. It has 4 sets of inputs,
>> PLL, multisynth and dividers to make 4 outputs. This driver splits
>> them into multiple clocks to comply with common clock framework.
>>
>> See Documentation/devicetree/bindings/clock/silabs,si5338.txt for
>> details.
>>
<snip>

>> +static inline u8 si5338_reg_read(struct si5338_driver_data *drvdata, u16 reg)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = regmap_read(drvdata->regmap, reg, &val);
>> +	if (ret) {
>> +		dev_err(&drvdata->client->dev,
>> +			"unable to read from reg %02x: return %d\n", reg, ret);
>> +		return 0;
> 
> Why hide the error ?

I need to comb through all the return values as you suggested. Thanks.

York
