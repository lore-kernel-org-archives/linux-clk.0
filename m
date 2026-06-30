Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950E2D0C82;
	Tue, 30 Jun 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808075; cv=none; b=cgWPyAcHOcLxz4AEOQBa5bexgIq4K9idm77H8pXhUio4+oiZXE9HhpX9/2oYmRaBTVirwTDxdzSLUlGlh0v9BDYnscC7WJGxjyTVONX3AL7qiIXQiKCTcRyPtXUE7vj/cVzSdth+11byDhCrBAk5HnvrsGA8dDTxiAcUaBm6+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808075; c=relaxed/simple;
	bh=oRhyV5noi8Q/w0aCeUKEONjgKn1IUDCoCQz2t9jyoFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Epl3JKNO6GBxCIedVWoOlMvP/nRwnDCeFAcROwR4Zlw05m2i7VmjySrwCziYpIhrPfGMfIiJ37K5XThdu4mycBFKRnAHAf9TTD0OImD/Faz6q7br8PQx3vOrsH/qMgdL/+0he8d1pngt9zFAixJ+mNaj8rxf0VoKOU9OSEVy94g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1C28A20066B;
	Tue, 30 Jun 2026 10:27:50 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weTos-005Nla-06;
	Tue, 30 Jun 2026 10:27:50 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weTor-0000000049m-418Y;
	Tue, 30 Jun 2026 10:27:49 +0200
Message-ID: <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 30 Jun 2026 10:27:49 +0200
In-Reply-To: <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
	 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On So, 2026-06-28 at 22:59 +0300, Stefan D=C3=B6singer wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> Version 5:
>=20
> *) Pass the static clk data instead of calling get_match_data to prepare
> for operating as an MFD child.

I think the MFD driver is unnecessary overhead. Can't you just keep the
reset controllers as auxdev and use of_platform_populate() to create
devices for clock-controller child nodes such as syscon-reboot?

> *) Don't use devm_kzalloc to allocate the auxiliary_device
> structure. I guess Sashiko is right, and that's what "Because once the
> device is placed on the bus the parent driver can not tell what other
> code may have a reference to this data" is trying to dell me.

Not using devm_kzalloc() for the auxdev is correct, but it looks like
you could simplify its creation a lot by just using
devm_auxiliary_device_create().


regards
Philipp
