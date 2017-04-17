Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:32955 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753387AbdDQJTY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2017 05:19:24 -0400
Received: by mail-lf0-f50.google.com with SMTP id 88so15771567lfr.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2017 02:19:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] ARM: dts: r8a7791: Add GyroADC bindings
To: Marek Vasut <marek.vasut@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
 <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
Cc: linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <776957e7-0500-3fc2-f6bc-1b2ba0e6594c@cogentembedded.com>
Date: Mon, 17 Apr 2017 12:19:21 +0300
MIME-Version: 1.0
In-Reply-To: <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello!

On 4/16/2017 7:57 PM, Marek Vasut wrote:

> Add bindings for the GyroADC block and it's associated clock.

    Well, I already spoke to you about the bindings on IRC...

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm/boot/dts/r8a7791.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 4d0c2ce59900..1b099dbc9eef 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -776,6 +776,15 @@
>  		status = "disabled";
>  	};
>
> +	adc: adc@e6e54000 {

    Why not label it "gyroadc:"?

> +		compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
> +		reg = <0 0xe6e54000 0 64>;

    s/64/0x40/.

[...]
> @@ -1133,6 +1142,13 @@
>  			clock-frequency = <0>;
>  		};
>
> +		/* GyroADC clock */
> +		adc_clk: adc_clk {

    We geberally skip the "_clk" suffix in the clock node names, so that the 
clock name generated from the node name doesn't have this suffix.

[...]

MBR, Sergei

