Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3FB1898EA
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427536; cv=none; b=eH6O8/DnSM+fbr0mkEzmkOdX8F9THYaw9O0Pw+6wUrSJXshTREvSZaQQQj8H0exoFqr4odtMhxevEqQ62oQwKmdsOffvoDongXlyBs5BGjsF7nMDC31MsDDeJOnUFyQLfiSWe53rhnk7jFdJZT8gpPmcXGMKPOndN7pCt+16CsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427536; c=relaxed/simple;
	bh=JR9cw74DQSM2eU2zWwaNZZ0xGyZqYuXXOD6ozbehUUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XeJ3UqP6x1iugKc+musevsY8W6LHumykVKC6V1voUt6WNMdfllrT+7fjWPVhMVWv262ofzuYQIjUcl+m1mOJR8aF6yc3uSv45aDMMsdXnQ91divxXkJJQxsK6bPnkmSfmrucCdHk42sdkAwTts0/4nLTqGDX9vHL9xO6WNBb1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H653+rAO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H653+rAO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a868b4d67c6so15270166b.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427533; x=1725032333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJs8d7RVfQGekQmLWkZ3l/lci/ql4y2sx5IVAqszbbQ=;
        b=H653+rAONM9NH05H08lSI7RPuqapvCjRvNLdz3hqHWK64TTTqjYNj7ym2BzCIeEJgz
         53ol87XiD4PXelWmqmeDJPvrarqPe80U8qxul+j52nXQdeLlwv6paIi27yp3tqw1FyC7
         7lSd0Zr7inDAFZAk15MAsvPNdXhBIe6oQaafYs+ztTaOwQ3DvGGBO9kochf+NGSmGcv6
         VKnpBVKvduUPsr93zGzLjOQRtzkqXHE4E4hsWnhHTeyvdT9oYgYLB18MARrfQmUuey6h
         K9EeALecGbVcPzcPIL908ZcHDRXN9IZeW8G903bPUtZOLYBJY9hCZ+a0PMV2ZU4Nn04E
         ohsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427533; x=1725032333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJs8d7RVfQGekQmLWkZ3l/lci/ql4y2sx5IVAqszbbQ=;
        b=Plh+GMCaozysrbj7X5q+IkO5HkxYXuTK3Pbxmrr/SGgKWnnA34+zXcZornlpXpPByQ
         q0pSrkAEBX0FBWj2qmshI5np/pLfsxj/E1lBZYVh5v3DEfN++fccHG1nFvFAjsxR37Ey
         e5aS8M2JN2XDjD2bPSLXNfHTu+t5byWo/dGKJyS5lkRJyPyIDRfm+VfIII059ynRVFvE
         CA5Qqzd1tlS1PzsAFF+n/41znnJIcna+mvSWbmeLsrR1wUkNloDBI0ShLVu0uNhRSghS
         rpEzDyGXNWdlyqt2efme+xgnJTpOb8zuHsLXwd9h4YQ3jg0Mq13FK1xv3pVoNCkcVGKj
         sjXA==
X-Forwarded-Encrypted: i=1; AJvYcCWKcUxLcAImHsqOj1so1EQhEI2c4C2dulItz6MCB5IVvodibuIXYlnvOGbSEVoHrcaHBbkehRKbRtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYndeTTUA8YuK2uEy26rtLczu/igueexXJTdtZC+w9k73h6hH+
	ed8WD6NHPcIRrZZNV5Gj/1/YcZytpIthhpXZxvU7WLLfQsdsOtEMAdKUasSwgsI=
X-Google-Smtp-Source: AGHT+IHjrGLfTu2FQGAUVxvGqawL/r9shFFDgxA1PeiSj8myBbgeuoJr5guuoDNtki43GxYl4WmVig==
X-Received: by 2002:a17:907:868e:b0:a7a:8378:6253 with SMTP id a640c23a62f3a-a86a5489a52mr122703866b.6.1724427533388;
        Fri, 23 Aug 2024 08:38:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2e6722sm273279866b.91.2024.08.23.08.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:38:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 17:38:43 +0200
Subject: [PATCH 1/3] clk: qcom: rpm: simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-clk-qcom-v1-1-68bb9601c9dd@linaro.org>
References: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JR9cw74DQSM2eU2zWwaNZZ0xGyZqYuXXOD6ozbehUUQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyK0IQtEkv5hsTH16vg7GMkM80IXzMNmQHSClE
 WDLx9TYIlyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsitCAAKCRDBN2bmhouD
 17SRD/9O9R3z7jT0K4xXGRf4Jsz0hfvMvbt5+GVp3EGiPy5d6axfBuNX1/OWAgdCHeEvhJKR6MJ
 ZDoSdUNxevZLbafQmwlTGFTwe0kuT2B+dUM6xB22VUNHTRnWM0iCF6fucU5dDAQjC1yAB/K3oRE
 lNc/C2u6tFZuMvBv1Fu06h7EtvPDjEfIVbZkkjzPk2HuLlTlXm6z5Cvl/YqYVwR3Ve6GsepflLA
 LXR5DWR1HOdlhLrXNFB8ErJHxoXhutLCzKoBIu2U+ANBpHyrQ3gvw5D4x9OsxbcFPyydOpKxAuh
 QnR545gj9b2smdNQM8opOyTZAoQEm57Y82dzLjz0ryYFp2R2xWBlnC7OhzxKaRojS/X0NPvHkNe
 FeNYdG8I1e+Ejd0ZCP+KSwKSQrlrTYVJ5WB/aWdVz1xP5rt9z65U7MZGc3qMQ5mCRLdcfpFyQoY
 23HVbRa+vKX6Hv2oV4d2Gpc5ghplUAKXk1ljmld6u0bplTxVHDbRdDy8NkOXhEtWOqUFQpaFd2G
 N91KuywF7T3KUJ+VIbKydsoBePBxZmU4RowAN/hyGvBxcVTriseJhul1tJW8X+Z81vhZD+ZaPde
 9a/r8CyviB3d+yGZWmhpD7ffzepSuXk0n5Yl+pKTJeeYvPGgVyi6ULTpD9gFZUVApj2FZcGL+pm
 nryYWEy/6Wqtz1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-rpm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 9da034f8f2ff..ccc112c21667 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -224,10 +225,10 @@ static void clk_rpm_unprepare(struct clk_hw *hw)
 	unsigned long active_rate, sleep_rate;
 	int ret;
 
-	mutex_lock(&rpm_clk_lock);
+	guard(mutex)(&rpm_clk_lock);
 
 	if (!r->rate)
-		goto out;
+		return;
 
 	/* Take peer clock's rate into account only if it's enabled. */
 	if (peer->enabled)
@@ -237,17 +238,14 @@ static void clk_rpm_unprepare(struct clk_hw *hw)
 	active_rate = r->branch ? !!peer_rate : peer_rate;
 	ret = clk_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return;
 
 	sleep_rate = r->branch ? !!peer_sleep_rate : peer_sleep_rate;
 	ret = clk_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return;
 
 	r->enabled = false;
-
-out:
-	mutex_unlock(&rpm_clk_lock);
 }
 
 static int clk_rpm_xo_prepare(struct clk_hw *hw)
@@ -324,12 +322,12 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	unsigned long active_rate, sleep_rate;
 	unsigned long this_rate = 0, this_sleep_rate = 0;
 	unsigned long peer_rate = 0, peer_sleep_rate = 0;
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&rpm_clk_lock);
+	guard(mutex)(&rpm_clk_lock);
 
 	if (!r->enabled)
-		goto out;
+		return 0;
 
 	to_active_sleep(r, rate, &this_rate, &this_sleep_rate);
 
@@ -341,19 +339,16 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	active_rate = max(this_rate, peer_rate);
 	ret = clk_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
 	ret = clk_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	r->rate = rate;
 
-out:
-	mutex_unlock(&rpm_clk_lock);
-
-	return ret;
+	return 0;
 }
 
 static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.43.0

