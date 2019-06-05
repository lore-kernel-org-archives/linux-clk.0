Return-Path: <SRS0=XCXc=UE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8935DC28CC5
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 12:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67381206BA
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 12:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfFEMcq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jun 2019 08:32:46 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46343 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbfFEMcq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 08:32:46 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D85741BF207;
        Wed,  5 Jun 2019 12:32:34 +0000 (UTC)
Date:   Wed, 5 Jun 2019 14:32:33 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: Convert Allwinner CCU to a schema
Message-ID: <20190605123233.qc3xewll6zhjdobo@flea>
References: <20190527100219.11264-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jqhlgzfdlvhte53w"
Content-Disposition: inline
In-Reply-To: <20190527100219.11264-1-maxime.ripard@bootlin.com>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--jqhlgzfdlvhte53w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 27, 2019 at 12:02:19PM +0200, Maxime Ripard wrote:
> The Allwinner SoCs have a clocks controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jqhlgzfdlvhte53w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPe2YQAKCRDj7w1vZxhR
xZcmAQCoHnzaop0TIqPe5nFDuqvfZo6Lsdi+UxIAowFEAIt7UQD8D3xJTW93Tl6h
66fFs8KlsmKdJxRF/Wwq/6xtD2vOpQI=
=aq+c
-----END PGP SIGNATURE-----

--jqhlgzfdlvhte53w--
