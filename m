Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0D3C0015E
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 17:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbjG1RKS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 13:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235488AbjG1RKR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 13:10:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E8D35B0;
        Fri, 28 Jul 2023 10:09:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11F72621BF;
        Fri, 28 Jul 2023 17:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8045C433C8;
        Fri, 28 Jul 2023 17:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690564190;
        bh=SXejYXaAZ4GyHrjgSzFQsSPl50CtyiFEvgiICxRytCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJaMFweVlB38fpubvsVipnDJiHV3BiVpSFNrlwSxtEyl2l6z6pENUETrSG1VfnLiH
         2ztMk3LKaWP4p/HA9+vVkqtteydxbdR6r+UwGYfu3DTUxR/+IyR7qqUj4e5M7DFUV/
         bWV/ShsWdAfHTxR44uZKXSLOLwIwEceoV1AReid3vH7DOPBtYINJQ8FTzt2qzePnUB
         T05s7C2YLhzf3ARQIsiPoXftH1dPcYQMuXj/gGAWxrqII8PZEl+5LT+3zg+7xPotdC
         1DTrARLSpJrNcIuNOGL/ri03ovIizWsKFo7K7pR0MprvXZiNn4R/KaQTnh0RXglqoy
         9qzHelxQTNiUA==
Date:   Fri, 28 Jul 2023 18:09:45 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH] dt-bindings: clock: xlnx,versal-clk: drop select:false
Message-ID: <20230728-geologic-vending-836dbceeee87@spud>
References: <20230728165923.108589-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n2nes34cEsEA2WN1"
Content-Disposition: inline
In-Reply-To: <20230728165923.108589-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--n2nes34cEsEA2WN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 06:59:23PM +0200, Krzysztof Kozlowski wrote:
> select:false makes the schema basically ignored and not effective, which
> is clearly not what we want for a device binding.
>=20
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock d=
river")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for spotting it!
Validation of the other patch seems to function as intended with this
applied.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> ---
>=20
> Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>  Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index e9cf747bf89b..04ea327d5313 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -14,8 +14,6 @@ description: |
>    reads required input clock frequencies from the devicetree and acts as=
 clock
>    provider for all clock consumers of PS clocks.
> =20
> -select: false
> -
>  properties:
>    compatible:
>      oneOf:
> --=20
> 2.34.1
>=20

--n2nes34cEsEA2WN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMP2WQAKCRB4tDGHoIJi
0nUpAQDumoe1TTNjt3WHWnwpEOmwvvRlQd3uIYODGU7sxqwBjQEAyHtoosnaKD8l
93WfbkVIvBKL3Di0Md8yGLm0yjxbyQc=
=+FoO
-----END PGP SIGNATURE-----

--n2nes34cEsEA2WN1--
