Received: from mx-relay03-hz2.antispameurope.com (mx-relay03-hz2.antispameurope.com [83.246.65.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BB2EA156
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134447; cv=pass; b=Ry5Kfw7ZDZCnCVOFVHCdIlHV+1t4qkOIpGyFBD3r+n98WE+r84Qc+fd0AA9uug6NV9Ee986EH7jO0lX7mZzW/m0d+vX30h5kU8XZ+kBQNkHnDlW/QDTlmQtXtBmqfgMbIOYU8hrpBJyWBu2eYp6ttBtdRbJkkUwnEqGS5FRt8nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134447; c=relaxed/simple;
	bh=7lPH8ZuwqrR0EPFMmGW3KMxzeLFRv6JnjvXAyllK02A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnWDfuUBTc4uojHoOFECcd2V55maOUFPqTejlcvsXtidASiTX2lMhEEGzyy+5qK1DTsJU9nUPNGcySRthq1NcdFv7I9wAumXg6TLgmW3DHFzugb+PXhde4tK8HgQSNEXjLNdlO0Alm0ZQfztuNSh7iECMqTGM/Sp2Gcz0iAx2UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Bp1hCPuH; arc=pass smtp.client-ip=83.246.65.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bp1hCPuH"
ARC-Authentication-Results: i=1; mx-gate03-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134354;
 b=qe9kKf3z6ZygIMoIaFGy1oz7e6GdVMSG/0UWxdEGFpTCrAY8sOKQzANKBtJUODttgP0Z6eIh
 Yol60UKTKowYgIMc+G//3rUWKPIl12sqktNn+SZ9/X+9UzLUK7YaxihimXzf9DhNd8Am6uwTIAd
 b0phgI7FcwHbQETR2OtS3McJalmNiD5hae0DAlJaGrSCBA0UTnprt4XBTs0M5h1DCLodh8oO3B4
 52vhznOqTWc4D0ZrwbtqMjiZ31rGDv4Ek7i0bTt6+0BJILQwdfRlFrGGWceMG3hzEjSfbCWbgNY
 REbJMIDGDJF0z1q50oQ0Btisz9DJkLpHQgB9RKkD/ZQCg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134354;
 b=SdDZSEGm1OekdIIYCm2Y52dfq8jL2nldnPSkzxNbQ+hOj5DvOFVB6vD4Nxua6rsT2xEuHZrp
 hFidAljk0Jo6BWFkaS+zNvxGFNsOXPTzrr3tRcAnbuhvmnA1g2srUYKty231q3Z+Nmzw6HgNZlL
 Cc3iWOHQfSVNyWy2UOqiEqHK3fw8e2J5MP811M7xmTL8k/JYvbYiirIDpnBQd/MP9ohoYKVNEPm
 s4N43juuhx+CNEfmi3oBqt4EIrEeEs4FW2N8F6zdivFqR0+QIxLke8tBTC81MlvHAvAGT3VnEQH
 GtIczc6usWD1gOHNoTr2kFWSfuGyjS7mbts22cNT/qNIA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz2.antispameurope.com;
 Fri, 19 Dec 2025 09:52:34 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4751A220D57;
	Fri, 19 Dec 2025 09:52:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
Subject: Re: [PATCH 0/6] Support TQMa8QM
Date: Fri, 19 Dec 2025 09:52:15 +0100
Message-ID: <24355727.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with 4dXh9s3M9TzYd7D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:d9ceb68c40de01de860771274803b5bf
X-cloud-security:scantime:2.014
DKIM-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134354; v=1;
 b=Bp1hCPuHUSQ3NIoZRCtnD/ksyilJo4SPapuUPrkQffzOMsTaFpT49jBomSa7ohOyUAoiRsVn
 ssD8sscqQk1KWSbPnvqgRMQ9QeERSTBHkKAzDKuPbO8dnnj582zC2VohtcJOjhIv8Yzvu/7W8yk
 UQJF6ZB/ilLokL6mFKr4/+fsXDBSFXzyfk07jYlh2UwxDRGxqbXzeBA1B7wfzR/ccV8F3UbXvZE
 pvNIzdZK0dBg1EVUS4BQ9JRoeq8b0KmjbEJf0fvSDek1IMg1Fmljy6P6dYLBIwByBmeVeHawVC7
 tpogUtJG+xb18d5v8owimePsJsmpxbw5D5FPn6y2tH/uw==

Am Donnerstag, 18. Dezember 2025, 16:28:39 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:22, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > this series adds support for TQ's TQMa8QM. The first 3 patches are prep=
atory:
> > 1. Add support for clock-output-names for clk-renesas-pcie. This is nec=
essary
> > as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures th=
at
> > property on the parent clock.
>=20
> Hmm, clock consumers should have no business with the names used by
> clock providers, even less so whether those names are specified in DT
> or not.

Well drivers/clk/imx/clk-imx8qxp-lpcg.c does exactly this. AFAIK not just
the ones references in DT, but also hard codes ones.

The root cause is that clock-hsio-refa and clock-hsio-refb in
arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi are setting platform-specif=
ic
GPIOs in SoC .dtsi...

My current idea is to use fixed-factor-clock instead:

> &hsio_refa_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };
>=20
> &hsio_refb_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


