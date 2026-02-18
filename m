Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7B32E753
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404882; cv=none; b=enZlw8zS3o0d3zMA0/Ge8SU2R/RQlN4Et4jZtCgH5+VpPK6pQ6vCmh4FuDHwVBbc4JskcmfeMnUUgNXS9OD0xUyJrWTVsSSttXxMkroKkRRr3QY86/+fyBAuzx6YCAfJgPCxQOO1w72MuvliKA4j0v4srRk0nry/at5z0niLkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404882; c=relaxed/simple;
	bh=B0LX9IIPSQh0nxiusnWB2RbTaT3+xl4JMsPNGQemMKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Td5MBQpEJdSVjx/b5148A657N2iGGEfPYBZG7Rg/2SLjTrzafwtWuv7yARjBYz4T9CmRxHM3My3/4zs5SOnA6ZVDb8RAkBu86yMn9xeRngDyLDn5AJPdg73nQ9H5yeG/hj+7mhmvUFNFBSo1JWAJf59QaMNGlEBayO+1rRfG624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKI-0007hc-GA; Wed, 18 Feb 2026 09:54:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKG-001NLe-0Q;
	Wed, 18 Feb 2026 09:54:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vsdKH-000000001Hj-1f9a;
	Wed, 18 Feb 2026 09:54:29 +0100
Message-ID: <d5c50646f309f82009e2fcac0607d0a485ed1174.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley	
 <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, joel@jms.id.au, 	fustini@kernel.org,
 mpe@kernel.org, mpe@oss.tenstorrent.com, 	npiggin@oss.tenstorrent.com,
 agross@kernel.org, agross@oss.tenstorrent.com, 	bmasney@redhat.com
Date: Wed, 18 Feb 2026 09:54:29 +0100
In-Reply-To: <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
	 <20260216-atlantis-clocks-v6-2-cb46d6a59c73@oss.tenstorrent.com>
	 <015b88b520db434fca21e83958c68cf6308f0f79.camel@pengutronix.de>
	 <CAEev2e-tHySkWQBE6qUNQq+zayc+P30DV0=0LJw09saSoh8fNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Di, 2026-02-17 at 16:49 -0600, Anirudh Srinivasan wrote:
> Helo Philipp,
>=20
> On Tue, Feb 17, 2026 at 5:59=E2=80=AFAM Philipp Zabel <p.zabel@pengutroni=
x.de> wrote:
> >=20
> > On Mo, 2026-02-16 at 16:16 -0600, Anirudh Srinivasan wrote:
> > > Adds Atlantis Reset Controller driver, which shares the same regmap a=
s
> > > prcm ( clock controller).
> > >=20
> > > This version of the reset controller driver covers resets from the RC=
PU
> > > prcm.
> > >=20
> > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> >=20
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> >=20
> > and
> >=20
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> You seem to have added a Rb and an Acked-By. Did you intend to add
> both or just a Rb?

Both. R-b for the content, A-b for the patch going through another tree
than reset.

> > to be merged via the clock tree, since this depends on patch 1.
>=20
> We have a tenstorrent soc tree now and were thinking of taking this
> series for 7.1 via that.

I'd be fine with that as well.

regards
Philipp
