Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34946 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751465AbdBIAe4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2017 19:34:56 -0500
Date: Wed, 8 Feb 2017 18:34:45 -0600
From: Rob Herring <robh@kernel.org>
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Jades Shih <jades.shih@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>
Subject: Re: [PATCH v2 03/10] Document: DT: Add bindings for mediatek MT6797
 SoC Platform
Message-ID: <20170209003445.r63ueytw3zoybru5@rob-hp-laptop>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
 <1486383336-16892-4-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486383336-16892-4-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 06, 2017 at 08:15:29PM +0800, Mars Cheng wrote:
> This adds dt-binding documentation for Mediatek MT6797. Only
> include very basic items, gic, uart timer and cpu.

For the subject: 

"dt-bindings: arm: Add Mediatek MT6797 SoC Platform"

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  3 files changed, 6 insertions(+)
