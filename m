Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B301438259D
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074859; cv=none; b=Kkov3D4AcKnjx2SwEJ9UL4NOlYKHG7HgCikvZkGjn6OaXHANXdsmzdF8LBqY+lDSnkUAMzejUke+I5iB9Uxb2epM6OM1HuDNLWT9Fj0gJkNJ+xg6TV8LuAxSRm/CwLqeqEATPv97dbb1Mpn5cMd6W88xJnYGFGs14xICvD4Og7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074859; c=relaxed/simple;
	bh=2CkKgkVghxRXLPN/bmJz9X5h1cbFh6fLHEOwpZ0ff6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8KLzYk9Z1g0cc0un0teAS+lRcxb/f2+zilE7lNPOTWYTym+rvHnH/rfR+xC3jMEfNmfGq4PZUxkIUIswblPbSWPgqQjVVhsYTeRBYLG4wktYloRhiEBbfhB3lfujMOZC2TmACjVnJioL+zJv54R005urxk+3JSHgayjH6bk4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjK-0007oT-B8; Thu, 18 Dec 2025 17:19:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjJ-006JcI-0d;
	Thu, 18 Dec 2025 17:19:53 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjJ-00EcBP-0A;
	Thu, 18 Dec 2025 17:19:53 +0100
Date: Thu, 18 Dec 2025 17:19:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrej Picej <andrej.picej@norik.com>,
	Christian Hemp <C.Hemp@phytec.de>,
	Stefan =?utf-8?Q?M=C3=BCller-Klieser?= <S.Mueller-Klieser@phytec.de>,
	Norbert Wesp <N.Wesp@phytec.de>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <20251218161953.wjiruxqmib7lchol@pengutronix.de>
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
 <15bb2331-713a-4b6a-ae9a-4870066e84dc@norik.com>
 <20251215170750.j2l6gnbocmhdloe6@pengutronix.de>
 <09a773bb51331940e76fbeb5e8128c183bf6d621.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09a773bb51331940e76fbeb5e8128c183bf6d621.camel@phytec.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 25-12-16, Christoph Stoidner wrote:
> Hi Marco,
> 
> On Mo, 2025-12-15 at 18:07 +0100, Marco Felsch wrote:
> > Hi Primoz,
> > 
> > On 25-12-03, Primoz Fiser wrote:

...

> > > > +	touchscreen@38 {
> > > > +		compatible = "edt,edt-ft5406";
> > > > +		reg = <0x38>;
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&pinctrl_touchscreen>;
> > > > +		interrupt-parent = <&gpio4>;
> > > > +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> > > > +		touchscreen-size-x = <1792>;
> > > > +		touchscreen-size-y = <1024>;
> > > 
> > > Please add "wakeup-source" property here like in the downstream
> > > commit.
> > > 
> > > With this in place, panel touch can be used to wake up the board
> > > from sleep.
> > 
> > Is this a required feature? Touchscreens with no certain
> > low-power mode handlig (e.g. reduced scanning time) can draw much
> > power
> > in suspend.
> > 
> > I can add it if Phytec is aware of this fact and still wants to have
> > thsi feature.
> 
> Yes, please add this "wakeup-source" property again. This feature 
> shall work on our platform by default. And one who wants to avoid
> touchscreen as wakeup-source can modify the device-tree or disable 
> it for wakeup via policy/sysfs.

Okay, I added the property for the v2.

Regards,
  Marco
