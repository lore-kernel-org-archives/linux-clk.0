Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH] clk: davinci: psc-da830: fix USB0 48MHz PHY clock
 registration
To: Stephen Boyd <sboyd@kernel.org>, David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>
CC: Linux clk Mailing List <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List
	<linux-arm-kernel@lists.infradead.org>
References: <20180507113457.4716-1-nsekhar@ti.com>
 <152642368847.237094.1884631416189964435@swboyd.mtv.corp.google.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <9f8a876b-6a66-687c-f83f-51b8d896c50a@ti.com>
Date: Wed, 16 May 2018 10:44:14 +0530
MIME-Version: 1.0
In-Reply-To: <152642368847.237094.1884631416189964435@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wednesday 16 May 2018 04:04 AM, Stephen Boyd wrote:
> Quoting Sekhar Nori (2018-05-07 04:34:57)
>> USB0 48MHz PHY clock registration fails on DA830 because the
>> da8xx-cfgchip clock driver cannot get a reference to USB0
>> LPSC clock.
>>
>> The USB0 LPSC needs to be enabled during PHY clock enable. Setup
>> the clock lookup correctly to fix this.
>>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> ---
> 
> Applied to clk-next
> 
> Did this need a fixes tag? And should it go into 4.17 final? Or it's not
> causing problems right now?

We have not switched DaVinci to use common clock framework still. So no,
this does not cause problems right now. All drivers/clk/davinci/*
patches can be included for v4.18.

Although if you are sending a v4.17 pull request to Linus anyway, and
can include this, I would not mind it ;) We don't need stable backports
definitely, so no need to add a Fixes: tag.

Thanks,
Sekhar
