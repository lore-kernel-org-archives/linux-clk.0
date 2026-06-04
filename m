Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75447DD6D
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580676; cv=none; b=jKMLFsdMwyBof4w+fbFrDVg/YFyZ9V+1pqZSU6XKYy2RTj8PUaZBFW9TKL6YZJtaLZmMjsXAhMfqsB7y0pjCl81sCmJ5STV7z2LSpjoEXLqFPJ8frLAzkU5j4yaTNUsUJkewhOfYACrtdkU407DeUAwNcd3fsigt+DAHN4ESo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580676; c=relaxed/simple;
	bh=JAYNoi9z2XrkP30NSWWkWVNm0tZX6tGRbCpHrwaHTcI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RoUli23fW6KQC9kIPtiVEBjMSYgEjk1+b0kqhMVHwWbdUoTfDdLNA6TGEZPlzycdSPMEusN2E3rmyTsxD3nV5IIH7Kr324fo+zvJJChjP1bZ6WEw4iFZ6pvOJsWb38lJ4GXBD41490valC4vBtfWyCD16xIxbzoNcg/LlDsTsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-0000Us-9i; Thu, 04 Jun 2026 15:44:25 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-0015UZ-0i;
	Thu, 04 Jun 2026 15:44:25 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV8Mz-00000000AB7-0Z7A;
	Thu, 04 Jun 2026 15:44:25 +0200
Message-ID: <15ab692f367e9fb607324a3d648ae9fd0b5a5af9.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 15:44:24 +0200
In-Reply-To: <7973709.EvYhyI6sBW@strix>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
	 <99743c29fe81a90d3c1f51889d42ef9d4766de3c.camel@pengutronix.de>
	 <7973709.EvYhyI6sBW@strix>
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

On Mi, 2026-06-03 at 23:49 +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20
> Thanks for the comments!
>=20
> Am Mittwoch, 3. Juni 2026, 12:14:21 Ostafrikanische Zeit schrieb Philipp=
=20
> Zabel:
>=20
> > Is this delay long enough for all potential users of reset_control_rese=
t()?
> > Are there actually any at all?
>=20
> You mean drivers that are in use on this SoC that call reset_control_rese=
t?=20

Yes.

> Afaics not, they all call reset_assert/reset_deassert, or only ever deass=
ert a=20
> reset that is set on boot. It isn't called at runtime and the only driver=
=20
> calling it that is in use on zx297520v3 is stmmac, which only calls it if=
=20
> assert/deassert aren't available.
>=20
> I implemented the reset() callback because other drivers had it and grabb=
ed=20
> the magic usleep(100) from ZTE's USB code. It looks like I should just /d=
ev/
> null it.

If it is not used, please just drop it.

The .reset callback exists for self-clearing resets [1]. It's ok to
emulate those in software for the benefit of consumer drivers that have
to work with both types of reset controllers, but I'd like this to be
limited to those case where it's actually needed.

[1] https://docs.kernel.org/driver-api/reset.html#c.reset_control_ops

>=20
regards
Philipp
