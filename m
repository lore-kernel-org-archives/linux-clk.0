Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266AFC61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 22:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjCOWtZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 18:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbjCOWtL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 18:49:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600992CFC1;
        Wed, 15 Mar 2023 15:49:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF1E361EAA;
        Wed, 15 Mar 2023 22:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5FDC433EF;
        Wed, 15 Mar 2023 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678920541;
        bh=kP7hwIqceFMghF3vqaAgPra/vliClSblHiQBxy8DZKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jrvhhbjjwzWHJXgforknH9oD2OUveGrp0PkYPLOuVrFm5MMLFH19GCRxB75Lq+AS8
         XrdMnF5faMVxunT/xX4jSyVhNO9LaJCmqx2Fi3bYrLzsN2RPq6KwZazfNjZpNziEo0
         mAgr2YKs+k6eg7OPCW+KMop9IZokyQ2Yx9bSpUqYiUuskiyXyYgG8n0UsLIuSs1VLV
         OxR8tWwKpEIXcJ7Gf33WOXcZ9bOsvtNmKMTpBPeRelKsl/2DX81frmI/RFQ6sMLqSb
         1hSunJykx2IMD+qIlgGk8Ymorbe4RyTO4nUaSm985yF2ZUbNwGu0jk5BSWPgPCXPO5
         x9twlQX7eaEXw==
Date:   Wed, 15 Mar 2023 22:48:55 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for
 StarFive JH7110
Message-ID: <2df1dc9c-b063-42a2-b74f-590c9421f4f2@spud>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
 <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org>
 <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
 <e895fea6-e13b-450f-97e8-34ecfe075691@spud>
 <e24f9d404c5f9830c9606e4635dc6431.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Fjpx3fCugxH/K+m"
Content-Disposition: inline
In-Reply-To: <e24f9d404c5f9830c9606e4635dc6431.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--4Fjpx3fCugxH/K+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 03:40:00PM -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2023-03-15 01:14:06)

> > At what point does that become too much to go via soc and some sort of
> > shared tag become needed?

> BTW, clk driver code doesn't typically go via soc. Not sure if that's
> happening but please don't do that.

Perfect, shan't.

> Platform/SoC maintainers either base their DTS file branch on some
> branch made in clk repo that has the bindings and drivers they need
> (clk-starfive probably), or they send a pull request to clk maintainers
> with the bindings and clk drivers. Or they don't use the #defines in the
> header files and use raw numbers in the DTS, or they simply apply the
> patch that just has the #defines in it to their SoC tree and we
> duplicate the commit in the history by also applying it to the clk tree.
>=20

> Let's try to keep things simple and not use raw numbers.

Definitely not!

I'll do something sane with Emil once the base series is ready.
Just was not sure how you typically liked this stuff to go, and now I am
sure of what you do not want!

Thanks,
Conor.

--4Fjpx3fCugxH/K+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBJLVwAKCRB4tDGHoIJi
0g7rAQDNu8KRjiEgRssI+Z2ZbQG3t377SoQPb2/FS66EltHS2wEAoTp3I1iZviol
ZjMFfchYJAVFnvR34uC6ulh1r8OeGQY=
=JLhb
-----END PGP SIGNATURE-----

--4Fjpx3fCugxH/K+m--
