Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:44538 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbeGaVGO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jul 2018 17:06:14 -0400
Date: Tue, 31 Jul 2018 13:24:26 -0600
From: Rob Herring <robh@kernel.org>
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, yingjoe.chen@mediatek.com,
        mars.cheng@mediatek.com, eddie.huang@mediatek.com,
        linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v4 05/10] clk: mediatek: Add dt-bindings for MT8183 clocks
Message-ID: <20180731192426.GA8792@rob-hp-laptop>
References: <1533015487-60189-1-git-send-email-erin.lo@mediatek.com>
 <1533015487-60189-6-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1533015487-60189-6-git-send-email-erin.lo@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 31, 2018 at 01:38:02PM +0800, Erin Lo wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> Add MT8183 clock dt-bindings, include topckgen, apmixedsys,
> infracfg and subsystem clocks.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8183-clk.h | 413 +++++++++++++++++++++++++++++++++
>  1 file changed, 413 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8183-clk.h
> 
> diff --git a/include/dt-bindings/clock/mt8183-clk.h b/include/dt-bindings/clock/mt8183-clk.h
> new file mode 100644
> index 0000000..bacad53
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt8183-clk.h
> @@ -0,0 +1,413 @@
> +/* SPDX-License-Identifier: GPL-2.0

This should be a separate comment from the copyright. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> + *
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Weiyi Lu <weiyi.lu@mediatek.com>
> + */
