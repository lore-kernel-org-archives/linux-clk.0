Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC53932E4
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350186; cv=none; b=XpIxPeWJFubeHj3KUmYQNVEugqbyEBM7bZDDJACB/AuUNE1ykMu/JnsqExDGyuVxPW/aVw5zQvr8CDcFOp1E0/2nl148LOfPsixAwbjDcaHrIfpw6VvmpR2iZAIqZIegTKL1yGyZppaVfFZnOeO0ba/tIW8NEGPJmlFQQi8bDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350186; c=relaxed/simple;
	bh=I99MGLT4D47BThz6SZfrpPwMy7BbAelylwfqI+dkqnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4RgFw+IpMDwzGvT6ml3jGj8AW1f4mQjz9pohrMylYnY4gzHM+Tf1UiZfEdNJbYrJey3MHyOalVHRiiKp5IZUHaPumJB5XYuD09MkIBXcNFlaQ1DN7v0RDJ/62xVMZBu0tn9aIibB8gHqMd0Ujt+mYQe5o7bbH2eA0a3snJVM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lv5C1wzm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lv5C1wzm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b77b150aso29598905e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350182; x=1783954982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyrVFx05JE+my29Owh+QhOGqArzBrtII5yeMh1a+E+o=;
        b=Lv5C1wzmDWkdpV2A6yKDsPu84EQDMWeB2YMg+7q4/TDEDFjmHhtzUuGtkXsRUVGbJ1
         4ODA/MFxJYwfaL/dhS5yK/AxgFC5o22f+JTQ2qL9oQVPdNkSqBqrmTrGBBGCogEfBPlt
         X0dcEn3ppKIQHAvTMxxVBudNVDfp4s8IYjJcZ9slhSUYX67VcNTvDVMYUG3B//kkjyWv
         cGL37liS5eUD17pnX8IF8gAqKfn3AUeQ3jvdfbr7oUMATDg+y62iPDNJRoXVd0Gxp5lT
         9YkxRPpB4mRiS/zagxP/yP25slHKfU6+TIkxk8CT+Yo6mP/dL+/heguuKkApNV3mmR9f
         14JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350182; x=1783954982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyrVFx05JE+my29Owh+QhOGqArzBrtII5yeMh1a+E+o=;
        b=dV36khrezuCQaHFTQdGTWg35sWRAebnx+0iZthdCw1x4mE1RZzbkNPrpcvjluVBN2h
         TpE53assgjxrDJW5yRoKpmudbuvQVBEr2vjkw9rNJ6whAtW4Ky4PWXhAz/Z4i92Q+GTT
         yBiCWl5WhDnuQgD7qMHhdeK5Rn643fdoFxZBWmW5GKyActqt5kZiS8iSlXLLTY1b7jLK
         6VoOqYlEv0crMjMJ8jaPBuVBIZO1BkJwheWPKo1URezGnwawTCbdw5JlCkA4Li1hzZTg
         3QC8bcFI/0AZLcjcQBGcvb6HzZjeNoK2c4xFDuChndk9dvGOMbriXLh3nyN8mrQfzVSH
         5pFA==
X-Forwarded-Encrypted: i=1; AHgh+RobfIle8kPwkp4XVTDSztTH0zq2s73gXEdGsUggjZwLGC3Jq4yZMH43tBEEY2BlsAddc3WIL7S5Eic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IV6UkJ87ethDRLWLRSyHfuGbi4rmBYmQBqWJHxSXEMC/mQxV
	EjNrpOyiCte5okvzlVJS3/zu3PqZpDjy9bVfzAZ9PE4hqjYEaCPQ2Mw7TEA4Tcf3sZw=
X-Gm-Gg: AfdE7cnKnzI4mtfiWmLmowCQjKqkEcWKBS4/oJkLh/doFDUzUzULSuK0dmWWU32mppb
	9L9Zl2TRhfFhE24D8pEFWZMok7ptjJtDCYkeaLA8yIGgq/LWo5Gck2PXCzI89Z2sAB/3imCKYDO
	qUbbuSldWoZ20rCjaTtjSrEXwhRC9mahEW7o/VMv4iYwvcRvaTU6iE/BMxfXRn54r/7dJX18KCK
	rJsM1QAe05zheITD01CyFytV/DGPWHUdpHDHa4bXfOphKmy6DQcoH5F0bfEnEs9Va/1jL6uslmQ
	ZDFl4UDnoJuR86Sh9XjtbXmdKJLVsY6yT1OK7Nsrtxjh+Rdl/eIBrQn/9FAI0EixAbbBUlXKbYr
	+LFAU5QRoPGuyYXVAdpp8LU6vPlbqdcgu9jlklYEE+U6NjboJ0xRC007huLkFUNvduZGlK0aobA
	5flWuHqHr4WXC+lUeA4y0YehOEWQ==
X-Received: by 2002:a05:600c:4747:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493df0559c1mr11645015e9.2.1783350182313;
        Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:17 +0200
Subject: [PATCH v2 10/12] dt-bindings: clock: qcom: gcc-mdm9607: Add
 missing "clocks" property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-10-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
"sleep_clk" clock source in the device tree. For some reason, this was
never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
dedicated schema, so we can just add it to the properties without any
additional conditionals.

Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index d7da30b0e7ee..ef4b274b5c09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -25,8 +25,20 @@ properties:
     enum:
       - qcom,gcc-mdm9607
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
 required:
   - compatible
+  - clocks
+  - clock-names
   - '#power-domain-cells'
 
 unevaluatedProperties: false
@@ -39,5 +51,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep_clk";
     };
 ...

-- 
2.54.0

