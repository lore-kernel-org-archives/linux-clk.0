Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F58189BBF
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427538; cv=none; b=YjsCie45oyAmI/uhNQkIfGCxqyEk91dAvp2VhjCyPRpUFWO/Yum/m0rXzpU46pRjIgGN2rhPxtIsqfzrK7RE2I1IgtS6OeEeyJstby3AV315DjlDh7MFr67mKrMDJYAlNQdOYdQs0zG9FOpQsrrEXDzNVqsRLwEphw3oy1WEZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427538; c=relaxed/simple;
	bh=evdq8Yt94WWw4pg1Boz8p0xNjQ+kk++pcNlC3Frqugo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4CW1IzxM1sAguJ12AxBeHz8h/tIMGxFfjPyRCyVQ4WRaByRKVSjvLhl9HrwU2DIjLGEqWpS8OPdD/G4i/gM8hr0kLZRUihYrldgFs20It3PzDtCu2omuyQTgVOPcl0PNmicDy05cxb3dsMEVRI+lNGm/9kgRrJHxow+ojuCfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObZHnFX2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObZHnFX2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86939e9d7cso17003366b.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427535; x=1725032335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTYXi4axMl8Q+ASzCGhkA8CZYY+O5erF5dL8M2uXh4I=;
        b=ObZHnFX2cXQwb1Jzat8NcyevEZ8kT3SLFR0/p9pRb9C+LA3foupCaRFqMWaakrKSZq
         T43421K1fR2Ti4bgQfwzRiLRtfz57fNtyAvNcmb/u2tsYrey0K61ZqmUiNpmGJpRi0kc
         tsqGXOSAu2E5do9KvW1FIduKeZZpCzf0BHwt6Bub0LESvg8XQdVttea1h/JL+upKZEO+
         +BzYOTzVNuxML5FW04a+xxHV6XHIFNrJSq1sKoOG9Yo0dRzLbrWHK+HGqq5VN+la7/5N
         QIXePr6FN4mwKd2Hq8UfF6OWTWCBcFOAdrTaGjG8Bt7vFLoNVgPd6qoiujwFQZNoa/0c
         Jc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427535; x=1725032335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTYXi4axMl8Q+ASzCGhkA8CZYY+O5erF5dL8M2uXh4I=;
        b=MX/XqY55jGA9+fi3qT0KXzC+pF/DPfUCgnlbjed9rjsBs8i1+sK2n84TWCV16J9jM7
         mfiMorExziua8+PiCDe1pPcu5kxrBJZFKyg9WMgT1zFpBUBEGH844fRr0BmweoFNYHN0
         AkwWkk5JliH3A4bP4KTh/FWceKxI7K3RbKlHDh7jwp9a++K00nDytZXaexcd2BtLTvuK
         c+PTEd4NhFeZKBrnwUseBuyqwN+3xNm3I3vHfgnfQQrYCTcboLnEPI4GMTsXF2AkP73k
         2j4tvpMbulypyLd+2d8V9/4DUdVrG1WavYonu1TnUyO8nM2BoCTY/bGsDWRauJugh09v
         Ob/w==
X-Forwarded-Encrypted: i=1; AJvYcCVEG30MWcmT+ymYfie0LEZN9yXyhUYUFWcfNmAJF2/WI73DGEsFVC5SlK6E8z0j60D2MTDuis88oOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/p4k2xeafObEiWGgH/jGQf83HcFVsmtRKJDwNe/KB04umq6L9
	TeSMVbPapIchJYCIFUGL8jyFzob5T+QCA/JeU9zX6INA2h3vDGJIxPRQ4A1LO6qNQW2DAX7Yhvc
	g
X-Google-Smtp-Source: AGHT+IE3hEHSz2qFa4m7gjtHBOUfNOEt1yU0j6abrhEBU9YNRc92xmhZn0idm+jCJ4fUR8136/gHhA==
X-Received: by 2002:a17:907:868e:b0:a7a:9d1e:3b28 with SMTP id a640c23a62f3a-a86a54d3d34mr128491466b.5.1724427534954;
        Fri, 23 Aug 2024 08:38:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2e6722sm273279866b.91.2024.08.23.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:38:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 17:38:44 +0200
Subject: [PATCH 2/3] clk: qcom: smd-rpm: simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-clk-qcom-v1-2-68bb9601c9dd@linaro.org>
References: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=evdq8Yt94WWw4pg1Boz8p0xNjQ+kk++pcNlC3Frqugo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyK0J87EiZDIfKLdvqTZgG0+FpbtH0S1vt1+oK
 Q6V3cbvtn2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsitCQAKCRDBN2bmhouD
 13PJD/4t3HRMv3eRBZKlsqv6qvMVSdJM36Smg2aWIT+lQi6G+TgLoAvWJYAS3O3I7IhM5jRb1vn
 4FXwIGY49hUowR6vxVCBka3ZoIMl86cm8NU38sxdS7hjZ1v7KFUX60qAqH/np/m/yGwjXL4iZqy
 8ic8pCqJUDIK30u+MqG3GJwnm2ESLC2ax3LG9TP26qTZjOIdiRGWlk3YqNSHJBula2bVZ8ajh7/
 53Y54Y8RHiklMhvJIExLv+rmTtu6UYqN8kVajlyGC2QEs9xc/65x9hZIciqSZexssPTvU2Lhglq
 ObAkyez9zzRvqc6mmuoULEBzkswkMecQ/i179eB6Z0fgpNSvpDeBNm4OTaU6CaOV9n1/J+oZmt5
 i9RL49B3ak19zASQ0RcJ+GpNZK02/xsrB5KfrBcCv/p99XAQgVat6SwaQag95J2KXDbSXf35TTO
 kjSKTJ+F7SLfOm4cXbUf+pCDaffuSEia2+/lcbkWHitW4bbG/jmHRXYZmD+qalq5STu3OlBkFrn
 fC0C37NmamYhrPpBwb2BXQ7z7UniSV7NMcx8tXVx6tb/YG92xi/HsDCaQMZML8UiEgNoZyBNyAS
 hquijbXGr8xeZU/dnieQW1SJjtVF4bn3swMVtW04qkaVIWOHhEDNJdAVcHwOYl0JYX5B3yjKtrv
 NZY0cQ9hKgw0B1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 45c5255bcd11..b8cd9f730119 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -309,10 +310,10 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
 	unsigned long active_rate, sleep_rate;
 	int ret;
 
-	mutex_lock(&rpm_smd_clk_lock);
+	guard(mutex)(&rpm_smd_clk_lock);
 
 	if (!r->rate)
-		goto out;
+		return;
 
 	/* Take peer clock's rate into account only if it's enabled. */
 	if (peer->enabled)
@@ -322,17 +323,14 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
 	active_rate = r->branch ? !!peer_rate : peer_rate;
 	ret = clk_smd_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return;
 
 	sleep_rate = r->branch ? !!peer_sleep_rate : peer_sleep_rate;
 	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return;
 
 	r->enabled = false;
-
-out:
-	mutex_unlock(&rpm_smd_clk_lock);
 }
 
 static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -345,10 +343,10 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long peer_rate = 0, peer_sleep_rate = 0;
 	int ret = 0;
 
-	mutex_lock(&rpm_smd_clk_lock);
+	guard(mutex)(&rpm_smd_clk_lock);
 
 	if (!r->enabled)
-		goto out;
+		return 0;
 
 	to_active_sleep(r, rate, &this_rate, &this_sleep_rate);
 
@@ -360,19 +358,16 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	active_rate = max(this_rate, peer_rate);
 	ret = clk_smd_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
 	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	r->rate = rate;
 
-out:
-	mutex_unlock(&rpm_smd_clk_lock);
-
-	return ret;
+	return 0;
 }
 
 static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.43.0

