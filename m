Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC35C139
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 00:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3xvS13M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5553cc31f1cso5098683a12.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Dec 2023 16:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894721; x=1704499521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RD+KG1VrKD5oGt/gDgU1ORt0oWHI+QJ6WNkaDvndULs=;
        b=i3xvS13Mba1mb1gSmcPxToDQ5WuboLjC/GlW9u8GcT80qGtzT8Ey7mUUkokRyOm7s1
         JsGCp7CHIcPJkWoU+kyDe6/9d6hmvj0t3kvkk+UiGC5IZUqYry1MOZvspsEzAT78RPbp
         eFWfTOsciBV9w4IczfKKoputMkJgzXI0mRzXz2FMgPp8yYdhAZVv6d+QSQW7pk1izGDa
         eTjx76AC9pDW8VHPog8h9GJVJxzagh6q3Gjnz9zd9qj5DbadCtxwp9oBAmkTAIDO9ymI
         aGB/KWOqSoqnsitJLuM/dhZTG0erdrPI+i7f/Mfd5QVVLRTj79K/DNzwiC6Jx7JGmXyX
         0KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894721; x=1704499521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD+KG1VrKD5oGt/gDgU1ORt0oWHI+QJ6WNkaDvndULs=;
        b=hSb63HuCsChrZWR9ead6Q8fqwpFe/1ZbIAchoOGq/EVeLXLG2jF/tUFX2XyO2kirFw
         7GrHOQ0szwdPbL/zjgEY0m6kjTazltbu4vXthUDFDx21LrdncaE9o91kCoMTy8nFbugZ
         JxUTF/AKA4PksMNzLltMtXzZXs+9w/UQvrjNtBnMUq+1jSAmWCWpTY78UceWkRl4yJrY
         0Iu5RQmi5CMn8I2jIw+2BbzN8BkkR5HdVeJ61K+kQIqxDD6GXykGQHDeagNpO69dTWRf
         leMzdpjo2HkOEf26E/JtGLzhlsS0Y9pe/njH93pU/j30y25GGW1MLtxql+NWJNXCG4ua
         Wz6A==
X-Gm-Message-State: AOJu0YyOernJZT/XfCdj5hUebTHbU3szXRhUASlyYWtozeSmp+goxv/R
	18Q8qV2CQhClE+qveiNr/Q9OVCBOWutImw==
X-Google-Smtp-Source: AGHT+IH2rjH7GbOvjD1sAUGCNW5dwQtU6peYxB7yj3ljeQbhlJ+7+ctpX8nJyowUxyOI/O/CfQWQmA==
X-Received: by 2002:a17:906:6b8c:b0:a26:6d82:3261 with SMTP id l12-20020a1709066b8c00b00a266d823261mr10723651ejr.38.1703894721211;
        Fri, 29 Dec 2023 16:05:21 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:20 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:11 +0100
Subject: [PATCH 10/10] arm64: dts: qcom: sc8180x: Add RPMh sleep stats
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-10-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=805;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pAneHkQpjzXuVLq/czDVQq++TfgaWtAoMvT9u9bC34o=;
 b=BLapVO/wBAb72mb4TAzWGdgt3gUR5FsyzO3z83hEF+/iTNbmy9lF3956wIjEV04CmiTWfIRS8
 B46vZ+9h1NxCRAcCbgbAuzVvzDd9UrZYgEv1qzVwu8RVE+hjC3SU44L
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the sleep stats node to enable peeking at the power collapse reports
coming from the AOSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index c0dd44f14674..013723be4bb7 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3270,6 +3270,11 @@ aoss_qmp: power-controller@c300000 {
 			#power-domain-cells = <1>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,

-- 
2.43.0

