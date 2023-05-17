Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B1DC77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 17:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjEQRPo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 13:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjEQRPo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 13:15:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A5526B6;
        Wed, 17 May 2023 10:15:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 001EC61B9A;
        Wed, 17 May 2023 17:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7B3C433EF;
        Wed, 17 May 2023 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684343742;
        bh=9rs6w/Oob54rFS5h303MzKdArQ7keaKIcj9JQ+9rSPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pQ8X8cQ+jDSM0y/hAfk+XLx+EKhh5nlULkV9js9gV8dXSfnh6raoHSjBZtnT9/Vng
         QMsLzlkVvkSgjUBlQ+zfAy3qqtOc7NEN/Z+B56Y9fsjostzA6HMCAQmMv9g7nJ1T0K
         OEK4IMLRwe4AJMCflVbrqqII7Z3bjf6ExuF52LtrZhkwb7GForYmzK2sMI6PKsBexl
         Fs6PWcRsIH/PtG67c8aIaJsb1rMPdoWCQTuscfQsHqDwKG7Y3nRSHjE6hPSPQv4vyY
         6ss1rUjVVSppV5TgJCSSDM4ZDJqgLaczx6ikh5dCy3vrYFAAUfae3XrI7VDCoISzBB
         47V94KBVx3OeA==
Date:   Wed, 17 May 2023 18:15:37 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 Audio REFCLK
Message-ID: <20230517-reprise-unroll-e2223cab3846@spud>
References: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
 <20230515-refclk-v1-1-5e89f01d6733@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fpjkaEH5QgyScueG"
Content-Disposition: inline
In-Reply-To: <20230515-refclk-v1-1-5e89f01d6733@ti.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--fpjkaEH5QgyScueG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 01:04:05PM +0530, Jai Luthra wrote:
> Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
> SoC.

This seems fine to me. Perhaps Krzysztof will differ...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../bindings/clock/ti,am62-audio-refclk.yaml       | 44 ++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk=
=2Eyaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> new file mode 100644
> index 000000000000..7c4cf7abe007
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,am62-audio-refclk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI Audio Reference Clock
> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ti,am62-audio-refclk
> +      - const: syscon
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1

Just a minor comment, usually reg appears after compatible and before
anything else.

Thanks,
Conor.

--fpjkaEH5QgyScueG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGULuQAKCRB4tDGHoIJi
0pN+AQCK25LofJxlOqk3RCnFS5ehEs5mn79haSqJQVsO1t/PQwEAw6Df6VhcCPPC
1cgNG50q2gr3/+KpIJiKwbVSCPucNwM=
=sQzT
-----END PGP SIGNATURE-----

--fpjkaEH5QgyScueG--
