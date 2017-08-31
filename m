Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39792 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751307AbdHaXUf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2017 19:20:35 -0400
Date: Thu, 31 Aug 2017 16:20:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joseph Chen <chenjh@rock-chips.com>
Cc: gnurou@gmail.com, linus.walleij@linaro.org,
        dmitry.torokhov@gmail.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        broonie@kernel.org, zhangqing@rock-chips.com, robh+dt@kernel.org,
        lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
        wdc@rock-chips.com, tony.xie@rock-chips.com,
        linux-input@vger.kernel.org, mark.rutland@arm.com,
        w.egorov@phytec.de, linux-clk@vger.kernel.org,
        a.zummo@towertech.it, alexandre.belloni@free-electrons.com,
        rtc-linux@googlegroups.com
Subject: Re: [RESEND v9 05/12] clk: Kconfig: Name RK805 in Kconfig for
 COMMON_CLK_RK808
Message-ID: <20170831232032.GI21656@codeaurora.org>
References: <1502848628-27757-1-git-send-email-chenjh@rock-chips.com>
 <1502848803-22954-1-git-send-email-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502848803-22954-1-git-send-email-chenjh@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Joseph Chen wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> The RK808 and RK805 PMICs are using a similar register map.
> We can reuse the clk driver for the RK805 PMIC. So let's add
> the RK805 in the Kconfig description.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
