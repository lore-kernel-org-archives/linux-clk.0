Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316433F8BE;
	Wed, 29 Oct 2025 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752572; cv=none; b=Ltx4SegrnTJ7p+CFAnHu/0EAXA8pQxqJqyj1y3QJmhhmCqNDhUqXhyZkrb8UgSZbpgHR1qSBjNu85Exs8/jZY3pFFF3c7wdLVBEXwwvY1YJQBR/bDt0DFwOIkh5Srdfc+ZWzx7pxcuF0HjVoJSJMfwk2CFgiToKXMvK8CMeDLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752572; c=relaxed/simple;
	bh=mTyubcT0QXbiYSYuJBtiOy+znibfDRYqoP4/3JvVdrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JDnuKSQhfR3rJ19SuMHH6CuDsXh8hJbCvmFDDxdh1MbP8wWCAmD0fbrG0R7vKM5hnbL8+QCPiMbg/Dl2BeW1rSV2p5htDKD1XVRaR5hKY+tKDRYtJVTr+VWEoTymGTBlYoCQVukBqJ+BAqUAMIWsUJVZABMo6CFXKP8LD3WuyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1wwya0A+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1wwya0A+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F69C1A1751;
	Wed, 29 Oct 2025 15:42:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CDF3606E8;
	Wed, 29 Oct 2025 15:42:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FA7D117F82C5;
	Wed, 29 Oct 2025 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761752565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mTyubcT0QXbiYSYuJBtiOy+znibfDRYqoP4/3JvVdrk=;
	b=1wwya0A+6J55bXJZ9i9zxIM9ypamlJUH+c9TrZ/M9MZrRukaDz3uACmVjIVbMqScFwybpX
	+S1t9r/X8A5FxjJQ053o1+VlfzT3sEbVrL9J0es/RK8clpfRafAF8jipRoU09A/j6G83e0
	KmO/BC2JWXI9sRkx3UMyDpVuAL53/ksHYqNY23lNEGTOPL7FiGaYlWKGjtejhbGoeeqRLL
	LXAPhJ+uKDc9cuVFCeCJ/0ZpB+dJrh/DhvGl3nxA+Vc6dAG7aA+HjsGzZ3tt8+FE1eMcWU
	xn7FnhuyfnKVUZqcN+FRdcG3NiFj6jA8J4HcsVPAP7QAGUlsr9Q0RHQkbRjWJg==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 16:42:41 +0100
Message-Id: <DDUX5TR1VIR9.1KDDNA4XZ6JYW@bootlin.com>
Subject: Re: [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
 <20251022-macb-phy-v1-2-f29f28fae721@bootlin.com>
In-Reply-To: <20251022-macb-phy-v1-2-f29f28fae721@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello all,

On Wed Oct 22, 2025 at 5:39 PM CEST, Th=C3=A9o Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.

I am curious if anyone has feedback on this generic PHY driver? Patches
on MACB landed in net-next [0]. If the phy-eyeq5-eth driver approach
doesn't fly then I should sync with net land to revert MACB patches as
they are useless unless we have phy-eyeq5-eth merged.

V2 changelog at the moment (will wait a few more days before sending):
 - Acked-by: Conor Dooley on dt-bindings patch.
 - ptrdiff_t is printed using %td not %ld; warning on 32-bit archs [1].

[0]: https://lore.kernel.org/lkml/176166121351.2249512.7238254409117352079.=
git-patchwork-notify@kernel.org/
[1]: https://netdev.bots.linux.dev/static/nipa/1014126/14277857/build_32bit=
/stderr

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

