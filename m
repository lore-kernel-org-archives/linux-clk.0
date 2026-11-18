Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009122;
	b=iWPrr66SZwe8bBkxt/ta/535TzWjmCoWxbogSIwl4yRPxjWlRZyAO3fcHQ6FTCEh2kqC
	 UYUDGKvUK1AuOmcSscuzz8OMpLoskIesg+Vp9U51n428rkKa021ntAvcRNQ+nhI/SKEa6
	 l7h15tI0atpH+sYKN/bfQWVBI0yz0f1nQCKH0smjCortBfj1C8zjoYIaA3TE8ttVoEXe4
	 UGWfkAgDtJTu5O7PLxicxnnLoSJrI56RQR+voOAgSauXR1W65KsnOvT/S8qzA70EJuxPB
	 kRm/qO4UahCPDC+3BWu3i5buHuX3dTq/MZB1qHtSk08rdnddy1yNQSN2bekpYYvAI5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009122;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=sqL/30O5DBtUeIumToxEEeq2AZG6X60OwNuWqWfJfvo=;
	b=axqX/Be+ZsyQq2qGQv1DFq0Nf//JmSDGfVQwJjoP/pTQxMlx9EAWSjohhvq/P862anIL
	 TXHWBZ8OPqVQ9nsi8++H4PleTm0JUmpzf6Wk2X2VsYF5fglJKeQaEufxqwDer17NAy5Tx
	 ihxPIyhovAZY22hSYjyZH+RMwBAXpVDbGH4+8jBMpAeFPm4VfGXpycnv6aOBYStvn+e0x
	 uhRBjUrz+hX5WxatOympxprkJRTw75gVXkLOMSGG3a5BfbExQqEzEsjYEt9r7R76bkjoO
	 ffnQZMrgMchO2m1d9doVNfuOVlu6OP39cUyqkX55CpGtYKbgg8cydb94B+C1miapx3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OhVT3rp3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719F606A31C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 13:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A719F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OhVT3rp3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49D02C4F77E;
	Wed, 18 Nov 2026 13:38:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70B045FE9B;
	Wed, 18 Nov 2026 13:38:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F62011BC2087;
	Wed, 18 Nov 2026 14:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sqL/30O5DBtUeIumToxEEeq2AZG6X60OwNuWqWfJfvo=;
	b=OhVT3rp3bR9RrA1m1msfBIIjRp4EcjwzlBYz04jm+g++IKrsQyVG82c2Oi3cK4WDIMK9Vg
	IZhNleRlyOvJdaP85LASBkALSO5LsqCl1p1o8sXyDRbxVB6yeqw9p5CsEgUmomxkXBBqB/
	S6wO2Fqr3Oi4W1wn9ekXEQ4QVQWPvcST0yjheoDFqB1Se+jlHwJ2QkfACVyxVttLC4gD3E
	vWWtYg7f4T0fyb8BdznRZOJRk4/P5PCjHIAGAsS0CimILT3BD4aXLz5djmYzGZ3l3YKuQa
	naCyUBOIUUq1uPO4fnrgl8+Umw9of434zWLZpsurASE1LJ97AzsLZl1AA3MGcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:17 +0100
Subject: [PATCH v11 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-10-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
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
index 93abbb315065..4dd185002fec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19982,6 +19982,14 @@ F:	drivers/nubus/
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

