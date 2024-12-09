Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E8223706
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747058; cv=none; b=UIDizsDF74iYE9l1ZVguza8xl+WOY25Bjh46UCDXjDL08wzlzL+QVSFMwycWy+UX6hS1Y6TaXTVAhB7dCtIQzndQ7fnldkob6rthUo8Nki/hky88VLDGOl8fzcM8WBZKUINYk4LGSywjiaskiZiPsDF0cgCEQRYsxspIpRD5NdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747058; c=relaxed/simple;
	bh=rkMjCrwS1+wByjVOGZBOyBmwHcPRefAACRVZAjVFMrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uB4z+WJxfNWyennvl4GKfBRVuzG34XJahc+g8dqBWHwZHQA4vcH47FdsJOPTL8BuneHi06pYMzKNXg6oNaXxOEnI6sBxbqNsm+VJNEI8qb5w6Q/cXOqwNUZw16TSl1a8T09hZHgxbMAQTSBwO2wqOsGEgM4exTLUxqWLIC3HQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TSkfFdnj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSkfFdnj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa67ceb4e31so27183166b.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747055; x=1734351855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VS86PQrU3aNTPQz7X0NdV1vS6PaGx8hn6CNMCEHmEw=;
        b=TSkfFdnj85CTjX7fstayGkA+yd08BtcXBT/3toiUjY3nBkkYZBXSHhN3uk3kBVpPMc
         vAexlKp7C2eSDL63Hz7EXl3hZSBshsIx/mqlkgt8AR2Yh2U1JYzuWX4u2GKtPjE/ujVs
         RAykGzOOb37O2A/EDHjXwX7tWS++CrZI5fNBDrTMVIl55WgvPENwXKfpEq0wKsYToyBG
         uDkaT0PcH/XRXTTBZhD/RgZzA26FxUcOKXXR/wbkCI8JHxMO3WFFKdnTAIOWpjpKiy02
         7dhz+75DkHynof/09jlwwFvPdxmM9C33wIwuWayf3bHuZUsMy2WenQKMXRmVSLxNklM5
         W4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747055; x=1734351855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VS86PQrU3aNTPQz7X0NdV1vS6PaGx8hn6CNMCEHmEw=;
        b=GMosZFookKdJ2A0zp3gANnRfgSrkfSAvM0C0xXRVRYnN3hqwvi0WPgxLwboierSbdF
         XZ507ecJwwTnpg1Q40BlNK3ucG4iYAUPlIH9fbUvkDQMlAdSUVvQhpridAdytfwf/A8M
         tL0u0fFPXryXqNdStXBbwC2kvdSButoVET6ArifAC9ovRT+c/fL2F19qMNxg6ZAdttCZ
         RKoYxcNL456nBS79ZsZuziSEMC0rRi8xhaQUj3hZkOxKEgMp7TDs/Iv2wiBwMzHr5XyW
         fD/3W80UGt7zVdyiAT/8O/klWdsWus3wnoR54xvaPuOAPdqHgBh/ZQLk8TH7F8y/GWvZ
         m8bA==
X-Forwarded-Encrypted: i=1; AJvYcCUdX5TCHrH50jtif5qLTSsZHjEVsPqffZTphWd6pHMludB2nfHHFCkQ+bR2jz1U1/hmy059le/xaLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9xrDbXQKRJp6HeXt1ez+Z3J7TO4Rngqhu2TDjqIHFASRrJCw
	Eyy3IM94a4W/Pz5sxkuqXyDPD8LjboU1DvLzsS8uUzeNpfp8XVkub4QxvlYiDVo=
X-Gm-Gg: ASbGnctJl/NaUr1ra7hDXUdn7HdtHPEd6abPMxqgp6ULbMlD/tDfnNhuBY6zCMhC8M3
	sQ2XL4h4MLxXuNmqzoaB2zYcvEJa0TrLFNIEN66SJxcRf7HPxCzB7ZZhHUnAWLJDKzUgbKMlG44
	C1RtgQfHXCwvEMQ/0IDLKA6j262ocuoz64ch91Fuh93AN831hXI+tBWfIUMt4j+hb50qqzRem8m
	mNQX3h0ixbf6izKblK2215+e76tV8rsJT+7IFyYwP3YHU6nUXmc+M7PjxWFuZ25OA==
X-Google-Smtp-Source: AGHT+IHMa1lVKER8h4Ap0+h8iEA/ASsQQiOkTcbxptlpeVP7AhBWBqczT0R0GsKDETc4Mf1TgulAPw==
X-Received: by 2002:a17:907:874a:b0:aa5:3e81:5aa2 with SMTP id a640c23a62f3a-aa639feb836mr488047766b.4.1733747054666;
        Mon, 09 Dec 2024 04:24:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm309925866b.159.2024.12.09.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:24:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 13:24:05 +0100
Subject: [PATCH RESEND 2/3] clk: qcom: smd-rpm: simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-cleanup-h-guard-clk-qcom-v1-2-b1077540230c@linaro.org>
References: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
In-Reply-To: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rkMjCrwS1+wByjVOGZBOyBmwHcPRefAACRVZAjVFMrg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVuFpiHvV0uVRDjZL66G52Y9rZuBpcDh97yVqm
 7VCNFzDmjqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bhaQAKCRDBN2bmhouD
 1z6bEACDJRMV3tKG8OzJzEzGyfz0lOZpMOl3jN/tTBoHX1ttuGWTy4ndNdqgrS10DEBZX6AukHR
 2RkvqWkTyKKdNzNQuzOUVZceVDzp6+14dJh8OmLv9rh3T1CybD01NWxDyX9E7dHwpzdzjKuOzik
 ysttIokEqGs7IBZ/l/nokgkJYYEd29LH5YirY5+WRuNafy79CfiPlh6J+BUxTMaw+qQuWFmoD4t
 PQFyq2OQiBrgTYYxqsxrT4JmK2wXe6+MD2E7A6hE6VJdr1O23cjjMVX3b6+Y0+zZbP6h7VO6cUc
 VyQzxXWG70zOEUW0ncp8VxGy836HsZoZT6XQuxBfOW+3dq2jEzkzDA3JMmNc/gFNaqb2eOHd0ll
 P6LbKNLNdJScsdo+7cCv6RlcXMffERSL6CNnOY62KiEfAIJyXrxcvOL6RvGd7qZA6Dom2kJeNAq
 6M3qnKP7ZQsFDIENjvEUPMTO95+zN6Ql5fL8pkAPLtsOESS6QvIBV7qnYM+dyTwGeTMJzqk9LZ6
 g/725GdkH60DSX36J3YUYaUjUqos7CJFgBuENmayd8k+e+t3MOOzpeh9pEF0K++9Z8PV1kbpVOP
 LEy2KoplchfXrzS10mQIx+q5O2+boaYrOiH4dh5kiLIoLpYZv1npQMxIclDZpW2qHr0xOE8sctQ
 WzPlTI+EO1P8OkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 45c5255bcd11bae69b83138ba1d5e52a8a3f3be8..b8cd9f7301194a539d5fb18f974a5600496a1032 100644
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

