Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD51F30BB;
	Thu, 18 Jun 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777258; cv=none; b=WHKEI1gzRUpiOH+tfeurGE+RykBvpH7PzIUX/KKy03w/704gTaaJylZw0z6iMRDGmB/x9bUmFogSde9Z8gCH+Bv1V3kYvExW2fbZ+np7rGn8BD3PFmikpDxmZDwMrzYcfi/BYGZOc9ktAb3bVukY63sHTJ76w9Zx0AqukELrguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777258; c=relaxed/simple;
	bh=cco+RFdkzD9BWRwgoYoN/A4dN8BWg8n/rXsKjM10FzE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHSS0spGpPdZ9YlkfGhUQGNLucmrDZnbXo5IYPz6Q3qaQojeyxbaTOc4J+CBT4C2L8ESj9P6mq5IG3ydXFUUPsRccUwCSWC4TiPCt3CU4VZkZ8L7fJ/hTGB+pCG9QOPLyEIOvLxuEFTrCatGuPD+FThrLkAqbaA6HHd7UXSk5IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1EA6F20098D;
	Thu, 18 Jun 2026 12:07:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ep-003PyD-07;
	Thu, 18 Jun 2026 12:07:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9eo-0000000060M-3qHW;
	Thu, 18 Jun 2026 12:07:34 +0200
Message-ID: <56178c185c25cbdfdabe6df6c6028f909fbc32df.camel@pengutronix.de>
Subject: Re: [PATCH v8 08/10] clk: realtek: Add RTD1625-CRT clock controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com
Cc: bmasney@redhat.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Thu, 18 Jun 2026 12:07:34 +0200
In-Reply-To: <20260610080824.255063-9-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
	 <20260610080824.255063-9-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-06-10 at 16:08 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the CRT (Clock, Reset, and Test) domain clock controller
> on the Realtek RTD1625 SoC. This driver provides essential clock sources
> (including PLLs), gating, and multiplexing functionalities for the
> platform's peripherals.
>=20
> Since the reset controller shares the same register space with the CRT
> clock controller, it is instantiated as an auxiliary device by the core
> clock driver. This patch also includes the corresponding auxiliary reset
> driver to handle the CRT domain resets.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Please split this into two independent patches, one for clk and one for
reset. Same goes for the next patch.

regards
Philipp
