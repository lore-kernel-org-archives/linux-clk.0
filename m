Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96383A1D01;
	Wed,  4 Feb 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197737; cv=none; b=qC3vVGZD/3v02RfV2lC9qWaFCmYMkquOz/uzqdgWGsRwsqkJyeKmOl+oYZCDHYOKsnZK9fL24qM4oCbFtZ0xBym41fO6Tw4vLuYxfDxE59LJeUM2q2JspJ4FjDY5veJnDFhiUoztv0RbjbKrMRG+NE2cDhZpIrJVHdxD9kHTshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197737; c=relaxed/simple;
	bh=jf4RgzlGdwbUlzDUpBSHMOUi07m+ktoWuB1ArPzud1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Nt7UVc7VdrOfbfWIUApTWcnZAEIkPzmahclwhHWQBOL3+CZo3+KMIh0JFdlOqPCJ2Y2J6oJL8LXPDZIpl0z72UlqcnbD4ZsydUYfIV4tn6aGwzGf5hLKoCQDuryJrQlk9MKcqXsWsUwnI4La4UoWSOcz0dLP8gRzYVFzxr9OFvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gI/B9DSi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gI/B9DSi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 332361A2BE7;
	Wed,  4 Feb 2026 09:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F111160745;
	Wed,  4 Feb 2026 09:35:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62843119A88F7;
	Wed,  4 Feb 2026 10:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770197733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jf4RgzlGdwbUlzDUpBSHMOUi07m+ktoWuB1ArPzud1s=;
	b=gI/B9DSiD6lHoSUUDety76BjmYRcoVrTdad7OK55xLgm9VECyd9yLcCSJfjEWVongW5vHU
	RVB/mmg3SdU526tmo7jeUa7rGi2NU9M6fkDWYiyYB/skpem+AnO9UqdnYzOlJJb+wl29iC
	RI4RUKnAr16Vl0dnEITApJuiAvK/+gc6Beo/DXjMbIiL0dmYgDh7yVUKd0wSj1t1e1nAYE
	LZxhC7Es54T1lRSIVnuwGGRx6iItGi+3wzPbNdzd7yTJjxF2IFyETnPRMZk0QbZhGeaDw/
	fkTbomwvIiTeYgZha5Zv2HudnPMw5xeegeO1m/fZC8Mu3OnqGT3OLBTAky4Pfg==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 10:35:27 +0100
Message-Id: <DG62Q1L5RK1Y.22BS02J31LJV4@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 0/8] Add generic PHY driver used by MACB/GEM on EyeQ5
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Andrew Lunn" <andrew@lunn.ch>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
In-Reply-To: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jan 27, 2026 at 6:09 PM CET, Th=C3=A9o Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.

Is the plan to take this for the v6.20 merge window or await v7.0?
The driver has seldom changed since its first revision 3 months ago.

Thanks!
Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

