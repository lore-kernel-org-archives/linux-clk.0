Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254441229E
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330355; cv=none; b=fTc/HQ6XN2Kr7vcZc4hsKATiEI4pyoeiKmGJ4NLXokz4AoG6YjcsBwT1ORPguMuSTgNMyNVQ4OKlEjjIWxA+Djt0KDehDl1AMEjvJhOY0y+Sk0OaJlvK+808j32n5eVK+snzpkiFp0RrzjfK/l1KzjSvDR8gKQt1AEPlc4ZFQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330355; c=relaxed/simple;
	bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxwP/87toYgZMi59MxrWflF+EjGwdmzuZ5M5NFB/yi440KFeMdLdap9pXygA2BvLzEHsnvC2jwd6FiXzG7SCZBhYyFzHzw78OyKyO8rTpdVkAcdqpL8L8FXQf+UF5dQRcgmODaGgN3+7zpTdBXKGUewJ6ye+T3yTgecknuHkbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KGVSC1tN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KGVSC1tN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c733f15aso28556625e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330349; x=1783935149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=KGVSC1tN+8gP10+03qB+OMQ6eQux1yX3pR80elByKlQTEWvRb+UZfw+/h5oCKPCAfO
         LUeFkNS5HiUPFiRN6XLYd0fWgRjv43LqHtOHkdy9m+XtHPthcwXdO6hyBNDK0KvBWJ8x
         P1B9xWXS1RF1s/Qiow4AwEdgfEfV97qLo7ZzroDXd0Kuie1xwDAvbBxHYYMOyojdzBr9
         u68WcC1H1KVqLz6jF5Gvl3ETXj1Q1h9LB9RgFrRul+1BkiFUXFhKQo5izMJn/HPgiDwa
         qPbkQiLLjf7Tqni5afJJsUvYCk92gQR3yaI6m1j8m8aou9iGmbnjxBxEtnpDQDRdEFTb
         +Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330349; x=1783935149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=jxlIdP2ilZY+nmcNVVQYQLrNHFv70tWXcacA21mXULVdfc4FPLJdAW3vDykfiVgb8T
         iNPqJFfFmR6JkG2TxOIgUxZccBIcvyHSujIARI3LfHCMXOLOGjYd3fM6KMn1rI17i+JF
         6mF8fXOY/LWOVp9gsCiFljFgInAWTyhum3LzdCYSe8mq79ZSY31anbBYNrlKi4XC5xNm
         0jQZT9g5JTNahYl6ERDmKDcBjUycanFhal3SNf3i5cf5BEuXSwCDihhgI8LGKScb7HgO
         JMyEuippTWPVFBpkWXMOsPBPT6dU91FKZbyVv22NgkCl/Q8cHf/qySzaI8HKV0NewY36
         bFyw==
X-Forwarded-Encrypted: i=1; AHgh+Rppf+uaQOJHXtmfnLFVxRPAxTKmm77hSgN9X+C8h1J/oSO2sBCDPHcO3G9dlP3uSZQMRbvuaBiizA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDWTyTiiXEVKV9Qjtq2J8ESREzHbT+0z+ABZikDvssLLSP7ENT
	Kx8oHH6uOlUfyibYHCxRnMZnPlusAUrXuyQok9S2opI1NAIbMdFYllQDNKdd1v9GX8Y=
X-Gm-Gg: AfdE7cmyUKnqGGNH2gV63PGYavoMPolqcr3DWGpyKGKHqz7v5NGM7St2BlyeZao8RlO
	GTujo3oVaR1gtjguf9/G9cC1KSXCowRqPN82ykulkcoBV4yqM2zfT7In3aB88dw4v8XEqR5j9jm
	7xHcW/56C38LSUofAfpye3HnQ1oxXZ/vOpYZOUdzXnd5gTa+s4hDdD+j6vUFx2vi2EtpWtFNJXP
	jgEu2Tolyg8nPgDw0qri8nniOd5pmUSqUSzzj/44+OlYZycBwx6xqNOg2FXr0ZzVPbzfeQCOtra
	Nm7EOGxpgd4l2qyLatnrRg5Suw6DudByogNfxap18qBz6rLfAdP4bQ96LGAn9C8w8kyBOrNJ7Ua
	eXHa3+h110UGNl0OiLJoMdqeibx0zZsiX/ZYy00iQ3e9iM/+mrSntzCGdnyAG1hy7dDJ+UJAxfC
	Y4APMDmAAF5ao=
X-Received: by 2002:a05:600c:524a:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493d11d7fecmr118661335e9.13.1783330348753;
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm20505835f8f.34.2026.07.06.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:09 +0200
Subject: [PATCH v4 1/9] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-1-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YgZ1kmVhbAFJg++nhyvscPyVSYf6qHpsfzf
 Q5jILv6M+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IAAKCRDm/A8cN/La
 hS2yD/9JC6LOTzoSad/DXBsiHV19K0GF3iopYtiTD2yka1JwfFAt56fW4Ql6js+tCDHjIR/8dNl
 ZCcQ37QX7+/ncxfGw35t5noFVL4eEv+HD0mAHkuiruSHXdtTQcc3TtTCtFdxRdg0WfjEIPUjCVl
 ecRZ3eMUxmbWUPEsSh6keNgpfZbmb+fow923az1r05IuTJZPvHCrp+h7kMHfAUfQv3jBW+Jitn2
 z1mXPL3Gp3GYRKAlruc7+fiwvN2dTZyzAH3v1Yzz+fLxz37C+XyK0djx/bbXdr1fLifB5rkCDSB
 14rD40d8cmUaKNROMLYfXMRTclaPfpxDyXldQLSn+0monEBssPO/tacKg32NUKJZ60Pc6oEKfYc
 tYxLDc0BE6z5jWxIC77CfkVuWwZULNDFT2BJPAKuj71gyThxusvr9rMIHlRu80ZFQY1xnZnOv52
 PBXVB9zZvmQkdbA7vZPwVVF7Rokh16UAHovkwZe+qOU99rQlDp+VaJSqXqYYqvxZTl4YE9Yf3N2
 AHiykcCHHT5HwgOsR/UlVThdLgH3dAvBJVF+7dnb+/e6T46AhEnI8WmeR66G8k+XgfXFh2ot6Lz
 wxebV68uC56VToYtAcrpAYtv9FpCPDy3HxCM8xErN232vbr9iAZPYICXQbCYACoOJTgIwdI/WY5
 /pSukiBC+wiN44Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3

