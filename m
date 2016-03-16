Return-Path: <sboyd@codeaurora.org>
Date: Wed, 16 Mar 2016 13:30:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mason <slash.tmp@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160316203018.GQ25972@codeaurora.org>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org>
 <20160304152711.GR8418@lukather>
 <20160304171841.GF24999@codeaurora.org>
 <20160308221320.GI8418@lukather>
 <20160315221601.GJ25972@codeaurora.org>
 <56E91EA4.7030603@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56E91EA4.7030603@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 03/16, Mason wrote:
> On 15/03/2016 23:16, Stephen Boyd wrote:
> > 
> > Applied to clk-next.
> 
> For the record, I will state again that I find it quite sub-optimal
> to resort to dynamic allocation for small temporary pointer arrays.
> 
> A fortiori when one considers that getting the patch right required
> several attempts.
> 

Feel free to send the patch and then we can discuss and test. For
the record, I was waiting for Maxime or Chen-Yu to speak up if
they would prefer that approach, but nothing happened. Usually
patches spur discussions better than comments.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
