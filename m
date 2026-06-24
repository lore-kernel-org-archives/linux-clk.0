Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8E25F994;
	Wed, 24 Jun 2026 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301549; cv=none; b=A5FfFZE+GNk/P0OPxWMwcMeyOOmgaBjcRTdxbF4IX3DEWZCVwd0ySj9UafRTkUZlH2cm+XYrmVMDB5yLiOxZAKXwp1ste10BWChtiros3MMi5g/pgreRu+jX/eQ1XkBykOmpeG93ClBgxRg2C/ZWp0DVHfVo1k/lW2LnDX1iXso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301549; c=relaxed/simple;
	bh=425jpoUA3Tt1bWmkrOSFNWHphFjZunbpgGFQD4aSpdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt7L57t4ZW3suitd9kdHK8wc3qui/SahI0Q845Mj088Y/sZeMmq3czCy4dUbBnMhbLAdQiME1mu69ATJjCRMxbka0QIzZpZFxqtrJ+rkJsRVI43eERrNUvGEqFNPQU9IkSAwKGubJ1SLS3Yl26IGZ3jBOqDfib2wGAkxkn+AqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HwpDwOU/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HwpDwOU/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=425jpoUA3Tt1bWmkrOSFNWHphFjZunbpgGFQD4aSpdk=; b=HwpDwOU/UQBrzXup3v/4wCO3K7
	zCJ7IIJaNRAveaToemqT9Rm33qC2yoq6kgTe2qtMtHgKZqPa4v07jlFRW4YuHCc5FerIo7rjalVAo
	mLceUYW8JZDM3ObrEFORrFNx8WeJS86BFf7n0D4HoZfGB74CH7p3GXWsWxbomDFIRm/hGpJ6k/c8X
	AcEzqVQPcfq7lbf9EnV/MwaW8Hr/GSnVw85NCnZxwDFkHv6RVtGoTuW77yfA9FCVceAaYve9jWY/d
	+mMFYaGajGkDVtAwwhK1t1tnE4Vaage37RZPRnx4ZYFlkUatkgW4UCiRG4ij0WZwJLq+BbA3tjSV+
	CRLniJYg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniele Briguglio <hello@superkali.me>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject:
 Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK
 output to IO
Date: Wed, 24 Jun 2026 13:45:22 +0200
Message-ID: <2008560.6tgchFWduM@diego>
In-Reply-To: <DJGM4D19H31O.4I5N79CG5Z8C@cknow-tech.com>
References:
 <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260623140958.4181297-1-hello@superkali.me>
 <DJGM4D19H31O.4I5N79CG5Z8C@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 23. Juni 2026, 19:42:05 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
> Hi,
>=20
> On Tue Jun 23, 2026 at 4:10 PM CEST, Daniele Briguglio wrote:
> >> So IIUC that means I'd be testing both variants.
> >
> > Right, that covers both: the mux path and the consumer path. Looking
> > forward to the results.
>=20
> Analog audio works on both. Plus with _TO_IO and LTS without in their
> respective DTS's. So I guess CLK_IGNORE_UNUSED works.=20
> Whether it's a good/right fix, I'll leave up to others.

It is the correct fix, as it returns the original way things worked for
boards not activly handling that clock.

So while boards should do that, this makes the clock-addition
backwards compatible.

Care to send a patch for that change? :-)


Heiko


