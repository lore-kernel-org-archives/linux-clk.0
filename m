Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A017B431
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929022; cv=none; b=FsquzbaYj96BdMIix5OnMKiUQXsxR6p733+Bb5CBNiCnjfFHtvEsVfdcGF1QduOHfm55aqBhPR1hf7NnjqDXJgjE1YLRfkdRzheVPIK3LufeLmKk5hleRiJvimn1YgxBTaJ54G+6gEdctdX3zX/iuC7TlXyGz82Q5lCvvWpYXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929022; c=relaxed/simple;
	bh=lRpLU4+n+2LPk/ccH5bPtiArjYLyhzunyjvm2wkPD+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lauw9KFqiFq3hyw8fANZil1f6gvx5Obnifc1EpowX4Ch2q7SEA6VZvf+2wHN2Ppdr15ntCG+SlnWVurMgA6p1C7kIqm0SlqqI6IpKIGh6+WqOdlGz+vQEC39cc1UlFeszM1lzckqS/bUxQzCM4DVxYxpFKTQ3wJ5eWyAW3ClOyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQmJnPYB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQmJnPYB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52a54d664e3so141556e87.0
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929019; x=1717533819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WcDNJo8QuorG4DoTByzRTK1XRQEYsY7LkR0kcQObUY=;
        b=wQmJnPYBiKenjphgjOaxBtVeKvdu2ses90EQgEAYg+8K48YtGq4dvrwzBmWVp28DPE
         +1FD3XAI1TqBvvFtu8F9uOxBjUnE+dxpXv1Htoy9KOkHYHe/oVgIeTaN5VtLzuvH4VVy
         IBwZ+JPrwFY7XssUwvN1IC101ps6V8tU7xI516YWATAZQxNXtKGnvKfFIvvGzv6Doi9O
         sbYAUk4vt+B/RlcxpoRQm/7NqQfqAy0eXVpFIGj0W8F3IxC4B4Frn1Xqu9WtDoukih6m
         HL8z9er8W9sO0iIfmtOguFjleLenEkqhiZVYgTjyI9lRLGRSkIF8L5yUW3ZEphSj3BD8
         eQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929019; x=1717533819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WcDNJo8QuorG4DoTByzRTK1XRQEYsY7LkR0kcQObUY=;
        b=KVzwgoa4Il13GFM8i4eo0OPYL+W+gfdHrdomLiS62qp5dP0+tTLMG5SSqQhZHcrXHB
         4G/vdhJL33aOgJnZ+CLtqftO+JGGw5eppvzWiNHlUEPVN6wID+tmQxWmBf0Cg4uVSI2s
         wd9rjS7pOEtSD5OFu/mrhRAwRBhd1r/x7S6c6NtY+i0pFCAP3KDagltrq4RwFvlTickW
         V420mFH79Hw7CtryvI88xndAxRK7NILZz88xrS1g+TeY421AvPrK5LKgZ/SC3KYxyOym
         2CYevZVdFWFCKjrFeJ41daa4tXaF9+yYpFcWx/cyjvAi1JZNdi7duY4L439k3PivAMAT
         JdZg==
X-Forwarded-Encrypted: i=1; AJvYcCWCZHRX+1PicWoYOMauyUqfnt9ZMXLWCfwzqq7lDvGvlkLw8GK6w+liNPG4elxj58VpDWYtT3eAbIqG8RbsWm4I5WzHwhr/6RXh
X-Gm-Message-State: AOJu0Yy/ol0E3nlKZaf05SrUp8zX2g4R5aomgzIzuHgq6AomPYOIjfh0
	R0UcBK4xpexUibQmwxzrOf99UcOEf91MGF1JfBWo8u8O7lWgw1CPstzAoHmMJVQ=
X-Google-Smtp-Source: AGHT+IE6TOYRfPyp56T2x/YFpRdUUS2FUm0G5zXSaM5Vo6P3jCeoLbnt2IK1SzCCeiOuN26Vxsxy6A==
X-Received: by 2002:a19:9115:0:b0:529:5f9a:c543 with SMTP id 2adb3069b0e04-529666d5f40mr7774874e87.42.1716929019204;
        Tue, 28 May 2024 13:43:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:23 +0300
Subject: [PATCH 05/10] dt-bindings: clock: qcom,gcc-nopd.yaml: force node
 name
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-5-03cf1b102a4f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lRpLU4+n+2LPk/ccH5bPtiArjYLyhzunyjvm2wkPD+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1z80cEJ+UZPNWqNWl9M97zzHG4+bkLeIyo
 TpUETu+qveJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1Xq3B/93AKIiN/qZRW8mCOdHldfd0aw9sGmlYmLZcsnFSqjzouQTQhrnW8OK105nc6VfcFHMSSD
 zjzip8DBOqL2rlppfkT53uAZz3WPBdCxtHH3o/tD+1r2hiZO6YNQPYk8zrE5pBKdwHpSXpBsiJJ
 X1UcGtOIAEfSskfrKLlXJodA3U85FNZkqu/2pLP6EH5mRUfncdwLwYH97GJ5NVmdSETlhqiAKNp
 5UC6U0O9tVODWJpzlrOf+ff7sQNm9NR0HAi+a3Tn1LqO/GL6S/6ocwzqkVgNVLL3Y32RP7npNTP
 ZXyOQB1DxOYS7wbSRzsjWcq4QTqyQEFwpGVkcLV7WBt9eWY3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Force GCC device nodes to have the name 'clock-controller'. Several
platforms used 'gcc' here.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-nopd.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-nopd.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-nopd.yaml
index a941e75a930a..fa9a3d3a3c67 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-nopd.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-nopd.yaml
@@ -14,7 +14,12 @@ description: |
   Common bindings for Qualcomm global clock control module providing the
   clocks and resets.
 
+select: false
+
 properties:
+  $nodename:
+    pattern: "^clock-controller@[0-9a-f]+$"
+
   '#clock-cells':
     const: 1
 

-- 
2.39.2

