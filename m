Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B41EF373
	for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754797; cv=none; b=RwxP0cIU2aQ3FV6lQGCdwrRGsJWT/U8rpe/Qr06Yri2018yEeg3QXQ4j+kIVn5fiekdb0S92Le9f1cUPTAdVgr9F9R4/us9qfTEYiuR+gZZUFyzrTBfQp4YfhTkzUee6gWcKpWwJFdSdFqI9HQia0q3dHKKRg0lp66EdbYNCt0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754797; c=relaxed/simple;
	bh=t4qbeog7E1aqUQK6n2S8QKAoBM4UxRfAdV0Upm9NGAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTngpxLo+ZO/8u1bhyzllnlS8bAqn+HXd0XW6XFls4DuUsseWWf1sLtaFesuI2slFGmyv+eYv6o1OyptFwb4kMM4ipQcElblfQ7pFOwBJOaWTBgeQS41dBrlbeKquT5XR2f3HsdbobKKemRIiOK6y08vTaUoNy6jKabxSKo1LqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muznHnCB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muznHnCB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a7d9a87bso1978355e9.2
        for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754794; x=1741359594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQNL0DTFNdponNENZJHjJr9zvCXn2Whem0hBaRtmthU=;
        b=muznHnCBoXdxzfoosIuP7UMAJ+Byu7QIBkxVwEVkqjZj56p5U5CrM5Felc+8Eleq93
         W8QGsWJlfT/8nQuKlwrwyv+c3fF43imPHz6KFZ4wVSoEK8hFLihvAblwcBUDEw527Vst
         gp+ybmtxiwfFwE6dBDE78OdbxWvfwZcLUHNXdO0f4xzttXLl6YUQuUETapiibqqXzrC5
         SMx7glK7OWfid/qP4vUCRXCEEvStcGqivN66hlWs+K3amwOXAkS2J1c0EVEYIfsDTyMk
         eDuC9f5FNNeLRwu3ehg5Yj5DN+GiSidIZ+HvvP8FQzIUwFG1wHXVblWzXzRmzbBBQzbB
         YR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754794; x=1741359594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQNL0DTFNdponNENZJHjJr9zvCXn2Whem0hBaRtmthU=;
        b=U1fSW01xwfUD95wRou3+kkI6UAmhCDsGiGEsrwYIGt+o3lOARkZF+c++HZE0Ts0q+N
         q/7fic7rX2f2diRiR8SqFAmoEFa6cZHYnAye7a6Dc9VvXy604d2rWVceEGdMSgQlpRP4
         b82T1xI/S3coKNTAj908G/6v70EpxuYHLiGYJHaV854g+rM+wGFTo9ux5ToohXh/AqH5
         QR/I3T1BsJxsLgSvUaQ/UWjoMN5OjCVxR4Hvfl8rmpiZodp+yE6Qp0qiufCVIEpSjQJw
         GEzsxEcCmZ+pW9zr2Xn9RmcDpLtMv+rrvpeBfftzQxZ4pXgUHfNpAc+uu0mHkhxsvZIc
         AuQA==
X-Forwarded-Encrypted: i=1; AJvYcCUyxGvak1PwyuimNZ4/ZxYdnLq4oh80JpcHzvH9gMnihdmtGU3osvt+jccxO75tq3JzpmSuIfvA+nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKLtkLsXEC6l72BHS94uyqwmjyrnbza1QAqSEc4nX+eaeH0nb
	FBYOk1KtEPnOWoVZ2J5YERQuKeTbUm+srlfZqKJaizRIEF2h2yQwbHkE7pHFrYs=
X-Gm-Gg: ASbGnctVtj3ZFcBdDqths3VyLd1Gz8UyhLW7CtvFWUl8SlmgcTiQTpWUBpMPGC1TNjw
	yjlGu8mYPSnLqX8yOkioVuQtWHxp8lhaf/XTZMLuZipVvJ4yreCiAq7W5+gBawMflPJXic6aBJ8
	fawcr76Iz6m/bLIULlNAhNPgXXYHmOE4+3yOmE0DGrXxQVDYxDd4RDXNq2NlDDAAEuycXnarN7M
	Vt/7O4losy8BwCmAgmPnEFwJ4+JlhIphlZMGwPxNqgzlxfnyIbMTnvfkaB6Zr3AeL4LDX9SUyIW
	tiMMK8yRHuCcerLe3v0K0RmWI/PWqtvAPlQKeQOISg==
X-Google-Smtp-Source: AGHT+IHaKyH9IMjK5CR/eYxW1u4ouesAuRuIcMLAbRK8LKw07p60eIEp1r1put/PmCa158oCnZFqrA==
X-Received: by 2002:a5d:64c4:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-390ec778bfemr1208401f8f.0.1740754794024;
        Fri, 28 Feb 2025 06:59:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Feb 2025 15:59:40 +0100
Subject: [PATCH 3/4] clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-clk-qcom-const-v1-3-611ab80d45e4@linaro.org>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t4qbeog7E1aqUQK6n2S8QKAoBM4UxRfAdV0Upm9NGAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9h0ypmhFjJZAAVRnFOxkGet0l4nMnufkzto
 m7heEkSSGmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPYQAKCRDBN2bmhouD
 1/DMEACDm8+3Ue4EgA2JR8UXp87IcqZBqVGR1/4o07ny+jSXQhFJyUAONT2lQtISto+DHScrI/l
 3WT7889gYQJLr6KqeBoSa5rb73XQ0mdPlwoeN2TORmil5v/FDq/U+Joj93+SpOueKNTZ1Jtsqt7
 iGwUrQWyw1S7aOKBgieFD0GRMKsfoWaifLedquSCuH02rWoFhShsXx2dxMqkn+P/kk0fFxSlMXd
 cafwjW+TdEnWjBPvTIn/0oh1gZ8PGRb0lEGS6lknxt/dMMZouKME5p5deEozTL73r6sRA4ynl7A
 tAKXDDkGM5Ro86bMpKUu4WpPcRYjIBFkC4/NoA8oooJtYaCusGjYrA8CVlvS4Ldu+1gZndq5naU
 yjEoKMMt97nfJ1p7g2zsNSsxs38K1QxlKdfxIexMuIa7qZOaxJj9YEw2e4tQyAXbG88yVWOQ5RT
 wVgzl98RuTHmvRXYY0Wj2+6SNx4pxWqbExMLZ9AYsl9wFbJo7yL4xb05uj013vBiSZgykDR3e79
 OZawkltbqCLamU0lYb10zlF3yj1zGUUZqk7Ngl4uR7S9vbGpt2EhrfgQMrf2y6JOiR4Iva4MOw8
 C6eo2mBGnLPaUlaVHqhfAeDZrZlgnztg20IWgN87FB3nFrilaXOFiomXRBu6mfZI5uei+Aqu5A1
 GBzX54SAjMlw/0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/gpucc-sc8280xp.c | 2 +-
 drivers/clk/qcom/gpucc-x1p42100.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 913e17f101967036bf1dde7a3282c0155ae285c7..2645612f1cac514e3e796257b4e7d54742dbdd20 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -416,7 +416,7 @@ static const struct regmap_config gpu_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
+static const struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
 	.config = &gpu_cc_sc8280xp_regmap_config,
 	.clks = gpu_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc8280xp_clocks),
diff --git a/drivers/clk/qcom/gpucc-x1p42100.c b/drivers/clk/qcom/gpucc-x1p42100.c
index dba7833396130e6f25baf078aeef466c89597976..4031d3ff560a8b18831fdb2480bc5c22d5b5d58e 100644
--- a/drivers/clk/qcom/gpucc-x1p42100.c
+++ b/drivers/clk/qcom/gpucc-x1p42100.c
@@ -523,7 +523,7 @@ static const struct regmap_config gpu_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc gpu_cc_x1p42100_desc = {
+static const struct qcom_cc_desc gpu_cc_x1p42100_desc = {
 	.config = &gpu_cc_x1p42100_regmap_config,
 	.clks = gpu_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1p42100_clocks),

-- 
2.43.0

