Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2ACC2D0E4
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 15:29:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C190222252
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 15:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbgKTP3e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Nov 2020 10:29:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:55734 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727083AbgKTP3d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Nov 2020 10:29:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 02B09AB3D;
        Fri, 20 Nov 2020 15:29:33 +0000 (UTC)
Message-ID: <92ebf37b2968a39b367ca8ed572084f0d305b109.camel@suse.de>
Subject: Re: [PATCH] clk: bcm: dvp: drop a variable that is assigned to only
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de
Date:   Fri, 20 Nov 2020 16:29:31 +0100
In-Reply-To: <20201120132121.2678997-1-u.kleine-koenig@pengutronix.de>
References: <20201120132121.2678997-1-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-GRV8FViA1bTRpxIt3gw3"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--=-GRV8FViA1bTRpxIt3gw3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-11-20 at 14:21 +0100, Uwe Kleine-K=C3=B6nig wrote:
> The third parameter to devm_platform_get_and_ioremap_resource() is used
> only to provide the used resource. As this variable isn't used
> afterwards, switch to the function devm_platform_ioremap_resource()
> which doesn't provide this output parameter.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>


--=-GRV8FViA1bTRpxIt3gw3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+34NsACgkQlfZmHno8
x/6MDwf/dUxzq7ZuLH2SIxv8ZgpvgQA5UcLY+WwzihoH64RIwAGd3obBM5uXKdl8
keVC7YgxVASciw0npqLDDv87uhYV7+buc+K5JXyGx3+0CAXs+SwOTwshbU30vYNx
JyUYF3o3sdtnMqpntVZDWcc0stm7wTzvKsPLNQkCe9b6I6QiNUqKjuEKfy+Nlzng
cJ9Hy3WFLl1NZt1+vKJ+YBFYgIhto9+Y/kiZE2qCtxK6lUErzqRNIvsVPqjGSjpz
9otoIwKgzsCBET6tUvCLQ6+WFy8cWl5V66G518KPrTcTyPj+2OzD/OV2+17iw12z
ARsGDJLuH3hIeqAGPJXflwkQyKRTnQ==
=igvk
-----END PGP SIGNATURE-----

--=-GRV8FViA1bTRpxIt3gw3--

