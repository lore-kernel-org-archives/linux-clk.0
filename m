Return-Path: <neidhard.kim@lge.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
To: Rob Herring <robh@kernel.org>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
 <20160628205518.GF3737@rob-hp-laptop>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>
From: Jongsung Kim <neidhard.kim@lge.com>
Message-ID: <577356E8.30009@lge.com>
Date: Wed, 29 Jun 2016 14:04:40 +0900
MIME-Version: 1.0
In-Reply-To: <20160628205518.GF3737@rob-hp-laptop>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 2016년 06월 29일 05:55, Rob Herring wrote:
> On Fri, Jun 24, 2016 at 01:12:52PM +0900, Jongsung Kim wrote:
>> There is no way to set additional flags for a DT-initialized fixed-
>> factor-clock, and it can be problematic i.e., when the clock rate
>> needs to be changed. [1][2]
>>
>> This patch introduces an optional dt-binding named "clock-flags" to
>> be used for passing any needed flags from dts.
> I don't think we want this in DT. If we did, the flags would need some 
> documentation about what the flags mean.
Thanks for your comment. It looks not that big deal to provide a little documentation..? Some of the flags looks safe to be removed. Thinking of only fixed-factor-clock, most of them can be removed.
