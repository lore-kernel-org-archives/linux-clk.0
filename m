Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612B1C282E2
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BDDC20821
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbfDSUWv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:22:51 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:44192 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfDSUWv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 16:22:51 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 14F403A8D40
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 11:19:30 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A349D40002;
        Fri, 19 Apr 2019 11:19:28 +0000 (UTC)
Date:   Fri, 19 Apr 2019 13:19:27 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 5.1
Message-ID: <20190419111927.j3ggz2oke6msty5g@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p3ahmimmxgy45ned"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--p3ahmimmxgy45ned
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

Please pull the following fixes for the current release.

Thanks!
Maxime

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/clk-fixes-for-5.1

for you to fetch changes up to 1054e4dd1cbbb7bf5cc836832648f9972134ef67:

  clk: sunxi-ng: nkmp: Explain why zero width check is needed (2019-04-04 09:32:32 +0200)

----------------------------------------------------------------
Allwinner clocks fixes for 5.1

Some fixes for odd cases of the NKMP clocks.

----------------------------------------------------------------
Jernej Skrabec (2):
      clk: sunxi-ng: nkmp: Avoid GENMASK(-1, 0)
      clk: sunxi-ng: nkmp: Explain why zero width check is needed

 drivers/clk/sunxi-ng/ccu_nkmp.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--p3ahmimmxgy45ned
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLmuvwAKCRDj7w1vZxhR
xbOgAP9qHUw27dHBH+Ethk6rjb8icOixHRDJ6SlevqVTJ23vugEAuoNBhDv1aDql
9R/TpPrACVuQlhDJoEQnGG7D0JU1Hws=
=yRde
-----END PGP SIGNATURE-----

--p3ahmimmxgy45ned--
