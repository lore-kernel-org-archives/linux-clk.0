Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539129;
	b=V2q5mJF8hPkBWZhScmISKwYX/lUycT1Ae3S2UYsF/85gfepzrr2+UitfJM7UJr4GSbrh
	 sHfhgNFUlKtMDLIU6W1r1vYBE11HgtJErXUEX/sY+o2l5REMbF7NGjWlBifReHiYF/7Kf
	 DqW+L2Mm1t1pdrI1sTSYLQe4w/Fq6+izYAjlTwEG3+jbtNZI3RChgorbTb7XzWwX4Dgwz
	 apecS2MHQuzrUVr+LHydzBkmgsYgvC7WDsG2bpNv7VidJVvxOJOnGmKqKaroPJgbCCJpR
	 vx95P6oyyZ20RfB8ABdoY2TqUv88lRt24T3Eg0KjzFkXpKuJcNCtTrAOobaqEFVVFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539129;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=aUiBH9apvClQ0TvQWQvH4phbJTKv6t2JWq6PhPuDHyY=;
	b=smXANB+1NWrqxm5BQc+xhIv43/k7T+a04nCO1ohHkXoBdh96kAxylTXBx6KS+N4A6+VO
	 ZctYQOPFQXYdUjf0n21U42gBAYAlEu4CXOnCuegF+3ihaS7zNr8CFN3flfRP02iEMlrqj
	 PZOQhe82oWOwBCjFwVMasP3Ai+mlNfGZc8oYJbfTn8wazTsEu+7P/t63ynV6sDYMefe04
	 EoCWwd07rzwakbjDwQwYqNKoMONFcX6VRpY5qTP/qbl2U2PM5kBqU4uJKZfzms3jkHm5W
	 /LdOF6VJM3kA8tf3KUMeaf0Cf5jOY6uiAJNKKdWfvGDNMPPcpZt50qqSZW0RgPmShLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvlCAeyP;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CD606A33D;
	Tue, 24 Nov 2026 16:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355CD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DvlCAeyP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 162C51A1747;
	Tue, 24 Nov 2026 16:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD305601E1;
	Tue, 24 Nov 2026 16:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8678A11E69A8E;
	Tue, 24 Nov 2026 17:51:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aUiBH9apvClQ0TvQWQvH4phbJTKv6t2JWq6PhPuDHyY=;
	b=DvlCAeyPJ+76z5lYBq/VkNqiGuP0oP2qTDDfYli5AhzwVbt157XWmKv5hquyzLu5kSbGwg
	/hxfKZHtwUdW3eg6mXs7QX6+bWCJ2mQSzIIXId7ccEk3b03Rm/KpCpubOUhY2rHk5cQMUE
	263tte8FLsjwzhG+kPMp0g42Ux7CMZHqqJM5u+oAAugr93modfRpCmmVJ/mdGozw+UT4cz
	gZbkaFvEyOkhmTzIdA+D6fxc5c1cEdGOIpcx2MgKq5ZnCnPzG7lRy51ntRwrMbqdaNvIVl
	OIxOIjXfqezbA3JZ+JP34l3HaVOe2lfx0PIAOkQ/JuuH7wcV6rvGVM3QU1xiqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 17:51:26 +0100
Subject: [PATCH v13 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
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
Message-Id: <20261124-perso-ma35d1-upstream-clk-v13-1-c920f4a9f0ce@bootlin.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The whole clock list is supposed to represent the clocks provided by the
main MA35D1 clock controller. Yet, the comment at the top is wrong by
definition: it lists both external and internal clocks, which does not
make sense. HXT and LXT are on-board oscillators which are now correctly
described as independent fixed clocks with their own DT node. The clock
controller is a consumer of these nodes and a provider of all the other
clocks listed in this file.

A look-up towards the HXT or LXT index through the clock controller is
always wrong, yet possible (even if totally useless) with legacy DT, but
should not be made with a recent DT describing HXT and LXT oscillators
as individual nodes, hence mark them both legacy.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 764d837d6162..ad0b281da45a 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -7,8 +7,10 @@
 #define __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H
 
 /* external and internal oscillator clocks */
+/* Legacy: HXT is not provided by the clock controller, do not look it up */
 #define HXT		0
 #define HXT_GATE	1
+/* Legacy: LXT is not provided by the clock controller, do not look it up */
 #define LXT		2
 #define LXT_GATE	3
 #define HIRC		4

-- 
2.56.0

