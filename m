Return-Path: <sboyd@codeaurora.org>
Date: Tue, 6 Sep 2016 18:17:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] rockchip clock changes for 4.9 part 1
Message-ID: <20160907011737.GU12510@codeaurora.org>
References: <2115968.yvb8ppzjmL@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2115968.yvb8ppzjmL@phil>
List-ID: <linux-clk.vger.kernel.org>

On 09/06, Heiko Stuebner wrote:
> Hi Mike, Stephen,
> 
> please find below the pull request with main Rockchip-releated clock
> changes for 4.9.
> 
> The signed tag should hopefully explain the contents sufficiently,
> so if nothing stands out please pull.
> 
> On the matter of critical clocks, I'm still hoping for the handover type
> to materialize soonish and am hoping of doing the conversion in one go,
> instead of making everything critical now and then having to go through
> the list yet again.

Hmm... ok it sounds like we should look into finishing that off
then. I can't seem to recall why we didn't merge the handoff part
though so I'll have to go look back on that.

> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:
> 
>   Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.9-rockchip-clk1
> 
> for you to fetch changes up to 7b0f9e357ac838f640b10fb3db1ac35d9a5fa8de:
> 
>   clk: rockchip: use the dclk_vop_frac clock ids on rk3399 (2016-09-04 23:48:19 +0200)

Pulled, thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
