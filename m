Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152633B95F9
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116130; cv=none; b=t8F9v2hC1l3myq1jWSgvKOAvTS1PfV4l1bSniG9akaJnbtvv0+R0Qp5MbWdCtbq3zL8v53KrC8CLZEBPjr+Ai+In5YFYHZ7pIppsT3Ww7Cw7knz5/mRU4K1vBaOyPOCL0NeSqGtleLcH761RZjFTbnVxG1jaKxM0s100hiWqyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116130; c=relaxed/simple;
	bh=oUlDgFPOuTzk+k1ZFHFnc33Wy4fO8ZWAGLIRsB8Y02g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJ9qRIKIXDSGPd8rPqjM4yqQ9Yo79T+hBI/w8kyVe8yZqgPJNJ6qkUDyJoLFbo+mrxLz78HKTSBzEMY2UGawT1bh4CGL5B3h4ym4jK/a8tT0mR8H5yO7PrwmTwzf4cnBvj83BibyN35YQXbjYiNsZH/nOgJale6CDAmbg3OQCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gow6+/c3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gow6+/c3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4377174e1ebso651432f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116124; x=1772720924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBlrim4N223oggAozzYLyyaMZ8xxO7R36NeLnPQn72Q=;
        b=gow6+/c3iGApyXcnFSUXPykNDTWujFc35zuuy30tMJ3oo6HufPU+8fJ6cXBswyDmfE
         surFLYnvcCNiMKv6hJjMqYX9R1rCXbqey0mg6EKuSr/UMz0heEzYn08AJGKCvyz4Warv
         7MUOBHQuaZ03CFsD7p5USolUj1K1OCma15QVudm42TH0XynrPn6Sp0sEsSrep+CSVcvL
         5MXlsXFpbFOFuo4Q408ZAeHgeYxSREvmmsHYSrUOS2M3jJwlyUaHwU9/d2L6tTfKvwFk
         2TPF7fjCfP5xaf/wMbp8EopmGbcEiUO+lno0cAEkvIGtligheRz3dzSHUxFsjnyxk8Ad
         +1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116124; x=1772720924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBlrim4N223oggAozzYLyyaMZ8xxO7R36NeLnPQn72Q=;
        b=i01bWbDsScUKs+0zuvWG1skc362r5MSk9XN1o4uLZHxK/zZTQeOmqHuuADXKF1CIcT
         70MDREqMQG2yclxaoE8nRLBhirPa9xngx4+kVVqKaP8f+EYjozhZ1U6ifTUq61A/ppFu
         9uqmpmA/nxA5J43DKgXcKAUtpVMpc1h+XDnPBLej8VWljHvoSvkQWbSWq/B3YkFz0Dc4
         h1I/Aoin32zKJ+AYzSHsDtf8rZN5ip/2KMoz6q8HEMkWbcUfMLpkNuW9Hztw5TfQd47+
         CV0NVKD9n0kxi6SjpXUONOsuS5l7IYKTFb7eNPU6rlQs8aXlEmQMXp6gH8pzMB1BnMLx
         LzVw==
X-Forwarded-Encrypted: i=1; AJvYcCV9nBjARcgkS5SI9FcGBlwQCC6CA8eVvOmHJ93omT/AGTEczdOpMSameQgzsnti4O+oiE4dKvbI/+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxO0Lk+7J2SguyREME6btlX5LRG6I71Mu36cUW/psSviOr5UKr
	5zHGKzlBXEuvunuIK1l87wXuDOZn3Yu2m3949dRzkG+9DosBh3rTFhVfJvo14ljDzRc=
X-Gm-Gg: ATEYQzwRqcJnArkvcSgV5xNDn7z8pvEYk3BROsaOAtd3Dw0/Be2PCruqHtdW4zu2+9Y
	MptXeeXLUaa8nW9G8bSSorgNYZeUJW/eNlPHp20OUAwaCytksuGDR0FJKl+oqToVdgLkAJWT8nZ
	gzbd+sg0R6XRJUbPADHv32M9yMsBfOmzXdlSdq/j2hfF2gcHwYMxPAOELcEVEglE2TJ73qF5Jh+
	sm0327S4mA3mLtEfVGMJcEK41I+Tq/xZPVrFMJv2un9NteK6WzRJixBiyh7Wi33BFjQiyn+Abhn
	d5+plIL/7GKZ2JVV0Cwx19c3y5mzoZRt5R6bOKRQA7medtoGYKMkVNQJtThp3pRxwYAP67vSfp+
	llk8IPN3MYIj70dMANtH3NI9WH46CUeNhhV6bZEBVBtxNQnltK26Pg1P7GKAjs4lsMt9kvWHzlt
	BiVktIsZ9fwc1+lTbQSog9gW//FefrePRdQ7HioNUAkUnGplrXFVyc5K6anwY+9Ql+
X-Received: by 2002:a05:6000:1865:b0:439:8a9d:66fc with SMTP id ffacd0b85a97d-4398a9d684emr16322032f8f.15.1772116124435;
        Thu, 26 Feb 2026 06:28:44 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:43 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:42 +0000
Subject: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oUlDgFPOuTzk+k1ZFHFnc33Wy4fO8ZWAGLIRsB8Y02g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFibxPnmC3u2EverAZkkby/eBo5GIJANa/oCQ
 eM1mxZBwhqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYmwAKCRAicTuzoY3I
 OtRQEACLfSoHUc1rg2Jl/sauqI9Mtdw8axf+VLfyialt38ijwTVbFWg48vThermKEBJofT64OEb
 ZfV/Ffe9HuGwiNSrKXZ1sN547+64PJPwCvQASX0Umh3Dopuqt0pafRzLjjOabplu4u1oLeQW0Jn
 s85cGIcLdeuBDSPivy1cVq3fBrmtO5HJOi3kJA2uv2/P71xOpeCL+6eCPG4F2DyxRjFy8ABXfvG
 Wgz01YMVSvzaKcjX3q49X9Y2Bb+gQCm9oRmWskn64HFih57PFk9Xov3SiNh2XOOpOGx02zh7sc3
 GX56hFn0iEX/2XbudY7hLtbPDSh4akpALwY1dLFNU4mrkVXF2zWS/Oc7zJX5etjOgBLm7ylsdbk
 gDCI14tn0NiYq/ZbeNrA5snP0BCsNZQiN2w2CRJs6zyFL5Q5VYRGT+nE7ba/q1ZZ6E/kIpUAcfA
 Q6I32G8xieCSNmiQ6S8kfmSeCpW+p5ZVGBHywDLgWDJrOktttiDA4Lq9uBQmXD2xf68XjQE6Kq4
 aPFxe5B6YR7p+HjIU7sAAGquKK42UjcDsE0d6zGfuKgmN3HSyuRZhfuXUYnXti+U9VQtV2squ6B
 5QPLVLTVooh4nrMU9sLXHCDZ9VfX0/tH9RR7K8THpex/e3ltG4rZdfQYzHNz2Iam/wUa380RpZU
 tsqIq7hU1M3dZ0Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..bb18236b4f344 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -126,6 +126,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -351,6 +361,11 @@ examples:
             vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
             vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
 
+            phys = <&csiphy0>, <&csiphy1>,
+                   <&csiphy2>, <&csiphy4>;
+            phy-names = "csiphy0", "csiphy1",
+                        "csiphy2", "csiphy4";
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.52.0

