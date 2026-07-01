Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7F3ACEFF
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886776; cv=none; b=GgR3flnz3n99aPj6Ns4Rtswa33oZhYYXH5ea2x068vfeGg1kCBZowUBCfwR1a7KPte3ugaWhhz0siuANfPBoii8F3oI3kGVS4L7iMt0uY+hd1LlUjgS5ehY5PaAZbH8sw69IJ36b/Lb9Qjd0oT5OsF3H5kwkztfqYUELWysd1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886776; c=relaxed/simple;
	bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Aaac+rAJPpOCZ8ffQeNruqBaWaCypXZdTI0A6tbw1GugpYi8zH15moVXTGrXYk6ZPY0EwcdKH6YEbIZiR6PDJtoCr6ZPeqQiG6qurHVASGA6OOFQMor9r2+1aGhYE/vmAYc3OlHhS9DpLy0+jINmP6bkyORMIMf3poqZGMAEevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xUq1NEcx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xUq1NEcx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-471eeac43bfso160861f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782886773; x=1783491573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=xUq1NEcxIq0ESL4lfVzuX73zd+FCW6ZoU08QsS1bk8p0eewqXjlrHh/BV9bjWIRJsO
         YVSNhNje4IpOtEUNHDI58wNU+6T7BUZtkNK8aZdpzFp+DH/L/0OXp2HnKNux9pXg1Bvr
         GLHxfCVr0PJD2a7KIeHgDRlFrX+c20UHLfhopyfkKchefnNxYs4k5sPRIeu3XEKBQ0Nn
         6SMmq8XxtAyDyzrU5oJ5t+9zAeaem5vwyBZ+MVRNJESuksfshgBpt831epMBBOkyMKKP
         /xtrpOo38R8NvISqS9+r9mT6UA4dfbSjlnaRNM4D0hxK8N2br1szu+CemwTQZbND4f49
         hXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886773; x=1783491573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=dUSefZl4hQcqvybnLgFRWZp2hm3ltBW7F9YxHLvpPwbui1CqWMpb5V2RdU5oY5ks2E
         ZTz8GB3ycoMxetbt6gpcrng3cQUmNyfoYnKghSsd0km8rnhGQeZtKO4fW778LyFY4Y5F
         9l+sXFKqvlm6FcEebT/rWoq2wqzvdqYLJwYGFsT/EM9btJdgMQDq05PE7Q5ZjUO2z+/r
         zZSYeT+RP33va3XszJ5Skr7/JakCloaQ0wkQlvdXUhoc198jwonpAazQa1lIxeC9UR5C
         6qTMEqzD6hVKM+uRo2w82ggQ+4Q8nwPEdScJoucmpWYBhJxH4WzUZQcBOoq2TPZ6PeO9
         s8eg==
X-Forwarded-Encrypted: i=1; AFNElJ9M5svywE+r0DpELC/eAZIejSUvADIb2fYA6knsnd9KdX2gedW9cFgmjmGk4bTzyKKuWXcXvWQfk3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82QBgmCPNN2AdUqiKqO3btztJcigLX+WOUtpA9UQA9HbUDvem
	YTjtR1JFtr5LLSIlEwJt7jr6zU2ewT/HxNnorCqAmCbm1sut4xSrBUivOpIOV5vB3FA=
X-Gm-Gg: AfdE7ckzZGp4EGRjRJDb8OLHfUpkwmCTyhPT7dLmksnlzAo5yQTC43rH46ZK+oHk3/Y
	7N4W2vbhQl7joT9YrUQOcH1Dkb4/pq00TueX6reQiA8GHO/oGUDy0LqBvS/1UzrCsWjfHScziuN
	whnsZJSAE3/tcm1NX8POGfoc4yvO5mYaRPvEPGLDp44GIvP/JUySbFXmY41kPRUcDLj0LRqDo2i
	vK7g5QKwnXv0F8gn1sHGowugQ/mUlrBzuJPDpByL0vK8OgNW0bonf2Bvzxcy5VU+2Ydo8eSHQoz
	ATPEODw9bDe1APAsatms5yXKxIC5AWIejPuBLvQj4pUcVUkjSiYKq9yr998TYwRfkLD8du+Z4/u
	L6sOZMWMTkWNO/tPL50lpNnMKUa72XtgbQZwfgtR6Zlgolwi0TTQLTyLOC4jO3ZVeMQzQg7eCPD
	dxQ2MyC9XskykfPvPvWRs=
X-Received: by 2002:a05:600c:c046:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-493c2b3d3ffmr2644035e9.6.1782886773243;
        Tue, 30 Jun 2026 23:19:33 -0700 (PDT)
Received: from [10.33.0.72] ([212.133.41.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm14748608f8f.1.2026.06.30.23.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:19:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 01 Jul 2026 08:19:30 +0200
Subject: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fScytzSIt3SvOTEgmJdyyRTYwszE9M0gyQLJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAHjbmdRxAAAA
X-Change-ID: 20260701-glymur-uncaps-9b538645f0b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782886771; l=1097;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
 b=mQrz1gNPzurdTuK+gXJ6oSM7mBxuhXNjzjZoHt5+V/7V1w1jwV2UE9wRxS5ime2wHKmUg+QDK
 BN1QGSiW8PrAbsH6RKrNTWZV4Mlh56gWTl0qGGPjVJaqfciqq3Vsqc+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
the prompt and help text.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..4169ecd95ef3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -65,11 +65,11 @@ config CLK_GLYMUR_GCC
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_GPUCC
-	tristate "GLYMUR Graphics Clock Controller"
+	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
-	  Support for the graphics clock controller on GLYMUR devices.
+	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260701-glymur-uncaps-9b538645f0b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

