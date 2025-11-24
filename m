Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293725A2A2;
	Mon, 24 Nov 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995588; cv=none; b=AZcU1W8LvgrddNdQKIpNKk3tfUYO7vnwKycpa6OPRuNbLPVTeJqaUJCR2QuIX0F2xl0emB+zlV88YC2CeiflyYvLHOmCwbHNBLVGRFtIBXUUtTcQVhKfLTRA7d/WaDnoKPyAeqZsTEDBxSWgTpInUz9VPKO64LkfGH7w3qFhb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995588; c=relaxed/simple;
	bh=o88QkqIpbqtaMRHhHEsBffYr6o9F7CUTv6RgqaerDrw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=YjxiC7Jy0O0EHskaKblQS8lGadrYJo/0Pff6C4Vb11t12UYNALS4D0w3zVeSx9gSpEA1pojD0tBr/Z6iW8jR0GrujIfopq1sDeQMFElei9dK7wAE7eI+4FMo/JMqX4ZDylM2km2bkMU5r7YWEqJC5nvlL6iXo0Bxh4Tk5hG28Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oCDxF9Gw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oCDxF9Gw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 109504E4189F;
	Mon, 24 Nov 2025 14:46:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6229606FC;
	Mon, 24 Nov 2025 14:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345D110371DA2;
	Mon, 24 Nov 2025 15:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763995582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+qmgrtT0fSoelw7XMVNn3o/vDeOr/X03Bxb90zIAOqQ=;
	b=oCDxF9GwvexzD4nD1/CZ/SQttn+vHARpNw46K9rfHbM+vBlEN0yTNYaTt42ezYScxXPHrM
	go2o6hFWebvNqe0u8S/7lbdss+BD+uir2lCZV6pHi07U6tFPLOhumVmDlAhvG4IFS4zSrB
	Ip6c0ApTp2Oee8PpDj8avs5PzxmdF7HyHjtzkeq2zYCHBarcQa/Ly03CKrXy82Fn+xRxih
	Lg+t7o8Z1YMlUAs9bJab047cHl2U3C6hQmXzL2d8tbhvX5m1OY7ecMekJi+111UdqmmjE8
	IwovumQRoBvm3/IxrOwr3mK3cO4mBalKJd4+cPd9AW0H/7cFynQehWoFwW3tbQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 15:46:20 +0100
Message-Id: <DEH08UJJGPFG.2RSQ6YHTM5JPY@bootlin.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v3 3/7] clk: eyeq: use the auxiliary device creation
 helper
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Jerome Brunet" <jbrunet@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com>
 <20251119-macb-phy-v3-3-e9a7be186a33@bootlin.com>
 <176357562473.11952.15433192921239262065@lazor>
In-Reply-To: <176357562473.11952.15433192921239262065@lazor>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 19, 2025 at 7:07 PM CET, Stephen Boyd wrote:
> Quoting Th=C3=A9o Lebrun (2025-11-19 07:51:11)
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>=20
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>=20
>> Use it and remove some boilerplate code.
>>=20
>> Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>  # On Mobileye Eye=
Q5
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> You need to add your SoB here.

Oops, I am not used to sending other people's patches as part of my
series. V4 fixes this. Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

