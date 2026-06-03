Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CD38D6AD
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476623; cv=none; b=GM6nwTau0MjjyKRgfcJBaTo4RBjGIm8Mwqahq3kbEDpUFulxLS7pdq2cKutTW/C0UY5rpCWkUUqi5gqjq34oEJcHt7YwFLE/yrSJmZmPJrnZ3PadEwPT36P5un5DT2gmJvwFYsz1PR5ZnPa69gz4mulwz4t68jGQVSB7onzHXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476623; c=relaxed/simple;
	bh=kChDTn3kRYGc+IHl+JPYUW6GNro54cJia3usxiJj7kM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f4Rr13KlxEfZLTRF/RtNnWKoIaHmCWTbc5XOc453r2KzlCMrKl2jcgaAHFVkbrp1xeCMOmgwINawnQF3tsZ0qbsXetzBIUZ1+/Bm3Z37RItZqH4INyQf0ZDBAckLmNkIUjxixYQldNdhFyPEjhRoMEeiQYsExNVNpOcAt8Kvvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-00064L-Vg; Wed, 03 Jun 2026 10:50:14 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-000swV-2D;
	Wed, 03 Jun 2026 10:50:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUhIk-000000003f4-2VCO;
	Wed, 03 Jun 2026 10:50:14 +0200
Message-ID: <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 03 Jun 2026 10:50:14 +0200
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
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

On Fr, 2026-05-29 at 00:52 +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20
> I am sending version 3 of my zx297520v3 clock patch. The major change is=
=20
> that I have merged the top and matrix clocks into one device because=20
> the interface between them is unclear in the hardware.
>=20
> There are still a few open questions though:
>=20
> 1) The clk-reset interaction: Both clocks and resets are in the same IO=
=20
> space, sometimes in the same registers. I see a number of clk drivers=20
> that register a reset control. I noticed Yu-Chun Lin's RTD1625 clock=20
> submission added an aux device and placed the reset code in=20
> drivers/reset instead. Is there a preference for either way or any=20
> guideline of which way to use in which circumstances?

When there is no interaction required when operating the clk/reset
bits, I prefer the reset driver sitting in drivers/reset as an aux
device, especially when register access can be abstracted via a shared
regmap. Some of the reset drivers under drivers/clk just predate the
aux bus.


regards
Philipp
