Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750776AbeFBGcn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 2 Jun 2018 02:32:43 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Faiz Abbas <faiz_abbas@ti.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180530141133.3711-6-faiz_abbas@ti.com>
Cc: robh+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        paul@pwsan.com, t-kristo@ti.com, faiz_abbas@ti.com
References: <20180530141133.3711-1-faiz_abbas@ti.com>
 <20180530141133.3711-6-faiz_abbas@ti.com>
Message-ID: <152792116258.225090.5279546677198775320@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 5/6] ARM: dts: Add generic interconnect target module node for
 MCAN
Date: Fri, 01 Jun 2018 23:32:42 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Faiz Abbas (2018-05-30 07:11:32)
> diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
> index bfc82636999c..57b8dc0fe719 100644
> --- a/arch/arm/boot/dts/dra76x.dtsi
> +++ b/arch/arm/boot/dts/dra76x.dtsi
> @@ -11,6 +11,25 @@
>  / {
>         compatible =3D "ti,dra762", "ti,dra7";
>  =

> +       ocp {
> +
> +               target-module@0x42c00000 {

Drop the 0x on unit address. Also, it should match the first register
property. And what is a "target-module"?

> +                       compatible =3D "ti,sysc-dra7-mcan";
> +                       ranges =3D <0x0 0x42c00000 0x2000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       reg =3D <0x42c01900 0x4>,
> +                             <0x42c01904 0x4>,
>=20
