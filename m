Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
Date: Fri, 5 May 2017 17:49:09 +0200
MIME-Version: 1.0
In-Reply-To: <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Am 05.05.2017 um 09:49 schrieb Stefan Wahren:
> Hello Uwe,
>
> Am 05.05.2017 um 09:25 schrieb Uwe Kleine-König:
>> Hello Stefan,
>>
>> On Thu, May 04, 2017 at 02:25:07PM +0200, Stefan Wahren wrote:
>>>        ref_io1                            1            1  
>>> 320000000          0 0
>> That means your ref_io1 is running at 320 MHz which my patch should
>> prevent. Are you sure it is applied?
> sorry for the mess in the dumps.
>
> Your patch works fine regarding to ref_io1. I made 3 dumps:
>
> 1. without any patch ( ref_io1 320000000 )
> 2. with my ref_xtal patch ( ref_io1 288000000 )
> 3. with your patch ( ref_io1 288000000 )
>
> I assume you looked at the wrong dump.
>

Uwe and i made some investigations regards to this issue. The busy bit
of the HW_CLKCTRL_SSP3 was high after boot up, but this shouldn't be the
case. I have the suspicion that there is an issue during clock init or
in the mxs clock driver.

Duckbill (Linux 4.11 Mainline)

HW_SSP2_TIMING    0x80014070 00000209
HW_CLKCTRL_HBUS   0x80040060 00000003
HW_CLKCTRL_SSP0   0x80040090 00000005
HW_CLKCTRL_SSP1   0x800400A0 80000001
HW_CLKCTRL_SSP2   0x800400B0 00000002
HW_CLKCTRL_SSP3   0x800400C0 A0000001
HW_CLKCTRL_EMI    0x800400F0 00000102
HW_CLKCTRL_FRAC0  0x800401B0 5E5B5513
HW_CLKCTRL_CLKSEQ 0x800401D0 00004104

@Uwe: Additionaly applying "spi: mxs: implement runtime pm" to this
patch also doesn't fix the bit error.

Regards Stefan
