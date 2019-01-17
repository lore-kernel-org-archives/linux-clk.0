Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541EDC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21EE220851
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="arnUbred"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfAQL7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:59:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60766 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfAQL7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 06:59:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 38FBC25B760;
        Thu, 17 Jan 2019 22:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547726388; bh=7jAemxdwaDAqNUtU7Bl/0y3TPn9jB3LsDxYRkP0wL6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arnUbredTTBph7O6wmVrqsVrBiKGqP3ep4X/QwZUPno90JqNH24UtOAIExGvRIdL+
         s13xEeXTjDgfBaoWsI63rBh0Pqq8pJmrfgCD1C7n6BL0nFFL/AEKbi0/0D209nzHfy
         rbUSQqo9IDJd1j9TJP5D1+JztrPr8tYPoCI0XAFQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4F4D1940459; Thu, 17 Jan 2019 12:59:46 +0100 (CET)
Date:   Thu, 17 Jan 2019 12:59:46 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
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
        linux-clk@vger.kernel.org, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH 07/11] arm64: dts: renesas: cat875: Add ethernet support
Message-ID: <20190117115945.bmlaoeoqvsmdqqot@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547663874-29411-8-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 06:37:50PM +0000, Fabrizio Castro wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> This patch adds ethernet support to the sub board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/cat875.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
> index a41d0d8..805ffa7 100644
> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -7,4 +7,34 @@
>  
>  / {
>  	model = "Silicon Linux sub board for CAT874 (CAT875)";
> +
> +	aliases {
> +		ethernet0 = &avb;
> +	};
> +};
> +
> +&avb {
> +	pinctrl-0 = <&avb_pins>;
> +	pinctrl-names = "default";
> +	renesas,no-ether-link;

Is the renesas,no-ether-link required?

My understanding is that "the property should only be used when a
board does not provide a proper AVB_LINK signal". And from my reading
of the schematic it looks like that signal may be provided on this board.

That said, I have an outstanding patch for this for E3/Ebisu which
I have not applied because I am unsure of its correctness.

[PATCH] arm64: dts: renesas: ebisu: Remove renesas, no-ether-link property
https://patchwork.kernel.org/patch/10692755/

Similar patches have been applied for other boards.
f.e:

[PATCH] arm64: dts: renesas: salvator-x: Remove renesas, no-ether-link property
https://git.kernel.org/torvalds/c/87c059e9c39d

> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii";
> +	status = "okay";
> +
> +	phy0: ethernet-phy@0 {
> +		rxc-skew-ps = <1500>;
> +		reg = <0>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&pfc {
> +	avb_pins: avb {
> +		mux {
> +			groups = "avb_mii";
> +			function = "avb";
> +		};
> +	};
>  };
> -- 
> 2.7.4
> 
