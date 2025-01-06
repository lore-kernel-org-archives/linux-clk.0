Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B2182D2
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174201; cv=none; b=oaJZxh+r3X4V4IyfzsJyX0qakHBsyyt0xuyVT8yTbbW79zPTog8bLhlynijUK1N3m0Jbb0gDx/NOGeRTkZVZGEk43c/iR9s5iCzi4SfgHVjavK5mKCeXU5msp9hGTHt/ma5yYKrKM8g37UJGKrW2gu6lcpq1Fl/rCF0Ws8mtTQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174201; c=relaxed/simple;
	bh=ZSqQEYHxQ445ycJU7lyhqN/qpjOmoRsXlbym7bsnDbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8f4ZExRK9zFDVvbRH7YqexA8K7bBj6RufqzrqKeF7M0KDE+GG5dRJZki/sF+JiG/xRw0wxKl297czYIq2oitx72V9hIRlL6q0EQFoIrZvDa0vCXCQgOb7CiUrTU+by2bUyE9moa16n2ipRa6afPV06Z5/5VEMvg6vCcNKti0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnHWbTvu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnHWbTvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736174199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
	b=gnHWbTvuYwB73wuZpc2v+QyMuD1BisfdTGAb0IYRlfFeUd78jneoerh8mTXOJ1JuH+3oZf
	tPHE1OKvqHZq4RzUtcyy01oRU6NZhfLt2w3FEOUuOnuxFmxZNU+uMV+Ovhm7Z51s2wFjgU
	KovJMLbHGvgMwHKeXTGTmb37wx8xa3Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-6D57vI7xN5C6txEc8byxtQ-1; Mon, 06 Jan 2025 09:36:37 -0500
X-MC-Unique: 6D57vI7xN5C6txEc8byxtQ-1
X-Mimecast-MFC-AGG-ID: 6D57vI7xN5C6txEc8byxtQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43582d49dacso98886985e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jan 2025 06:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174195; x=1736778995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
        b=VGCxTAr3vOnElQ/VrvFeVfPILTeg6hT/1lm7o+G97L/56cHzGyw2wwY73BI9AYhewV
         NcnQhXpgKck+E2kqBLPb2YwRaABp0yADXZDDVEXylkVoORCJST/5IVAyWNYtwu2aw7Ol
         iVgbNTLMCuAdu5fTNtyCkbhweY3bAO2FbJKivXX3zEM2v+QOwEMYhqn/POvw5xsI4fJg
         X8Dt88OZbJu8C1m+WuOCapWsBOZIceK75fqJnB8v6UKuMIrOSVhEU2beJ5wRHAwAdWKc
         r26IBeDUMNKjkC05qB4tHRGHW5XjKytS0l8p6+gIGzGvpNnzOwzE5cPhYDjTRZfbHjpq
         CJAg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Bf9rbZREJJ2E3+dAB90xOYaGoKbSjq8jxDCMr273EqJ4aSHPrq20Z1AgGoDARvnnTMsN5QXHlIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzQO05k9fTRp2dIcWmc/YhDthuc0P3tjSxMThRpc9zOgQCxdy
	SBf/woVNtCE1ARZewVzcu7aOiSY4+TdIixBzOftnIqRoP51yJTw8tZyQEE9YiUHDm1zsVVwOWAF
	0/P3Em+LRUNoViZwloHvH2DPaXytYmYNWyfaqSlK6cOtq74W7LBmErjxg3A==
X-Gm-Gg: ASbGncsFg9cvL68gddbYjzScW3/52phDIFlpU5HkmT0R+KEFCrKF6xsrl2oPbstbO7X
	7NHhy+hpvOgn6IweZw7RzcEVPF83EH2ktor2bNtE0Kz7EY8dFHb21RKzXxgpxHvo6a9oIHumHB9
	AbAum1hBWfYTSoUxMZ4X8IvG5BfQVaXbz2c4xuIinzFc/fSBjG+Lb/qcGhfF7/iqCO9fA60LYZc
	/3RliZ9UCo/ScqRXVgi5xhJBCVzEWGc
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43668b93834mr397724175e9.28.1736174195191;
        Mon, 06 Jan 2025 06:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0zUq0wMUNH4AGrWwr5yK1Wt7AJ8lyLbtSAp+NItR7fypEguExnUJqnsC50MI52YtRVFYQdg==
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43668b93834mr397723965e9.28.1736174194695;
        Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661218f43sm573410285e9.19.2025.01.06.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Date: Mon, 6 Jan 2025 15:36:33 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
Message-ID: <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
 <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="l2x26wlw7urnozbm"
Content-Disposition: inline
In-Reply-To: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>


--l2x26wlw7urnozbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 05:22:56PM -0800, Stephen Boyd wrote:
> Quoting Miquel Raynal (2024-12-23 10:43:13)
> > Hi Maxime,
> >=20
> > On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:
> >=20
> > > On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> > >> There are mainly two ways to change a clock frequency.
> > >
> > > There's much more than that :)
> >=20
> > "mainly"
> >=20
> > Or maybe I should have added "on purpose".
> >=20
> > >
> > > Off the top of my head, setting/clearing a min/max rate and changing =
the
> > > parent might also result in a rate change.
> > >
> > > And then, the firmware might get involved too.
> > >
> > >> The active way requires calling ->set_rate() in order to ask "on
> > >> purpose" for a frequency change. Otherwise, a clock can passively see
> > >> its frequency being updated depending on upstream clock frequency
> > >> changes. In most cases it is fine to just accept the new upstream
> > >> frequency - which by definition will have an impact on downstream
> > >> frequencies if we do not recalculate internal divisors. But there are
> > >> cases where, upon an upstream frequency change, we would like to
> > >> maintain a specific rate.
> > >
> > > Why is clk_set_rate_exclusive not enough?
> >=20
> > I am trying to protect these rate changes from subtree walks, I don't
> > see where setting an exclusive rate would have an effect? But I might be
> > overlooking something, definitely.
> >=20
> > ...
> >=20
> > >> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core =
*core)
> > >>  {
> > >>      struct clk_core *child;
> > >> =20
> > >> -    core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> > >> +    if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> > >> +            core->new_rate =3D clk_determine(core, core->rate);
> > >> +            if (!core->new_rate)
> > >> +                    core->new_rate =3D clk_recalc(core, core->paren=
t->new_rate);
> > >> +    } else {
> > >> +            core->new_rate =3D clk_recalc(core, core->parent->new_r=
ate);
> > >> +    }
> > >
> > > Sorry, it's not clear to me how it works. How will the parent clocks
> > > will get notified to adjust their dividers in that scenario? Also, wh=
at
> > > if they can't?
> >=20
> > The idea is: if the flag is set, instead of accepting the new upstream
> > rate and recalculate the downstream rate based on a previously set
> > divider value, we change our divider value to match the same frequency
> > as before. But if we cannot, then we just keep the old way.
> >=20
>=20
> The exclusive rate code could support this if it doesn't already do so.
> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
> clk_set_rate(parent, <new rate>) the core code should try to keep the
> child at the constant rate, or fail the clk_set_rate() call on the
> parent. It should be possible to confirm this with some KUnit tests for
> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
> parent changes the parent rate, we should speculate the new rate of the
> child_A that's protected and fail if we can't maintain the rate. We need
> to start generating a list of clks that we operate a rate change on to
> support this though, because right now we rely on the stack to track the
> clks that we change the rate of.
>=20
> Initially we thought that we could do this with clk notifiers. That may
> work here, but I suspect it will be clunky to get working because clk
> notifiers operate on struct clk.

I think notifiers are great for customers, but not really adequate for
the clock drivers tree. Indeed, you can only react to a (sub)tree
configuration using notifiers, but you can't affect it to try something
new that would be a better fit.

Like, if we have a PLL A, with two child clocks that are dividers. B is
initially (exclusively) set to freq X, and then you want to set C to 2X.

The best thing to do is to set A to 2X, and double B's divider. It's
simple enough, but we have no way to try to negociate that at the
moment.

Maxime

--l2x26wlw7urnozbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vqbQAKCRAnX84Zoj2+
duj7AYDidThds1LFflb8OweKnRrNPu4M0tpfbKNRxlViGeUwfGeosS89X8zOl5WP
yBs8cfoBf3W2e/SASrJLpQctBMdyN2XKiw8Hpa9n9cLwlnq7mQteUYczwt9dWEyp
r6A1YHUBOw==
=VbDO
-----END PGP SIGNATURE-----

--l2x26wlw7urnozbm--

