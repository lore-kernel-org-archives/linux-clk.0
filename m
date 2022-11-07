Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C2BC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 18:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbiKGSSn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbiKGSSL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2022 13:18:11 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A59E83;
        Mon,  7 Nov 2022 10:17:03 -0800 (PST)
Received: from mercury (dyndsl-091-096-035-235.ewe-ip-backbone.de [91.96.35.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FEFF660036C;
        Mon,  7 Nov 2022 18:17:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1667845021;
        bh=ZJRCSTiIUO7mMlaT9jpPOoTTmzS39xNBMQ8EmypLwBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U33QTZRJX2uJPdMv3wmwQ9EChRh5z+v50X2F87vEKs8gUJ08WonXXRoHPp8bCB7rv
         dLt6bYmy7Atc9+/CxkzwX0cojzhBM6g9LhIhIQJYUC2+ukjDmR3z5aQc4WuFNpt3IL
         AWzTckFvOSE6Ha35P05mMLnTc3n+qiRDU8ysF6MtYccmo2XuGKiT0ii3++H+4BDfWD
         pxVXnJc7bK7LZQojAUOTvU61+CtmhXkgBeBvn07KsRM6VnNl8ovTo7Dzh6GhnB5qoY
         OF8YDWSgPsaL4nAczFXPzkcBvSe5jNYdXYv6V7aUGi6RZjFpewXohaqeUfSB70CsgO
         +bhMbAuv5clfg==
Received: by mercury (Postfix, from userid 1000)
        id 6CBF51069DE3; Mon,  7 Nov 2022 19:16:58 +0100 (CET)
Date:   Mon, 7 Nov 2022 19:16:58 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 0/9] RK3588 Clock and Reset Support
Message-ID: <20221107181658.uz2om46wqzlj2m5f@mercury.elektranox.org>
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fjipx7j3dexdj2fi"
Content-Disposition: inline
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--fjipx7j3dexdj2fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 18, 2022 at 05:13:58PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> This has been part of a bigger patchset adding basic rk3588 support.
> Since that gets more and more out of hand, I'm now sending patches
> for each subsystem as individual patchset.
>=20
> Changes since PATCHv2:
>  * https://lore.kernel.org/all/20220930153857.299396-1-sebastian.reichel@=
collabora.com/
>  * rebased to v6.1-rc1
>  * define rk3588_rst_init() in clk.h to fix build warning
>  * add input clocks to the binding
>  * add some more rates from the rate table (merged downstream fix)
>  * fix input of mux_700m_400m_200m_24m_p clock (merged downstream fix)
>=20
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20220623160329.239501-1-sebastian.reichel@=
collabora.com/
>  * split dt-binding header addition into its own patch (requested by Heik=
o)
>  * split dt-binding header into clock and reset one (requested by Krzyszt=
of)
>  * use reset identifier instead of register offset (requested by Krzyszto=
f)
>   * (involves adding lookup table support to rockchip CRU reset code)
>  * use linear, gapless clock identifier (requested by Krzysztof)
>  * reword the DT binding description
>=20
> Changes since PATCHv0:
>  * https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@=
collabora.com/
>  * Sync'd with latest downstream changes
>  * Update bindings according to Rob's comments, except for license
>    (no feedback from Rockchip)
>=20
> -- Sebastian
>=20
> Elaine Zhang (5):
>   dt-bindings: clock: add rk3588 cru bindings
>   clk: rockchip: add register offset of the cores select parent
>   clk: rockchip: add pll type for RK3588
>   clk: rockchip: clk-cpu: add mux setting for cpu change frequency
>   clk: rockchip: add clock controller for the RK3588
>=20
> Sebastian Reichel (4):
>   dt-bindings: clock: add rk3588 clock definitions
>   dt-bindings: reset: add rk3588 reset definitions
>   clk: rockchip: simplify rockchip_clk_add_lookup
>   clk: rockchip: add lookup table support
>=20
>  .../bindings/clock/rockchip,rk3588-cru.yaml   |   71 +
>  drivers/clk/rockchip/Kconfig                  |    8 +
>  drivers/clk/rockchip/Makefile                 |    1 +
>  drivers/clk/rockchip/clk-cpu.c                |   69 +-
>  drivers/clk/rockchip/clk-pll.c                |  218 +-
>  drivers/clk/rockchip/clk-rk3588.c             | 2538 +++++++++++++++++
>  drivers/clk/rockchip/clk.c                    |   14 +-
>  drivers/clk/rockchip/clk.h                    |   95 +-
>  drivers/clk/rockchip/rst-rk3588.c             |  857 ++++++
>  drivers/clk/rockchip/softrst.c                |   34 +-
>  .../dt-bindings/clock/rockchip,rk3588-cru.h   |  766 +++++
>  .../dt-bindings/reset/rockchip,rk3588-cru.h   |  754 +++++
>  12 files changed, 5390 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk35=
88-cru.yaml
>  create mode 100644 drivers/clk/rockchip/clk-rk3588.c
>  create mode 100644 drivers/clk/rockchip/rst-rk3588.c
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3588-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h

Can this be merged? It's the last blocker for basic rk3588 support.

-- Sebastian

--fjipx7j3dexdj2fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmNpS4sACgkQ2O7X88g7
+pqRxg//X0Vm4/QXcHwCzRzyy8Ib81+HtP+k2uIIvaQDdsob8ctKxrBgIUQE8FG0
/oP/Bu9CjTcXaC5A9CRhYwOCvJg63q5kEVomsYdJDXuAVxO14Yy4pA9W7x/j0K48
CuECS467T2gxJcI9S6GscYweULNc+j1/gGPChiWRuDXvTwS44hMMUz1KknHWNXEd
g0ivb023UGHGvBDmR6tU8faMC+l1S+68zk+at3Ia8dC/U/40ZhNY95/fx4WfdD+A
BZP1S2ids55pZqZBsDC9gXkWohMxBt/PgJlFkaNlARG/8H7X029imh83hpdczSNg
ecNsV6Q651Q/Vhy4qxyd2/Nw5D6I+gsYQE0e6V1PcdIUseoEAfLaCl3KfVVqqmbJ
ehmpgt7ud3Xb/80TKpZxP6e4VWlvJ4wTn1zUjG2BMtFF1V6Yin/U9OXA7HHs3org
FvrXAyFelnWI4GJA1zUrTJeYgbzX9FMl0hd/Gsfok1Ib6s8Ib/0LvDJDaANIm95y
ZDI+Y5BdtiuA2sOvn782/5yInkwZjLGtBNqfpABFWiucB8rrnSWWfSvoHx2myvyn
YQp0O2O+KBGQ1gH3bRnFx00dKhPD4F/4bOQV2noamzEyjlMEOAUoIsrfUybRWFq0
+Y7w7LVVPuhE7TpCsOSTcWhzu76zJe5Uw5/KXt/ObH0BaAQox3A=
=cK7F
-----END PGP SIGNATURE-----

--fjipx7j3dexdj2fi--
