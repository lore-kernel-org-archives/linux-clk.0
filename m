Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D632D979F
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707097; cv=none; b=r2Q2DFuut7yTFelwBx8/+k/MrTDNwqKhi8wagsfQ25AXksKgH+8i2XbrfHpwFrObQ0351JN8NTv5WgjfpCQx87DZ6yFnejrTDdei39VMPyxEx72gO2Pn8Dt96xVCWf1pk3As4sXGKgwPmKldas0M4PYqtkJiP3jl5BwA0r25DaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707097; c=relaxed/simple;
	bh=2cljBbctUpov7EPp9dHLO/NTrzVDPxTc08Ag9XJ0xdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqReR5I5FlT3qQG20Sis2/USocjhUupmi/z/w8Cb+WIsFIiPB0z+Wr8WFH2I1VovnuQCYc+3iKLy73jOBpqvTGQ4sIBAUFQ80r5lC4vQMFugwRMJ8AtcsvpLbLkAoQOgUsvmK2QLIJFSWGum/uyaKbVFIUbWcBmhmsjVtgXxo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYvH2jul; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYvH2jul"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4939778f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707089; x=1759311889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=UYvH2julEtiVLHK5cq3xe1ZDrFicw+myAajPVWZSgqRPu7nbZcPbxrASYkrKMg/2ao
         +tyXlZcSqUCL0jeVk2+PzgmwVq7ty9JnLVqJGAsFGFpMmTPZ9kVsjaPCtF4W/6UseHI8
         lvnpXYibMv5KK0NYroHDZLnPE9FSu990CuLK0veA3huexyAGtkBW3M5SFuY9Y6c9KWwD
         pi6BXTEqUtCUSMQ8UhTtPQMMSmFWMyCdQEolTAvkzTsiqzsw8ztPj01qIzQtLJfq7wYe
         7zoM446lJV6Xmgyg3XqoOObCYvIebemVkfH2b8v0z29yEM7B5KKSBNEudP1l4p1YiCW6
         qqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707089; x=1759311889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=fVnxSarjzZlg/8CCjar5FBL7B/e/nuMZhAjsJciaZYc4BVLHOhotP3EN5mF2V66mLg
         9JlaRXU+pNo3Hg0EClhR3OXizac3qTSJihki93wZyUcU15R1c/gT2nczzuJK1QBCVCOC
         FZQ6Xq7yDyK3/CpZNzbMTOtRC6ZjNxVGGNKjxggxVbI4el07hZAiKhu8OSr+/gc7A1UP
         hDos3zV6mXu1I7gcxSqMdosAXgzYcohIOpGtQKu6eOE+5wEqL8+fHGlwVA6zw5V/EEEq
         rUWv7os7n4m7yJcbvNkLwNm54XUVnPj3EQEebVEZe1mDfmzh2k2qqhWHt2PObbGwRYzg
         q9XA==
X-Gm-Message-State: AOJu0YwJ0RK37EyNbq4J6Fi0Ilh/FHQ5YiKwhq3OQVXB5agOygoTMZDx
	D+Z5lBR1kFG3uPqRs3Izbhkt86vwSUC1skcjrPv7DHMub10SsA8xbQ0Z7HmmWw==
X-Gm-Gg: ASbGnctyABjaN1ILPO2OfMV4MRYFzsFJeZ5APij7jW4YBJXWd4nL4gmh2hzUpfGb0F6
	ri0Q4WStl2RG9EdePHPWhbGx4Vo4SuEiY2KTKoCns+9PmzFpB+LMeyn0+38rQGQWLrrfslmcDku
	aBApTfm6onw0hSLSCbUmHkvcZCrvX/yB2r+L2ZBe8kNwWXgs3Eg88MHzV84DIHeE0pv7F3O+QNa
	tAac678Z0pdK4he12CZIxAtnGKtiBYACRFouAYCiWT3VGoMFlUO8LfaP1cfPsI2N9fLm5Gx3j+q
	q7wqaTxGG3VwXiOhXgxsyIUSKPMcuO58TPBV8odg023kPieIz65ZNkU6htk0Bo6E3fzmm6S3ZpK
	hYebX+jOhrmrwvhhODPnGfLfDAZ0QhwU030et/eCE9jRXLc8T+xXAKV6q44WN1TvKBc/ndg6IQj
	l23nNCwv2o6z+bNQ==
X-Google-Smtp-Source: AGHT+IFDGC5gILr6xmz9HYWmbPGf7fv1JpRWluY5ULikXOKvBqLdmUKtTk3mYXekw57q/HwxxJNkVQ==
X-Received: by 2002:a05:6000:186c:b0:3f0:9bf0:a369 with SMTP id ffacd0b85a97d-405c6d1024dmr5131775f8f.14.1758707088783;
        Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm27213765f8f.12.2025.09.24.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:42 +0200
Subject: [PATCH v8 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-1-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ec..4d471e3d89bc 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -123,6 +128,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false
@@ -136,6 +142,7 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        #access-controller-cells = <1>;
         clocks =  <&scmi_clk CK_SCMI_HSE>,
                   <&scmi_clk CK_SCMI_HSI>,
                   <&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0

