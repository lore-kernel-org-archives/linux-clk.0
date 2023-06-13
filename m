Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46F9EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 14:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240551AbjFMOx4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbjFMOxz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 10:53:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867A6173E;
        Tue, 13 Jun 2023 07:53:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F21C6309F;
        Tue, 13 Jun 2023 14:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0363EC433D9;
        Tue, 13 Jun 2023 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686668032;
        bh=5MZ1o708A1rVO5ABzu1z4mVt6wqEGNGTdC1ktea6vv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=av2SPjihbGdcQg4Lw2o6SSPPL9BxnYCnF1bkK/QXDuq+leRpVv5VOfJ3KlerEqfOB
         gZpbsid8sws7dI2Gs4eKaVWdevn1cFzCgqsGgY6fh4HRySNxnT+gPKDDo2msn9IE4t
         fBZ+lbQ0g4oph4BWxCxvRl65RQl3HSJqPD7gQuC9ECANUM7kGEyqkG/Hfr3ph9rjyb
         PQJ531tO/g2Clwl91m0xP53BOxRiU09nh5lIg0ClKL+dusXK91Uc4LOhMUo/zh/uXv
         v47af69BH1AWwqjK1Kw1AzfwY6a4EI6bz0OdARLHxLKbXpc+SEouzy+6SCnou1m00g
         Zz9Zkqojec/kQ==
Date:   Tue, 13 Jun 2023 16:53:49 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Fix best_parent_rate after moving code into a
 separate function
Message-ID: <tsda76b6sq5irvqle2nngfajvpgmxhmqtalfulcq26h2m3daap@rwxntc7tjzlv>
References: <CGME20230613131644eucas1p2b232fef36f6ae621827674c775a6e070@eucas1p2.samsung.com>
 <20230613131631.270192-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jeo47hlqe4ao3eyd"
Content-Disposition: inline
In-Reply-To: <20230613131631.270192-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--jeo47hlqe4ao3eyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 03:16:31PM +0200, Marek Szyprowski wrote:
> best_parent_rate entry is still being used in the code and needs to be
> always updated regardless of the CLK_SET_RATE_NO_REPARENT flag.
>=20
> Fixes: 1b4e99fda73f ("clk: Move no reparent case into a separate function=
")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--jeo47hlqe4ao3eyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIiC/QAKCRDj7w1vZxhR
xZDbAP9PJ041eQl/zj2dkUG5ht2LgxNTqTlGw9UbWtQEhRirOwD+Mf5rZUFBl3jK
YZYbYjQ73V6vgRG5J89lweflVIMz/AA=
=l7Np
-----END PGP SIGNATURE-----

--jeo47hlqe4ao3eyd--
