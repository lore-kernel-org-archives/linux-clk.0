Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABC6C77B75
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 06:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239562AbjELGrj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 02:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbjELGri (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:47:38 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFD51FDF;
        Thu, 11 May 2023 23:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683874057; x=1715410057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8xCLpgBlCHyRbWeXw0cN2RgWjw7cDE8G0Egfc8IHxes=;
  b=UPUFZcQgcasBmFnjwadBWfouiByo6vSCHlQofsv8ytNyOWuzMsnm3cm0
   bI002BoX1hw8ldimV7c2BxhJjQRu6z1Qn/CSl3TFvC6d/Pi80phfUexfw
   SQWwoqQZB8fEnnBY19BtpUHK31geZmor4SWpqj3TC38Pea5Knw03lcjhJ
   lBHvUZlQVWuUOsY+ei+zlPv73nmxp/f99NPIIDZ7HsAjFnqB5igHLg/kj
   r3srlIAsYSBD+KOFtUscM5wiMF/2/duZtxulVkdRt0kEPF139M4DlF0EB
   YKruXQbJwj5EWJml76foCv8XzO08EFZY6XO2vWoPtRwHf6pOuV2l8FRin
   w==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="213558597"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 23:47:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 23:47:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 23:47:33 -0700
Date:   Fri, 12 May 2023 07:47:13 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Message-ID: <20230512-uproar-external-49a9e793fbc4@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-4-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="flOQef4Xu+ZZp6dZ"
Content-Disposition: inline
In-Reply-To: <20230512022036.97987-4-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--flOQef4Xu+ZZp6dZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 10:20:32AM +0800, Xingyu Wu wrote:
> Add PLL clock inputs from PLL clock generator.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.3b.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed=
, one must be fixed:
	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.3b.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional f=
ailed, one must be fixed:
	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_l=
rck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too=
 short
	'i2stx_bclk_ext' was expected
	'i2stx_lrck_ext' was expected
	'i2srx_bclk_ext' was expected
	'i2srx_lrck_ext' was expected
	'tdm_ext' was expected
	'mclk_ext' was expected
	'pll0_out' was expected
	From schema: /Documentation/devicetree/bindings/clock/starfive,jh7110-sysc=
rg.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.2a.dtb: clock-controller@13020000: clocks: 'oneOf' conditional failed=
, one must be fixed:
	[[19], [20], [21], [22], [23], [24], [25], [26], [27]] is too short
	From schema: Documentation/devicetree/bindings/clock/starfive,jh7110-syscr=
g.yaml
/tmp/tmp.KDlzwQM5ma/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive=
-2-v1.2a.dtb: clock-controller@13020000: clock-names: 'oneOf' conditional f=
ailed, one must be fixed:
	['osc', 'gmac1_rmii_refin', 'gmac1_rgmii_rxin', 'i2stx_bclk_ext', 'i2stx_l=
rck_ext', 'i2srx_bclk_ext', 'i2srx_lrck_ext', 'tdm_ext', 'mclk_ext'] is too=
 short
	'i2stx_bclk_ext' was expected
	'i2stx_lrck_ext' was expected
	'i2srx_bclk_ext' was expected
	'i2srx_lrck_ext' was expected
	'tdm_ext' was expected
	'mclk_ext' was expected
	'pll0_out' was expected
	Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml

This binding change is incompatible with the existing devicetrees for
the visionfive 2.

--flOQef4Xu+ZZp6dZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF3g8QAKCRB4tDGHoIJi
0gVTAP4ywjId2CiomCDX0yZX5w9nULUiXIqcBDWgQBBXFqkvyQD/WHWtGF5tiLCz
7eU2v5Dumdw3jJo+4zXQPGPu7O5ZFQs=
=7jKj
-----END PGP SIGNATURE-----

--flOQef4Xu+ZZp6dZ--
