Return-Path: <SRS0=pXcS=43=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E34C10F27
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 10:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61A6921D7E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Mar 2020 10:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFuw9gY2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgCJKme (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Mar 2020 06:42:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39098 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJKmd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Mar 2020 06:42:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id r15so10116179wrx.6;
        Tue, 10 Mar 2020 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V4YmGWErw9+YVGfk8LSseTEoRHvWPa3Zx/f+g0rklJc=;
        b=dFuw9gY2ZGsZBDFQMYIhL7RFNoTExT8jlAdIa0ubDMaNC3x1rK0fyN1JNwA4+N9oYU
         MPj2gnEIS/ZTkK7Vsps2z0ZQGy8ZtYmbiqonDq5TFWnXqGfSYTpsbALVchIYUyBXgzs1
         JONSwkjTVWoFQY9Lre4z0Cqy/e+rh8SWETL9VMNs3S9u82N300F2LcRgYW81lBa+T5vr
         BQSuvSNo4N8X4/s33LJ6rVVfJBanNvXVw9XMRwKpkolNEn6RWwmugXBMEHquzoJU5dVL
         FKQa7DSRGHbWE4vIBIqcgRdnPalP26aQkAWAbLsKunhfsytetOOls0OeRxUsSkdSwoy3
         BV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V4YmGWErw9+YVGfk8LSseTEoRHvWPa3Zx/f+g0rklJc=;
        b=mWWAbSXL14DMjPbddwt3ayNaXgiT0wre23dBFh4yOSV3Fha+t28AhkOyjq/pTk7p39
         P1XZMmSz2pkLcU887Cg8DnsJ/KqNX138bogb3ujynwP0x08JFp2W/9nkkFip5gR63ZzV
         h0Fqvav3I3vBj/72Mzxh5EjDyRVL1F/89oZxk+A9mCYgfMbsA/J8a5heQsCNnGRQiszC
         AlUj/h90WHkESACJMzvI3DBoFud9Vt9rDJ74YltwtWmuuZtDgS+8mk73hglDsnG3xrlN
         i5Xfx5ecwVgUfWofGfaKR/tg3XTNzHOo+Fq48Pd8vHSP9IJfnMYKqtnK8VIcAKcNA8sk
         BvDg==
X-Gm-Message-State: ANhLgQ0p9P2Rj/4VpxmGKc1SRyjT0xAC1dzoIzfhgGIOwH5EAq1rCxRl
        eW9Q4TaAoHp+Gmx93PkQFCA=
X-Google-Smtp-Source: ADFU+vslMLwT6OEhzxKBUwSz9DYivA99lemp1xmBG3gQHQD9Vj8srDkkWBDHvyU5Ne+yy+9sVc+hDQ==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr8198633wrv.298.1583836950221;
        Tue, 10 Mar 2020 03:42:30 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id q16sm51169717wrj.73.2020.03.10.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 03:42:28 -0700 (PDT)
Date:   Tue, 10 Mar 2020 11:42:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Message-ID: <20200310104227.GB2030107@ulmo>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
 <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 12:25:01PM +0200, Mikko Perttunen wrote:
> On 3/10/20 3:48 AM, Stephen Boyd wrote:
> > Quoting Thierry Reding (2020-03-05 09:51:38)
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > As part of the clock frequency change sequence, a driver may need to
> > > reparent a clock. In that case, the rate will already have been updat=
ed
> > > and the cached parent rate will no longer be valid, so just skip the
> > > recalculation.
> >=20
> > Can you describe more about what's going on and why this needs to
> > change? For example, we have 'set_rate_and_parent' for cases where a
> > driver reparents a clk during a rate change. Is that not sufficient
> > here?
> >=20
>=20
> I believe this is related to the memory clock change sequence on Tegra,
> where the EMC clock may have to be reparented multiple times during the r=
ate
> change sequence.
>=20
> If EMC is running off parent A, and the requested new OPP also uses parent
> A, we have to temporarily switch to a different OPP with parent B so that
> the rate change sequence can be executed on parent A without affecting the
> system's memory accesses.

It's not only that. The mismatch can happen every time that we change
the operating point because each such change could cause either the
parent and/or the parent rate to change. The CCF always caches the
parent rate from before the rate change, assuming that the parent will
not change.

Perhaps a clearer way of saying this is that the parent change is an
internal part of the rate change. clk_hw_reparent() already allows us to
notify the CCF of the hierarchical change in the clock tree. But then we
need to additionally either override the parent rate in the driver, like
we currently do on Tegra124, or have the core ignore the cached parent
rate if the parent is no longer what it expects.

I should probably have followed up this patch with a corresponding patch
to the Tegra124 EMC driver that removes the workaround, like below:

--- >8 ---
diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 745f9faa98d8..f29f0a0e48de 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -92,12 +92,6 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
=20
 	tegra =3D container_of(hw, struct tegra_clk_emc, hw);
=20
-	/*
-	 * CCF wrongly assumes that the parent won't change during set_rate,
-	 * so get the parent rate explicitly.
-	 */
-	parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
-
 	val =3D readl(tegra->clk_regs + CLK_SOURCE_EMC);
 	div =3D val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
=20
--- >8 ---

But I haven't actually tested that yet because I don't have a Tegra124
board set up at the moment.

I do have a working Tegra210 EMC scaling implementation that I've tested
this with and that has exactly the same issue and this fixes it.

Thierry

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nbxEACgkQ3SOs138+
s6EEnBAAqpKHWPGJxLEP11s5wL7ZmUnV4Y6/i9O78auyNgCvwlq4CRLQtbKwg8Ti
0t+++1/2pZcftoYX0cOgF28qs5sI3RcmiLTtGXxwheL7Gry4cwF8WJ6nVnUE4su4
F+jmmN87w5g+HtEJQINzUkcyyGrPuMnW2oOrKTnyKUAbIP7linKWyoX3BCpngBii
y0KOvBkJeqTMgjCRJOSSWhtV9OnkCY9VG4YI4yqp4ouag63Ez9PN48h4s23zs6xS
4qRG5zSCnaJz74ob9xCYXQ2xUf3SMZv1LDT0MPvDEBhxW+ivbmlUT+qeu//jSS2k
ea15Isg/pXMVWtCcwjK1RLfbU1pJmokXXLItOeJn52Gs3csySXw+Q/jErMjkYd9m
CLfj6R7PVrxC1wQ33Qez7Al1yffsRv1twZm64HRsU5cbB1vZu7xT8VCQImagTLRT
qKlCEB9zn6c/yYEsL9nsr84RyLCrNUgtqIgVO6+UnorD0w4yGR0Du8R+COe9Pvnb
YhcRfzyQaCljK/+G5IKUbLD33K42wwa9z09azCGPqvXZ1Jxxdb+faxK5xY99SjWp
VHlOhL24Zz0v4s+JFYIZ07ZUpvb1N/i1FiraEwNroZd0MPyy7vXvjnmFp0Vs+Rgy
W3yL8dlmFeYS4U6TJ39GFj5GFkjK1o076l0pa0qwnzNHctDceik=
=i58G
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
