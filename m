Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009108;
	b=nzOR9rW9Gm9GrKoCdCyfjcpK2r6Xf+ucE4chnrPaOJjfiomxL20bE9/KMVc1A4WhPLAR
	 eWBbR28MIioXPZozzgwgo9gbmfX7Pz589PR5Phncqoy0TqWJPSyIu19Qrw9R93S+Ah1f1
	 K8eowbMSYJQCk18CYvKHV4yuTuB2iDXEoiRcBSO/3U7LMwzGznKz4HkQIqA5Q/Ah2Z1BW
	 pnkMCFswF1otMXCQZ3R7atnXRHDVcMnxYg/mMEm1vS1c7ajdmoilUUn71ph/HnaswxQjp
	 gGT6NbnoyeKz2TM9cSAJmTA5Dk3iFVIuhIPHJE8Yh8/eIXb7kYUHDyLcUGr+slAMXyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009108;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=vUZCPEyl2XDXzmhALGKtzv1B4oImbS9pwSpjiPE0UN+On2YcLaXTCcU5ka9l6Mh3b1Bg
	 PbJy7EEtUkzZlrNH6VMM24tNucz0TuQ/FkW4bw2YvcQmdsd71iyLrWyevHWiC0nKREg0z
	 5hETwW6vlbylNQ3Z+N6feMHY9WJQty9oXNwnpnZMGrPr8NT+louQstgLsN0xKSyGUWJPG
	 ZVUYE3c7TEAZYFwpUPv00Ov2b10XPoFen0ZcGwJHCFsAAsnSHEeUBJG5O95mxBXUoiTCw
	 8ATODrLaJmhBEhN9vICPYJI0a3Q6cj57kBGO7vhURMnZqv8wxuoqzbPdyWx919DSGkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OZ0sjl4v;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BA0606A336
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 13:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BA0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OZ0sjl4v
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34CAE4E41627;
	Wed, 18 Nov 2026 13:38:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE9555FE9B;
	Wed, 18 Nov 2026 13:38:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D06711BC206A;
	Wed, 18 Nov 2026 14:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=OZ0sjl4vmh27yEtpI5NUr4MmRGxIyVVTfCvJ5u0WaWUQMFETlxEAQO342LSuvqacew+b1a
	CmSP7RvUtqtyu+DTbJAlrMwJzAMBFbF0ip1Udw2INht7rnMEOxPB2HQmaktqPw6T7Jf2NK
	hFsuRPeLNTfcfTYoP4JCM/LXqZmMMX01KeInKb7XFVYSiatCqm/ui8vzqiBzpvJH4s7f+8
	/E95gn1nq1v4oT4vq0rhbWuyeskz0XoqH36T9gqTTz8HDWJJJ0oVpBGZHfuUDz4emNk6oM
	vVeqBI5873gIqbkdPq324yBTc9R3f2us/VGKLmfAPq91NJkyEcvSQshsa6Gd6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:14 +0100
Subject: [PATCH v11 07/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-7-bd1d1e060926@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

clk-provider.h exposes many different helpers to help registering
clocks. Most of them expose both a 'basic' variant and their 'devm_'
extension (with just the last parameter of the inner function call
becoming true instead of false). Do the same with:

     clk_hw_register_fixed_rate_parent_hw() by creating
devm_clk_hw_register_fixed_rate_parent_hw().

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/clk-provider.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c2b80cb3ab0b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -458,6 +458,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags, \
+						  fixed_rate)		       \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),   \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework

-- 
2.56.0

