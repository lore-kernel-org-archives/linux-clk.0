Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB66238C15
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274613; cv=none; b=hgYIA6cBVf7wQ1l5grEx8ETB6JMLD1hQap0jPjEKdJc/3APnNPtAblW8HUa/ud/6ZplsAsRTx/vS0Lk4ZSKaFmqUBRG6Pte8X73yJuGohkXd8r0Mi+cqlLfQVWg3EzvSBJi03TwX53h9JiNKX0zjEWNU82LzUrLA7pDuBeEgwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274613; c=relaxed/simple;
	bh=oiXhK2A6qAjCeSrQjh8L1wUGnhbIoDCcnIty1f+TnrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz/PfrnmN+3aqFSpxnWa4V3IKgn10Ks1s25xw0y1xQXgbKaP2E9HzTxP2iLpr1XlgF4lktOo7k49Xtfff5HJP6MKZ0ihyTbqUcdsWLN0lESWTQORkcNoWqVzSLScQlanmzgQnOL44KJNhJTyXdyI4QO0y//fVC7FypozoxSy6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdem/cg/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdem/cg/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso4753163a12.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274609; x=1769879409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=Zdem/cg//zU0udbZVMoQs6TQC73Edrgm4zyyNWjfns+5Zp2x++qC6+RPJ9NwJJlbMt
         gJfqtcwhSyxN0VQyHYu7ZSXV/SdhxNjCT5wDtLt2qQwK7rWa6RXb4zui6hsZcN3fXIIt
         LwecRBIYwIPWMZhHEf1d4LSSEgFqufNzMWBrjRu9TBRmtJdsq/Ezkc1PMG9fEQhipYKD
         Huc0fxTLQA/Upwvk/IG3D9mI0XJ5tqPTzlYZGV4hgFKa7nW7RPZGkYanSDD3Hfb97TZ+
         cwaj+17BsWjX6lfuMw7aJKjgOmxknK96DuCpD4gBN1fTWX20AtsfOIOm/bbwrpM+Rlod
         NxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274609; x=1769879409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=KGnB4wzCQ9xPmS2hslLUgUB0d2Xx5nGpQDkW9B+/wysCIJKmGDPhzN4bLd2QWj7abZ
         zf7BBL13cmAv3/M19Mu86w9Hj4xLOYZ9imm9zae6HMN+tLgDNW42/u1vCPwNvqy+4TKm
         hPNRcpNHI26wk1DiykAdaaEdcVn4FaK4oMIdX2S0+UUoAY5nt/mwYyvNGK3YjSeJUGC1
         v7XGwYnJznoLQzooLVjhVdT603gTVXGX6tjtYhBXiHoBEsRUm4/BEJoHsyzS3imXhL5U
         w76TRBNfkkIaukH3DBOpIhVJVQgeMQ4Q5QPrxv6BgCmvpg0For3Sp8scVQ+t6QU/K6W2
         fBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCViuvJM237BLtgBx5QEthftK2MaeenIlyJ1TzvwesL7vtYXj5GIHBnQob2qzlaESos1/UljiXx5pKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/tT38E00hu5gQGpcd87SVt3lDPVz0ZNCO78y6cICdYHzXRnC
	jOH8xZrxoa/cW5ieU3e7ICagEEJP5b55ta5GCoQSDB7H2CqW8ciLr9oK
X-Gm-Gg: AZuq6aJo02DKzP3Xc9OoMKv6s4QiiK9Z9FZDJl+ke274wqh+ShhRiD05C8WjUnow6WS
	azgbDNmksolcwzlACs+vLsNht0TWqMsC4UD2vkrN/0xC/pTO+yGvz6k1vycxASmBSytWy4gDVUB
	mi2ZLQAE3MNZimaGctewakTCGj+ts973Upx2E6cNlgloYn4jI0vXYfAHPCLylM1UZ1mX2izFrnx
	sqzBLV3oD50VRsiU790E91sqdvKzWpY4YywCsfAeNygs5lMyEW8AdyjTfYj5AUwV9KE8q5pSuhF
	rhzc/4NPhJhTM2aCGNoEpMI7AG638MofFuMVoThwRLToIIAQgOOo1pIGXic+VhnFvbhz4O3X+1n
	eCa2Tm4wqXoGWi6xx2T9ketgsOI5/qoWhZnw8nfUuYD1JfzeFyXiHOWGooq9mFgmXOXdg1U3LBh
	fjr2OP2W0I8G6jCU9OkUJDcboodEm/ybi18utGSXul+nGRdtjZZYe0hpxlmCsDLGbIYCycYCLkj
	W0B6QK25I3v0lmEBeZSnA350cTXJWGXyBFMIwLR5s5yOw==
X-Received: by 2002:a17:907:d91:b0:b86:f0b4:4974 with SMTP id a640c23a62f3a-b885ace961cmr524530866b.26.1769274608550;
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:02 +0100
Subject: [PATCH RESEND v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-2-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=oiXhK2A6qAjCeSrQjh8L1wUGnhbIoDCcnIty1f+TnrI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr84AtMz8e9EIpfABMWvoSk4kv0vtrP8/IL
 hSvXEKVnzqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aMKEEACRNvmrJFuQDxrjGretSv/T2u+KJjPG6EBnz0sOxMNotQ2zoZFowKVbvvWbOzYW3ULYzjb
 1rML6Y8keRWjGapqEu9z42FFjJTbjM3Iu5gvTYraySovyj8GHrc3mHYbpCe3YiNkJNYaBE2G4mG
 9VHUniRuqF4lH7cTsh2BwzyOx9Or243smDt97LqbOA09fmGhDATS90TvVfQyLqd1nVhynho+URe
 D3kpMqEFVZWLNbZtTwRdJOEg7bTAGtM5YbY88EeNZHx5faZ9YEWrDGNlD+gMKbYvLnQmUcENox9
 CYSqQKH0/Vg4pVEw3gL0YtsQaioTVg0bXaOQPBRjbArymJM63vMLs9+IWZVbixCqEWjCq5WuVYV
 FGyfJGWxzyBpA9PxWSfeqiv3IsKFSFOosQYoeuv/qXTI7Ctw+EdlbPIzgByH5TW2uJE3SXAHlE3
 WisKISiz0BkCdmVvApNbKHvUrKapJE4b+A/yjVp6EMFvGroI+ZwEC4vpWWvkLsLNGTK/bxFrQt2
 s0i3BmrQiKHqRIsjkiel6CSuw7FGOdt3WRw69kZg/3yiAklm7lO2Q2/mspsGo1WbdYp8d8EcyXf
 vO0SbxHYaOx5Ocylsd4WtxwRoh6Ps4Zq3YJQStn3VEEbnyTjes6nm5NJoljXJcu7wW4nXEhfyQD
 BVjWHyUOVW+jx8w==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d..7a380a51848c 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e7..0c7a7e10cb42 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.52.0

