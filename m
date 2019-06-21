Return-Path: <SRS0=rhXi=UU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AB0C43613
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 08:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6C8B208C3
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jun 2019 08:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfFUIOj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jun 2019 04:14:39 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:60523 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfFUIOj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jun 2019 04:14:39 -0400
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id DBF74240005;
        Fri, 21 Jun 2019 08:14:35 +0000 (UTC)
Date:   Fri, 21 Jun 2019 10:14:35 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner Clock Changes for 5.3
Message-ID: <fa2e50d6-b01d-48f4-8ddf-77488f11036e.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7nrsb5xw5ieoesh4"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--7nrsb5xw5ieoesh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-clk-for-5.3-201906210814

for you to fetch changes up to b467ec063ec56900e1ebba4d5aeb50b0a7cb0ef8:

  dt-bindings: clk: Convert Allwinner CCU to a schema (2019-06-05 14:32:08 =
+0200)

----------------------------------------------------------------
A few patches to fix two minor bugs, and to introduce a schemas for
our device tree bindings.

----------------------------------------------------------------
Gen Zhang (1):
      clk-sunxi: fix a missing-check bug in sunxi_divs_clk_setup()

Maxime Ripard (1):
      dt-bindings: clk: Convert Allwinner CCU to a schema

Ondrej Jirman (1):
      clk: sunxi-ng: sun50i-h6-r: Fix incorrect W1 clock gate register


 Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml | 141=
 +++++++-
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt                |  62=
 +---
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c                               |   2=
 +-
 drivers/clk/sunxi/clk-sunxi.c                                        |   2=
 +-
 4 files changed, 144 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun4i=
-a10-ccu.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt



--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7nrsb5xw5ieoesh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQyR6wAKCRDj7w1vZxhR
xQRaAP9Xhmy1qm0KuuUPap4yaBzivCPU9gMJnpXd1U9/q0GisgD+KR+IEnaSC9IW
TRI8JPg3bNELIxz+AAgz8FskRHMM1Q8=
=aVEh
-----END PGP SIGNATURE-----

--7nrsb5xw5ieoesh4--
