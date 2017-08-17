Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34995 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753147AbdHQVEs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Aug 2017 17:04:48 -0400
Date: Thu, 17 Aug 2017 16:04:45 -0500
From: Rob Herring <robh@kernel.org>
To: weiyi.lu@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/9] dt-bindings: ARM: Mediatek: Document bindings for
 MT2712
Message-ID: <20170817210445.y34gpxbqixt6qswr@rob-hp-laptop>
References: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
 <1502779370-30150-2-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502779370-30150-2-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 15, 2017 at 02:42:42PM +0800, weiyi.lu@mediatek.com wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> This patch adds the binding documentation for apmixedsys, bdpsys,
> imgsys, imgsys, infracfg, mcucfg, mfgcfg, mmsys, pericfg, topckgen,
> vdecsys and vencsys for Mediatek MT2712.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
>  .../bindings/arm/mediatek/mediatek,bdpsys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,imgsys.txt      |  1 +
>  .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
>  .../bindings/arm/mediatek/mediatek,jpgdecsys.txt   | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,mcucfg.txt      | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,mfgcfg.txt      | 22 ++++++++++++++++++++++
>  .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
>  .../bindings/arm/mediatek/mediatek,pericfg.txt     |  1 +
>  .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
>  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  1 +
>  .../bindings/arm/mediatek/mediatek,vencsys.txt     |  1 +
>  12 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,jpgdecsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mcucfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt

Acked-by: Rob Herring <robh@kernel.org>
