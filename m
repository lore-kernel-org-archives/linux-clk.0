Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AC6C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 17:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243964AbjEORRL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 13:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243912AbjEORQt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 13:16:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A39711558;
        Mon, 15 May 2023 10:15:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D24DE62BE0;
        Mon, 15 May 2023 17:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BB7C4339C;
        Mon, 15 May 2023 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684170931;
        bh=Ev9noomAYJfnt2AIcctg5rEid6cEDTtCWoPYWoVf+aQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HkwiFK+JuMl25oOozpqhCwBZrNmt5R+yTHWLNsmkSSGle0QgrkFnRG5Eivgw+nn9o
         5tYNxUYoFLwBMndntqThOY/VxXn7OLjnexsp0Op4L+ETxEcUNimiCeledGaHalADcY
         aClbbxd9kXSuKR7k6qVaQCcbQnUhzirHnGDpHoLsTa2zUdOYupO6ZrXZ06vxvRhk6c
         pRIURWR1dpLFOBDbkgVRhenkpVbrX8YqjF9RZqksfmCdrI2dJWuskGgZb7pvIqkXRI
         tuzfD5husbKiz1LsPLly/mIT5A+byE8uzJKg7I6uVBuoLrxko1BToNdl1HZv1UADxA
         0pLqH3AO4XIrw==
Date:   Mon, 15 May 2023 18:15:26 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>, Wei Fu <wefu@redhat.com>,
        Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 3/3] MAINTAINERS: update entry for T-HEAD RISC-V SoC
Message-ID: <20230515-skimpily-pluck-0a1f71e36020@spud>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-4-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="++jOKj3XXxEhTRyC"
Content-Disposition: inline
In-Reply-To: <20230515054402.27633-4-frank.li@vivo.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--++jOKj3XXxEhTRyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 01:44:01PM +0800, Yangtao Li wrote:
> Wei and me would like to help support and maintain too.
>=20
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1e51accec4f..dc35c654f78e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18155,11 +18155,15 @@ T:	git https://git.kernel.org/pub/scm/linux/ker=
nel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/riscv/
>  F:	arch/riscv/boot/dts/
> =20
> -RISC-V THEAD SoC SUPPORT
> +RISC-V T-HEAD SOC SUPPORT
>  M:	Jisheng Zhang <jszhang@kernel.org>
> +M:	Wei Fu <wefu@redhat.com>
> +M:	Yangtao Li <frank.li@vivo.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
> +F:	drivers/clk/clk-th1520.c

Please tell me you actually communicated with Jisheng this time about
maintainership of stuff, since you're signing them up to maintain the
dt-bindings and the clock driver!

Thanks,
Conor.

> +F:	include/dt-bindings/clock/th1520-clock.h
> =20
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> --=20
> 2.39.0
>=20

--++jOKj3XXxEhTRyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGJorgAKCRB4tDGHoIJi
0hKKAQDjAVao6ahBxcrNBFDV6+WHrLkkFLBnLKnwkip62Qw5WwD/UQA7kNd/ynHV
xPGDx/VtvKrvvAVJX7emHY4xguA2JAQ=
=oQCM
-----END PGP SIGNATURE-----

--++jOKj3XXxEhTRyC--
