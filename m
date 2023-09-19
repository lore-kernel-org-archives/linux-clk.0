Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A08CD3441
	for <linux-clk@archiver.kernel.org>; Tue, 19 Sep 2023 06:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjISGrc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Sep 2023 02:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjISGrc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Sep 2023 02:47:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED271102;
        Mon, 18 Sep 2023 23:47:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A55C433C7;
        Tue, 19 Sep 2023 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695106046;
        bh=EW2PBAsGC23fHfHY9mgqpEKwidIkjSfxXfSLtKOX5+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mmwe8Dc/aTPaoZf0s16Az8HbT7OahVbDxo0WiUdPFY32/nsxSCh1YtSH27+htygRh
         rVIlbTZQu/WtzP0k5/nJOmb/EyM4HNSHSk+3TDxANm1vV0Xtv9Wi9migUjnSjr6Fb9
         yCWCbXTj2d7Yh2hOflnyRw/RkurYJ3aUQMPFEl33pMExc/U8gI34c9sQFu1Ri5WHfg
         IYD2mEq8EPjIpRynair1rgjlQ5fPmOQZ33Ko5ATghaj5EglxjJSo0QZZyh3CVwZCrc
         lowzLgRdNdRjjqICpiLqJdLQ8PIDbPzc8EsedASmO+ehxT0U3EUh2dhWQcIizhJScB
         TytP6g5xTTG6A==
Date:   Tue, 19 Sep 2023 08:47:23 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Oltmanns <frank@oltmanns.dev>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH 01/13] arm64: dts: imx8mp: lvds_bridge: use root instead
 of composite
Message-ID: <sam7p4hwzgzzicacmbie3o7izedgun7eyxwdyn2zszmvwbtfvv@7lnpxiscu3kr>
References: <20230918-imx8mp-dtsi-v1-0-1d008b3237c0@skidata.com>
 <20230918-imx8mp-dtsi-v1-1-1d008b3237c0@skidata.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q2zc3nhbedjlu46s"
Content-Disposition: inline
In-Reply-To: <20230918-imx8mp-dtsi-v1-1-1d008b3237c0@skidata.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--q2zc3nhbedjlu46s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 18, 2023 at 12:39:57AM +0200, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
>=20
> Use the actual root node of the media_ldb clock for the lvds_bridge.
>=20
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

DT is supposed to be hardware description, so an explanation about what
has changed or was wrong in that description to make that patch needed
would be welcome here

Maxime

--q2zc3nhbedjlu46s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQlD9wAKCRDj7w1vZxhR
xQI3AP9YWaAkGD9yDkEZkoaN+ZhLpI4SFlsX0RpcxxHL/IJkQgD+N/j5IUrrLWQ+
G+cAl0JzRpjso+KEMMHWvvA+dC11SwE=
=Rm7O
-----END PGP SIGNATURE-----

--q2zc3nhbedjlu46s--
