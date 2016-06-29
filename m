Return-Path: <neidhard.kim@lge.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
 <20160628205518.GF3737@rob-hp-laptop>
 <146714872010.89261.1969853552594659808@resonance>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>
From: Jongsung Kim <neidhard.kim@lge.com>
Message-ID: <5773736D.3060405@lge.com>
Date: Wed, 29 Jun 2016 16:06:21 +0900
MIME-Version: 1.0
In-Reply-To: <146714872010.89261.1969853552594659808@resonance>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 2016년 06월 29일 06:18, Michael Turquette wrote:
> Quoting Rob Herring (2016-06-28 13:55:18)
>> On Fri, Jun 24, 2016 at 01:12:52PM +0900, Jongsung Kim wrote:
>>> There is no way to set additional flags for a DT-initialized fixed-
>>> factor-clock, and it can be problematic i.e., when the clock rate
>>> needs to be changed. [1][2]
>>>
>>> This patch introduces an optional dt-binding named "clock-flags" to
>>> be used for passing any needed flags from dts.
>> I don't think we want this in DT. If we did, the flags would need some 
>> documentation about what the flags mean.
> Flags are specific to Linux implementation, so I agree with Rob. Better
> to create a compatible string for your hardware that bakes in the flags.

Thank you for your comment, Mike. This conversation starts from lacking method to set CLK_SET_RATE_PARENT from DT. I understand compatible string can be a solution. But.. if someone starts talking about lacking method to set another flag, i.e., CLK_SET_PARENT_GATE, then we'll need another compatible string list.
How do you think about defining possible required subset of the flags and using some more neutral flag-names acceptable in DT?
