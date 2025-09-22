Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0C2FD1A5
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528754; cv=none; b=oBecLaLdNbspMIPI0WL5Lkq3ibNVg+N73t+m7wN5xzMTV1gsQYZN50S43UBCLMVlunIvKhylHtbnkFCtfWXiX8/SKdw9TN3yzNc1dm7V5W27g93B+7/NmyMpiDqFfhfsmH0NLkzHdHolpTp/1brGRjTPZoqXE7oY6TZQ/kB+TMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528754; c=relaxed/simple;
	bh=2cljBbctUpov7EPp9dHLO/NTrzVDPxTc08Ag9XJ0xdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFDsrBJymDnl+zyAZ2+PxplFEiDXp3rap1Lm/wXb4Zs9HQp6XHkKSeAu6EYBKcq9En6SybmmgbL/HkdFlY5n9eJ0yeOTB6O/RtxJ/kOwlJHm0R5ZbY+dTjNpUnEsPlgm7mJWWF+fNc7Qyl4QUDoY0QRMK9tDwDmwY8TQkwY7CrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD6X+XhG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD6X+XhG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45ed646b656so35557655e9.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528751; x=1759133551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=GD6X+XhGPR3drqDCQdw9PMOjJ+EjGbxRqE+3GgKT+OesFW2rSrDgaEoYNiIIMqYmk1
         ymu/g0BNhGJrdACy/l6CZaccfhe7WV6CIIdTgs4p2GXAwYBo1e7SD8w1S+xAovpeDvFI
         b3ZBrtXJjyv4FE41zz9cXKbQtftCnUKJwDs41LV5E1RexsmCDNDo5RMbgezUvK9egvzk
         Je8hoiIN5E4lIqCy6aPrZ/jEFHDZkrg9GZ3QW0BN38xcN74vs7SS0aG3BE+QyISRu71H
         jVyQ/2CoT2ux/HjBSZ63d2ele8QpKxlBjj5+m3a4x/JrVI67/9/9q5ecXD6ZcVkChPHp
         504Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528751; x=1759133551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=ZpC1GIH2qi933POhb64DO1FC3j3k/R68i1XvvqyM5W9UIjx59bnWWjZZNbGPo7ELkV
         m8KKOKXNVaCI2Wg46RyzdRKATFYr+0d4xEaz7t6q4N/lcqMSqECl4blrHM/5unmus36H
         6zf4GD4m1+glFsoVO//Vitgg3+vhk/4MK0R7p1AF7A9s/pRj1rfH4nEetb2iJxk7AJlm
         LcEOg46uQuEQCdiyhrititQjISFotDpK13m56eXZoGmu6bsE2Dsumy8SG0kUz3tBrx/i
         rE6bwr6zZQHqiIcrDgOMpM6yAxw5CoEC1z2yxzrYPRCYfh6aowRgCWwqRobMOzFtvXzs
         2CyQ==
X-Gm-Message-State: AOJu0YxMX1XsXhZ8EV09ZxGLINgPOI3U9AFFo0KUmEpqG/sI+ZTMC1wL
	qqO/aCGEXUb9WLPtNLCkZMq9Lw/Wemy+tUEGgFhe+L1uikceZ3FvmCy/
X-Gm-Gg: ASbGncsWRxhJeDRMIyQGN5mEEv11RS+GflvD3NZFiv/vn+I6j9kVT085S5oo4shbBLe
	j0nUTLKDEgkKMlfUUYDOZ7hlDGNW6qgMsjmdDs63P00Oe7+j6UQT3IASpqiZDx/OgbE/V51aC3o
	0wIRibC86m2iqRGR/PSTWAplIQnFHyDjQzxk1pOMW9rJsLjcu64t3nSokpWm9HgBE5Mebddjt9w
	t/ll5tj+bzstbFZecE6iTTQYlzFjZwTTunsC4OO3d5V/QgEE/75uPzyRJxaa4HGOe1tV1XDitcP
	thkkYktIu0X1WmANFax83olRn47ICHLwRYfrGyVTSHjqmVbexxmWuKFHcx707RuPVfJSn6oFbXN
	CKTHT+nR+237AijNvcKZUBp6IG55brJ/69nS6Jp8WEpCtXS4NgRoxm+cS0yDqLDL5SEiWLkF7ue
	oX2rc2Je27iaA0z8aN
X-Google-Smtp-Source: AGHT+IHIVtfPSrHin4y9JkfBQxIDF6jMfONQa4rDA8eGnaJ0DC6uDJwECPyzN7tfzI8/ktqkL/ZedA==
X-Received: by 2002:a05:6000:40cc:b0:3ec:d78d:8fde with SMTP id ffacd0b85a97d-3ee8585e38dmr9724920f8f.44.1758528751149;
        Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f00cc58b91sm12911883f8f.1.2025.09.22.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:30 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:18 +0200
Subject: [PATCH v7 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-1-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
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

