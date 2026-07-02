Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E871FB1;
	Thu,  2 Jul 2026 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982906; cv=none; b=BBrybQc/axNu3eciXQ4Pyd0f64kH0kgbFNNQ2HZ0O8NRpEBHd9nn7YfHh6FG0RUNDxCe//0uo0ojYdby1+o+R2zmwC4dvVvkt0C6vE99Cji4rB6vK5OkNv5LjXv6AZTcf6cIreRpTv5CYF+RS14MraW/bpz6QWx9ZiYiJtgApJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982906; c=relaxed/simple;
	bh=Ci5DBXRn+5kdYcV4syoJ/nlrfafCD6IBrci7rpIgT7k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AewDd6Xt2CsL1fi9vgZ1IBQLtJmGZubhwnwGN5uCwdNwM+a1ZZlDflLyFCI87kZ3dzhXI7gMCCwrMo/appy4Ld7nk+vhVEDpR14SZ2IgykFQEe26HKZLTmnV50px5N6BMwhe0vshHq8o0Nm+skUNOu9bATU8+DN0bsDRKgdUinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E3D852003DD;
	Thu, 02 Jul 2026 11:01:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfDIc-005iZG-2i;
	Thu, 02 Jul 2026 11:01:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfDIc-000000005AH-3BGi;
	Thu, 02 Jul 2026 11:01:34 +0200
Message-ID: <1ef8b2e4ab588aac1dae737541240e698fcf26a7.camel@pengutronix.de>
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Brian Masney
 <bmasney@redhat.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 02 Jul 2026 11:01:34 +0200
In-Reply-To: <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
	 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
	 <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
	 <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-06-30 at 11:53 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> > Am 30.06.2026 um 11:27 schrieb Philipp Zabel <p.zabel@pengutronix.de>:
> >=20
> > I think the MFD driver is unnecessary overhead. Can't you just keep the
> > reset controllers as auxdev and use of_platform_populate() to create
> > devices for clock-controller child nodes such as syscon-reboot?
>=20
> MFD for top and matrix was the suggestion of Conor:
>=20
> https://lore.kernel.org/linux-arm-kernel/20260618-fantasy-estimate-6c52ed=
bc6890@spud/
>=20
> To quote:
>=20
> > I think aux bus makes perfect sense when you have a clock/reset
> > controller, but once you start expanding past that and you have reboot
> > or hwmon or hwspinlock then mfd starts to make sense.

Note how the example Conor gives is introduced with:

> > Because I messed up stuff in the past, reset-mpfs.c has both aux bus
> > and mfd probing in it, [...]

So while, yes, this is possible, I'd like to avoid it if not necessary.

> I can go either way. To me aux vs mfd seems like a distinction without a =
difference.

I think that's because the main difference doesn't apply here:

MFD comes from aggregate devices where a shared register space
accessible via a physical bus (which we have) can be partitioned out to
child devices. Reset controls are often just individual registers or
even bits scattered around the CRU register space, so we can't make use
of the MFD framework's IO/IRQ resource partitioning infrastructure at
all.

Auxiliary devices were introduced to separate functionality of a single
device into subsystem drivers (which applies here) for devices that are
not just controlled via direct register access, for example via a
firmware interface. That's not the case here, we usually can just share
a regmap.

Either way, I'd prefer the reset driver to not carry more boilerplate
than actual reset code, so if you can either put all of them into a
single auxiliary_driver or into a single platform_driver, I would be
happier.

regards
Philipp
