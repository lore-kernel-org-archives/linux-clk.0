Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274618;
	b=TQ/KDyjQSlV4NSJa/LdeMEGLdJYaUEuda33pggkd36KR7vWZr2kFsNJQXvRPCtYFr9T4
	 GhFQpEhQgAVMU8MbWXGtbfRlvYFEaMOnMQLyI93MTeFg72dtJkd+KmRlZC1vSJrQ6XQrj
	 1R7UnMkDyFDt+VD92iIAQ0cl3JpqX6WtFw59+Ig/3ukdTQbcY1gYB0pOT8tezPre71E3T
	 mqQNg/afD3xzhQVtqFKl1hYN8ZiRIHs1jxcSy38vh3ZGdJ9L4KUA1K44wQiet1f/jEJRR
	 vuwNCV9ePA+tIK+jemX1JA43oPSfJsKxAqOhq1QEmUVVzUZpye4j1o1zTHdkxBdBnTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
	b=m6hvJ/730K4eVM0ywXPJ7h1FnhG2YbiH57O0qI0qTMpNTUYpWetxuL/DNAncyWIiXODQ
	 FevgKOx/F/HUY5QsSgqKoHYe7QBGPdMREPBQrepnwrPcKLVAqlUl2kkm0vSDJL7gBA7nM
	 Ii4PXnKIrp45rwF8HaeUvYlHJyWiqjIm12Fp6KyBTMqA3O/7UxzBC+9Z+LHay2u2VxheC
	 dPdap/10qv4M1WNcjS/psmUAy6bQRfpdW8CaEltboDzx9Sbb1MDuhxB4oficZDuZaoENe
	 3fsx9KYcchXEr71rpOHJEAXePvWRbHBJJhcC6me86uhc7sXW/6qWRj0UVx6SZpGScGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05CC60A2604
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05CC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IifquLZD
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7987517aso8617085ad.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274617; x=1794879417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=IifquLZDZ+cGll9llv67+7ME61nc7o7FQKMoq1Pmy+5nIBxla61YJWHsHKruAn+vkt
         1E1pM0yuqw7uDjvRtjt+gY0g0we1m4sBlfJfOTOa4nQvvuD0+J9DogAgK4oUBSLcpFVH
         UKQmY4AJPzhsBAhfF6i5Z5PnBBLV68vn/QBCqHtNaVTaE/1uxslVDkwlgZEphqjCIUTR
         KmfsnLIwFB1oE/ZOPOmcHaUcp7dLiqOm2dzbJVwPUsPRP3XBJjNsRhiM+fCcKCv2eFgO
         amp/0xP1jIWUcIm9ebZV3I1M81tgb8OVHBAMhdDZR0FRk9wQMYooq4l+B4nuFWfj6Qfo
         aHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274617; x=1794879417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4REj6Cc3PcYKPXeO0BJLjLikBlGobV/sM3/zRfrSm8A=;
        b=wQBWLqHjM2LOkzrxkZRVr09IzT53vM8QK7pBVZIlnhfSK6mGfq/pTbChaF8e3mCM/3
         0jWxQtBubHNGoDM3TVCieoBIgGR13oo4jHWdCgX7ER9Slq06AlqVRz04Y4XldSFyZQtD
         zl/eeU+QcjTT0KX+MrTBPv0xV9namWZvEEWyvI8PALSbBICf5iC4CPJChMfBqethBpZL
         nln9sUhB8qAOZluIeMZpdQE5uQKUwRznTeHcdICFSkGaACNtRB4ua9LGl3ZVsaC+k0jL
         PDQtKlrjPsm3BC/bLpBc421O75Sobvk4d1rxmn6sNUS5SuDmRGCMF4Ph8YwxE54cIE/K
         zhJg==
X-Forwarded-Encrypted: i=1; AL+hErHNzRWG3yibgs2avacMKHU/vCVSFX43DFJzyd63q3xCzyKWz2IOfryCDVkA3GR4fGLH4XsXkdUOkss=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ekXAb2oSfE4KyTTo6xOCN1YsVfwsuDuy9/LHs36BAQu1gMysZ
	5O4asV/qFVsOVnXhkAVjHE3m+ecL0h/yL6GoiOZeW2sJtHXcRHvqLXox
X-Gm-Gg: AYBFou34IpqDb6WVtTxY8U0tpYL9Dgzh7ZUz0NJ/SsKbN79UxTFXj+4nIRuWrX10UPJ
	x2FHD4vqH2jHzB4XlCalGYPTgkvPoNA934flMxaZdsoSeJBwr46KbpmcDBSv1BM+Ivb+rWgQ+3y
	k9XPdmMdmPLkVIehgETTq2JS6AYor/ycgWpDSvLH+SPs+w1cKqBWeEoI017cApsl8+lVk43UQwl
	NqNoMBdPKQQvJBuZgY76ry6Bzmo6Lb9sh5XjQwG2r4L57u6WtOy7+PAa/YIWr/yMms8g8ucnB3d
	oPOD2ppd85P4AwqaeEUjtY6x60ZsngQVGux2XLG8kW4hgT4hPJqjGGCNUHGgQ9P9OmFIVqTPPJh
	35Al4xuuhudNwzyVT1FG5owGI89tE1iDQ4W5X4wmJPiiBs+2HxsRylTgkhP9xXtiBRLV2jXEIQO
	WigAKGYgZElax29r5Gp/2rZJiaq7it577w9SekqqlMBELiYwADKSmtB1kA3WNy7OxEO4GrmUTIG
	41lKULEJN3QqppeP2plB+23auCxZBl+BZpIQ1X7daUDPwGpGUWry4HKVcjOyh2jnBHNjb1zgJos
	yZZjZKQC/KDfvyvGdmmd0HtwOTsxz2M6hsjj+Yi3eajoR/O5OchHkiaS60lFHFuBjVO243J/Oh6
	toTHjfDARQWGUrOzkTnyYh9mPKyhoWgtgkLiGWl389utTUZknnsP7+nNWJSrk5rqBLp/P5EyKn/
	2fgzCkUwTSD2w39z3yScLusYw=
X-Received: by 2002:a17:902:e944:b0:2ed:630:40a4 with SMTP id d9443c01a7336-2edb91f5535mr10276065ad.11.1794274616976;
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
Date: Mon,  9 Nov 2026 17:36:43 -0800
Message-ID: <20261110013646.1582970-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AR934x has a second, high speed UART that is compatible with the
qca,ar9330-uart one and can run from a 100 MHz clock instead of the
reference clock. Add an ID for its clock.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..f8a98e4d206d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -11,7 +11,8 @@
 #define ATH79_CLK_AHB		2
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
+#define ATH79_CLK_UART1		5
 
-#define ATH79_CLK_END		5
+#define ATH79_CLK_END		6
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

