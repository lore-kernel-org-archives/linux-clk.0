Return-Path: <vz@mleia.com>
Message-ID: <56BA7A06.4020807@mleia.com>
Date: Wed, 10 Feb 2016 01:45:10 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, stigge@antcom.de, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: lpc32xx: do not prepare clock "0"
References: <1455042550-18766-1-git-send-email-slemieux.tyco@gmail.com>	 <20160209190309.GD31947@codeaurora.org> <1455048667.19294.5.camel@localhost>
In-Reply-To: <1455048667.19294.5.camel@localhost>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sylvain,

On 09.02.2016 22:11, Sylvain Lemieux wrote:
> On Tue, 2016-02-09 at 11:03 -0800, Stephen Boyd wrote:
>> On 02/09, slemieux.tyco@gmail.com wrote:
>>> From: Sylvain Lemieux <slemieux@tycoint.com>
>>>
>>> The following errors are display in the console during the power-on:
>>> [    0.000000] lpc32xx_usb_clk_init: failed to register (null) clock: -12
>>> [    0.000000] lpc32xx_clk_init: failed to register (null) clock: -12
>>>
>>> There is no need to prepare clock "0"; the first clock used is 1;
>>>
>>> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
>>> ---
>>
>> Do you mean register instead of prepare? Change looks ok
>> otherwise.
>>
> Should read register in the description;
> I will submit a new version of the patch tomorrow.
> 

thanks for catching this leftover after renumbering clocks starting from 1.

Feel free to add to v2

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
