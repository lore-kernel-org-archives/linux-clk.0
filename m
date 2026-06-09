Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056F356A37
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014531; cv=none; b=sddSCM5IuRjp+mXEvWJW1wWw91GysKzEfm68cMdrVucfhmjjXyoyvY8+VGTywKT9hmq65noLRaimrnQlg/WuxMAvV7Nxfs9UokFIh4xgQx3lYp2XA3A7t5sOessRuDhMzjelnxAcUKU1gVjZsR8Ao8ccDfjUAjvxFo2/SIzvlUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014531; c=relaxed/simple;
	bh=AYE8/yTvZRcI5dAmg8Q5FrVlVGaGXYkprn2mgV5S9wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShHqPK4FkJ7KmvdmWjpwH9HBrJj3nSblwkhpUcOvVbu7jh08rzPjOf7/sYsw07zWemMhPKXUCM1zSqkQfxVof2jz2Vf+qJmgrKKFbaxEpr94K5o+VLt695cets0fgsyDJeH4BvTBMN//ZTXGxAWj8YL7jxBKu1hPKiyU8v29mso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHT5513B; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHT5513B"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso29442825e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014528; x=1781619328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgvmtFO9MyKbYJX4a5Py/me/oMsrPj1RpQs8PD55NQU=;
        b=OHT5513Ba1Kl8WmDDallQaLp9HH6tMSOjBbBFweVJ78T94QJLuLpJ/REXBRspTkcVZ
         NbUy6s4oPsUeCneYrM0R0ZkbYcl8nZV6MTP+6/a879eWobRhdwovmVpBHoV31BUelMJt
         wQhNjWCIsmUKsK8gAMAhu3aOVxX7uPQYiDFBGwzSX2w0G3wlQht8bZUCGPCiCmP7krXl
         8RLMJeyorQuF0a3r3DQ7p8WFr5MOxKmVEK0mgWQ+TCe32fwE86eVcca2gjCi/L3aSPr/
         0QeEp2Y7gs6cgWFhVkUGIPLvgEzJCD7I5UuTfsa4VJ5Wwn/tWfvA8OBThoRRKoZJun7V
         G/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014528; x=1781619328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgvmtFO9MyKbYJX4a5Py/me/oMsrPj1RpQs8PD55NQU=;
        b=j2Zmflc7JIFe5KnjrNXPeQfwpY7vEJuYYrEGhctbIlMoPcT01/COjFxJ/0toH/RueZ
         4mNoDbqWl3Ypg3RxdtegZG2wvXAmKnPgQLCLAMmwc5u2mDIzte4sB4sQRS8bEMDuwmJo
         s+D7ZBzPthE/PSrjPzUbkqOvLIjsW7qQJ5/Fcv7AvHG5QSg0cwaOLtVrJPcyyLeHpCm5
         fyz6gjtO51zcARPKyUCUUzhclvS7Ofj5Mq7QBcgknmLZQ3d2LtXO744RgKjcpVEfHGHg
         TI5hsQ8bb1CsQ+R8vIPlEzgfIckhbv8XsqtU0ilF7QrumBCQgpJ8hpF30may4iz6s7wj
         OeGg==
X-Forwarded-Encrypted: i=1; AFNElJ9f9te4D1m7uec8JKqrOpxln7LHCL+gMMWiPI99ldDtApP45fbMk/gh2cHkyi5LUOVjAfrL+WJwmL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvvm4H7u82gaMOHSJ5AjX3TDWlTRC213K9OjAAHpAwmhmIzHTS
	xvQx7Wf7pND3+pqv17s+RBW9Au9TnYpNIH3h8Z4GNoEU8Jo/GeJLDX/tRD8kmi/e3k8=
X-Gm-Gg: Acq92OHGMCcqpGw5J6hkD0Bd/6zIg+1aPkJLPyjICAUvSbU+6GpOnIiYbOJafCEJJo5
	3B9VcnG3ptpkJ0O+vMZgcHNM9uHPvyeRar/+B0Aa6FJlnerX1sfaUtl+9MrVl8qItYU1TTJHjEa
	krSe0T4VNwrE9Il/3qtKn9iKhvZdeuPeS1h1KV9apjm03wPmYZotllMhPLJ9qh3NdA5o+ftNrwK
	zhWK6cHEeZ5/AMdmmM455UK0xIp/5FUdI/827283brbBfB4eeBA1dxggL+skQBRlG9I5mkDdWFf
	Mu/Iy3/80NK7KYZuBypNBSJ+6Hr69TdUmfZkkzr+5cVkyPSPA4e5PXzC+7olP1vzhAqQGIVcFbq
	iENCUHiYq2os7HL3xYWXQiPbbZ4mRMTfs/RQSZUhMHNEEcHeDBuPoHrTmkC8W1XWIc5kJKR1gPh
	ddA4s4bgEJ9V9UFmEWbbSGq8//aSRDDzvF33W9apUn25VAZwnbjzgttkL8zw==
X-Received: by 2002:a05:600c:6388:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490c2d1412emr262186125e9.14.1781014527983;
        Tue, 09 Jun 2026 07:15:27 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:27 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:47 +0200
Subject: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
well use the correct memory addresses in the example. This does not
affect the validation itself, but will reduce confusion for readers.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index ef4b274b5c09..1b0efb1526a6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -45,9 +45,9 @@ unevaluatedProperties: false
 
 examples:
   - |
-    clock-controller@900000 {
+    clock-controller@1800000 {
       compatible = "qcom,gcc-mdm9607";
-      reg = <0x900000 0x4000>;
+      reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

