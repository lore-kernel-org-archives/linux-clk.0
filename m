Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713734D3B3
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784370; cv=none; b=ATJRwQ7wQKkByEFLnNkI35W6sn56nl5v6PXFuauUazLadnpE81PSNGwzW7HShooZDeu4CXQsN2VR+sjczoS1j+0a2PKBPq5vjJa9tEdz0mM4vAKGLU55TXQPieqdQR1jVuHRCBsfH5pLmf57MzAubbnDz3/f4lkBk4qFrWQsHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784370; c=relaxed/simple;
	bh=CZjpfv7ugZLpQEjHOI/k47q3vnyfBFO3OcNKUMEYJr0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WydtkPoTFytZ3yAdiu3l7f7wQi4itaUYfKVWn2Dg275iA22Ha5NDDSpi6qiW7+euuDywslax93eAPhkjYPuVNzDZqKtNjbuE9HsxX+jw+lziiCn5muFOiBYJqwYnQpORmq/hGDP+Bh4yeHpS6d1WJe5+hKqwg7Wkt3mym7pjku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tGk9KTsQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tGk9KTsQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EE0C4E41608;
	Mon, 10 Nov 2025 14:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8E9E606F5;
	Mon, 10 Nov 2025 14:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B459D1037176A;
	Mon, 10 Nov 2025 15:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762784365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AixT7Oh+5FxWWMEZrxu1kDjvQPH8JSRwqc8kK2kvJaU=;
	b=tGk9KTsQI2Q65bzJrFFGVZMBlqJL0S5t7NCc7oHdD3VkJ7+4DvdWCQ1H+fAUPwNSCCkKTo
	mb4cak229bqD5R2nYdIofNZNfCwEYFNwjrDP2XMzY4gRkKtvgxHNNDrEpzrh+F7s+3tohi
	IF88La9EBzOBGWNmzeDbgNfVvwUMISSod2H02ulMO04OGgjoqPISyStUXuj5kb6RpzzPfx
	u3G2MpuRo2y5hlF0j1NqsgamhemSCsrxPqK4Z/TgsRHzg6He2ENBbGaz16F4XH62zhf7nz
	ypVF6xKKeHJphkB1yWfga+Le2zF3iBCyw2R7QXAhmJKB/9bIEv/riz+QGqXDXQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>, Yazan Shhady
 <yazan.shhady@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Josua Mayer
 <josua@solid-run.com>
Subject: Re: [PATCH 1/2] Revert "arm64: dts: marvell: cn9132-clearfog: fix
 multi-lane pci x2 and x4 ports"
In-Reply-To: <20251030-cn913x-pci-clk-v1-1-e034d5903df1@solid-run.com>
References: <20251030-cn913x-pci-clk-v1-0-e034d5903df1@solid-run.com>
 <20251030-cn913x-pci-clk-v1-1-e034d5903df1@solid-run.com>
Date: Mon, 10 Nov 2025 15:19:23 +0100
Message-ID: <87pl9qrmvo.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Josua Mayer <josua@solid-run.com> writes:

> This reverts commit 794a066688038df46c01e177cc6faebded0acba4 because it
> misunderstood interworking between arm trusted firmware and the common
> phy driver, and does not consistently resolve the issue it was intended
> to address.
>
> Further diagnostics have revealed the root cause for the reported system
> lock-up in a race condition between pci driver probe and clock core
> disabling unused clocks.
>
> Revert the wrong change restoring driver control over all pci lanes.
> As a temporary workaround for the original issue, users can boot with
> "clk_ignore_unused".
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>


Applied on mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64=
/boot/dts/marvell/cn9132-clearfog.dts
> index 5cf83d8ca1f59..2507896d58f9b 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> @@ -413,13 +413,7 @@ fixed-link {
>  /* SRDS #0,#1,#2,#3 - PCIe */
>  &cp0_pcie0 {
>  	num-lanes =3D <4>;
> -	/*
> -	 * The mvebu-comphy driver does not currently know how to pass correct
> -	 * lane-count to ATF while configuring the serdes lanes.
> -	 * Rely on bootloader configuration only.
> -	 *
> -	 * phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0=
_comphy3 0>;
> -	 */
> +	phys =3D <&cp0_comphy0 0>, <&cp0_comphy1 0>, <&cp0_comphy2 0>, <&cp0_co=
mphy3 0>;
>  	status =3D "okay";
>  };
>=20=20
> @@ -481,13 +475,7 @@ &cp1_eth0 {
>  /* SRDS #0,#1 - PCIe */
>  &cp1_pcie0 {
>  	num-lanes =3D <2>;
> -	/*
> -	 * The mvebu-comphy driver does not currently know how to pass correct
> -	 * lane-count to ATF while configuring the serdes lanes.
> -	 * Rely on bootloader configuration only.
> -	 *
> -	 * phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
> -	 */
> +	phys =3D <&cp1_comphy0 0>, <&cp1_comphy1 0>;
>  	status =3D "okay";
>  };
>=20=20
>
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
