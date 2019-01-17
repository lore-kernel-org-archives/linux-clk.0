Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184BFC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D73A020851
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 12:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mPT7v3dH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfAQMFt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:05:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60909 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfAQMFt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 07:05:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D7CA425B7E8;
        Thu, 17 Jan 2019 23:05:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547726744; bh=RshCalWzZJKH0vN1zWRyr0wiisP3lMenYFbxegdU/JM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mPT7v3dHhD6W9pLglc3q0+twPIKIUc+dIQ10xbZ9YM6dUZf1EwjdGFSJgeCH9b2Fl
         ebyLMW51dq3slq3JNnl2PqYR5TVKglXQ9Eh6c3U79MfL5P0A2QaX+W/1CUeK7THh0C
         COrJ/GmzPzjRVPd4h28kvY7Wjt+EECF8IVl5eG+0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 471E7940459; Thu, 17 Jan 2019 13:05:42 +0100 (CET)
Date:   Thu, 17 Jan 2019 13:05:42 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH 10/11] arm64: dts: renesas: r8a774c0: Add clkp2 clock to
 CAN nodes
Message-ID: <20190117120541.slymsz47fjkzz3kg@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-11-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547663874-29411-11-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 06:37:53PM +0000, Fabrizio Castro wrote:
> According to the latest information, clkp2 is available on RZ/G2.
> Modify CAN0 and CAN1 nodes accordingly.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Taking your word for the motivation for this change,
this patch seems fine to me but I would like to wait for review
from others.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 3970aaf..326ab3a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -809,8 +809,10 @@
>  				     "renesas,rcar-gen3-can";
>  			reg = <0 0xe6c30000 0 0x1000>;
>  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 916>, <&can_clk>;
> -			clock-names = "clkp1", "can_clk";
> +			clocks = <&cpg CPG_MOD 916>,
> +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> +				 <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";
>  			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
>  			resets = <&cpg 916>;
>  			status = "disabled";
> @@ -821,8 +823,10 @@
>  				     "renesas,rcar-gen3-can";
>  			reg = <0 0xe6c38000 0 0x1000>;
>  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 915>, <&can_clk>;
> -			clock-names = "clkp1", "can_clk";
> +			clocks = <&cpg CPG_MOD 915>,
> +				 <&cpg CPG_CORE R8A774C0_CLK_CANFD>,
> +				 <&can_clk>;
> +			clock-names = "clkp1", "clkp2", "can_clk";
>  			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
>  			resets = <&cpg 915>;
>  			status = "disabled";
> -- 
> 2.7.4
> 
