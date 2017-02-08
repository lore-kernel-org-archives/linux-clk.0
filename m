Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:35285 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbdBHXUl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2017 18:20:41 -0500
Date: Wed, 8 Feb 2017 17:20:39 -0600
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
Subject: Re: [PATCH v2 01/10] Document: DT: mediatek: multiple base address
 support for sysirq
Message-ID: <20170208232039.p7ljh4krndtn2edy@rob-hp-laptop>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
 <1486383336-16892-2-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486383336-16892-2-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 06, 2017 at 08:15:27PM +0800, Mars Cheng wrote:
> This describes how to specify multiple base addresses for sysirq
> in mediatek platforms.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> ---
>  .../interrupt-controller/mediatek,sysirq.txt       |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 9d1d72c..1718454 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -18,16 +18,21 @@ Required properties:
>  	"mediatek,mt2701-sysirq"
>  - interrupt-controller : Identifies the node as an interrupt controller
>  - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
> +- #intpol-bases: Indicate how many base addresses to be used, default is 1.

There is no point in this. It can either be implied by the compatible 
string or you just try to get the resource for the 2nd region. (Or in DT 
terms, get the size of reg.)

>  - interrupt-parent: phandle of irq parent for sysirq. The parent must
>    use the same interrupt-cells format as GIC.
>  - reg: Physical base address of the intpol registers and length of memory
> -  mapped region.
> +  mapped region. Could be multiple bases here. Ex: mt6797 needs 2 reg, others
> +  need 1. If not set, the default is 1.
>  
>  Example:
> -	sysirq: interrupt-controller@10200100 {
> -		compatible = "mediatek,mt6589-sysirq", "mediatek,mt6577-sysirq";
> +	sysirq: intpol-controller@10200620 {
> +		compatible = "mediatek,mt6797-sysirq",
> +			     "mediatek,mt6577-sysirq";
>  		interrupt-controller;
>  		#interrupt-cells = <3>;
> +		#intpol-bases = <2>;
>  		interrupt-parent = <&gic>;
> -		reg = <0 0x10200100 0 0x1c>;
> +		reg = <0 0x10220620 0 0x20>,
> +		      <0 0x10220690 0 0x10>;
>  	};
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
