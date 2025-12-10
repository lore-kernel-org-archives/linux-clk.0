Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077A62FD7D2;
	Wed, 10 Dec 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382808; cv=none; b=SRzewe47wRrR+NfmilsdmkdKh0ayjMQaBxqk51wmwMSI7V1vr65Hp1rqOE5ofDC9wfyPCDF1QxMznGEBv/7CVcdwIHw6zQ/i/fSC/ClEadUsLdZzpstdqIUwWJFAnNR8KdhmHvcnhxAibHx1jClIW11DxbHUv8DQzwq13WT/BUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382808; c=relaxed/simple;
	bh=5mMlEr2VNyN1MRfdOk88GRdVzd1UC1Qzmeyd2ltEj9w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YOtJsftAQBHjSXIGQuXta/VQozDlLe/hBSPxh0veM1zZcPGbhMGXM0trt1NM6qa6/sr/fJxyo229jrOemR2GMLNViTPYn3BkReUa7ptmPPwUNrJFjtFn1uEQuq3LxKDohiqh18csmEoDW6MIkUL/qUaUXbsYPOgZtpukdKKUiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PyNv6QD+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PyNv6QD+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E3DBC180F6;
	Wed, 10 Dec 2025 16:06:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD5A60714;
	Wed, 10 Dec 2025 16:06:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B26111931A8C;
	Wed, 10 Dec 2025 17:06:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765382804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IZ7YZNfW8akNqU2m1GJ0qgSiSInP3u3B1ptG7sHFuMU=;
	b=PyNv6QD+ueNmdfmWHuSzSH6pk6CG9xsrW2BAm2SFPPRN1XfAywkmLLnJad+Emev4UYCUPY
	6L45UGxXCOrPn00MKmWN/1LmbVwcRdTy2an29imcy4S6kkhtPnwSYZ8vDiwxrb6Lw2W5IZ
	Ja2b2JRStJ5sGonAOmEL/1mBQFTIMk+2BGN75aSuBmOs8HqigN0LUj4mYAY1OgdNpBqiqD
	0IdJ3mUE4eTfcrAoUY8sJQf//gkPwrniY6Z/Ww0QbOrs5ZLgegKYuuzyb1vXE+YnMega8G
	4cI1y3Bv9iuqFHTfFqxJHsKjw7GJ3j2KlIiRgBtdp4d6ptkVLPIGMEkJhyIviQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 17:06:41 +0100
Message-Id: <DEUNZ2R3L0LU.1CO231RCA18A6@bootlin.com>
Subject: Re: [PATCH v4 3/7] clk: eyeq: use the auxiliary device creation
 helper
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Jerome Brunet" <jbrunet@baylibre.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-3-955c625a81a7@bootlin.com>
In-Reply-To: <20251124-macb-phy-v4-3-955c625a81a7@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
> From: Jerome Brunet <jbrunet@baylibre.com>
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ=
5
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
