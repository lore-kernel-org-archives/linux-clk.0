Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D52E0B71
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131810; cv=pass; b=Fziq8upfhRUJaFV4t+6JwvyDoVwLwxIXXL2j/kbIOQRPXe9PxM+3y500UnDLx3FwYsNA6IkvSYyViU2S3nubBeXX8XY1IxxBamBHBZoNLQ5B5H2UDOZtxrN43jfvOy2CvxP+VuNmf+V5vHQknFtbDx84xNr+zObvzJfxMR+EuBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131810; c=relaxed/simple;
	bh=SshNRPgIyfZhOL9g00Tx3x9NU8S7Oou4WRUj0p6RJMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cxcn53XTIyyGZqyqU5BCglFjy8qUh/d9ycYO6lrA1kO6eumFrpR1b1uw1shY0/Evy9LW3ELEv28F6MXgK1vlz5fjDvxnk3yx1oOYGbqYVz9zdF/lZ/JyGjTvH2WnaNrsXiFSeM8UQ94ZlhBdhdvOCIp9aqg+EoypTl4R7eOzFfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lTTAv3p5; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lTTAv3p5"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766131783;
 b=Hh/n6nHDO7aqsOS/50Hyxsq0EnR8fLOGEburW9N26fypL66s0ukapdFo+SAh+FblPRlAZLH6
 6feO5keeszBj/cSL1yjbpx3Q9I5FgCnwUzKZNM3gyBg5Rx9HkRapc6//NB6+hV6B3RkNH+GsPo/
 5DdizjtnQh/XN7xFMdYO+DmsU2ZB6YRz9onCo1Z2B4pWdMXFrHGtBHDAVoJgNV4KD04Gc2Bthlc
 wzuYBRDkrO9odnEnYH5JLpKjljm3hgfg9fn2KYjZNBfwjGzsx8oPfE/XDCaLDh4euR19EEBeKSU
 rSj/0ARcmjAlViSxm6Scghwxq/SoGibZPu7WQLH6ViwYQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766131783;
 b=NuWFnFQ6UUm6EFSn8fboiklkIfjr5RcQHqKjsHLQOKmI2fsaZEE3nLJyjLEiMFFZqBgyX3tP
 x7AziNAgmXB74MyApIUQqik47kv65WDVGQp1yrP41eg2o8hTgino/HwQ/nxgiKU/9yXFV8//GGY
 5ogDVDnaIVUyDivbXdvejyFRpYNRqnso4IOrgk5hFt+DofCDYqpu+p1tbnR/Bm6WmwbVPTyQ+OG
 WNN4c0fhpyXmYWfpLsriCeeBZrxmyZN94s7E2s/OpjqVOeByks5d6Zieg/Awx9MN2jZjDo07+UL
 CrReVJSh8tjmcpev6vqcAKvOJHJ2cu7YGLdY86ptKLSjg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:09:43 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC51CCC0DAC;
	Fri, 19 Dec 2025 09:09:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Fri, 19 Dec 2025 09:09:23 +0100
Message-ID: <3357591.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXgDN6fwtz3yb91
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5b88bc5d9b014baba218eed2fec8b5d2
X-cloud-security:scantime:2.167
DKIM-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766131783; v=1;
 b=lTTAv3p5k2mBiWpbSAGakugERPYgBYZH6Uf52L+Lb+GaoLYNq6I9RpiS+MtNQTaXQLqgPuNq
 X+V0d9ifN/fwioeqln06mShiXzdQ8RIDSjzMZINDpXzdZEwxoGRLPOEx5Ib82yotaLW+2tzvttg
 QWaIsitkpLwO85Uu7i+VKSzUt12r2bQvQlv3FNLyMvi/9Nj92jisoG9eoC+5LJgIK9XzcQDO/dJ
 9swJq/AuZNy59gRg6G/E5ZGyU+sk7py7ubLUYi1Ily62FUUaykHS3mIo9n/pfyXyDW30QCqPTGN
 P6vOhVDaZBEhTXK5LPc0U/apZVHtMFIoU3+VaP1qu1iHA==

Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Add "clock-output-names" which is a standard property for clock
> > providers.
>=20
> Why? Isn't that property sort of deprecated?

It is? Oh, I wasn't aware of that. Maybe the property should be
marked deprecated in dt schema then.

Thanks and best regards,
Alexander

>=20
> Will be replying to the cover letter next...
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


