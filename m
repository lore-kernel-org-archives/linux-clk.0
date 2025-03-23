Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5029405
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769569; cv=none; b=KO7j1ISMqI3pn0+Dzr0KkbUFFUALBfSngRXSJjWwIU2mBVIm42yD3XKRTDfDxcdPwQDHhHbPnJPLPoiZtFNei0qCfJQjHPpF8oE/SzZ4NIyMYrX27+1OjQOt6tGLZY34AFxPo0VOEx1ej00dffwPcegZA9BpGy8Hj3s8jUdJhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769569; c=relaxed/simple;
	bh=ft5MMINeJ0ZFFqsyd4wk/QMt+OACxl4RgJok7sE3LxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fkc3FNI7RpkWYyIbSL/W5JFbbqP5/e6nO3pz5dpC0CDd347VpCjz5g22TR09/noneTvjX255JathQ7AYDn6tcOGsvItTO4GYDa0OxCa1IV2epNQAUSZ9EFGZXXwNRLiChxTETUCu9PXHPzmuDiE5DnvJLa+DAV+wwP/wIO0AONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXVHTe/l; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXVHTe/l"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25d2b2354so632202466b.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=bXVHTe/lCcytO1CcopVSOr+R+hBF2n7JErX0VIIT7eeqljv3nLzD9yrWhU2FJRKCfq
         nrMVP3DWwwhuP3uNfZr4lsR1IstuIYajHcIuGpOcAZCaNGBrJ5HD4HuDdhBRjsK4UhLq
         qbdb/dpq2m6Hab2PG9Qa1jvC0x2/gTHdDcRsF30MW8rFDTLPkOhKjEg4tXBCZ2b8B5s+
         TwsC1hPhNTMkD7LnUqF/Fv4no0EQ7/SZf6wuR5uiA9EntK7eI8CPloNZTWPs6F301sM7
         NtxzmRhE2IOAs5UjqFaKjDBOJVUmNa0D7LvcOOUA/HBuCoO0J+r+S7g4Oz7idMYVOLAg
         kU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76PH5cHSw8HwRSSvCBVkDwYPjRgUpAN3tWdOoIM1T/Y=;
        b=uZSIFR4bTYqPF4wWloFIJsSSG4SSGEk0HeldJHapk6o1WIr/EYb/t9j8q1OxvA55Am
         OqPYhIET047PO4fOl6T1+PRQ1eWR1DltItrsYi+Whg3oBePiCVCb9nDkiWC9Y3JZAYtx
         xUnL6GvSchak0MNMBx6Zq6bak4KSjTKRZ9MMJclyGgcmPIlL518jDw0pphXxbmVbFXkA
         NOGG2gc4f0rYpIabyEEI1cQSv5DUc8L+shF2FcMU2Aj+dT1+yNs/hHIL0jml71wTngG6
         +3S+3myx1bPWUKOFwj2f7Qn8pSWDGlzJJFJjXffHUIQE22uUA0Gx37RjQyLkUaNERjSx
         WotQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3zTlTzIzkJk9RSUCxl/srB9hksaK3b6IyYSF+q/P7EqVJNB3HkXo3FhmOrtxnfwNFTDQQtWaAhHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOpOkD/M7G7nV3klNfvAJS0+rowMiNI657H5RXZMQc/41l1gF
	lcW4q+0i8NNdPq/eTlAYQY6oogiiAGz0WGbsAZae+W7ZLPhIgVCxjR3GIMEeDrM=
X-Gm-Gg: ASbGnculz5kiGPzdxY6mh1j/NwaLLUGlTDyPaf82/KKCNxMqmov31iv0Zs94MeqrZuD
	6jj1HNhqKBsUZf2VFv1Ahv9aUbWxYtDuvZ/8r+s70oCcpDdHTwckmZMhQOvgDj11aTQ7tkRwn+f
	sK26+EAF1OuU5hyL9rgp2ZTWIlBjuAQ9GNf9zz4R3MQzOb7kPzQwDLRv0lvjs3PaY1KQjXJgIFO
	1FpfBbMvzkZqL0NmewUDLmuLkjRbfkfVTHO4/tJal8iUw+2h9J865JQYuVuO1AeLdZ3IJO4tlkB
	yzagC7Limo1OCYRRIotVHWqkupajb5D1Ja/u0m00dIeB4a8P/RJEuDa3q2tc0iFYq3LjgnBAm8t
	E3dNy9rGUIFjv/k85gs2oGar9uv20
X-Google-Smtp-Source: AGHT+IEYfWzNbR+K5DYstAqClR9nSakyWw/N8LzTya4wskfRe5KrC67EU110F2zXc4Z6WRaZMMlhIQ==
X-Received: by 2002:a17:907:7292:b0:ab7:6fa9:b0a9 with SMTP id a640c23a62f3a-ac3f208a29emr1120053966b.11.1742769564738;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:18 +0000
Subject: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.395.g12beb8f557-goog

