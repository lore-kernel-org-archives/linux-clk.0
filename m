Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEE7304976
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586593; cv=none; b=oN9v6d0BKIpKCtnvEpaXhsb9cEcsw6/KWjfeb+R6A1pDUwIKSxlh9TKFR01tcoC126RF4MOvUMvdBROK+5mhE2AXBhMA0lX7KY4rxvtwFpaiQ3PkhnF7r9RqLx3g4CX3k242W7ULQ7/rvcflpf89GcJXoCeYwS+pyrQ6uur9jFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586593; c=relaxed/simple;
	bh=pVuZuEBIULjzQABGGJSQfIDgV0lIC+f74CyYOz83UH0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i7T78qWGyOAaFnEoicDUPBGdjf+pZ6ZxwzLUGxbp1azAqgAGRmDuZlc2SUd6/H+CaZe11BVW/wDrIsj3ZZZ/vXbhcPC5E2nKxSi4PoKNGISfG2VO8TsU7BSDnEGocjO7RbASgFTeTczAtx/xFDGQ/FOmdOsAAn2kuFW/WpPQhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0008Cm-TC; Thu, 04 Jun 2026 17:23:01 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0016D7-1k;
	Thu, 04 Jun 2026 17:23:01 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-00000000CcW-1o5o;
	Thu, 04 Jun 2026 17:23:01 +0200
Message-ID: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 17:23:01 +0200
In-Reply-To: <2062167.PYKUYFuaPT@strix>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
	 <2062167.PYKUYFuaPT@strix>
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

Hi Stefan,

On Mi, 2026-06-03 at 23:49 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> > When there is no interaction required when operating the clk/reset
> > bits, I prefer the reset driver sitting in drivers/reset as an aux
> > device, especially when register access can be abstracted via a shared
> > regmap. Some of the reset drivers under drivers/clk just predate the
> > aux bus.
>=20
> There are two interactions:
>=20
> The register lock because all LSP and at least one TOP register contains =
both=20
> clocks and resets.

That could be solved with regmap.

> Shared register definition: in the case of the LSP clocks breaking up the=
=20
> composite definition would sacrifice readability.

That is a matter of perspective.

I had a harder time validating that the resets[] array is properly
initialized from the two different composite arrays because of the
unordered reset_ids, and some remaining resets[] being filled via code.

It would be much simpler if you split the reset definitions out into a
single, separate, const array, indexed by reset id. In fact,
I would suggest this even if you don't intend to move the reset code.

> Neither of them are insurmountable and I can certainly arrange a separati=
on if=20
> asked to - but my preference is to keep them together.

I'll leave this up to the clock maintainers.

regards
Philipp
