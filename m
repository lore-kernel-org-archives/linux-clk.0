Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 17:52:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jongsung Kim <neidhard.kim@lge.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
Message-ID: <20160825005221.GK19826@codeaurora.org>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
 <20160628205518.GF3737@rob-hp-laptop>
 <146714872010.89261.1969853552594659808@resonance>
 <5773736D.3060405@lge.com>
 <20160702002030.GF27880@codeaurora.org>
 <5779C056.3020209@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <5779C056.3020209@lge.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Jongsung Kim wrote:
> On 2016년 07월 02일 09:20, Stephen Boyd wrote:
> > Do you actually have an IC on the board that is doing some fixed
> > factor calculation? Or is this a clk driver design where we are
> > listing out each piece of an SoC's clk controller in DT?
> >
> The SoC has several PLLs of identical design, and one of them is divided
> to half and used for CPUs. The fixed-factor-clock represents the divider.
> 

Ok, so it sounds like we can have the driver that registers the
CPU PLL also register the fixed factor clk? I fail to see why we
need this from DT in that case.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
