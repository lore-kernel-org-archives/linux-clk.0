Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9B13F459
	for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352440; cv=none; b=eyzek/fx5XdPO3FdK4IUTgCSW2VYM4D2bvGTk8A6V87BOhzxZmIDK1Ved9Dgtu+/DV0yl4+MqHZqoGebylVjIvgC3hcdS+ku0Y64HYmggGQQLwYVZwQYj5RDK6i11o8Ld3ctl00o02LkDKZYtUou7EjIqJv6s69y6JpzOUSaTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352440; c=relaxed/simple;
	bh=pMkcGiMy0q3S9WZlbdBLqLkUokhQo4RSjeHCoPtjS+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUMuMnlMfNdgGtYrdECY2J7I00K3VOHgfivOdA8xCI27IG/CI7plxF4ynEzFaG5LCP3UEoz7LzgT4LwXKEP6167ffPOhxAZg3OOWTL46YtVHFociKUd+G2Lqn+NgZz5riqKZQ1BPRxnFOcS2JL8NrOYKH7pCyHtOCzGoEq31uvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJBlkGRW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJBlkGRW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-413ef6908ccso734135e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352435; x=1710957235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SmKMGXF81mfKkNpF0CZGS/Z1f9uS1wllHcEDjQ1fhE=;
        b=DJBlkGRWSiD7QFyrsaGqXsMR3t3z0qRmckakG6buVJCy/giXoMbyPvwEQqmxsrIAlF
         xWDcmE6fKevJwqlpzSyb0yCDkuNxJ+SiYZuup9akIjb3CMjBnH+Xebr8sJMO9JxE7PeS
         3nk2crXbimGFk/NiDLXd0UA4xuwobIw9UtQrbwjbcBYGvuU7kvpDc+vzqbczddcOSuc+
         nQNtZkmP6nuVU0ILDAbXntUc/Jdk4Y+V095HQBfeTKytSqk9DuMqdHFHAbrH+0BzgK0m
         gpUinji35sgHaGZAWRco8CJRxhPmBAS367STjTYzWKULPQ1HiI7Poc1LP738Dt6MP2QO
         FVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352435; x=1710957235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SmKMGXF81mfKkNpF0CZGS/Z1f9uS1wllHcEDjQ1fhE=;
        b=bv9Oy+UP+g44Y/6BPbnsMqUkPcbmv5brdgKiTM8CAeuUe8UAR11ASU2MwCYAN8xdOB
         GoXRAsF+wgDOIMi1geMbk2B3U991Yze0UETIuLY9sDbfcGPxl0Bb2CLZimE66jItXpKF
         O5F3o3TdNI6lK9vLqmZwA2gvbZL1DoVBlfbFKq6c+R4qGQtH2/W+OkwpxHHb7kGvitoy
         kdqdJUGvMCG0YX3p2V/26rs6QXOYT2PLha8MsAp/7aHCr/Q+ajhUmpvjIUlaZLWMFmP6
         lkPFT5xCQJo3sHeO77FUsGhFht4p/YT1gAk2nSyVLqvGZvdirm0+BrGms+zjGldpkVFE
         VekQ==
X-Forwarded-Encrypted: i=1; AJvYcCU93OQUCLWJKKg9PqfLB/cYuVMH/NFYay7en5zfXJST2IMV2BN2Ko5dwGXRef0xdNqKeoAP6Xjf+fIah0auGFuqHkvp0jwG+DL7
X-Gm-Message-State: AOJu0YwqgFKgTwNQLTL1fcMvWZ8MxMxceNswAYTIPvmVpJH423gizCkj
	rw9qvu25YJZROjKa1ravCOYlcAUduocz3HKaqQvfAQWSoza7hbxFw4qu6c/fyp8=
X-Google-Smtp-Source: AGHT+IGpjXdcVcW+OWgvTuMi+NTYup3ENVDM08ZLJnKTDwsM761kmPBqDIF23JsP73xz3/jHXijD5g==
X-Received: by 2002:a05:600c:470f:b0:412:e3aa:8f69 with SMTP id v15-20020a05600c470f00b00412e3aa8f69mr534360wmo.30.1710352435024;
        Wed, 13 Mar 2024 10:53:55 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6acc000000b0033e7a499deasm9914482wrw.109.2024.03.13.10.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:53:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 13 Mar 2024 17:53:52 +0000
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Fix x1e80100 camcc
 power-domain declaration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-linux-next-camcc-fixes-v2-1-9426da94ae37@linaro.org>
References: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
In-Reply-To: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

camcc on x1e80100 requires two power domains MXC and MMCX. Define those as
part of the schema.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          | 37 ++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index fa0e5b6b02b81..1f62139426845 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -19,9 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
-allOf:
-  - $ref: qcom,gcc.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,9 +35,8 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
+    minItems: 1
+    maxItems: 2
 
   required-opps:
     maxItems: 1
@@ -50,6 +46,35 @@ properties:
   reg:
     maxItems: 1
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-camcc
+              - qcom,sm8450-camcc
+              - qcom,sm8550-camcc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: MMCX power domain.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-camcc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: MXC power domain.
+            - description: MMCX power domain.
+
 required:
   - compatible
   - clocks

-- 
2.44.0

