Return-Path: <megous@megous.com>
Subject: Re: [PATCH v2 01/14] ARM: clk: sunxi: Add driver for the H3 THS clock
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-2-megous@megous.com> <20160625071338.GC4000@lukather>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
 Josef Gajdusek <atx@atx.name>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>
Message-ID: <6a37450f-35fe-3296-da4b-10f7d645e2b9@megous.com>
Date: Sat, 25 Jun 2016 17:23:12 +0200
MIME-Version: 1.0
In-Reply-To: <20160625071338.GC4000@lukather>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

I try to base everything on the torvalds's kernel.

I did notice the patches. Is there some main git tree/branch where this
work is tracked in? I'd gladly use it.

Also there's a PLL1 rate application patch, that would need to be ported
to the new CCU code, in the case I would use it as a base for this work.
Given that the new CCU code is your work and it's fresh in your mind, do
you have suggestion how to approach it?

It is [PATCH v2 06/14] in this series.

regards,
  o.

On 25.6.2016 09:13, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Jun 25, 2016 at 05:44:58AM +0200, megous@megous.com wrote:
>> From: Josef Gajdusek <atx@atx.name>
>>
>> This patch adds a driver for the THS clock which is present on the
>> Allwinner H3.
>>
>> Signed-off-by: Josef Gajdusek <atx@atx.name>
> 
> You might not have noticed, but we are currently rewriting the whole
> clock support for the Allwinner SoCs, targetting the H3 as the first
> SoC to use it.
> 
> There's already some support for the H3 THS clock, so please use that
> instead.
> 
> Thanks!
> Maxime
> 
