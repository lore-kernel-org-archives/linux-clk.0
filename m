Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315117B413
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929021; cv=none; b=ggqqqQPgRGT9oR524zyz0ggt/03j2vYcjvXaO2B/no6+nvUUo8SdNyEvYRY/GGJxK3gLI5p3A9n2ogHvQ+kCa9ILaHZKVzyqsr4lATRJPrZYr5QzYhnNL/qJ5iXjMkSkiJD0oGCnqkUkZ2pUkopDBShwfil53fcFESQYGpIQq6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929021; c=relaxed/simple;
	bh=Lh4Hlg3OXkRgrzNaBrVJx9jsphKXiP4NDsWTTIpai3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dt8MO8arWV6GZW1oQftQpMeodQhc274ky4jAQHo0+sqoHyeo0LzrzdpdenKvDE1fUUKiMXEY8Kjjx189hUPbbS5EyozQVrsacKF+Hsk/s4fhhnLbX/bGQ9BW8zmiJuYwKx5/9fEKMItXKVmvBCfLMxL1Zn9F/5laZYBlGlSP3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lh0fKGxy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lh0fKGxy"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-529682e013dso1621373e87.3
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929018; x=1717533818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POO2bYnl6aq7h8lxQS/2Flz3Bzpp7Ij0f+fr1wR/NfY=;
        b=Lh0fKGxyYfm1KyfgSqWOY7UnWK3JewPwm05jV/FzXLXe0A6GECSOSo6yLlNNDy44tk
         PCWTUaawhhPZ+qlLiSVqYMOBA76XFAsK+VjfvOmnwQlmbl4jL0II6OSOVBHIY+Pd9wrH
         J2kC5JYIl+wEE8SEa3uM2kpnAundkKG2cbzyOJXk8aoIPPfI5yfKbuLVRGMxGtN6Pcw2
         +TBr8pCcEGfgWaxgBwmqOPx6SlfpdyPcvQ7GuocKUj9WHwOPYIBTUns4AjsdfRxLymvA
         jteJBbZgfivDUMmetwMYG2d3FGE2S8zGI7OgtIeEOHaM/cNva2AcJr3sUEVLjJ/fYtCo
         zKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929018; x=1717533818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POO2bYnl6aq7h8lxQS/2Flz3Bzpp7Ij0f+fr1wR/NfY=;
        b=m6uMsRruVqrA6wlg93um53Zv9xqAXHJB3G0+6Eux7YslyMGpbc5YZcxuA/551yJjt8
         utS1f8igbR9UQNFpVpstyoxKgDH/gyFmtvGBoRwBdUXJoF2DK9Z0Lu2OAikq4U5LLgk1
         CGLPnTCvKtBJuvF632XiWwBi1zLjoQZI1mwaF4rB7hCOwnYlPkfeU4Hb91kJK4MFiqaZ
         8dQSel6ZOG6A9P/8Nke6klJFDY9u/4cKZnW+wPjvqG8I3Bw3Yf3qW47bpNmreMEPFu/A
         QvjA50MgozvdeXBQ6sVoiLmDc7Udp00dlH+TvSoftcYmgKGs7eJLNTP+uifMze5kodrg
         o+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVIK+Ln48a6jnRgN+xlssHY57pyHA6OoENhkgWv9Gln/8WhqAJM34YFSNyj7O9HNQ/TjMnPJ0wglyv6OpNDq+629kLqxw0+QWYf
X-Gm-Message-State: AOJu0YzLNzR3sBHOq9jm17ZcDiEQ2BFt5+xOcJ9ElMn2zgCyN+wg9mEq
	n6rGJEwkNZs/eCCZZzCIpKrjLOfN1fjL47RYRFtQCPBR1+G8qAyA7hm0/+PeBi4=
X-Google-Smtp-Source: AGHT+IHiMBjjkNVwN6MlJKQdJNHhTw9/NF2ZxkZ+oeU9e8d0M/voGuqJlp9nod48lHnWKrWipsu8WA==
X-Received: by 2002:ac2:5219:0:b0:523:b672:25c9 with SMTP id 2adb3069b0e04-529650a426amr8583040e87.30.1716929018166;
        Tue, 28 May 2024 13:43:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:22 +0300
Subject: [PATCH 04/10] dt-bindings: clock: qcom,gcc-ipq6018: use
 non-power-domain version of GCC schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-4-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Lh4Hlg3OXkRgrzNaBrVJx9jsphKXiP4NDsWTTIpai3k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1BtS0w3w9UdiY86gSp1CApy+0s30pPMZ14
 iKEe/dsHnGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1TLYB/wMNUqcuM95miGmJRd2Meb24y0lbdlx0Jn45Qx7Kl7ksJBXohtRLphGL/jd9/PhPZG+DPo
 VuOgeFs2LRVKDhPdt1LSO58QO1Ioq10WlDlq8n69Q1t5rLr4LwfleDdvGjcp4Ikn0x4YVq34gGz
 hvINQ1spNTg2/lndjIGVRLaL0UFyBYcn6pPZlqKRQA3QifNDlsZg6TILiMd78NuqAAJ4QXJX0gq
 O68AQR33q0j1lywgS7J1Hgt+KATogqUgCVv67dhou7VO/KUvuuGaqH8Kc7mAGk6JAwMUU7/4c+S
 iaaVsOQ9YY7DSW6o1oy+KFyLpSywyoiIhUbWKPX0WjsxJuG2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On IPQ6018 the GCC doesn't provide power domains. Switch it to use new
qcom,gcc-nopd.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
index af5d883cfdc8..4e811698d30b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq6018.yaml
@@ -20,7 +20,7 @@ description: |
     include/dt-bindings/reset/qcom,gcc-ipq6018.h
 
 allOf:
-  - $ref: qcom,gcc.yaml#
+  - $ref: qcom,gcc-nopd.yaml#
 
 properties:
   compatible:

-- 
2.39.2

