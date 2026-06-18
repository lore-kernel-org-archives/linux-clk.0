Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8423A7590;
	Thu, 18 Jun 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771412; cv=none; b=fL5IdOcg2IMqN/yPVo23QDJki5qi+7tQA7TXWI16QHDZBWXTn/L9AinBIsuoK7z2ZPeRXlDTzRA90+HEoElWcjqxWbeoKtzTugyjVcIEQe7YoaA01fKiY3NvQjN7ulp4Lg0U628Zuj5GiX8I6jbHI2rYm4JRh89faUc0chMLbNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771412; c=relaxed/simple;
	bh=6mIvcGy8LPHzfteMQOnk4oL6dfSG3N5Gsj+qKYirtyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jqgRnrZIrEecMZYkxnIOhMh079VZSEi9rFeQqwZTtMsNcaNuhvJTC8465N04Vy2x7o5a0z0yGOgASt+hfWyCG3JXKEEaw6q9uWm/lU/t0QJvh74V09SDg+I3II0OGIt8J2N6GQ3sm2Xma7qfAwFm5P0Nd2N9+sACCBWtmJ4VcNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2D22320071A;
	Thu, 18 Jun 2026 10:30:05 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa88T-003PMn-0D;
	Thu, 18 Jun 2026 10:30:05 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa88S-0000000033G-4Bo3;
	Thu, 18 Jun 2026 10:30:05 +0200
Message-ID: <cd63c1ab9831fdfd39aad8d1a40c4702a9cbb158.camel@pengutronix.de>
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
Date: Thu, 18 Jun 2026 10:30:04 +0200
In-Reply-To: <SEYPR06MB62262C0F7823337CA9496DE982E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
	 <20260617060437.1474816-4-joakim.zhang@cixtech.com>
	 <20260617-clinic-blank-61289f8fc1c2@spud>
	 <SEYPR06MB62262C0F7823337CA9496DE982E32@SEYPR06MB6226.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-06-18 at 01:43 +0000, Joakim  Zhang wrote:
> Hello,
>=20
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, June 17, 2026 11:56 PM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: mturquette@baylibre.com; sboyd@kernel.org; bmasney@redhat.com;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > p.zabel@pengutronix.de; Gary Yang <gary.yang@cixtech.com>; cix-kernel-
> > upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: a=
dd audss
> > clock controller
> >=20
> > On Wed, Jun 17, 2026 at 02:04:35PM +0800, joakim.zhang@cixtech.com wrot=
e:
> > > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > >=20
> > > The AUDSS CRU contains an internal clock tree of muxes, dividers and
> > > gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider
> > > is a child node of the cix,sky1-audss-system-control syscon and
> > > accesses registers through the parent MMIO region.
> >=20
> > Why can this not just be part of the parent syscon node?
>=20
> The clock and reset blocks are handled by different subsystems and mainta=
iners (clk vs reset). Putting the clock provider on the parent syscon node =
would mean a single driver has to register both the reset controller and th=
e clock provider on one device, which doesn't fit well.

There are many examples of clock and reset drivers sharing the same
node, by using platform_driver for one (usually clk) and
auxiliary_driver for the other (usually reset).

regards
Philipp
