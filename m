Return-Path: <sboyd@codeaurora.org>
Date: Fri, 19 Aug 2016 12:51:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: Re: [PATCH v2 1/3] clk: meson: Add GXBB AO Clock and Reset
 controller driver
Message-ID: <20160819195148.GF6502@codeaurora.org>
References: <1471514928-3341-1-git-send-email-narmstrong@baylibre.com>
 <1471514928-3341-2-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471514928-3341-2-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Neil Armstrong wrote:
> Adds a Clock and Reset controller driver for the Always-On part
> of the Amlogic Meson GXBB SoC.
> 
> It exports paired Clocks and Resets lines that will be used by
> peripherals in the Always-On subsystem.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Applied to clk-meson-gxbb-ao and merged into clk-next. I applied
this after the dt binding headers to keep things compiling.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
