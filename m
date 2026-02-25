Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71432765DF
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031287; cv=none; b=ByKHRE6Z3WRVj6H4SnHFPaBvGpaPLT1uz/jr4Wzuv2zziLatsZ+oy01CWOEd7eIBD3WSZvGVETeZ9YO7+4yNgxW+1NQFhos2q03yUCGyr8gIulE5H0DxKvU838xIHgJxbXmi/mY40M1AckUQ2broq+uV7aT2rxF5hxP5S0auwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031287; c=relaxed/simple;
	bh=FTk/d67CtY8ZapgM//ezIGGA/bXReJD1LaqTvX62mLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=qHhzOfi0dQd+ag/6nSTvo7oooKgq9VTVmR5Ur1XKY1LrLZSusO826RMDIYDia847CM19m+hd7EIYtC2rjJwTyL0Y4EBBbwEmaRm7FRSIxsXDigTElaXH5unQ+BsaoHi3djJ/+Zbb/4CGipDtIY2MWLK1Mhg1Lbx4vgWiS2fPRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JkH0Uq4X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JkH0Uq4X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B6B67C16542;
	Wed, 25 Feb 2026 14:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 855AB5FDE6;
	Wed, 25 Feb 2026 14:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1FC91036923E;
	Wed, 25 Feb 2026 15:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772031281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FTk/d67CtY8ZapgM//ezIGGA/bXReJD1LaqTvX62mLw=;
	b=JkH0Uq4XtShOocNcAAhp+piqjlj5aQkoGd6ruThi4UifZx0EV6bHL/50VHSBAnbADAQy30
	wTXAW/0EfpgTL2TBT1XfYomOpCbKrwVOwbLo0f9VMUKQztfL015LxoSzXZYUU0nbwZZmNK
	qTlKZMA2aqvnFXG0yD7wIkUcuJk5awZDiJAfdeeiZlctpaumv1GFJRt+MyjSWIvE1An4oD
	OEoIcn56UmWnjj3V/rh1D/0NAe1eJW/hw9eO8ywSBTcgsVBjPaEA6PYTT/hJ9+0qdO3VR8
	98d5FCtTEFRcR+InS08CbM5xjcw30+70cpuSW6Tz6YQ0ogLIzaFsP8q8nNLKSw==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 15:54:36 +0100
Message-Id: <DGO4NU2DMD0P.1EQARLCP0QW4V@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Vladimir Oltean" <olteanv@gmail.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
 <20260210193516.temrg46yozxma7xb@skbuf>
 <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>
 <20260225122949.pt55t3eefr5nawmu@skbuf>
In-Reply-To: <20260225122949.pt55t3eefr5nawmu@skbuf>
X-Last-TLS-Session-Version: TLSv1.3

You can ignore my email from an hour ago, I don't often fetch emails.
I have everything needed for a new revision that is coming shortly.

Thanks for all the clarification,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

