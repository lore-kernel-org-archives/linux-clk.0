Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573215AD93
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163566; cv=none; b=S2K0z6dy8pViGWkc9VkMRLtY0GFlm0ujBAR/xSOCOMxAn+qvltIIDvCVfL/QDugDrmu/8+LW+8whFoLIxuqNz4Y0/pioEdC9O49CiF33wdsJcBkkiWXfNGgjJT9wtjOMPlvcrMhKPYyO8fxWguQjgXXnE7wg+kygeOoWF1FqNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163566; c=relaxed/simple;
	bh=Jj35C2gsmeAKqAGSxKwpsqLfwDT0T6WvwyZo1GypbPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbc4OuRvEBAi30ppTaNkOhBoO0CycqDMdsAZm1IkncB5CcUlQGjqUc9G3co2KQF5EfZCS4vr4TsR17fUmM4weCmVIBmLlQnCxkyQUKgzov5TGuNby6+NLrAVokQhL4kkBeHFOyG2vmU0jekYlCtNBnRqnL271EjFF/1nTM1H52M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eeoyGkDX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeoyGkDX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4201986d60aso19649045e9.3
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163563; x=1717768363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifHHoOAJfuCZtjnswpV2fZk0gvyupvUNPvgcYygKpcQ=;
        b=eeoyGkDXJPHkUta7VNGAIWWNVuLd1cnKf9zNyKzG4rm3WRG8VEPBljAQ/Xrg1xWKgs
         Ske6qPkTQ6xWRudU0Nguaqm+bHW2OZq7xuCGNWu5rlH/a9bUUVW2uqicV/z9zuufwtPk
         RRtm0kwMN4zQFRpPPMfJgz0QO9ayW4BZd3P6gRbWBRnsSFNbOwzdrjjXpY1UpSe6qoq2
         aC2gi5W1JX7U+6T9tzKdSVkEM9rqmOCJFhuqaNjVtbWjR12hJw1ULZaTCsEYTK5RyIeI
         GT2SsPxd/0HEC92UvgaRoKzS8TcJ4b3Fqo++OmYSZmY0u/iAnYpubDSAav+NWULnV0SP
         +Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163563; x=1717768363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifHHoOAJfuCZtjnswpV2fZk0gvyupvUNPvgcYygKpcQ=;
        b=sttxYmI/GU+Ag7ov8kXZ40P0zHZmHGKBrgBDBxIBItLWFj+APRBXtxduniKhOzqBcY
         5hIqo6vjp3BbJ1fzvMEXUelVLQinuSDM7NKdGzVyM/MX4ZFl+IvTw1SsCcTY5GTXWWJj
         1+IhGIHQZmIFHwA2tTOad8N+CobOfsBqaX7i32aHKcY7p22Cb49enKkYT7UJEFalHzsJ
         CZ4ELJj5mhRii0GLuXnk0nuUdPDe94cbehh68g01m0ZnWG4A6v6hyiJESlHllHwViStN
         qBDaV08naK1VJcBT863qRAyMmpJVuyXNcLOXZhJsBYSgkAYSK3hpkily5a5mmBNBWf+D
         /JIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGQiy5Rlx/dwXq0dU7knM+WTFQgDenEgeQeYUzbOERNIo49YljLCB7rjztkg5ni/RoqEx5g0xiw5D3S4RJlDmm8gcf2qlWeKiw
X-Gm-Message-State: AOJu0Yy+JFS3W8m9MBto6eZIdbD3rPMJ8bVVLrR1zNC+TWaxELuxpcEN
	c5ZrThaWoLovQxj6Mxvue5EfS12Fd9T71rmVpLvWnMwPWqb+WShGdssGsbTXLzE=
X-Google-Smtp-Source: AGHT+IG6OcDaaKpgLQQXXWROr7G4bmEmk/pebfIMd87838Uu1cMe9qTFvZpP65S7U2/p4mJ8V0T8bg==
X-Received: by 2002:a05:600c:3d91:b0:421:967:7488 with SMTP id 5b1f17b1804b1-4212e0c499fmr13280115e9.41.1717163563277;
        Fri, 31 May 2024 06:52:43 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:19 +0200
Subject: [PATCH 01/16] dt-bindings: clock: qcom,sm8450-videocc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-1-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jj35C2gsmeAKqAGSxKwpsqLfwDT0T6WvwyZo1GypbPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYX/U9+dxgxWl6zpA8BmpOtGU9Vuo2Y8343C
 tsbOJwMD2WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWFwAKCRDBN2bmhouD
 1//gD/9DaxbglP7VG8nH6mLPXXse+ttiRMGhfAt5W6y4leqH/Mf77uZ0r5SrreSTMK04eF+7A1Y
 vnfcTvTOL//4vY03xcgfhvoKidWHx05qAbEar83KCj2J2vCDh1xvyyEksNOl8LJO9HrrJioLKIl
 xPp8iXOqe5sE0BCYOuJAXtA4h0yw+orv9LvrQGWYJu24+2TJHEXE+mwnPQRpgDVhE897nCeSBlX
 p6EYFhBFy7AO6zh4e9IEIvZSnue6lVCX8wX2WGgvfyptiIaYtcvfJiFeboNh1PE/FB6jeZF5z+9
 gRGlRNt0FizkJXgG9Rb1Y/3z5g/zeY2QkS2z0MNI5DQHqlXeDh9832RnY4tXfyksx34WAKmdpIP
 yxLnfpgv0fvN8Vlmi5OxmJFb1zyOdwG/xUty5aOczLEN31+oshly1Zzrp2kd6cWnl9rJkdtCzRt
 0Eas3yN02AjwZtFkXlLPe7u0gcpII4+D3J7j9SR/Wm1bn+N9oYwgkHK9VmJDicL26F5WuSOM77M
 kUC0L13qArdsu1+1MfEJqHd/fck6MHe1XzW0ZHd4ufxFnNwqqy50evJCqWUW7EHSehPP+9namab
 mia8uS9yhypSiH4UDNle/cyUKZQ/NE+QOQJ0iqAny+Qla//zksmBBjd+e+SNzOliDVFwd36579l
 /sYdCmp+jgYkjdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SM8450 Video clock controller
is also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml          | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index bad8f019a8d3..74034e3f79b7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -21,9 +21,6 @@ properties:
       - qcom,sm8450-videocc
       - qcom,sm8550-videocc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -39,26 +36,17 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - power-domains
   - required-opps
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

