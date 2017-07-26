Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 25 Jul 2017 17:36:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 05/10] clk: sunxi-ng: h3: gate then ungate PLL CPU clk
 after rate change
Message-ID: <20170726003650.GH2146@codeaurora.org>
References: <20170723102749.17323-1-icenowy@aosc.io>
 <20170723102749.17323-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170723102749.17323-6-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/23, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> This patch utilizes the new PLL clk notifier to gate then ungate the
> PLL CPU clock after rate changes. This should prevent any system hangs
> resulting from cpufreq changes to the clk.
> 
> Reported-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Icenowy Zheng <icenowy@aosc.io>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
