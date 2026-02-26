Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124693D3490
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116131; cv=none; b=BlNDVpwzl+2Tpqcp6zIuxBhLCuzEowJXUwJhdYfmvymWbVXzTNxCA/+nOmhzwpC+tmspNk1RoyG8zt7pFuEb5UokVoLMhTKAsYbWL5PH4WFCNfGTeOhDa/IAXaJLP2egkAcO0zrIyqrkNHXc8kOzA+v5oB7+Jzck1RA1MJ8ODOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116131; c=relaxed/simple;
	bh=Qn38MpcT3X5Uop/ohxc7EbyGDk10OdmDudGcFnhPjxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOnWr5e8avzRO304dgj1IRBZHnaTNtsAzgT/ePj4reMdWjp2PpuOm7kAdOTelevyWljF0XRC+EAjULxFW66NTO9Rie7elavJ8V9OfSZVWSbHEChg4NYOjuBxGw1hWGqy23S1uCTJNB9/7wNY1XtdwSp6Jue0EXd39I19CaUjFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5PkBfRk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5PkBfRk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43990ea3fbcso642230f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116126; x=1772720926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAf7469QLdF9nEYEeORB29gZq4TsObx9AWVyJ/rds9w=;
        b=k5PkBfRkAgezcT43OXqr98+PeNadlKfc7sjS0aQqrQlKtOv36KwCEbjD+q/ZHT8WyV
         j66stZhmV2U4omDu6GKL5Afn8Pq0LYr/DPa1QjWzpFFiIR08ObhnURXKO3n5fK3OZRxh
         3nzVDtq4H0wHJV/7+kG5saNwj4+dbHpGgW+F+JMrnF3OaDpbTSQARAD073BcBqDFxkhN
         x2X8QRoCs+I0jNSobMiWnHT6NTjzd5/xVgoCvOHa4qOVEiCJfq6ynP0Cl3e1wGHprTRV
         +AeqQCfONyYlhDpqXOtZtfrl0EzfKyjxLOKKWZoB2MF/g5NOIAQd+12kthay4aX9htpS
         DWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116126; x=1772720926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAf7469QLdF9nEYEeORB29gZq4TsObx9AWVyJ/rds9w=;
        b=BaOELdZKGcZoMhBkEvgbvjD1ESu60BOWF8zqN6WeP3RrbpAnfXCaKjr5ZMo9Uqaes7
         FjO+gWkEbI8h2wiMbTb17tTutPjhLWpGQHL2E6XzAChvhB7y8oIhIww/wqXrj/dqvVUy
         mI85DM+MEh25khN7hyb2MRIE8JCSlfFBzz+xlJdC6EDQ1LBJvKNSp4KC4ZFuEQU3Pp4S
         La2TLxqHrDZ4InWl82bclzawb6t+N2dF8ArudRQWPW4ttCB6p++ire6kf6sdly9AH6nn
         +0XrBTUY4ul/No0T3avyWHnK+FVqplhLgflQktk6tImtvwXOj/oJexcIWmsCxwuiroRH
         bThw==
X-Forwarded-Encrypted: i=1; AJvYcCUzgBufU8YPLLrz7M5UAjjdwD89pYb/uwN4l8AwDeDIvuKwO55EKWqtsGi0/0p2UH9gpZfiKkUAgbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN16KDZ8jgmur6wsYK4hz5yA6tLogThgdQzcPeYqcnz4nXXIW0
	dahFISN1163gyTUoDU4vB1opOsfVSbbJ7kDiOoqDApbq4BoJtXn1lZCg9LsigxFmGJQ=
X-Gm-Gg: ATEYQzztRYzSQ9DYE6YHuVGCG1x6tIpLTBpHK1mardubxW6ustUg1JC5CMQ9FFNLwZR
	C7ZZ2UzJKL6wcjdMVTPjVjPSp53P10L7f38sYkNLXpoC0FSHuXxmYfDeFNHexwURsvJuUY0KDA/
	eDPfP4i6ujE4DBFvBAfcIp3DDnGmoKaCul4mRotghT4q8UDn3hqvF61PzjCpls7KHmdtIM16ZSk
	CQCJb1wGpvSImbrq+w+1/1KfCJgj5X4/h4QJFgX+WvFo2gXJ/GyjOnPXUn2g/wBrSkjUh7l5DJk
	3++7hd0zUfdRYPXN12Lvr2Hxg+bbI7bMo5xYErzhPowNCWUFhsnXOkNMC1sfsxJBZYl1ceEp5kC
	uwyTdIQ+ezwJMx93uiU9/uzP2Vjsn/m3jGhes9Vti3GehnTesIZIUAtBTdAg03PQpK9rX8QUbh+
	55REcXjNieYbj+upH2rlNe1Pb2tNWIYd7UqePbRn90fS67vQzms493dUOuBoK/rSGr
X-Received: by 2002:a05:6000:144c:b0:439:909f:c594 with SMTP id ffacd0b85a97d-439971ae7f0mr6470219f8f.10.1772116126101;
        Thu, 26 Feb 2026 06:28:46 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:45 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:43 +0000
Subject: [PATCH v9 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-2-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Qn38MpcT3X5Uop/ohxc7EbyGDk10OdmDudGcFnhPjxg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFibxmwRG4nV42g91OU5baGAhb9UrprB+WKHZ
 UeLkd9iB7CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYmwAKCRAicTuzoY3I
 Oi+PD/9pCn3AIL9kKnZr+D3tr8VDBReN+w5AWVk8KycbgwU8ryeqALkr54fryKpzb5jZLxqiovX
 XRRXh6gUpyCYAsBNfDKD99+C1uDy6YaOfmLip+sWsa/YYfLje0G9J0s8nuxFmgQU53kCY+olg0W
 qm1fIye7dXW6MHXJvjY9K3+P0ie8VQAVR39n+HI5NKxuzeAazFwckTgzTA/wY0ozthnlUk4zYvZ
 dCQYhxhFSQ+HjQRbGjDacjka+2hfFzwwIS+twt00NY1UNyrHhhN8AzI7fI/q09OZIwMmg2OMYFd
 aK9j+1XCrt+1IbOTXllrz/Qk//rQ/B67gbWGP2ZnWpbubpq1La1SWk4mx695AJqshhMN3gk32xl
 9gBOCeGLsAVT/accM2oAlSwtzDQQKjNDAAT42AEjKmSC2SKcj4sFmRtIeuVsHio1r2S0RB1lGsb
 ZLNVjcUhda1VM+54Cu4wLj1J5isHMcjKDlrHa3js5qULzYADANUnNlGlIa8CC7ZlRhiyL/20471
 4JypF6hC48KNZm8bFNSCivfirLRbzWYCSoNglj/7c6WZcRvjSru0yaoYcigurZ3RlHFyBVBDQ1k
 i0gSTKwDMHzDFJNi/tG6mpHyWD8kzmz1jwAyUwgOBVngydEzIcB1lnlFer44PxJPeuHTlTF717Y
 Vujn/s5/5pYyA6g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
one CSIPHY.

When we have one endpoint we may have
- DPHY 1, 2 or 4 data lanes + 1 clock lane
- CPHY 3 wire data lane

When we have two endpoints this indicates the special fixed combo-mode.
- DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index bb18236b4f344..8dbaab16b11d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -140,7 +140,8 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     description:
-      CSI input ports.
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
 
     patternProperties:
       "^port@[0-3]$":
@@ -148,26 +149,86 @@ properties:
         unevaluatedProperties: false
 
         description:
-          Input port for receiving CSI data from a CSIPHY.
+          Input port for receiving CSI data.
 
         properties:
-          endpoint:
+          endpoint@0:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
+            description:
+              Endpoint for receiving a single sensor input (or first leg of combo).
+
             properties:
               data-lanes:
                 minItems: 1
-                maxItems: 4
+                maxItems: 4 # Base max allows 4 (for D-PHY)
+
+              clock-lanes:
+                maxItems: 1
 
               bus-type:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
+          endpoint@1:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            description:
+              Endpoint for receiving the second leg of a combo sensor input.
+
+            properties:
+              data-lanes:
+                maxItems: 1
+
+              clock-lanes:
+                maxItems: 1
+
+              bus-type:
+                const: 4 # Combo is D-PHY specific
+
             required:
               - data-lanes
 
+        allOf:
+          # Case 1: Combo Mode (endpoint@1 is present)
+          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                    bus-type:
+                      const: 4
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 1
+                    bus-type:
+                      const: 4
+
+          # Case 2: Single Mode (endpoint@1 is missing)
+          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
+          - if:
+              not:
+                required:
+                  - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
 required:
   - compatible
   - reg

-- 
2.52.0

