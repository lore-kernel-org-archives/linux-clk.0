Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68555302CAB;
	Wed,  3 Sep 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903680; cv=none; b=BQ55brXECrWR7iWxspCuMSwS86iVX0jtw80SJh2rMBBQBxayOihlxQ2zDRTGdPocdZzDIfAeOS9Z+wuHZN7ZXH8KABY/JP61g4K8fFODcvoNyPftO7qFO3wu3JGDIQMp/k/K8N2n4HHSN+rnwv6vdlYYJF3sW47r40+V5EVviKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903680; c=relaxed/simple;
	bh=8rmzqvfR/jLcrU3Ww14o338baqPR0EMUTSwyH3c+BkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOT9UrLvGzbG6v4OHPUkcGQTcWId1lfchP0LA2sANfo+2bUIhl2SiNgZx0IHPeNnwxeThSGUOxgZtiZwd041WUJ3AmgU6VRUJDxhAsByaLBE/+3mA00zcSZCOrg/da11kK6JAkWbF5sDUGeT5xhnv645N6xyw991FlEtoH7e5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PKdUv+R8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PKdUv+R8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5F4AC8EC56;
	Wed,  3 Sep 2025 12:47:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFE56606C3;
	Wed,  3 Sep 2025 12:47:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EE471C22A4EA;
	Wed,  3 Sep 2025 14:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=12E/BElr5gCYI8YsYwHlrC7l4pZjCd49Xorz7J+azFg=;
	b=PKdUv+R8aFTvVO0OQ3WlDQproDTLqPa1so9i7de2hVOQC3W7lsrpqdcJWFoIn4pxE0O4C3
	Qi8O8smdxUARN2ZFzHRVheGxed4P/uUchwEKSfs+9he9GbvKErT2jVlQy69+mnmr7sCTu2
	oRLzHv85R6ADboqYZKwd8Tg4EqpRXf/kcN34FJ3uqPVzpQbtNflMyxoCxpA0W1ld7O2qon
	aRy/IXjcaJy+9TkWBImuYAiMqVE7rHX4pfBLSUDd67+X6D4KlZVEJ8HZVRKCESOQsYckgR
	FyCYdtDq/2mxmNmh3JuHSiOHARGLAm0WyHQYEvM5cM1QxY989n4I756iOkyl0g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:17 +0200
Subject: [PATCH 10/19] clk: eyeq: skip post-divisor when computing pll
 divisor
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-10-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

The output of the pll is routed before the post-divisor so ignore it
when computing the frequency of the pll, functional change is
implemented to reflect how the clock signal is wired internally.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 8fbc8eb31185a9e82216a38a81dfbdaa1a700858..cbba4a21cca47efb8ab554ecf7322e47437c9c6a 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -177,8 +177,6 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 
 	*mult = FIELD_GET(PCSR0_INTIN, r0);
 	*div = FIELD_GET(PCSR0_REF_DIV, r0);
-	if (r0 & PCSR0_FOUTPOSTDIV_EN)
-		*div *= FIELD_GET(PCSR0_POST_DIV1, r0) * FIELD_GET(PCSR0_POST_DIV2, r0);
 
 	/* Fractional mode, in 2^20 (0x100000) parts. */
 	if (r0 & PCSR0_DSM_EN) {

-- 
2.51.0

