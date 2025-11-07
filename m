Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C644303A37
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506457; cv=none; b=kEwpsvgIG1Tz4I7RB+9qitkq69+Wgj4rL8yk9W5XObGuITA+pNm+o0CQ8cRSJOHwTEYQZfcjrrIFeul8W7V5jNOjMQz7LbFkCMpoCBlRyzKtbVCVfPWn8GRou8HFgGUHrdEO1qHAOZ+c3X8INiC/36otBQygfH3NLVWu2q9HKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506457; c=relaxed/simple;
	bh=0r3mLNCGrWE7hT6p6FJAIG3AhqSA9KylKzwdHZxUZpM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=j9eF/qu8ZxJg0e7c+8F1xxLlnlViB3NjzTOQgb+IcxNsF439++3UXKVFQMqCqHOK/Ne01/0oDTA7Rh5Mkllx1glBpm+ZkhcqCQyZcio7DWHq8ikhgXa9umAbEaseef41psaC8SCjQzAZlE3caz2Va1W+YgbLyByh/IWtjpmQzHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0rzgYZsY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0rzgYZsY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 267884E41591;
	Fri,  7 Nov 2025 09:07:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC1B46070B;
	Fri,  7 Nov 2025 09:07:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA9AA11851DE5;
	Fri,  7 Nov 2025 10:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762506451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sy63ZFPfLxeX+rkZOJprYwfHaS5jEGoCibkMAFJMUlc=;
	b=0rzgYZsY73DyTeUngQTpshM2GBPYgAwxOp9qVrv8gZO96h4rFyI682/J7ahEUWaNzeuM9B
	tJkWuSNE1n0ibZwbVBGXWKUpVjNcJSW3Aknslb/zrlqs/iw7h+P+t1v4uxvg1xkaglHBMQ
	D0V7tRIG4q1UiPtBhiyqFYrlnQZvbt03vH+3LGrm+YYygSLwk9hecL0CKN1L4Ua1i/Xx4C
	0E9RSPkqeqrwmsn1eAY17ZBAP80uozInu/RRnYqcfyWSqG4JX4ultmjT58SiAGhxUQDif/
	2gKPHvhZm3CGlMFmzu6XjChJjyxxvhnw2BCO9Buq4zlUqrEMv1Be+AcJrkYqWA==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 10:07:27 +0100
Message-Id: <DE2CE3YY1Q9E.3HLFSD4K2CCGS@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 0/7] Add generic PHY driver used by MACB/GEM on EyeQ5
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Andrew Lunn" <andrew@lunn.ch>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
 <56a49462312d89fd0de6da273f698c0f89e73ada.camel@pengutronix.de>
In-Reply-To: <56a49462312d89fd0de6da273f698c0f89e73ada.camel@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 6, 2025 at 11:51 AM CET, Philipp Zabel wrote:
> On Sa, 2025-11-01 at 09:53 +0100, Th=C3=A9o Lebrun wrote:
>> About merging, it'll probably be complex. I see no build dependencies,
>> but the board will be in an odd state if only some patches are applied.
>> Some dev_warn() at boot and dev->of_node refcounting issues at unload.
>>=20
>>  - [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provid=
er on EyeQ5
>>    We touch dt-bindings because OLB becomes a PHY provider.
>>    =3D> linux-mips (?)
>>=20
>>  - [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
>>    We add the generic PHY driver in drivers/phy/phy-eyeq5-eth.c with the
>>    usual Kconfig, Makefile and MAINTAINERS changes.
>>    =3D> linux-phy (?)
>>=20
>>  - [PATCH 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet contr=
ollers
>>    [PATCH 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet P=
HYs
>>    DTS patches to add both the #phy-cells of OLB and the MACB instances.
>>    =3D> linux-mips
>>=20
>>  - [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generi=
c PHYs
>>    We must update clk-eyeq because it instantiates a new auxdev.
>>    =3D> linux-clk
>>=20
>>  - [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
>>    [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by p=
arent
>>    With the dev->of_node assignement, we must also correct reset-eyeq.
>>    =3D> separate them into linux-clk and linux-reset?
>
> Since 3 and 4 should go via clk, and 5 has a dependency on 3, I would
> suggest merging them all together.

Thanks for the feedback Philipp, and the review on [5/7]. Getting it
merged in linux-clk will ease the process and avoid breakage. Updated
summary:

 - [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider =
on EyeQ5
   [PATCH 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controll=
ers
   [PATCH 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs
   =3D> linux-mips

 - [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
   =3D> linux-phy

 - [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
   [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic P=
HYs
   [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by pare=
nt
   =3D> linux-clk

I might send V3 soon, with your trailers appended.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

