Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6D3E1218;
	Thu, 18 Jun 2026 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775928; cv=none; b=ADnYg/W3jK8jotcUvqWkpFCiEW18fIKa9O+NTPKaMrjgGgfUr9xkbyVxCuDy5AzKi6x5iw/9BEvwdLC06ecO2MgIY/sWggu5cRJ5loKwqJ3XczishG8xbRTSxNg3tZwp4NAUBtVYWaW7fnbZlOLeEcSFrsjBwIiFE8OJoCbDotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775928; c=relaxed/simple;
	bh=soFFhd/e1EcbC4o2H1GFX24/KTFjL6ZkTmQXbrKQIrY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mWaI6FWLCdN9Z0NKvRurhBYjW3tohxo9gQVNUfkr1bw3MnqTn6uOVrTIYfcRuqPJGjhCcQreLGBgnpjMTVXyfAMvVXI1v10i7sYdXJoInap1+ARP4McI7BUeCtlfTaoc8DaTcMTwOSlMr+pmRuAOeFOtG+mBhrxVyPqqpRfHqkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id ABAD62002AA;
	Thu, 18 Jun 2026 11:45:24 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9JM-003PsA-20;
	Thu, 18 Jun 2026 11:45:24 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9JM-000000005Ev-2Glm;
	Thu, 18 Jun 2026 11:45:24 +0200
Message-ID: <0bec40ded4ca98136064c2f158551e4269d51944.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Joakim Zhang <joakim.zhang@cixtech.com>, Conor Dooley <conor@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"	
 <sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>, 
 "robh@kernel.org"	 <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org"	 <conor+dt@kernel.org>, Gary
 Yang <Gary.Yang@cixtech.com>, cix-kernel-upstream	
 <cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"	
 <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 18 Jun 2026 11:45:24 +0200
In-Reply-To: <SEYPR06MB6226B25BA7652287C752E4C782E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
		 <20260617060437.1474816-4-joakim.zhang@cixtech.com>
		 <20260617-clinic-blank-61289f8fc1c2@spud>
		 <SEYPR06MB62262C0F7823337CA9496DE982E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
	 <cd63c1ab9831fdfd39aad8d1a40c4702a9cbb158.camel@pengutronix.de>
	 <SEYPR06MB6226B25BA7652287C752E4C782E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-06-18 at 09:27 +0000, Joakim  Zhang wrote:
> Hello,
>=20
>=20
> > -----Original Message-----
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > Sent: Thursday, June 18, 2026 4:30 PM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>; Conor Dooley
> > <conor@kernel.org>
> > Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; Gary Yang
> > <Gary.Yang@cixtech.com>; cix-kernel-upstream <cix-kernel-
> > upstream@cixtech.com>; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: a=
dd audss
> > clock controller
> >=20
> > EXTERNAL EMAIL
> >=20
> > CAUTION: Suspicious Email from unusual domain.
> >=20
> > On Do, 2026-06-18 at 01:43 +0000, Joakim  Zhang wrote:
> > > Hello,
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: Wednesday, June 17, 2026 11:56 PM
> > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> > > > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > > p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>;
> > > > cix-kernel- upstream <cix-kernel-upstream@cixtech.com>;
> > > > linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; linux-arm- kernel@lists.infradead.org
> > > > Subject: Re: [PATCH v4 3/5] dt-bindings: clock:
> > > > cix,sky1-audss-clock: add audss clock controller
> > > >=20
> > > > On Wed, Jun 17, 2026 at 02:04:35PM +0800, joakim.zhang@cixtech.com
> > wrote:
> > > > > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > >=20
> > > > > The AUDSS CRU contains an internal clock tree of muxes, dividers
> > > > > and gates for DSP, I2S, HDA, DMAC and related blocks. The clock
> > > > > provider is a child node of the cix,sky1-audss-system-control
> > > > > syscon and accesses registers through the parent MMIO region.
> > > >=20
> > > > Why can this not just be part of the parent syscon node?
> > >=20
> > > The clock and reset blocks are handled by different subsystems and
> > maintainers (clk vs reset). Putting the clock provider on the parent sy=
scon node
> > would mean a single driver has to register both the reset controller an=
d the
> > clock provider on one device, which doesn't fit well.
> >=20
> > There are many examples of clock and reset drivers sharing the same nod=
e, by
> > using platform_driver for one (usually clk) and auxiliary_driver for th=
e other
> > (usually reset).
>=20
> OK, I will have a look.  If you are also prefer to this, I will refactor =
the patch.

The hardware should dictate this, not the driver/subsystem/maintainer
boundaries. Looking at the register numbers used by the drivers, and
assuming that the audss_cru label in the dts patch means the TRM also
calls this a single Clock-Reset-Unit, I'd say Conor has a point.

regards
Philipp
