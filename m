Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC1309F12
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725795; cv=none; b=K+KlmFFHPMzvN7UEFoZ96bUZmkRQ4NfXPoegqjJKpBeYCL3zFJZEBrJAsFfs8TQmcd+2x1t0AV+tQwOr4d0JgXCfavi/tIOxCznoTKmICckZB8LhO7kS4oZ//0ay4Uqd7CyjZJ8w5X3PtM5MadTvOmZzdHq90Wqfi/LA3hx6u+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725795; c=relaxed/simple;
	bh=PRZk0jrFppgN7vSJOjlLygbmhzpydrL411Vx9kPArxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OO5+ZN7hliXKGzHu/naKQjiZFRBLl07b5t440K7M4CCnXVwIvwR3RGGBMK4rwF+ytT8xZsTIDRhsxbqqBf04L+OxSYSABk10PmRkBzT8TR0hUjNZlzEioYfMzRZkvPEvqaflGpntexFSzZSvJpR1Nl6CZDPPNBHq8IgTXMIPH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGdaIUHE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGdaIUHE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b556b3501easo1455330a12.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725793; x=1759330593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTbOy29uVlcjxenqUAe8YQxe9aRTQQhc7UehxU14MvM=;
        b=UGdaIUHErP8azX93+SMz6kw/SwYEX3EiN/MG58aCC2P1J8HOPEZ4JqBinyWtAMPJkq
         VSyFofq3+sWzG6ERZc1HTWNWHUNy3hb7IStwk9CByeh4wYomrTwEmPolFyu3j6MbCtCL
         c4y8uF/6N5QQsuAFxBazGwnaLjbBdnSmDVwf9LvMBEMpZnNtZQWyoWF3xnzV0epZkokp
         Fvk/+P237rLUQ1SHJkqfcRMc0F4gQfj0U8v4MPAQlqpUifBa9Wol2C0iN0YW0kYzOwfN
         IwnLJIv0+RBZAtrOH4YJ6T424Vpvw0cVIzvOf48gv6m+mJrBditHZ6QrSJbcazdvrQ4x
         RlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725793; x=1759330593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTbOy29uVlcjxenqUAe8YQxe9aRTQQhc7UehxU14MvM=;
        b=T7j5HuTCDGngVv98WjFaGN/DvztBXoqmy7sD/sgUsEK6obTp9m5JtS84FbwAXB0OBS
         cEQMJJb5v96gb0CrNaykFcMgehEaRZD1ENEHfTxHrtzOIrVs/FkyyMt+CE03DPhAX8xh
         ZD5aMVKAE16o9e9w3CrQqPIFQixRhXI0Bou62aGIfQjyHhUoP6k/4+jhns2qORx+glJI
         kybvulbZC3Rt84foSkp7ZNwd2MDhJub/qnz1wQZ7fiu0UU/FkS23rzmu7lkhafwI4QVA
         SPWzPcuurdHjfSDH/Bgpp3kPcM7uIk0jbIbc0z9MpLhAfTUDDkz+jf08HcpaL7ONCesu
         y9dA==
X-Gm-Message-State: AOJu0Yw92W2FKRwRQ48vrckqJQR72ZMCp/iAZG4o9pvn6DP9MRAlPUFt
	GQJre4xLrpuM8cMMEXhTisiUYZav9JEvjiyEhwJHGyyD3ctlsbGuo5D/
X-Gm-Gg: ASbGncu1mj60qBitV8eLovCqDRbflGFKEtQGPEN96qgL3ZHgx7yWUOmQKAZBuUdp0XB
	7hGSrm/IAuQfMKXL2nWiK35InicRweAGPzWuYc9PWHXAETFYfORuBR3ICw0Pb6FHlP+q3vC2WXX
	fzhK34nAQsQNALKWdBZvpNVHLY27hUbu3tusp/gZ255MTEZv6mSar56uUteagXP5ywPHA1D6oIZ
	GE0nke61zgTaa3YVTeDKyY3yFXKiqZmcpo8uBGpAS0HRaXvPdIvGj7x6ZbDnMHHHx+fD01MFSkq
	XvUd9uFmFFfw8lpU6dpbGDAeFH4GFxyZuIMcvSYpog1hvlV0ksNGzgsQXAaIvpnq9JDr6hnBamY
	unwSnSz/kZ0Fdm6cD9eHcUyPQPayufVo82hCbNQJeifWzM/FizsTFAke5j64=
X-Google-Smtp-Source: AGHT+IHUOeFU4kluRlGJm8/v8V8Ejgu0uLYlYSI6Xmc4VXSt/m1ELVH4qAcTGAn/spP/GfmPawzFYw==
X-Received: by 2002:a17:903:b43:b0:267:776b:a31a with SMTP id d9443c01a7336-27ed4a3de4emr65295ad.29.1758725792827;
        Wed, 24 Sep 2025 07:56:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f31:8167:35e6:be:ecb1:9216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de963sm190509975ad.77.2025.09.24.07.56.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Sep 2025 07:56:32 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
Date: Wed, 24 Sep 2025 20:25:53 +0530
Message-Id: <20250924145552.55058-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
API, for cases with dynamic size calculations inside kmalloc().

Resend is to correct previously sent patches mailing address.

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..0c0a746a183d 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+					sizeof(void *),
+					GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
-- 
2.39.5 (Apple Git-154)

