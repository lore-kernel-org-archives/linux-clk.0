Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195042820BD
	for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 08:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705495; cv=none; b=ZJSnVAC8LPtwlx+mi3Gjt+D5drkJ8DTeQHWMe8rPjPLnmXMeeQ6693RBEzqaN3zFE13wHZV8BiIVQIZMZW05YwyyGK5478TiHUlY6FhnbrRvnWiEEdYYQGEfAAq5tTvXPa/2FQ9nOs1s2lID6i4q1Lz3OetHALXyasPsiICGejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705495; c=relaxed/simple;
	bh=sFGMekDjeVuOQRwXezlB0hJR41CNbYrITZjFMlKUWVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JaGkqIh87OZRUMIG6gNWJwSV7NVYq4eA6i0L/ei+Gd3BIRrrQWBs7u5Q55/TIkSzDaWU9S5k2jo/kIqWJwRg3hgoXAzDO0RW6eQomYc/oXlxd88bil/uj9IeZNcciNDBQIp4raMWBvto8/P3+szMIh7ZrgXdCIC+9xKnn6QGAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bay-0002GN-5b; Tue, 15 Apr 2025 10:24:40 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bax-000O1M-2z;
	Tue, 15 Apr 2025 10:24:39 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4bax-0003O6-2l;
	Tue, 15 Apr 2025 10:24:39 +0200
Message-ID: <dbd81c1b07f65edc77329ff479bdf9c790c78120.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/7] clk: spacemit: add reset controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, mturquette@baylibre.com,
 sboyd@kernel.org,  robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 15 Apr 2025 10:24:39 +0200
In-Reply-To: <20250414191715.2264758-4-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
	 <20250414191715.2264758-4-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mo, 2025-04-14 at 14:17 -0500, Alex Elder wrote:
> Define ccu_reset_data as a structure that contains the constant
> register offset and bitmasks used to assert and deassert a reset
> control on a SpacemiT K1 CCU. Add a pointer to an array of those
> structures to the spacemit_ccu_data structure, along with a field
> indicating how many elements are in that array.  Resets will be
> optional, and if none are defined the reset array pointer will be
> null.
>=20
> Define a new ccu_reset_controller structure, which (for a CCU with
> resets) contains a pointer to the constant reset data, the regmap
> to be used for the controller, and an embedded a reset controller
> structure.
>=20
> Each reset control is asserted or deasserted by updating bits in
> a register.  The bits used are defined by an assert mask and a
> deassert mask.  In some cases, one (non-zero) mask asserts reset
> and a different (non-zero) mask deasserts it.  Otherwise one mask
> is nonzero, and the other is zero.  Either way, the bits in
> both masks are cleared, then either the assert mask or the deassert
> mask is set in a register to affect the state of a reset control.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
