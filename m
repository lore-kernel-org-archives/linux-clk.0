Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Apr 2017 12:56:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.12 (take two)
Message-ID: <20170405195605.GN18246@codeaurora.org>
References: <1490952253-10963-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490952253-10963-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 03/31, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit cecbe87d73006cb321dec79b349e3fefd1a80962:
> 
>   clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0 (2017-03-21 11:12:23 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.12-tag2
> 
> for you to fetch changes up to bb1953067c05be30a605ee1d5b05a2677735bb37:
> 
>   clk: renesas: rcar-gen3-cpg: Add support for RCLK on R-Car H3 ES2.0 (2017-03-30 13:26:02 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v4.12 (take two)
> 
>   - Add support for the Clock Pulse Generator / Module Standby and
>     Software Reset module on revision ES2.0 of the R-Car H3 SoC, which
>     differs from ES1.x in some areas.
> 
> Note that this pull request is on top of my previous pull request for
> v4.12, which accidentally had a wrong version number in the subject
> line, and which I believe you haven't pulled yet.

Thanks. I pulled both by pulling this one tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
