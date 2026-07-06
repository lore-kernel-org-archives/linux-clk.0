Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C739E6F0
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350187; cv=none; b=MPa5zGBXMKsOK/7YckCfcf4449lZ0BiUp8IbHcJPTiOE0dksbTsEIKTn5VpydWKhDsbiW2bR3iXI6PbUdKtM5fGNxp6Oopi/EZF0Fa3KH4SkX/wzt28QcMO759gZzjOjFffkQvyMnignuH6i5nSPN0vtWx8c1eDkL1IiZmStXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350187; c=relaxed/simple;
	bh=tGUpztyp0tohTKWZjC215EyWB5KJSdZpfq0WVjwZLFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2J5U1B4UVkbS/vdc1quARSqIoEduieuMG0mA0rXlnucKNYTa1NiLXZVOmuZjdftWqn8c8mSM91wPL2sC/GVGD5q0k279ln+SVfduAb0DY0WRhI8DzFh8CbOJviRRmBDl3pdwuZOFT1mSVQpmVGnGm1i0SLlLt2gAxy6fhWiLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9+9NZIv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9+9NZIv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so21809735e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350184; x=1783954984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=q9+9NZIvawAYWbM/Kr/ZMIPWSkOldZgmBQu9AbW2wJsMsCpnmNR481L6otEkDvxMc/
         if1HVwCRWHfp9lB66n5L7W2oSgEq/+GfYENT9/+qs7ObwSJHELQdcSnQZDzsMdKKe0av
         JssmJ0xIVkQU+t14NX6iUtD3p5oZCdWKybgP52tMZZLba6E0RuSbkjAahzI7e8TEbTLl
         bhLR1F0m6sFpShpGzqI3NMrQNSwrXOU06ZGyDHRVqzJXTyylOu3CJrP3QSObmEGkwVl4
         fotPUdL7Su4nyPgavTzKu5h1E9ZP0vXoEwmI2cxvAygvhePUUESWqX+sQEQ7N4lFbpV3
         3sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350184; x=1783954984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDGBVdju2nTTsocBvnoqIfFjlYoXwPS22bQg2+7uzyg=;
        b=XS/FTRQ/IG3glQa/LtlpeGNyHuUIqgV6Sf/cfZAITdMWEyv1UwfRVD31U1M/+S3NI4
         SFV3oa72RMYWrSkyGOaBNdbbvM/j4JnjfF1Bve+Tg3L4i9bd58avxU9G4TyBYD2puZt1
         pDVh/0bSk9bxxghnbwPCNyg6NmXm4arRug4+wWum7m2Ya8TeH3IyO/tJWBWrKf3xuLBn
         vY4i+IVJQxLlTnpAhIN0PsXWbDqZCua/saywLcoVyR9LpCpzpcdiZVKdWC4mAXRe7NWB
         quAfVNjgOZPl+pxsIxILsq7/JAdS8JMwgWld/DnljNf66DrPZca2SCFsD1G0nFpxzZAV
         /Qng==
X-Forwarded-Encrypted: i=1; AHgh+Rr8YxluN4gm0Kd4ZNqokPpqXVms6fTOBgxoTqBHg4zNFi3TUM57LxNgjGiQ9up69tNPNY2vPkd8BXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwRockMMGPVPEk1LXSnDxE4YW/OpL1UiOstcMRCMFkiQ7PJLZ
	/umLjGOcGc9u0VSCnN8ZyakREkcm00R1GqcatSNwbrPt6x2/GnB3tA4avaqoBizmndU=
X-Gm-Gg: AfdE7cm2/oqvf9gZyXgOhIZ7C7bEUQ0rWmeAexaKMng9p+yUIFUg4RXA+ck0jsUkbKT
	mEfB+HrECLa0Gmenbkqcdu88Nfmg2vgU2RiuWE52Z3tJcfTy809jSoGBj5A0Dr7ScOv0AMi3cDS
	Q9lla0WwTWwM01xBxW8/duZsg1SPe8Digyp7qUaU5EscwNOnNkdrPRPOqFQL+Qhy14jBJLhRI3D
	ZLl9CH+cMUZU0KHRFG+KkYjb7nFxV0t5Sjsvf5g/wyjekeuGortTGzIBOxsrTDeNrNAQKno1Az7
	lHWSoF+BVm4BnFe2eAYNarCHWLV+Cs7TbsLY9wRARFTwS4Y25f1JC4GCHIPONasiw3AIqfpaKiw
	+5TpUNiDR/hQcCwzSlpwZ9t8VDPd/8jXI1j/1K1v9/hj4WmbDw4YwRLJB3HNNvHI9QqItt+RrH3
	sHbmlRlGJifY5ol9H/tFedeABWea6fzl9boTDo
X-Received: by 2002:a05:600c:46c8:b0:493:c3cb:409e with SMTP id 5b1f17b1804b1-493df0405a2mr10905835e9.15.1783350183567;
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:03 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:18 +0200
Subject: [PATCH v2 11/12] dt-bindings: clock: qcom: gcc-mdm9607: Use proper
 address in example
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-11-745565101869@linaro.org>
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

Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
well use the correct memory addresses in the example. This does not
affect the validation itself, but will reduce confusion for readers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

