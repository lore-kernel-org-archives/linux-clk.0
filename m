Return-Path: <SRS0=k6hG=65=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC0BC433DF
	for <linux-clk@archiver.kernel.org>; Fri, 15 May 2020 17:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE51C2073E
	for <linux-clk@archiver.kernel.org>; Fri, 15 May 2020 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589562768;
	bh=EwGY+MoNBkSyft3S/X2OQ943UQiliBzaUB3sMvP45qk=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=rYbJ+Mfs3amBjS/ot9+WUcYYlgLv2/5ed59gi8F2tmUMIvwy1C1Kbq6KV3R0h/0Ao
	 uK5GvK1Qx/GMkZEggInkVR3tX8DfqXighON7tInyAEzUYVRL0yoldPFvezkk1m+KZA
	 EfaUCb2lgZIJ8UM1AKH9QVbKNTjHJ5hxG0pnI8KA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgEORMs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 May 2020 13:12:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgEORMs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 May 2020 13:12:48 -0400
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1B78206C0;
        Fri, 15 May 2020 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589562768;
        bh=EwGY+MoNBkSyft3S/X2OQ943UQiliBzaUB3sMvP45qk=;
        h=Date:From:To:Cc:Subject:From;
        b=Qkpn1rx2fO7VBBWAguRho9/hhGaeqkssyzeUQzyAMMpJnf0Y7gv2dAe82V23wJbCH
         fgogqXmzgXOO72sz93W1uavTF1Is33gZy+HGZW7cNM+H4f7JmF9VzRoiIzLZB6Hx+V
         Idkn/CJhueIzloCTDk1wjq61HsGtvlEpr/RCUfH0=
Date:   Fri, 15 May 2020 19:12:45 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Changes for 5.8
Message-ID: <e18bd659-6a8f-4a4f-8308-8e5091ca8b45.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.8-1

for you to fetch changes up to ee25d9742dabed3fd18158b518f846abeb70f319:

  clk: sunxi: Fix incorrect usage of round_down() (2020-04-14 09:21:05 +0200)

----------------------------------------------------------------
This time we only have a single minor rounding fix for the legacy
Allwinner clock support.
-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXr7NfAAKCRDj7w1vZxhR
xXarAP4wdfOSI6mpPQstJnueouvozab7dSOAJhZCdyy6gD+SHQD/arhVv5dPyAub
MUA0yjWdgCGSrD+UQjLwSb/RsinoVgA=
=2qN3
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Rikard Falkeborn (1):
      clk: sunxi: Fix incorrect usage of round_down()


 drivers/clk/sunxi/clk-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXr7NjQAKCRDj7w1vZxhR
xZoLAQD/9YigNJFFnX8mFRwxyxEVzsNrfVUbv92elrNT8zxqxgD/aH2PmctKZzJt
XZiE0Nb93YEKo3ERHgSNcr+iRqBA1QE=
=6u0v
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
