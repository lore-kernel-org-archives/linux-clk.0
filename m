Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34901 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753635AbdHQVJb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2017 17:09:31 -0400
Date: Thu, 17 Aug 2017 16:09:28 -0500
From: Rob Herring <robh@kernel.org>
To: weiyi.lu@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 5/9] dt-bindings: soc: add MT2712 power dt-bindings
Message-ID: <20170817210928.3np4vrmww56ovs6b@rob-hp-laptop>
References: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
 <1502779370-30150-6-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502779370-30150-6-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 15, 2017 at 02:42:46PM +0800, weiyi.lu@mediatek.com wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> Add power dt-bindings for MT2712.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |  3 +++
>  include/dt-bindings/power/mt2712-power.h           | 26 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt2712-power.h

Acked-by: Rob Herring <robh@kernel.org>
