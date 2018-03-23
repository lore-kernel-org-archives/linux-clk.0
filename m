Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44724 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751221AbeCWI0F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 04:26:05 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Lin Huang <hl@rock-chips.com>
Cc: dbasehore@chromium.org, shawn.lin@rock-chips.com,
        briannorris@chromium.org, linux-rockchip@lists.infradead.org,
        dianders@chromium.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/2] clk: rockchip: assign correct id for pclk_ddr and hclk_sd in rk3399
Date: Fri, 23 Mar 2018 09:26:00 +0100
Message-ID: <5398945.fsProPGqoW@phil>
In-Reply-To: <1521511589-17844-1-git-send-email-hl@rock-chips.com>
References: <1521511589-17844-1-git-send-email-hl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 20. März 2018, 03:06:28 CET schrieb Lin Huang:
> Since hclk_sd and pclk_ddr source clock from CPLL or GPLL,
> and these two PLL may change their frequency. If we do not
> assign right id to pclk_ddr and hclk_sd, they will alway use
> default cur register value, and may get the frequency
> exceed their signed off frequency. So assign correct Id
> for them, then we can assign frequency for them in dts.
> 
> Change-Id: I6c4d15d37ddabe4ed34e2351cf26e660672ae9ee
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 4.17 after dropping the Change-Id

Thanks
Heiko
