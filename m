Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
Date: Thu, 16 Nov 2017 08:54:41 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	hermit.wangheming@hisilicon.com, project-aspen-dev@linaro.org
Subject: Re: [PATCH 0/3] add more clock definitions for hi3798cv200-poplar
 board
Message-ID: <20171116005438.GH11163@dragon>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Wed, Oct 18, 2017 at 07:00:26AM -0400, Jiancheng Xue wrote:
> Add more clock definitions for hi3798cv200-poplar board.
> 
> Younian Wang (1):
>   clk: hisilicon: correct ir clock rate for hi3798cv200 SoC
> 
> tianshuliang (2):
>   clk: hisilicon: add hisi phase clock support
>   clk: hisilicon: add emmc sample and drive clock for hi3798cv200 SoC

Since you haven't applied this series, I will update it with a few more
patches added.  I assume it's late for 4.15 merge window anyway, so I
intend to maintain a branch for all those Hi3798CV200 clock patches.
After the patches are properly reviewed, I can rebase the branch to
4.15-rc and then ask you to pull for next merge window.  Sounds good to
you?

Shawn
