Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20150504125331.GB3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-4-git-send-email-wens@csie.org> <20150504125331.GB3274@lukather>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 4 May 2015 23:15:21 +0800
Message-ID: <CAGb2v64Khq9gW78JYDZUW_Ae7-3Qz5dkXKosbc65XN=+k_BrWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mfd: sun6i-prcm: Add support for PRCM found on
 Allwinner A80 SoC
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 4, 2015 at 8:53 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Fri, May 01, 2015 at 12:10:04AM +0800, Chen-Yu Tsai wrote:
>> This patch adds support for the PRCM on the A80 SoC. There is little
>> to no document for this at the moment. Only register offsets are
>> available. However with some testing, the clock and reset controls
>> seem to be the similar to the ones on the A31.
>>
>> One thing that needs verifying is whether the apbs divider is the same
>> as the A31 or the A23. The lowest divider is different between those
>> 2 implementations.
>
> Is this commit log still true now that we have access to documentation
> the PRCM?

Oops, forgot to update this one....

We have all documentation concerning the clocks.

ChenYu
