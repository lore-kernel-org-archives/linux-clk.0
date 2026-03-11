Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCD332629
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241631; cv=none; b=g6+z518wyLCYsh89OyYrGztndDNZHD/FVbSfvpv1YWvvVaLgEaATNuuaWssEdWNaG45W1XmLofJIKF5EV2bp4DsZsBsXqtnseRb3GX6+rgamk1OOX/wFEpI+UNb30361FWYkvPJvLpLHd2EqdVwvkraIPbETrzTPhDi948ykuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241631; c=relaxed/simple;
	bh=XKGVKkkA1YFEQ28eofaP/YMo52x1WcSFJFUYOku2rV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rc5PHt1rGhn55I8rybXLotlq3fH+3IyMGZ/4hdzh0rexstINL6oTzABKWWZ+HHZWnYWn3Uk5Din/ReDEOQLqG6GPE98p5O/dJiYt2kVfuaChd+VIL+jjCcSqeAlTC3MwJjgyrBMfgAV0EZmnwOpw5tmmVU/eTw9gpWeSegbR+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Iuupisj3; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Iuupisj3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NHcXA4Vo5uDe7HPajpC5VBv8LgcG6irSL2nhHCrAnTE=; b=Iuupisj3Zuhf6ZYUv+SXKfxkRn
	jiWeCXQ3kAySgP18jGwfTLUhs9mFqMYGEOAFxq2l0Z9lWgRX7+pxzHDoF0v42r5+EN1L+OFGzn32p
	aotu/q3DhTlY9b/H6N1JnNqc4vzPMJ3Z7NhyI+anji1mIOrT/SIL0SLjjO5SFJpdGj+lX0ZjvUy8X
	4IDiKMQkkI368WAOO3CH5Q0NzBvVQm7DHv4IFgDiuRgT3YHuQEByjbFGeowge2v2iNJu+FEnJTVcP
	RIsXKZZ2W93C/d617uAo1GfVelOWT6hX8Mzl0BycC/jxf8Lzrf4OvkscDraezo02iEbwtZIu8R2mG
	/rgxEOMg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Ktb-0001sr-0G;
	Wed, 11 Mar 2026 15:50:47 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0Kta-000FGI-1O;
	Wed, 11 Mar 2026 15:50:46 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS display
 overlay
Date: Wed, 11 Mar 2026 15:50:45 +0100
Message-ID: <7489551.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
References:
 <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
 <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)

Hi Daniel,

Am Mittwoch, 11. M=E4rz 2026, 15:48:04 CET schrieb Daniel Baluta:
> On 3/11/26 16:32, Alexander Stein wrote:
> > +
> > +&panel_in {
> > +	remote-endpoint =3D <&lvds_encoder_output>;
> > +};
> > +
> > +&dpi_bridge {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_rgbdisp>;
> > +	status =3D "okay";
> > +};
>=20
> Hi Alexander,
>=20
> Any reason for dpi_bridge breaking the alphabetical order?

Nice catch. Thanks. I'll update in v2, same for PATCH 3.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


