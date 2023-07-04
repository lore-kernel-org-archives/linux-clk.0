Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A4FEB64D9
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jul 2023 22:21:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbjGDWVh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jul 2023 18:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjGDWVg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jul 2023 18:21:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409E2E7B;
        Tue,  4 Jul 2023 15:21:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D33E061377;
        Tue,  4 Jul 2023 22:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18497C433C7;
        Tue,  4 Jul 2023 22:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688509295;
        bh=zvw/mDYDfWKt/nf/UUoCzc7T+cN/cP+PxbobIDiIOi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=npI6pcNrbUA4mj2CaNsW7a7zk2p+EAuvqUSDtutievqz13OIqEqndI6Y96UHpEKJK
         6p8Lva217GO4RGvmHaGlg6F62xj2VftUhpqy8yFw7iO8s52m3IaIICRMrdMkD9p1cu
         pLRFSDX6Z7fmvtLm1J09qzjizPatJsxM4c82jT6z02i8mT5MYcXb1GHmvWwrsyz/1v
         yzk26wPz3GzagAZ5CcSu7m/xr+uwaD/PQzcSa5rg4cnwPSHNpIE01lknG4C9AcQwqG
         y8oBN9jXU6SCYOK4FslwLfPwUBTqXr6elFOYY5Hh7cE4tMYUMIcTZdtev+PXtzcOBd
         gs9Sdp0koxdyg==
Date:   Tue, 4 Jul 2023 23:21:29 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
Message-ID: <20230704-parcel-pavestone-71900e35406d@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X3k1Y95kYeIlaDWM"
Content-Disposition: inline
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--X3k1Y95kYeIlaDWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 02:46:05PM +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> Add documentation to describe StarFive System Controller Registers.
>=20
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

This looks good to me now, thanks for keeping at it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--X3k1Y95kYeIlaDWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKSbaQAKCRB4tDGHoIJi
0jUMAQD0A+H8IQHZIwrq+Sf+CN/N8upNkt9KWFQ+VUDQIj2I4wEA3OF7RUmRKi+D
M1wrWqJq6nv5GGSCGs51WUljkCkBTAA=
=o3Mb
-----END PGP SIGNATURE-----

--X3k1Y95kYeIlaDWM--
