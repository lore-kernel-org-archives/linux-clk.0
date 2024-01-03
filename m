Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F21CA98
	for <linux-clk@vger.kernel.org>; Wed,  3 Jan 2024 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFm3rVEH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55559e26ccfso6459521a12.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jan 2024 05:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704289036; x=1704893836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm7vsf6UZKbMh6cnZmrwv/W/K4dUYmjWU07UgTkkSLk=;
        b=TFm3rVEH6elCQhdWkUehstSb2c9bZlUrnsJ4Ocg7W+o1QhpGL20qkAqAQV584dpwoB
         WA7RobEUGATsd3LP8cJoYk2+Gt6YvnCOO8R3NrdyJMaLcXQGw7bX7txAioKcJJ8YJGNM
         ClzlpJPSpRf/ZGae+m2dd7wxnJanOYhpAULRB8Nud/jCICV26Alkvxk8HKRr0ZfyaSHS
         39ynjfEPe/N8BMjxQ+hs0Rsy+O4G+158sjMlDSeBgvPNtmuxVH2Y4EMufmR7k2PBcodQ
         xtdNo6AvqDW2IRWpj8EAXH3RW8uo1jYGf2Za3Z+h+66P2YC6VL8puTVnKrXZP+pBKX3z
         CMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704289036; x=1704893836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tm7vsf6UZKbMh6cnZmrwv/W/K4dUYmjWU07UgTkkSLk=;
        b=jNEkggmrE6eI6pCw1hroDazAN3izaNczORoMl8q5u0R6ckiciK8CCYrngZ/hzZnFhD
         B3nR+IjzpNdmxRUhlL9O6u8tvWgJWtOwJNnCY1luHJUvSB4L+kyNBx5JCnHjQCj2WsMT
         okdFwxbORtlq+lWi1XRs8VFXrHgB7cNUkxEcyhnJF9wF1+JZuxt17ruwyAGVkxWGh/bk
         cPRXFQW3nvQZQBbl868CKp9hLO67gcKvGsce92UKHRN46+UFc19IktFh21i9hdETzmzM
         DTvu8z9ImMozQSWSwmcf5ANrGiZAWKt0eoqZ2CtmtJ5zlvvxT0bqjco+64C3YXFYkg11
         EurA==
X-Gm-Message-State: AOJu0Yy6pGKJQ7MsvE1x8bcm+kDnqicU/kMm3rG+YchZC+8SeKeR9BHK
	KSwmDj/n4gdfEa9tM38BNaJl9ikCCDgurQ==
X-Google-Smtp-Source: AGHT+IGvVYI4IeESAJWHTgmEd9qDmMC6i5QwnW7ftiUW6nuXzWeikhEhvNDPxQxxzuG4vsPRteLNPw==
X-Received: by 2002:a17:906:bc58:b0:a28:a552:92e2 with SMTP id s24-20020a170906bc5800b00a28a55292e2mr240000ejv.43.1704289036270;
        Wed, 03 Jan 2024 05:37:16 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a275637e699sm6474351ejb.166.2024.01.03.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:37:16 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 14:36:09 +0100
Subject: [PATCH v5 11/12] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v5-11-99942e6bf1ba@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v5-0-99942e6bf1ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704289018; l=758;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=L7WLthXykOxwSCjhfTNvX8JtR2g4GIz2oFPri6fp1uU=;
 b=4cv1/NHGVZ3hzhfLG3uMDFV74Ryx7DGRCmW/dgacvSjY+egEtyvdqP2T0EX9S1w/GJ+BKFrop
 ChwsYyJteiPCwLAcu1TicJmyGGi3eqV/Jjek3Tt9m8Z+pw2OvHtzuSs
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..30b140e1cec0 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -807,6 +807,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd SM6115_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0

