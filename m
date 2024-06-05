Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0DC49644
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575016; cv=none; b=AmPcuh/3S0UJZKPHPlgyC8l8DZ+xXiZD8337tza5/uRTUwM5xIqp4CEsCP7lQTxPyX3EY6v/N4Ienib6gBheItYBnZcYfOw4jAEHSMh86EqkGHwf0TJAafhf887ywfHW2RSNV5h6exFIfgwwhppRZdOMD5nT27CT1aaF+6djchM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575016; c=relaxed/simple;
	bh=yP8M04wrYIyG1Yj7d+611FEUHWAcRbT1DbI8zfDWipY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1TRQqjQjA4Hj0ngUGjHZan+xew8nf11TBVEft43wUBKPfdAWpOwpG54ZrSqY/DjInxJa0lwAHOnrIMmzVvGuZtqfFOClZUDL1HFTe3gjNwp/wOkwIMxttdgReBtrtshfv9IEwcvtTIM5r1epjucfEf1xmRIFpkDwmoATYe5aP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uj+wI5rj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj+wI5rj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4213485697fso39161755e9.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575013; x=1718179813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQp03l3+yXbdf3aPVIbOT/Kg4NL7/SxcDu/zA8lsjOU=;
        b=Uj+wI5rjhQfWCMxXsHzjHdxjAkhaArbsOb9VHsylwxHwFFc9lhxYrLIDprgL1TCUxM
         HM9pq1g2BIlfiQ8eS0JFcBqDvpiOGbLyHaOi4WHhEMH/o5LieeNPW5I9P1+nVTdVpUC2
         DmAJkpFcMlIiZV4K/sV1C0QE1nrqOjGjCqlGz8kb+BjrS7o2NxAygzQtK7VzsRthXVUh
         VqOxWIUDk03bJsFOBkeFUQUSZpS3hQreFDWAAsaBDfVQC4hyyC5OtZZduvstiq0ysh4F
         lPoNdEG8QOY6fHd6BEpqAcG/5EQPBVN6R6UjaFnEWHVG92/Il5kOM7K8wsA44Zlj9Yjr
         H7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575013; x=1718179813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQp03l3+yXbdf3aPVIbOT/Kg4NL7/SxcDu/zA8lsjOU=;
        b=mIwgMBj6I4ORv/1raiPn+cQtls6u7NQ8Bz+j7Ia7kTbdf7x8luHCWbtl7HKh+0h+mq
         f8fdGk9amUOKOUpKTZKJ+0yScRXxWlO6tiVv+Gs7dCf46UwQ0zjMDxcNFGqEP1FsgcDM
         Eh7V6eB3cqApn67dhuSN990ZjYNMnacsnTY1mAMh2YkKqQf1hu9fZMwajgfE3OgiBJeS
         dlhexouPCBfj8ot4hSCftJRKKHMW9WRARutLmJi+BTt3fTGQIuWiSCTRcEFr11MtTj2V
         2FnS9raw+aX0UIaYLr1DYfvyaaYC1omDk+kQTgDd/XjsdgEZa9aSKCl393Kv1I9euSDf
         LonQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6x7BT+b8hCp3ocv7UYqfA6APNxRQOR1+CWEOle3xOwJNUm8ahuy+osLXGb8tfNYNFW8WySoaoxHTWK1JyR0xpmiSV//MMgIhL
X-Gm-Message-State: AOJu0YwUReLz4H4P+eHZsQjW5pTbX/68nFtMVrSC113ZzYzamaE7YXRV
	gnWDloQW09eGnXGvOHvA4NsqmgOfRqUiYbO3wIAIf59jNXB9pbkS0Bu56PxTdno=
X-Google-Smtp-Source: AGHT+IExc9V+yIR6faUt8kFvInX/OnxLjU5xv4VJ/NzhXwJN3IF+wvDAxyyvJo0rOjAqMWhG8OxsWw==
X-Received: by 2002:a05:600c:4fd3:b0:41f:e7ac:cc72 with SMTP id 5b1f17b1804b1-4215635c139mr12784035e9.40.1717575012788;
        Wed, 05 Jun 2024 01:10:12 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:35 +0200
Subject: [PATCH v2 08/16] dt-bindings: clock: qcom,msm8998-gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-8-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yP8M04wrYIyG1Yj7d+611FEUHWAcRbT1DbI8zfDWipY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1PPRcMzQo0Zhi7k0Li6x173aEYfxe6r7qn4
 aJmw2249VSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdTwAKCRDBN2bmhouD
 10j9D/wOS78WgVCRxu5yeb03BsGKI4v6nUL74N4VBZKYVK4n0XQgowNy/UuhIR4Bn7oWJsh1lx+
 ArPJvNcIYdURQShQIQ4++n1Je29k7WYR5HvsIAEsyMy0EDp/D35/5ZxpRU0eDHTIcWR5pROtTvz
 HqTI024Zwa5OTG0UbGiRz4YbV/kgoNHBimPgitNvN6LUwLhJK8zTRc/wWgnXKzWezGRA/peJfDM
 5E03xxzCQmrt85U67VTyuTDC0XXtQL2lQSmEZc3rvRARfhYr9SRn4G5xbhp9655HoUchMaB4Mth
 fcDTR/gPvrFGSJvv9IaZ4wZAQVBmVnzj7h/Cma/3KcYezki+qRzgloYl+aZno4xs31mrg+AWkNM
 YsA709M0j2QO4dM+hDA8INacqPHUANU0ymf4luuGF4F1CKR/eOFsWmuBxBRxT6JhpYrfX93VgcW
 lFYJCalMXzYLW1TOkGoeXzzHwrDmIjbTt/tIbilPUBH5ZDSyeHrqvRZlFAd5oSvW88/i3eOF+uT
 w7ZXgb+m5mwe8ne7qBV13wMexF/I9s55WIlcHKQ0gKYgmOFn/TcA8RvWeQmmUVdqQgRJJmWIokB
 LPPdyV5iC6rMmml6DoF210bYRRhx5dXg1GBq/Pnu5WRY1B6oyi6r7AvcB3WL+Y6tiMFl3OYOpKV
 WurSsJO2ZEmP/2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
index 7b271ae210a3..b9b218ef9b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
@@ -29,28 +29,16 @@ properties:
       - const: xo
       - const: gpll0
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

