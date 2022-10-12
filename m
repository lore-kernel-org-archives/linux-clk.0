Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE63C4321E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 18:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiJLSvD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 14:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiJLSvC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 14:51:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8896FF2531
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=1HD/i4jz369D27pipi6lzug6qw1i
        dYuw+95LyUrPsEQ=; b=GbqdYfRlYtQqkHdeRoyX6JuNCLqlwDYrFxbqOo9ReEJb
        UENGl7v8GVtuvJV90w+/RNz8LCCjqSuvhWlY5pTA8IYZqTnaUKxCVXd9IQUQDM+5
        lSj/FLMXVixBi/N9v9Hwgv0Cq/SAMyitjroJtvShbZ2pFq/WIWy4nM64v3+1HnE=
Received: (qmail 812947 invoked from network); 12 Oct 2022 20:50:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 20:50:58 +0200
X-UD-Smtp-Session: l3s3148p1@otyJ39rq5OcgAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 20:50:57 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: renesas: r8a779f0: Add SASYNCPER internal clock
Message-ID: <Y0cMkfXOMWySUurL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1665558014.git.geert+renesas@glider.be>
 <18e6765bfc3bf7c3ee5ce93a370d377c1d17728e.1665558014.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gpu5VvqXsUAhQ3qZ"
Content-Disposition: inline
In-Reply-To: <18e6765bfc3bf7c3ee5ce93a370d377c1d17728e.1665558014.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--gpu5VvqXsUAhQ3qZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:02:34AM +0200, Geert Uytterhoeven wrote:
> Add the SASYNCPER internal clock, which is the clock source of the
> various SASYNCPERD[124] clocks, to match the clock tree diagram in the
> documentation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

As discussed, looks good!

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

For the record, I'd like to test as well, but that will need some more
days until the board shows up in a lab again.


--gpu5VvqXsUAhQ3qZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDJEACgkQFA3kzBSg
Kbaz1w//dRT1mQ5dQhF1739qj8xH6fYLTaaoDJmYsX6EwKTM2/nVyiAcy9iQetkz
kWjlVl4cmmNg+gEVOkC29eb/lrsCp9FStpwORPG/rKuVcsrR4T/ADXErtFkAbOu9
KFZHKhotDKvcPEwuWclyhngb5+VIh+oiCl25kBBoOo7cOds6mhbJL8cQuiktJ9we
NoN//INKfYywFQg6tleH2qoPz5zOEkqMeEIH3vjh78rCQTtIap/Vc30iPwYElY5y
z4RDJ4kcRNaRPvFwxmYSHp2L7kq3a7jjQIx0sXphLpQ+7EArr3rp29dkOj8lgbcR
0LGXrVG95HkHfK916o0wM0Y9J7PkTTl/dTIoYf/JY2rQfMbiGaqAJyqtXIG+byeh
GgCxHGeVd3ayx+7WzUs3tnn1zOGpLdqm5ye55/1h1KLLyWLmYiPMUpzBdPmo25zF
ae8Y5Hnm2tSP/nrf5LjJA/4WsUlDVsz++5XdVTzb+n5ozJWbzbxF+gpoeMtnmvxL
MYLMr4U1VTXj+cgpDKgsxXgu5Crr1PxMjfg6lleBQrqwZFn/p9PkvwDPhO1bjv5Y
Yzb+Yn0W+a+7zqVdPnEyt1gEQz0VxzwZuGEhIvffM1fsy06tF1V/Eqn9oxszpRzF
M8/dmfhIRUSlhynxLl4r717X65PZz1+FUX20qNmgP+k40shkSxg=
=H3fL
-----END PGP SIGNATURE-----

--gpu5VvqXsUAhQ3qZ--
