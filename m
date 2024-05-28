Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FD17966F
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 20:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929019; cv=none; b=ElYRCq4KqYqK1l2yCdhZju06IWbIrz57BDGwFIFXMhypP3so/yXn+27i5U9eqEeGCgGxpbhs5vqBWp2sKX2D9w1x0uT8vq4z1nDIKCtQBrYpkbOLBhv7bsHCUHkaxXt7cJA6kG4RmovnoRkiJw8mdQ3oVQFqeprdWWEwjPu5DXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929019; c=relaxed/simple;
	bh=fpN/sB1kdV03hmunL8ZhnuGTpWrKPaZSw7oap98ctMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmKDC00PExkSEdyBB/1Vrnr+8+yO8Eom6w0odctpb2GZRxnGpsoYXXKI/gTievOzU60tXcWr1hNm2xSMTUp4+LAvXw2aT+k9XqD/Ru9DDA8NIs/PH/qUw9UkmytXF7aAz427cMBmHmFcVSifqPq29L1k927jwooRUcxsuUa7tK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZlAzq1R; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZlAzq1R"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-529b79609cbso2124503e87.3
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929016; x=1717533816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vW2j7fTo5NMoWHmkFtlyEs04u2QSV5yhTmOY/QdIkQ=;
        b=zZlAzq1RrtFtdfBhaKVyRsX5t7ub7CU/DZy0Ai9VYOd3BFo9JyGAImskvA6Q9uZUoV
         8XrX5C5nOT7yId+sHGMwtmNjYPWI3NsT7k6G7469beKzYbjcFI+mMdiaZMCRKG+IZyjn
         i8AUS+gNNJmrpqr+YbpGdUPy4HnG83H15bILiTQ2KOhV9a5lMyU/N/oDDj6SNiBnGrwR
         DER61gRMfGfgNju2bJIEfesQsH5zPWkY/kwm5tp8Jqtcq6dlPgXalWyK23FsTNMUbclG
         3nhEWGW4Qh5uuz95Vwg9XTB1mXDu45QxETr/akY9/c5LgUuUPaSFgZ8/kp6LtAsP+7TT
         DOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929016; x=1717533816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vW2j7fTo5NMoWHmkFtlyEs04u2QSV5yhTmOY/QdIkQ=;
        b=SzcuxTVDFFnhoShWWQB2FEk0m3xLSbW8yymb/slw9YhFoZh8zURx8HJ+ER0mLyQyCk
         SFc1EUNCdzSABTA8xu2PPAHxiZznfC/B2PGoFjQqcTXM/e7vQ9FwJTrQMa8Fwo5wor2G
         SavCWEaSh3+SZbp5CMlvfgGSGySqpvFTavTjHYTGy7CwLo+tmb+o+sPtHDUvhX9IGSDu
         8OosHHriYJw7BE47qvyRGkCGXDQwrEpJdPO4D1JyV/IrEEV5nS1toiowWqpUlAwwYJVs
         FNkOzDwzkt0UBXRHfEfNQ6yj2UPJ44TIJJpj8BrVWlLfUXxU5EkmxmOrOL8nk/2UY/fc
         lxJw==
X-Forwarded-Encrypted: i=1; AJvYcCWovtBptT2Bedp/NDOgjEtbNMOzlN5g7qOzc/a5muzPuOq6fyQciXKaN0q6xJosMaQ1seRNE/luJ8TdLSqzv8Wh5IvomK0n06xP
X-Gm-Message-State: AOJu0Yzpef7YFZFbpGbjMS8O0bvMebApIsPhFclbpuoRv0WJuU9B4LFN
	o+brxRsvR/8NkJKfwuURwmEbYGe4VtUgw8HCfxCW71GBpTzqdBd00kov3SvE7tM=
X-Google-Smtp-Source: AGHT+IEL9AzhuGLTfai+hLmqWw4PGEnzD7fFTLqG8UeScBRya/bMsCh5jGa49XTlXcK8v939pBG9Ug==
X-Received: by 2002:a05:6512:220d:b0:523:481e:9f32 with SMTP id 2adb3069b0e04-529671810bfmr11045978e87.69.1716929016384;
        Tue, 28 May 2024 13:43:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:20 +0300
Subject: [PATCH 02/10] dt-bindings: clock: qcom,gcc-apq8064: use
 non-power-domain version of GCC schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-2-03cf1b102a4f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fpN/sB1kdV03hmunL8ZhnuGTpWrKPaZSw7oap98ctMo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH072OkVIH9zjHnmZOmF9rbfrcdmv631L5wl
 +26JPp2YXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9AAKCRCLPIo+Aiko
 1X/lCACf9sXQw8yS4XTvsPSnT3oHm7RsIA47ciM+Q8S2LTZL1WSXHWTYFJD2svfm/l66j49mwkW
 1iS9OMRGoYh4MbcpyNv5f8ymdn2Sw3A+fpfnGILqH+9LvewsIX9iQSPSTKOvMI7NjZIhgGS6XHC
 lpK7Fft+SaMZV7VYPPtQFwRSkVprmMHaCKwFiIQYaIoy/4qlVmFH7EK6DERNl4KOU9oH8Ov8/tA
 zUdJiBjXmJN7bYSlROtvyaak54e4FPVK4KMPLlLYd/49Ecs3ptbz9QtArihigS4q3fEokWUzWPH
 7JoBoAEusLWeVztRKbMjFKxKo5V/zNm9VWv/FLEJBJirAafu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On APQ8064 and MSM8960 the GCC doesn't provide power domains. Switch it
to use new qcom,gcc-nopd.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 19211176ee0b..f06720fcb531 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -19,7 +19,7 @@ description: |
     include/dt-bindings/reset/qcom,gcc-msm8960.h
 
 allOf:
-  - $ref: qcom,gcc.yaml#
+  - $ref: qcom,gcc-nopd.yaml#
 
 properties:
   compatible:

-- 
2.39.2

