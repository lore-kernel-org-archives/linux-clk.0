Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30145355F25
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014530; cv=none; b=u3cxvy1g3LZofzf4hNzAgH+AFz4en+qHBWyhVAupW/BrA+6OjUNkl1HQZi8q4KCnBpIIuSbYyDBAc+fBG8UQL6lxHzI04hc6AMNprUhlJrkyk6erNY6cmWXGF+WWMvtfaYblZgR5RoPMrixTdUY8lxarsjlia2PscrbzxueR58E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014530; c=relaxed/simple;
	bh=jGtdpE9UwjNX62OhSgQUXvi8hpltM7Py5hhv+eS3ZaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsJvJvdQ5BsBh/78pAWyuJUwO2sxA5H6kGKhlWJJYtL+VHXRl4wW0hqde7owteGH404xmMMgAJ4/n+7b0NAokUeaqBNJI6wAl8I0rIj661/aH/pqBWDO4Z/WpiKKZ7qAB6T6JLr8H8TS9bGyQA7FqsGUKh2bJp0cM27xzDjGeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oexFxqjs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oexFxqjs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so61757025e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014527; x=1781619327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=oexFxqjsDP1oZULIvwZodHEJfP75K9rHjFar6ls5k4kxtdW/gIY2viNH6pjavFCefD
         JE+qaLyzfdVXePHEBOBXmAVZ4euMDwwMSvjQ4CqQNf6eD9ozvgoEC/9nccs7FGrTpLRb
         FErk8D/yCOJi0WXOYldFyoE32zNQ/SZHiiFGhuj18mUkV07dsqYpYkY/j8Do3MZcUmi3
         qNH8d10WITKPxiBD13qDZJ17lI47CFs/ZGxKFLkGD6TFpVRm+1cQUCQzxsglUaNeW+tD
         WHDxrE/0Kn01KbDoLhdJ2V4kIfVVRxyDUEufhPdFyj+AB7R6xFUn2ohaoP9vhTKpBLEz
         +nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014527; x=1781619327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Svkh8TTwOpP5Nz7RAVeXNEyn2CeMCjSVCIOtvFwRCYs=;
        b=C8BH0ymehBsiv6rxbx1agneN69ZwsBRCPoAhPALzmAllNYHNpjOkWghB0U6qtqvgVH
         5OLoWgtjD/+Wq28MKZ5UyyvTRaoaXGr5XbN+yskMllcgpL8foorpgumRYZEclsBaa9Cs
         CNDYzchFBG7AOaRsJxz/POS0dxWdMOKcCj/ARJs0VZp314CIXBBIEcJVF5mcWqiAi6N7
         CJVDwmRXiE+WF2kjsqrYZMpRKaIFI9hyga1Uko1095FBjNmk71OtvP0sLSp2fdUDm4L5
         QmbpC7/vHWToWqf15aPgqFrfm6B6/ui4zoKXjgAsZ7KHPZ8G8vS55xFbIQulY/IHqkv3
         aa+A==
X-Forwarded-Encrypted: i=1; AFNElJ9xh+cLTElUopFxHwCFE/R7sTWaRh93DmSlHc40PqHo9HGbegA0qPh2T2S4nUY8lI03/on1WWXNEXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZm1Lhrrgr82YGgNC3L6n58Wf+7X+2zFKSPKLE7mTnnAiuLekL
	wIwcbMHKA7M2inRleu74O3xTtOzL7dlNlapzeyhYJD3Tivc/oIpSvkLlnBsl179gLsI=
X-Gm-Gg: Acq92OFs1/dLV3X0Fp/fzxzgIQva8aSc1xIONBeo2BbViHHFqtr1tdkvqjfSecIwQdP
	2dzOE2b2OYtQc70m/Bk81iVBJ5CvwR2SJlVcNE/wLe7+JAbb16V73KbOTJIel9XEsGvmMYP0JpY
	QjpqXXjpcYu8JWSAsgG1VG6hwL42p7bC7OwWnYuIoKAHg1DtoHMZQhU630JUd2R+aI2gnHmAwDw
	4Y0t6nmtYzteB6abmAcSdle2ojILyJ+ZC5XKpNYK/Q23S5ImvIpcreiSQOHz1dg6/5xD+6GcQ0q
	AopkBDJtvVKBLkC85KXt2iqk4qc5dZEjnhZ7+Wq8pAWKLdn66vjBEhtxe7wyrN563LoJnM6XBwD
	vZVPLAbo6ulH1XThKi2aa67EA5sS6upzJDcAW66pgi+u2rzZ4pnai55eLRmw/1h8WyzlKzyaMsR
	G14f7QGbFHLrsE7DWiBe+ytENZtiZSDPCez3ip4Ym8Jhpxfek=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr356932685e9.21.1781014526601;
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:46 +0200
Subject: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
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

gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
"sleep_clk" clock source in the device tree. For some reason, this was
never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
dedicated schema, so we can just add it to the properties without any
additional conditionals.

Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-mdm9607.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index d7da30b0e7ee..ef4b274b5c09 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -25,8 +25,20 @@ properties:
     enum:
       - qcom,gcc-mdm9607
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
 required:
   - compatible
+  - clocks
+  - clock-names
   - '#power-domain-cells'
 
 unevaluatedProperties: false
@@ -39,5 +51,7 @@ examples:
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep_clk";
     };
 ...

-- 
2.54.0

