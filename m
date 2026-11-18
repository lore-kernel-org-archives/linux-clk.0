Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021611;
	b=njMqAkTL76w5Ew5DLv35YYWl3aqFq86QzkkrdCZZCaRyfR2imzgC7xqb94lPDy3fB/Fx
	 sHbD/vPpErb1SIzLVQJK84aYgqQwGmH6LtNDKutfOw04rpo/pBR9Zpip3YZjGzhn7TFNG
	 k9JMTZkFTunYTDR4SttFX61tHOvM/rLvBkHtt/H2AyBtZAmbdgSbH1OvbxbEiMqOjyMDE
	 Pq7R1ri282oKxQt+u7jOZUXVetQh2PTF88kbZ++XJ1YYoVntMG5lZyY4uttMXIAq/RrV2
	 BrhsYefp5GVRrHxejv86bMW6I0Kh4kmOibhl9Y4FSp1eK0skVJ2/yXoTxEuVSX8gU4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021611;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=wWl7nv1+iCYYni971N0J3aMrvV4R7qgN1XFvCJhdF8c=;
	b=TWEqVZQ8Lp7AE61U4dWkZclcJsKrC3g3p+C5lPqcqc2f8nAW77isAUB+Axqbe6UElEbj
	 zX2e8mF3pC4H+ARYmIlvBmskBZydtBs0lQ4+brfyscOQEWP59bucmpTmWgDUMfEqQdZrT
	 m5RQQDG5BqX5yf8evoh9PprUImwkhw7WU+hhb5wvTuXr0CUwvBhXeTYF+2dCLAo3M13zI
	 SQp6BUz5cJn5wi3L/j55z+OJqQFpuyjCl+dVhIJUzWz4wIzbloPaHSGYuutACdCXPRqF+
	 rIxD7uP33sqMCdkyqm0iE4gIQamUjqSrxGR+CDeU/h0BLdBLUq4f5iEvlO/9CXGClnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dvHmoOE1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A3D606A32C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 17:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A3D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dvHmoOE1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7820C4F77B;
	Wed, 18 Nov 2026 17:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D83F65FFAF;
	Wed, 18 Nov 2026 17:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E55DB11BC29F6;
	Wed, 18 Nov 2026 18:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wWl7nv1+iCYYni971N0J3aMrvV4R7qgN1XFvCJhdF8c=;
	b=dvHmoOE1JEeyXXz0NtPhMKYVm4kCGm/o6gKTrdjLyE/qzzpG+peQJo2YBwmtwA22rrIabw
	rqPK3n5Y6uIEAlVpl4P9dwYEXHBqJfmCbOaT2sXPkqqvVu+eW/dWt4AqgejRRIIgxnqc2l
	hgzlLik794leDoRMDoID2TliUaC/+TQCcBFdeO8t2+OY6tNhlHoEjndF6/1MvJTVVJ6T7+
	hAbI4p59xPz2uivozbJkillEcef6MI0LxiO6hDIUWqMlLVW1Qb1aT5ZQDAnWLGFAISWTpA
	pFBQ8TXnRTKD5dJvc8BK6EoNijGrgEOW75TO9eiafWgK9KYisord6IcGeyfeNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:19 +0100
Subject: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
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

