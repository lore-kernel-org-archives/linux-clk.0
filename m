Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75915EB64D7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 19:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjFMTzy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 15:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239405AbjFMTzx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 15:55:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3110173C;
        Tue, 13 Jun 2023 12:55:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4604963A4E;
        Tue, 13 Jun 2023 19:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C030C433F0;
        Tue, 13 Jun 2023 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686686151;
        bh=X7DO2laKYP3B3ysfxN/nkuzWiO+uHEaxJZ1lz3iMzb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nfsn/DHRWkcADSnOcb040jqIjz5AfCCOaJukDz9wZ6KjcmlTfXoM0BgqB0lNRBzIe
         sOT3p3D6WnM5pbvAETJ3mGd++65yIZZMLsUvwhCZdSqkxedN/LDeo6xwhV6lhsKBHQ
         JlAkwN5xoAXM2/LIFs8YmkYYrDUMg2A595Sr1aT/SY3mjh12mhRU2/vOo8/QgzS+wS
         MvpdAykDyFJA1KaUXubv7qDfV9+TX4/7OuIJkYndrzsCox/UPSH+ogTRi4x4Hyls6F
         r6x10SWXQzSI5TDfmlNHgcy6DzAwvTLyIGHg8aeSg/VXvWZYNV/ug7hOI8mQzMZzMt
         6SB5AjyRGqHPw==
Date:   Tue, 13 Jun 2023 20:55:45 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 7/7] riscv: dts: starfive: jh7110: Add PLL clock
 source in SYSCRG node
Message-ID: <20230613-ferret-sleeve-d0e4a5b2289e@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-8-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IvMtdvMJSWf1agmh"
Content-Disposition: inline
In-Reply-To: <20230613125852.211636-8-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--IvMtdvMJSWf1agmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:58:52PM +0800, Xingyu Wu wrote:
> Modify the SYSCRG node to add PLL clocks input from
> PLL clocks driver.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IvMtdvMJSWf1agmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjJwQAKCRB4tDGHoIJi
0kAHAQDAQlrfp+wAEcjz8yEbiLRP2ZBZ4oUJZzxPbMVwnJ4AwwEAuMOz21LGVZW/
UGdLvMJasIvYjc+BI+XiwiBmWilfJgc=
=PiqU
-----END PGP SIGNATURE-----

--IvMtdvMJSWf1agmh--
