Return-Path: <SRS0=2Ghr=Y2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76AFCA9EC7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 15:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72FD621855
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572709830;
	bh=CpgvGaylEu3otIutzfhkjA+p+SD/JsZ1LIgNdivpSS8=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=zVogIHYL5WbzwGbD2wKLodxyat63s6aAcN5YcwPTsyDwSOqAo5Kim1mqSe0apKjTg
	 l7nQzEN1d+MkFD1RzM/e9IIQJ/5wyQnb1s2xL2eBbwi38347c8sPJgPhYEsS+yO72W
	 umSKbzJUa/yLxaMjw5WsXlKK2/fSh8uFlBJra668=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBPua (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Nov 2019 11:50:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbfKBPu3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 2 Nov 2019 11:50:29 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCFCC21726;
        Sat,  2 Nov 2019 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572709829;
        bh=CpgvGaylEu3otIutzfhkjA+p+SD/JsZ1LIgNdivpSS8=;
        h=Date:From:To:Cc:Subject:From;
        b=GomVhvbJrPCBdr+ylrXMySXaLoTHDbmvdoPzHqA5Tq3/bTqjIDeHAs1ibnQWlg7D6
         X9F6CxlE6RgRn3aAdniUL9wITl8IucmmMzi04goVpTnTX6P2Chg0HOC+NZvbQ3K5+W
         pPkRMRRTZECSTUIiNHZHz5Qw4xwsZbATxhCAzl+o=
Date:   Sat, 2 Nov 2019 16:50:26 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner Clock Fixes for 5.4
Message-ID: <eb232b2b-ff54-48d5-bbd0-f628d4650b25.lettre@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="br5xgx2nbqlesq7w"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--br5xgx2nbqlesq7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-fixes-for-5.4-1

for you to fetch changes up to cdfc2e2086bf9c465f44e2db25561373b084a113:

  clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18 (2019-10-29 08:42:52 +0100)

----------------------------------------------------------------
Two patches that fix some operator precedence and zeroing of bits

----------------------------------------------------------------
Colin Ian King (1):
      clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18

Nathan Chancellor (1):
      clk: sunxi: Fix operator precedence in sunxi_divs_clk_setup


 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 2 +-
 drivers/clk/sunxi/clk-sunxi.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--br5xgx2nbqlesq7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXb2lwgAKCRDj7w1vZxhR
xadmAQD6qoJLFv0cNuvsrcIJCkGltYHCIdt6CA0dK1K5T6aqhgD+IZFmscdTupjL
fQ27DTFj06PULCGdLzmoiCUIQCebVQM=
=v5Ga
-----END PGP SIGNATURE-----

--br5xgx2nbqlesq7w--
