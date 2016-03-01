Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH 26/41] clk: efm32gg: Remove CLK_IS_ROOT
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-27-git-send-email-sboyd@codeaurora.org>
 <20160301192651.GE2613@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <56D5EF92.1080108@codeaurora.org>
Date: Tue, 1 Mar 2016 11:37:54 -0800
MIME-Version: 1.0
In-Reply-To: <20160301192651.GE2613@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 03/01/2016 11:26 AM, Uwe Kleine-König wrote:
> On Tue, Mar 01, 2016 at 11:00:11AM -0800, Stephen Boyd wrote:
>> This flag is a no-op now. Remove usage of the flag.
> I believe you, but still it would be nice to point out at least in the
> cover letter (that I didn't receive) the commit that made CLK_IS_ROOT a
> no-op.
>
>

That would be too many Cc people on the cover letter. Thanks for the faith!

http://lkml.kernel.org/r/1454463733-25281-1-git-send-email-sboyd@codeaurora.org

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
