Return-Path: <SRS0=2F0X=ML=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13796C43143
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 15:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C16C12073F
	for <linux-clk@archiver.kernel.org>; Sat, 29 Sep 2018 15:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16C12073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbeI2Vdy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Sep 2018 17:33:54 -0400
Received: from mail.bootlin.com ([62.4.15.54]:55382 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728111AbeI2Vdy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 29 Sep 2018 17:33:54 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id B70A22075C; Sat, 29 Sep 2018 17:05:06 +0200 (CEST)
Received: from localhost (unknown [212.145.226.70])
        by mail.bootlin.com (Postfix) with ESMTPSA id 7B690203DA;
        Sat, 29 Sep 2018 17:05:06 +0200 (CEST)
Date:   Sat, 29 Sep 2018 17:05:06 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 4.19
Message-ID: <20180929150506.vch5wuujblgkngfp@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ppfl4xfwicb6p4ps"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ppfl4xfwicb6p4ps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here is one fix for 4.19.

Thanks!
Maxime

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-fixes-for-4.19

for you to fetch changes up to 80a6ec7d5e1653208eb53f6738620dab98f6f50e:

  clk: sunxi-ng: sun4i: Set VCO and PLL bias current to lowest setting (201=
8-09-07 10:20:50 +0200)

----------------------------------------------------------------
Allwinner clk fixes for 4.19

One fix for the Audio PLL that were not properly set and generating noise
on the A10 SoCs.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun4i: Set VCO and PLL bias current to lowest setting

 drivers/clk/sunxi-ng/ccu-sun4i-a10.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ppfl4xfwicb6p4ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluvlKEACgkQ0rTAlCFN
r3TltA/+Mj0jc5cOpEmR6B8VrU23majafHm0W6URBmJC5HgxwpArFg3VeuFY4fJM
S60e6RD531whsQi6+vE63PO8oefhmk4J2JNtnTPEghdSGhUfkZEED4cpIMIroyuR
yC1GXrT0nBfNPzyPx3mAt0Vv8922V0mqESR/2S/mM8BRzdYGM9M6cFbmxK67cUMj
KUCh07aUEdweHBcxPBzyRCDkUHA31Wp7qZmb7Vvvm5u9QET3FiIfhrkIx7S34zTy
S0SKZ8fY5z3kGE9RAE/zwY7UyYKgSL9fukJkYFrWnauiEfdXLlijjHSo07BO+m8c
h8eNgVBzUula/UdfwPzWRqnf6BDvaAgT3jiA43BG6UkoK8HSvV1I4zeUh00YF8oF
+3VH/oerSBNWST/du8hJ0+Tb57G3HQ+4LB6/7r4R4BnNiQ4uF7tNtUTJT9vyARm1
qVOcFMNHsDERNSYHq0IoYVyHOwG1UpIHZtjRgwbo3RKOnc3iIn3BvLIgJgk0RENl
ZX5q1RfKGNa9Wi1leP4FmaVzB+eSUwBsTc+VIsqKp2xL/gQwMfM+zhjNZ1aPmNqd
20T2o7RrH33K6UF0968Etw4zt8zCy0wL1yfU4uELGIQfRY7326QV039oZLzBkr5C
NWrPJ2EiRYVm3DFpmpMQ52FpaInSKLGr/Y0+inRy7xVl67lYMw4=
=9xmF
-----END PGP SIGNATURE-----

--ppfl4xfwicb6p4ps--
