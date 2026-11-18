Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021596;
	b=AiTPbsL+97mnyoj9YkeXfciK04z0BZEZo/8PNgVCCc1fAkU5gut2sZlozCebJjTMqm9c
	 I8nKIlfk1reMjKovE0srPgtlnI1tbFj2rhVnXLCW9e8mrN6Fvj+UWaRDcvnsUljVn47lw
	 Y9Ly2/yRSczda4QkHv02+phz2g41D+JcDH9ZFQ9662TNkS85IL3cnKXFc3tWZMrbzK+Kb
	 aHVhrTVWoEIqc+3NW5eVmY+KSdXrdV2c+DlVigaJdo+H2RWEGicF3S9yPqk4JKaWHcj+/
	 nEZC2CGSh5AKybI7ICtD88BFlxugPWVjOWMvRqA2fd7hfT86n8D5NAC5gfRB2vt0Q8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021596;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=ELfAQwzgK0VQ9sjcVCP9CJ/u+0dJUCwYKtiFrvfG/5p0yxms2T+pi0JpavqYlFQz+f8U
	 80/FtsbEharfIYzmWZRnISwaXS+EKNI57YG9ArU2WDfCmxq3LpU5VK7XQvWmZAGypDnx+
	 i3rdR46O9ETu3HTr1eEvhebcZ9LHbI+6AgQGw8qFiij4zqahuOfcylugxwuRfgS76QlJ3
	 55vgXWiw3HmlSmrkI5spVQ7M4XehXMDd6PYlf/3WPNeyuYVBAo+9J/Ep+GFoKBLmbtB9I
	 ++lp3nvIndyJp3q1mHX18OTUVu75FHmE72YaUNc7gNNfZBkbLgs/87xvfYe/hkgeXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GeVUKz0p;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E96606A33D
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 17:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E96606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GeVUKz0p
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A81F8C4F77E;
	Wed, 18 Nov 2026 17:06:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFBAA5FE9B;
	Wed, 18 Nov 2026 17:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE98011BC1F23;
	Wed, 18 Nov 2026 18:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=GeVUKz0pIuAccn9dkHbm1aUU6BFn85veWvaTHDBRN655UUqTzoN+Vz43SlyM/wgPq3/AlO
	+eV1xRXDjH2EK77wXEMcSwVaMgwhPtZuIj6XK9bD8xBl7m9Ul1gOu0YWngIr6rnEEJKucx
	DWaLGV/RrhG53on8mVMakgtz+imjCSGfBVl8F2kTIKw4xa+Orkc0B5v9+nkyKF/HqVWKuO
	gMzMhocoeWRyZ3PUjHHj6FbdteK2m5Ta+285AuaUjbL6YwgiQLiTctEUF/AeEmSkzBLPuC
	xc4DFDm8mYYRIITHrXwyjntx2cUngjaN4gofN6uqovFxvp3OCBGv3Jn4L8oV1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:16 +0100
Subject: [PATCH v12 07/10] clk: Create
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
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-7-bee2c8dad4e1@bootlin.com>
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

