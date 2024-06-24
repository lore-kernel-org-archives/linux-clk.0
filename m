Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008A49653
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216364; cv=none; b=N6QKLQnur4Giwq8gzxLfvQ8E8KJ42C5tkk83DArgPO4Ts4r8Q4d3o2PFYXqJxd/F2NoSTNaWQp6ZDDA+ej57VQR4PP31RWgzYNv2AbuBHNXqK8FHodiB3nhLXuKcWYsgVLDcIBfFeryz++mgz/j9b4CgNm57a5T+dNnXb3IV9jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216364; c=relaxed/simple;
	bh=CVZ99XGO1/Q0YNiabuHR8pXC7UWmuLN1weDi3HiCVx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehTf3fow77WOgHaG9sivjFmWqj/0/yXtrCQrc2hIlyNos3DPJQbyHKxZuMPbKe0XkHGqalLl7DvvMpotJBIFzlZENvOVc02gdy2BdgE9wfTafLfDCDHZkyMP8/WiBjw05vaAXhae+k5M/66gvKm3RRwBzJr4Kmlb+VTJpFGQGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKL4DMcg; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKL4DMcg"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso772729e87.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216361; x=1719821161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq027QwJPOPWERgfAacSQ3tvZEtk9hRZ+RB+oxWkMp0=;
        b=NKL4DMcgbnffaiAxBIiQ/hfa597L+CN9JPSQ5wzOeRxJb3aCKkUGd+ZmvCukpsDLve
         bG5yltpPfgnVg8BmXo+vjJhGaKa+rL2p3pPSxXYcYaJyAw3XpO42sO7yXVeNbUaEgHJo
         cpAIsw8IIJx6zHZ3oTY7t705s1R9YNTrGq65XaAzrWlgoCQhdIjVtHZd/WCE9lZSYTwU
         jnonGyjVPpXRYGgNwWs69Yq6r0bKICN0ZYq0by/vOiwNyV30Y0tSZ2kl6tRilEhVLYjP
         p/Tja+Za73ugkXLilAycGCqW1jlLKqbWwlknOsyUv1tXMwR8/zTjZfLwCsCKLdcM8pQh
         LEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216361; x=1719821161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq027QwJPOPWERgfAacSQ3tvZEtk9hRZ+RB+oxWkMp0=;
        b=fhrfb30etXAjYsrym7WZUW/2iOzWIl+rXRFJ1iJADa8dsQqsy9iI/WRt4Og8oSC6kM
         4sp77M2pzE/Qms2cwyiCcm+NllZJ8SkJKWgfZ1cJH8tNK4Igs2qXobjg3tx8mbf5K7Aq
         W22cN3dXbCNAP5pvz1bYsG/M20QKuSzdW9upmc6+MCZWb815NhB49zJfJYpkoI9slXHH
         QRwfacrDaisxHG34XrtGCxPLL60k7/LL2aK2uPg0m7FSHHuyKMbO5biHNNwLTTa8jBKr
         3Qv97wKwmRBuqaJLqXihPv/ensIEciHYiqimxH997CB1t/vKEyQRHd1xs61VpXC62izP
         gu0g==
X-Forwarded-Encrypted: i=1; AJvYcCUATH+tIZ52deQlu9a+s+/ZlKwB+1lBsCmk4baZuo5pBweu+j9XvwU4wzjiD4gbczjUqXgJ8H64wMzpSGx9Yv/9uvBZLSTM6eXR
X-Gm-Message-State: AOJu0Yzg8nM/4g/HOQBA/E8ef4B5aDEFh2ozheiSkYGh61B6dbhlc9sK
	KZp4DUACXLzEvfy74AP880gQ2eV0XfDWBu1OcqjG4ZS9lx+4dhUJKbUFglwk+v8=
X-Google-Smtp-Source: AGHT+IG/DPxnHbM7vQbL/qKAQhWp6hBWMKXWzAs6fPLsVWWBybzmDb2augTjpN3BOnV6Yt5fPZiukQ==
X-Received: by 2002:a19:4312:0:b0:52b:e800:25d8 with SMTP id 2adb3069b0e04-52ce183559fmr1934089e87.25.1719216360895;
        Mon, 24 Jun 2024 01:06:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm9280284f8f.104.2024.06.24.01.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:06:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:05:52 +0200
Subject: [PATCH v2 3/3] clk: qcom: dispcc-sm8650: Update the GDSC flags
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-topic-sm8650-upstream-fix-dispcc-v2-3-ddaa13f3b207@linaro.org>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CVZ99XGO1/Q0YNiabuHR8pXC7UWmuLN1weDi3HiCVx0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeSjkAeoEtuUidH3qVRWlVXt8JDsc/aFpbUPsBrJe
 q5pehxCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnko5AAKCRB33NvayMhJ0eFuEA
 C8JXkUajsSIicgsyO769Yk5BjDrbB9kB3guwEeXo3oprRY/WUl/HT6yibZ1Oi1X5cIlHITEq8XNWqN
 oVxE8WUl9SqnCwWqgqK3ov01vVl4BbPYmb7O9rU+EInhhLrgOITUtaaEVvHntcGNRvDPyHBzmPISwa
 ViJUZOn6sKJzzOvoMIst5zLfl910mgHHq3UtS3VN1KwiRg9HWGlfZBrwEkL4UxDwjg9l1gKwOgVl2i
 EtmNHy8TpuQuxy9nLGsxwueMRrKb8mLsROR1kivNbIp4rj6Mgc++9Qwu6MBAhuG5xKjQCvaZYRKUQg
 ETHgKC5R05N7kz9aNTAhi6PvOmUfebRRBhK21TjVJoVppTc6xXx2xTZyP9tWsXTG4Mgc7OtvHC3m2F
 sHc3AOgifIekEtqAC/S3PInL2/vDPWsUx1sfH6gbKCl8fgCGkgA4fmtbP94PL9V4RtRYoyWXjie4bd
 5kWWpQJe87aW2zwGogFIYepGHHH+7s80JQAiKS2rrQCnwZRTIWpTWG8rLXRafh4+vZJ5kMjASqh1vc
 0t+GKcfG3g8jhqDlEN3CbTzrCMCGM/IU9w4342QpFTTOINs0DjeWGivTwimjg1tBP69jtd/jhq4NU+
 6Tf/khTOmvmy6maWpHsphyzm5JUkcLb6jxiyuIdL3wKtItlEHBRZVrewfTLA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Update the GDSC flags by adding missing POLL_CFG_GDSCR flag.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 1222a26c45c8..85d8809e31e7 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -1610,7 +1610,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc mdss_int2_gdsc = {
@@ -1619,7 +1619,7 @@ static struct gdsc mdss_int2_gdsc = {
 		.name = "mdss_int2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8650_clocks[] = {

-- 
2.34.1

