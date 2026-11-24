Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539175;
	b=jzKk/QRtNXR0begHNmaGXmQ80Xfr/qo9vrEmYDHpwFxEt16AUzSlvy4cOr5gLoN9qJV5
	 YTpZxiCuV42IMRz/j6FfL1FjMWmfazhrU+KmxmI9KyUv/sH1Bv2axbHRy7lf26Xhvl+fl
	 hG6DNOioJKorW8Spov4CgFjZAbFzpXB77cHSPKaViu7gJaFGXbra9p+i+jcQ+1XB9qyHU
	 oacwoLyXjZGPB2Sk6A5hlmvTNrpu/J2WnxQM0mSKsSDcpalUDErL6q09Jur0U0Q5Sx/2i
	 XqJul7cMtQY68xEWpiByiQdFTVSqUjHEJvIFwUqfM6uicJnfArdYtpqCLJqwhfZaMqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539175;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=EFR88qbXp5eO09+9eYqMUZ+lAx72XlVVtZDdwFWiHJI=;
	b=I9nuK/0N8aKrhIOSvxh+zOZ6OsI3Ozi71cVhNqh7Diy8GIdz38Fu8qBmGcl0JYYj22lU
	 ZUNnscBJp5fpLr0z6lubKr1R7gfrMTwwer+ySRIuT/vYTyUu0aHo+2RoXfwZseS2E9PMF
	 vYxeMwv10H2PR74JtAzJalCSFr6l5TBokVqfNXvgbBKeT+05BUCVc+ZkrVBlHRYrGBjgg
	 knFewl+ddAavJk6RHOyh6g2TQuB4TDqXY2aTQY/qz38NWAC/UyXoC7Io+53OeCGXRweAh
	 ukpg4bAOM4ubhH5yhclSpQLt6ZObwvSEeFFNxz4XK5FpiqYMvUEqrl/gpdkQJ02SQzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hXD6++Bh;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031CE606A33B;
	Tue, 24 Nov 2026 16:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031CE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hXD6++Bh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 206DBC2C678;
	Tue, 24 Nov 2026 16:53:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ABE7601E1;
	Tue, 24 Nov 2026 16:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EC7911E69A89;
	Tue, 24 Nov 2026 17:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EFR88qbXp5eO09+9eYqMUZ+lAx72XlVVtZDdwFWiHJI=;
	b=hXD6++Bhlini5KqPzJbjS9eqyCZ6Qr3Ww2y+YPEpG3INtQE4uRHvhVzbkZs/8pTOQgGc+x
	jvRRfgimhw47ZK8QdN9LXGerTgUD3Rd+NLt8AkbDyD3bO9MB0rnSx6s9mY3LlXXvUNvNun
	jGby1BtPqj6NN03SBEKNE1Y1mFdTIX1ZPFz2xMSGSiuY3CyrUg+i3mJighzUrBnYHfDDeo
	sTpH3Gfl/hsH85ohWV07PuWD5e3wvZoEaDfAYYgmr0vTSA3vtRjGue2dKJpSQyIiekjDxM
	mW1Vqmq1s+BB0+baeg0zS6mweXXdvSZ0o6Wrp0l+GnZVEwxik0QjM8DNHBo3Iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 17:51:35 +0100
Subject: [PATCH v13 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller maintainer
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-perso-ma35d1-upstream-clk-v13-10-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I have the platform, I currently use it for my developments and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintenance of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..44361a557aee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20072,6 +20072,14 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON MA35D1 CLOCK CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+F:	drivers/clk/nuvoton/clk-ma35d1*
+F:	include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported

-- 
2.56.0

