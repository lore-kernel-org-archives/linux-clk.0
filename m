Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D656522F12
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066800; cv=none; b=XQiJfxgCWg4jOZ9nCYNAQbxK7afSjGVwDL2sprJBWTWFDzrZhqJBlfqpCH6HhHJoHDhMOGrz78TSib4kTSgVydEIBzuvnTAdxcRg5V2vKeRz6xwLr0QHUTIPKYdIUAUIAu9jeML4svgEnTjb+FHaEOGwagxfDJnXGKCzYo5Jq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066800; c=relaxed/simple;
	bh=ntgI1uFoKmwC0j7KbZiA+1P/H021PU59ERAZPtAvuVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1gYf4/YYiOuEJPcrz1R3YsFp738CJujuAbhSaKR6UlY9t+X7Txc7YpEsbMmq93ni0anZ+K2oXM8AU8OAdBFCRtDTho6AUpe8pUCwL5BflNFVztMSb9AP8D5w1sShhquKadq3bXVwEdNuMSap0VFparjwajfoQZPd/E4S2xfDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rwb0c11q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rwb0c11q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10551C62202;
	Thu, 15 Oct 2026 12:20:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA43660360;
	Thu, 15 Oct 2026 12:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4849E10328BC6;
	Thu, 15 Oct 2026 14:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792066795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oUZJWgh1jtbi+p1yrcW64LX48+HiL8UrWIoerSJqBPI=;
	b=Rwb0c11qpdifuIjOtjYlJsBJ9paGWwZgeXQ+/u2YHZaWvFmsF/iuJml7Q+I4ExBfjXLpxb
	iXAycFIQQpp02iPhm/UNOKShEBipHNTqL86v0S5SKkAxs6sQB7XhHcytNHW/o7JcwP4DEW
	Hq9OKnDIiK6UNTi/iXTtAPtPuOUsG64wysAyX2XATRwzotWwBHaYmH6NjdQE7ixmJmzQoO
	uuUZQbFQ/hlxbiltngM8mWKAdHb899TrUZ3mGYbp/Q4SY63qKLsvPVgkFOFO30O2D7GTp2
	KtTNPyamk0/ZoV8TbaRpM7ykXherOn7i2yG5unCDAybON+LMOSGofXXjT0fXIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 14:19:04 +0200
Subject: [PATCH v9 08/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-perso-ma35d1-upstream-clk-v9-8-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I have the platform, I currently use it for my developpements and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintaince of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6977bc6245b0..c9f482b5edd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19541,6 +19541,14 @@ F:	drivers/nubus/
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
2.55.0

