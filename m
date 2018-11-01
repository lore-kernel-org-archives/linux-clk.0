Return-Path: <SRS0=b8N2=NM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=FUZZY_XPILL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B7AC0044C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 13:47:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32DC92064C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 13:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32DC92064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbeKAWuX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Nov 2018 18:50:23 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38811 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbeKAWuX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Nov 2018 18:50:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6CB318093C; Thu,  1 Nov 2018 14:47:16 +0100 (CET)
Date:   Thu, 1 Nov 2018 14:47:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        James Cameron <quozl@laptop.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/8] OLPC 1.75 Keyboard/Touchpad fixes
Message-ID: <20181101134717.GA11465@amd>
References: <20181010142504.233467-1-lkundrak@v3.sk>
 <20181015195612.GB29649@amd>
 <c4edf9b09e88cd265a0829644aa962c28cbc3d51.camel@v3.sk>
 <20181030100139.GB21529@amd>
 <20181030102610.GC21529@amd>
 <2761d7e31cf7118492e466a5249303c92f68049b.camel@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <2761d7e31cf7118492e466a5249303c92f68049b.camel@v3.sk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > https://github.com/hackerspace/olpc-xo175-linux/wiki/How-to-run-an-=
up-to-date-Linux-on-a-XO-1.75
> > > >=20

Huh. You see that crazy sed magic script?

sed "s/^\(0*20: .... .... .... .... .... ....\) $BEFORE/\1 $AFTER/" |

Do this with the regular expression. My xxd actually has different
number of leading zeros, and so fails...

And with that fixed, I have self-compiled kernel that actually
boots. Yuppie!

Thanks!
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvbA+UACgkQMOfwapXb+vKgKwCdGm+6mvwJoGwO7bGawC6sSRae
UY8AnRt4ntT2EDG4tbBvoIwr/REnDDlX
=IVtm
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
