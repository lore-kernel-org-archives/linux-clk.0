Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05B79E3
	for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C805GElg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-559058418faso297386a12.3
        for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705157477; x=1705762277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUTCpmfzsSKDHjYlRAYYiQ/aykX/VSlVLVDx9q/aHss=;
        b=C805GElgMCsq5N3rhzJBZMwTtpcv6KXklRX5HZzb1Gg7jhb9JdQx4DWT+/VsJ3Szmk
         cGCUjQY3fQw71LlrIPFA9vSTKYAYcq8KmWq7Q4xzKZ1MGgqMwHJaGD6jFQpIiajEsViG
         biee6/8uvuKWmnsa9viWzrtoDkRjOa52IR4bWlpC/F7nthFpZQzyx/8pLHdswSTNlObn
         HG4fH0fiiDuo9P/BgX2lWlRK6GHAB8L6W40MTybBTwqj3lqz9QON38Arhpx/3CbmVgE/
         f4+TICpR6LbDenbiuLS/QqlJLC9TB3gi7si4UqoQ3wAClCD6y9Ii7h7nIx4Z8B1U/Wx4
         2ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705157477; x=1705762277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUTCpmfzsSKDHjYlRAYYiQ/aykX/VSlVLVDx9q/aHss=;
        b=Q4mPeQVv7M9kLawpSDfwkUqmWBv5LSSNbeeGzcFR7P/WubAHWebykYI4ZYIdk1jQpn
         EkEUanLwRyXaKWZK2+O5lbmPWl9igjm1x6vBTByqskOpXo5GU3ipCm7IEdmsK/9jQycJ
         VMU9XQb5a1sdXlBtKNNy4lDUyY5Jy9blMxWnG27qEa0jdtOnEFPRr1MAj6Z701NWKmJt
         4yJglx2G4ir3lT0eZDIfgvWjcOrvXkOgTURFpFeg7i5LqWcFAtG0SCKv5uKybSuCs3Hm
         O0MkzMpX9Kda4hUIK+sLSfkctcqMVX8j30uahZGYkbRWsXXfndkZtTkG5ektLA81jgqK
         cR9g==
X-Gm-Message-State: AOJu0Yx8n/vQqwdLMfbpdBwb8TcbYZVmVn6Vog9tSfmdyz2trvXQZfOo
	1k5mdR+Wvs4YdjtdL+iL4NO53oecVmCk3A==
X-Google-Smtp-Source: AGHT+IETAequHzfAwgHF8QsK/gBIn4BSDyAY0yftCXAhJQJM0qG8OILiUEsNbSoyObZt6WLoT++NLA==
X-Received: by 2002:aa7:c602:0:b0:558:2cf:b7f3 with SMTP id h2-20020aa7c602000000b0055802cfb7f3mr1362760edq.70.1705157476826;
        Sat, 13 Jan 2024 06:51:16 -0800 (PST)
Received: from [10.167.154.1] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id es18-20020a056402381200b00554b1d1a934sm3014593edb.27.2024.01.13.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 06:51:16 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 13 Jan 2024 15:51:01 +0100
Subject: [PATCH v6 12/12] arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v6-12-46d136a4e8d0@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705157455; l=911;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WDI26IliceRlW0YgN7X8GrPWGyVd7988pOYar0kAAss=;
 b=QkTIudk9bwX/+NypRGqOTPXGV2soTD0F/pgSW+rfGeoOYUJvfu6xMrq9N9B54gSGyfZfAOYfu
 PMG412v8x9ODGvD+GYIFf8ufxxA4ySNYDB/TNcmJ62+5QHMNcTVJIr+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GPU_CC block is powered by VDD_CX. Link the power domain and
provide a reasonable minimum vote (lowest available on the platform)
to ensure the registers within are accessible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 30b140e1cec0..ec9a74acc69c 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1723,6 +1723,8 @@ gpucc: clock-controller@5990000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
 				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd SM6115_VDDCX>;
+			required-opps = <&rpmpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0

