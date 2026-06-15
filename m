Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16370413608
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542635; cv=none; b=Din/FG1jQVmc6mIvO8SmrTzVllt244+uJhtRg4Y8IIOzfPvKvSZa41nHNUiYG1l/mSbKZbOQIlUCrZ/7p4gO8MTINyCKgN+Iw7awRiQipDFa6HeDx/PnNShKDY3oEp0m/W+NOzGZ4K3vjrvcalA4n6w2YiqHaVFIC/wmzHpMUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542635; c=relaxed/simple;
	bh=ZhQJ+ATOf2/e3697dcikBIUxSOgBzQ+mxpxycGxbD4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y44t5/yze9Ko1n2qjdQiGgOf+nD0mM7IWotd/jiYmUKD2Zp9Qk9kcNeycOkdhOiKDrRtnjGq7lT2E0DuUbXTYeTwx8ijnNGZhdpT2HsYJCT+mQ3TVbVVlvZx3RCEVu9U96Ywm3ybFoawkGyLwOOGJWHgOvKoaIlkKzDkhT/E9yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXXmx/7B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXXmx/7B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso2467044f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542632; x=1782147432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I8rLZGGWdJ6oX3kTRdXuUSAnTgsDf8zvHp2gM2ybK4=;
        b=qXXmx/7B3KWpmCyqdpie4GnYxBdUHx8+i/2cLW0QqTobanzWYw/AaOp0vqwtiwrQNg
         eA/mJ4HQLxPRRiH/S5ZtO4cnufs4Qy/vsWEYb5iTBhmmHxk5JfG/moK0iCIi8ngL3zHA
         wUx/aWJ0BtrLBQ6QB8DVrtZY15xal9LlZE90O1FE55KRQt6kXTAd/f40iftCmCFJQY08
         qTq2zzEh6qusJ4yxz4wtm3vJGQCqqyxyhB2FOFS0j3LJPF4bovzHohwgNg/2m0iV/qU4
         h36c693KBSr3/JuGqFPSnxSqh13de944plQkapsuo08RV5PJ5RyU+o1ReFG6z3OXR3iw
         PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542632; x=1782147432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0I8rLZGGWdJ6oX3kTRdXuUSAnTgsDf8zvHp2gM2ybK4=;
        b=pc7F8vtGUVcKWKg7TEwJc3fR+xq8jdY6KSGjZdQYjJvvkZ6LNMXVQ5/TvuNptfMocF
         LG+h2ODVY3B5FTHs0TWugfCJzriJvQiUQd45rp9Z95TR0bOl7wo8fKMgTV712rjKd4KB
         ZqSEMcAFJY9NR2944NWO1zk5rv56AgZK0nkRJG9oTBCfJtEK+xy+9CV8itmhIbboNYK0
         qpj5lOkGkbyjegE4OvspRGM3qVenMDUZgogq//Wzxvx7XlLbQbjUA0EwSW8Siwb2Sht2
         705e6H6apmyGsM7o9roax1b38oo0eDjbv7arxHewShaZSDz9KDDjK/tyHMHTycBTKK5p
         xXEA==
X-Forwarded-Encrypted: i=1; AFNElJ/+clWbU/ttICzFgKA57yZveA9SeN93ib9+/MY4siDrMRj3Rbq8o34TGG0dSQ/tv8E2MIAnrenaMY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyajyYmOxzUVZGPpkoDWORKxV2fODPGFm4nF58lqfo1oHeXlWFk
	d0mBB2uAbPJ5lSt0t0AA2ZM+xDYz+iX7nb+1bwrGkHx7toPCb7fvLURw4HAoxI3Dz8Y=
X-Gm-Gg: Acq92OFJppug1oq3pn0SNm30OZVt8CgzW+rLVMKnuuavIH2d21Pv/q2JY7QHmOKq5rn
	d5E+igN3M56S58UWCnetcUbVw9LaA0aZxQQyh69o1F+qAb3oJ4PMNH0CHmcYUr8E8Kxgq8P1RcE
	LG6ueBcFSmG+qJF7Qvu/DhEh4pX56ZTrdVBmstCnM5thIcu/fvElRh+SJs9Wkre+jrfGmxMtRSu
	VNxAsEKdL+z437YM9G2bDEUOHcqvnejDy0A9q/xuZy4meb3CkQnenCqMY4PhmQtPrAPCe9W6sTj
	Ej3wt8SJyuAbkUmrbwrNpi52kpHu2Lyhb168yRhUFNomVXgiupypjpA/xPU5ot8scsV0yzXjG2E
	yfMDl0xHnrU7FDVwbpVe4YiNLD8jf8J4bC3h99VLBj6iEi9ULM9HYeFJktpyf20yJlrBO9sh3VZ
	Jf4HH2KvSC2vbp/Qbx8qFyuVCoIN+lKTuLeUE63jCBquPEaK/zVpwS4ms=
X-Received: by 2002:a05:6000:986:b0:44b:7ec9:2d76 with SMTP id ffacd0b85a97d-4619f383d22mr399414f8f.7.1781542632403;
        Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:05 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8450: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-4-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZhQJ+ATOf2/e3697dcikBIUxSOgBzQ+mxpxycGxbD4s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7hdnvmiCaAWFycnN5uwwBUPwSq/N4H2zmhVTVS
 x5yYXoCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4QAKCRB33NvayMhJ0YIqD/
 wNAx8XYfbprrC2nmCfTTHFJFFhzfmcY7mvR/9fhvFf+R50NXugPczQXsCV1cTbQ/C3z7qX3OD5oK1Q
 MLLD98fJZujWpCH2GmPOpgN50YLnTRZaJwBRrtXVh6X6/Kx2eFL1B+yoUASt7vzwNMgQKm9tUmuUo7
 wqzFIvYH5/+BOAVjvJhObG2W5dU5xAhqS6Q9ojOSrMezt4JvXYE840goJj7KJ0q6gAHCEVMPqM0515
 Bec6nUImZJ8rwcjCN1h+yeXHUn9LXihtuOvQbeTddA3Cg20ndZFaemcaBC5G7q3V8uvXEa8N6MGNsB
 c4njivR5vLz/DXUdhC1nmxjynyNnSY0KtK/qjRErfyPzAc9cQC09cPr5d6xJ4zzmYJk8JNrYOyCzDa
 AqUWHGyDW1zXB+CFzdy2a9SKhxTZ5hAinjWF6ibHNPPWLxduCSMWjA5tJmv1AXQu6W73p6/jZZ4HSi
 JDO4CK+x7cW7I0ZBYjMd9uVsmeAgFeIPtAK1yjuvIPn9wv4GTdvjS8r5Nz68cNKK6CfExNK5IW7kPj
 G8cHT4qfXzeRM6nzAfY2pYelzzCVaofWQ/UAhCJQHDbwt6HcCgepSeky/x+IYDj35v5MF3w744qu0S
 rybTLBQuN6pZUYd2HBupbUn5eOqKO6dkfBSSTwScJ5JPxZFZU9Ym5YbzK/+Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..2639790307d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -935,6 +935,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-sm8450";
 			reg = <0x0 0x00100000 0x0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

