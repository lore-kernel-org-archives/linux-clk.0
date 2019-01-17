Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6EDC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D17582054F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 11:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IJDolZhK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbfAQLLz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 06:11:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60111 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfAQLLy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 06:11:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7370525B760;
        Thu, 17 Jan 2019 22:11:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547723509; bh=hPshUkVrJYqBAJ1MQKD8+WaOrXi1RDZHWSs+lcwqS/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IJDolZhKOnCylP8jy4UQCPQwbTFwmAqlDKx1xrJYT/CWXkD+43kBh+xMwxnenYZLQ
         877Am+byOGsUp1bN5asPPgZVSk+ZMXCmsSHXFjoBMQKYk8qj0a2LP0qvzdXuKPqyOY
         4ozYyB9xLQA0fCpy7w3TAEhDmJZexFNR0rYeFB0I=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C4EAC940459; Thu, 17 Jan 2019 12:11:47 +0100 (CET)
Date:   Thu, 17 Jan 2019 12:11:47 +0100
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
Subject: Re: [PATCH 06/11] arm64: dts: renesas: r8a774c0-cat874: Add uSD
 support
Message-ID: <20190117111147.vb3lkdmgx24zusjx@verge.net.au>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547663874-29411-7-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 16, 2019 at 06:37:49PM +0000, Fabrizio Castro wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> This patch adds uSD card support.

Can I confirm that SDHI0 is wired up to a uSD slot?

I ask because if that is the case then this patch looks good to me.
But if it is wired up to a full-size SD slot then I believe
a wp-gpio (write protect) should be described.

> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 50 +++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index c545ce5..477a56b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  #include "r8a774c0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "Silicon Linux RZ/G2E 96board platform (CAT874)";
> @@ -26,6 +27,29 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x78000000>;
>  	};
> +
> +	vcc_sdhi0: regulator-vcc-sdhi0 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDHI0 Vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vccq_sdhi0: regulator-vccq-sdhi0 {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "SDHI0 VccQ";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <3300000 1
> +			  1800000 0>;
> +	};
>  };
>  
>  &extal_clk {
> @@ -37,6 +61,18 @@
>  		groups = "scif2_data_a";
>  		function = "scif2";
>  	};
> +
> +	sdhi0_pins: sd0 {
> +		groups = "sdhi0_data4", "sdhi0_ctrl";
> +		function = "sdhi0";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi0_pins_uhs: sd0_uhs {
> +		groups = "sdhi0_data4", "sdhi0_ctrl";
> +		function = "sdhi0";
> +		power-source = <1800>;
> +	};
>  };
>  
>  &scif2 {
> @@ -45,3 +81,17 @@
>  
>  	status = "okay";
>  };
> +
> +&sdhi0 {
> +	pinctrl-0 = <&sdhi0_pins>;
> +	pinctrl-1 = <&sdhi0_pins_uhs>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&vcc_sdhi0>;
> +	vqmmc-supply = <&vccq_sdhi0>;
> +	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> -- 
> 2.7.4
> 
