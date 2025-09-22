Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F222FE051
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528757; cv=none; b=cevM//rEOOrAkHVK8zOI5NkZ+6+DaXuyO08EzeJ/UMxkQny9h6fdwprC7tIVL0rg5s8Zm86LO58ahGBK62ZY1ha0Bix8LLgjU7VKW0fnN1FYHftCt2al8tOIOXc90jChGQ4Fb/sJofto239qRAa0+ykbbLD9Q4mN2xWUIcLLcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528757; c=relaxed/simple;
	bh=jW34m1dVcRktmghJ+wO36JmqpXfoGmyvLM7Vm/SWXcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSsPjgoQdQ1ZYe4m1Od+bq8FCfF8GAq6WkuB6fK8rjWgVBPRoFH8lNUpNXL2CcLAPif2FS309oXnsc0/XovBlGUO3NBBrBXCBGO4gYjJaQ+BSiUcETkFl+ECMZEDFY9faCPzl9vPHMS4kLuvk3jwQQ/fZY0x8/DhyFlVSg5t82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn5mmEaI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn5mmEaI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee130237a8so2074530f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528754; x=1759133554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=Wn5mmEaIWjjjzbui9nWX0w6xBmrPou9xF1NQwoWVpv+HiBwjRREE4+C1ot7AnJk+F3
         A6iTMP2IJPqnFtPU1nG1m56kBtXrUAYP85Ejfx/YKpoGNlh9rGWB57Exjqow38f6OaOO
         Ci6cORUQjnQOALvHWFgpQGztAkU/ZTX2AY/a4qABNjLDa/RpY0NYzGUWhiBO6mmqRed+
         wqKoyt0/QfkLVQon4ALkmVZsKIo7miYlufVIWkQGAAr87O4k68CnJHh3PDxl61J/cQfO
         GNW6ybbmhmeaADvIs2rZSB8/Zt39HCrI8c0kFPEn19qqhG5++/Y4+GR0gP3JwZ3KiwM9
         KaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528754; x=1759133554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=v9TH64AiRL/A349gvjoSLkZltapcGj01HQBU57mM7q1r7Nqc0f7YMjEXpJAgeUAkAi
         6fR03F3fUCe0Lp+HXXKVgQ4QfR9rH7w1lnd7A8joLvYIdxo80kaTU4yQtZlmPoNniPLs
         0834z2cDy6nNzY9sLnlam7Xks8ZXZmMqTi90vN9FkKIrFbnVhIWdXJbB/CHerO8D4DGD
         PoqpxzPRTWR6B6YMkDHZheuGfpsP+D9FerA+uPCvWFuXI5tECxWHE/SE43IQCt7EgiLc
         EU7X+3eC4H45HeKjkePbHMF9i0l9rwSe0jZG+z1nzsTGYXK+w8/Sa/LEHErt7/yee+U0
         pJwQ==
X-Gm-Message-State: AOJu0Yz4Hq/qh5nrkti2MPzbyAyL+ucyzT5PL1gjtKOCJMwK4A9gQgQj
	PRrJO1hQoSY+I145gtr5R6Fae3anCjb+8cPCwrtn0Yukb1nXlyD4YAH8
X-Gm-Gg: ASbGncvw6LeLN7lx4UmxqJtYHdAGoHM51xuW8vbVMUPd7bM/4plfkON9M8+IIum3vsv
	56s2HbWYXJXjueJ/lmNAgWggMQqG4tb6cc98nAY+AYbPwAd7mwHlfvIgQajpDQU22pAw3ncRGTU
	iWZZllFP2rcMBEomI4lOYLbHYN6Ng+8mp+LkUVlGHO/pTJz8MYT7Wi+mVe2QwX504AaviAXMLYj
	cENFMuFzTgPrTogeyHSl4siplqPzcOYmowBtt5pXIW+iH+2OBZO1bbf6XK1Eut/6RZZRklBVgo8
	dIvdColcvEFQ35dSzKZSwgpcPnmmpQvHYw2bbipCXnjL+FarQ3END7NIcNV7axlkdGOZX84FCNC
	lAKKsYHVeoNZiTvLFlKrauu+RMvU3g7BxylsatcXDmVZxxHH1AnCBsB+jSXa71RfCpWz/y5BC5a
	ZS4lireR9NP7eJwflz
X-Google-Smtp-Source: AGHT+IG7fGN4H1P92BRx3rITJwG9FHeCws+SAhbbvZLAva6UiKbmxu9K+H7jexOc/3MevB0fxM8y9A==
X-Received: by 2002:a05:6000:2383:b0:3ee:15b4:8470 with SMTP id ffacd0b85a97d-3ee85e26b27mr11700859f8f.45.1758528753964;
        Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07412111sm18642688f8f.28.2025.09.22.01.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:20 +0200
Subject: [PATCH v7 3/3] arm64: dts: st: set rcc as an access-controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-3-2dfc4e018f40@gmail.com>
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

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..fbedf23def52 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1677,6 +1677,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0

