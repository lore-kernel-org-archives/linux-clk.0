Return-Path: <dongas86@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160612132928.GG20243@tiger>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
 <1465396420-27064-5-git-send-email-aisheng.dong@nxp.com> <20160612113627.GC20243@tiger>
 <20160612121303.GE32690@shlinux2> <20160612132928.GG20243@tiger>
From: Dong Aisheng <dongas86@gmail.com>
Date: Sun, 12 Jun 2016 22:51:58 +0800
Message-ID: <CAA+hA=SG1OViVLeZGVBT=eteWE3t8bUYv=sqotVQkF-apNcDFA@mail.gmail.com>
Subject: Re: [PATCH 05/11] clk: imx: refine the powerup_set bit of clk-pllv3
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, anson.huang@nxp.com,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jun 12, 2016 at 9:29 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Sun, Jun 12, 2016 at 08:13:03PM +0800, Dong Aisheng wrote:
>> I understand your point.
>> How about using power_bit and powerup_set?
>> * @power_bit:   pll power bit offset
>
> I'm fine with the name, but the comment should be fixed, since we are
> actually using it as a bit mask instead of offset.
>

Yes, i can change to:
* @power_bit:   pll power bit mask
* @powerup_set: set power_bit to power up the PLL

Regards
Dong Aisheng

> Shawn
>
>> * @powerup_set: set power_bit to power up the PLL
>
