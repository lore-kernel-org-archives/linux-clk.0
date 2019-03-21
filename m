Return-Path: <SRS0=PHVF=RY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340B2C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 09:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08BE620811
	for <linux-clk@archiver.kernel.org>; Thu, 21 Mar 2019 09:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfCUJCY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Mar 2019 05:02:24 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36657 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfCUJCY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Mar 2019 05:02:24 -0400
X-Originating-IP: 90.88.33.153
Received: from localhost (aaubervilliers-681-1-92-153.w90-88.abo.wanadoo.fr [90.88.33.153])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A19F21BF20A;
        Thu, 21 Mar 2019 09:02:21 +0000 (UTC)
Date:   Thu, 21 Mar 2019 10:02:21 +0100
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: sunxi: Add Kconfig options
Message-ID: <20190321090220.u6itbl4fhnhrn7e2@flea>
References: <20190319143759.21650-1-maxime.ripard@bootlin.com>
 <155302433780.20095.8306789134509103174@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lmzclmndvtu5xozw"
Content-Disposition: inline
In-Reply-To: <155302433780.20095.8306789134509103174@swboyd.mtv.corp.google.com>
User-Agent: NeoMutt/20180716
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--lmzclmndvtu5xozw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2019 at 12:38:57PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2019-03-19 07:37:59)
> > We used to have a clock framework that isn't really used these days, except
> > for a few clocks and/or SoCs. Most of the time, the new framework and
> > drivers (sunxi-ng) will provide everything needed for the customer devices
> > to operate properly.
> >
> > Since we're not needing it that much, it might make sense to disable those
> > drivers, for example when we want to reduce the kernel size. Let's add
> > options in Kconfig that can be disabled if needed, but are still on by
> > default to keep the same features in the standard case.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lmzclmndvtu5xozw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXJNTHAAKCRDj7w1vZxhR
xVLfAP9Stu1PefU+QXPWj8zFWjiXa2aWmstfR/DJ/EB5BhOt8AD/Sj2+CRQxItXE
RCYFfeQ6ANaSaqJTzeOWCU8VQ+V47gw=
=NZKZ
-----END PGP SIGNATURE-----

--lmzclmndvtu5xozw--
