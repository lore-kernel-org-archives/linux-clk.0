Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBE14A09C
	for <linux-clk@vger.kernel.org>; Sun, 18 Aug 2024 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002222; cv=none; b=rZ+gJzo20aYK9h/r4z0QMr0SEqT9OjG8OS2JjNWxcxsthzPspausv/am1V/bsVrvcx9M3ejglfu7aTv/UqCIalWS1SibOiqmLfHChZUtFPybY/xBlhozh9P1TrFNcUux3iifjkDDVkT1ex6dd33jWH8R3S/rn0DeC4KLIjcm3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002222; c=relaxed/simple;
	bh=sN5FORLVLXwkJ43Q7Qzr6kRsZnNwqAP8G08RJZtLaNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPDm/UcYxB6QvDMOAKFwhKvFhMOOb3gRbf50UJVgGAnSIMUk0xEDhy2EvF/KvoEISxoJy85QUW8y6oB5p/Vt62TFW8LmT29zTvTAfmLIkoc6W+IUGGyMeVsrA2dLlt+lj8IrXw2JSmadZcssh87IazR5KOmzNmdygdlX0UdFP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+J5bZcZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+J5bZcZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-429e29933aaso26366675e9.0
        for <linux-clk@vger.kernel.org>; Sun, 18 Aug 2024 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002219; x=1724607019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3MSSxP9rHAkbncpX6jbhl/iQ23LwfwRpJkBsCTawB4=;
        b=g+J5bZcZmVBasFI/R8L15ud7+mxdeIycN7ozYUKlCMpw3j4kGgyIKEdAl8tmMpHqsQ
         Z/ZIDGxgTgH2AppjBDWNIoMjYJ5ab8cCg7Q9Z1w4arHuzIbGQ87hjmseX/h2MzMSHGNv
         1DmP67Q3qMM1HiMvMDEoNVkz15AHXZiXz2vVPMs55m4FAhHCwKvkxOowTHTixPDu9qKn
         oPksiNtJfEH4Mqsi6tP7AekGtpds/9EJpX+h8J0TT3kpdFJPJJgIYY+6YaiAb1/G4Mrl
         3u5qTzqNjfh05apdiVgGpXg3JKUx2NAEjZbz8Id3BZnRXHJwFPm9+YvNlPpwIU4J4Sdr
         TAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002219; x=1724607019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3MSSxP9rHAkbncpX6jbhl/iQ23LwfwRpJkBsCTawB4=;
        b=M3s5TbPjxJFpObDNUBEwzxjHp31wAu+qZ08xbFiJ3tWuTBDboIyCa0VWFbRJfOXeec
         PafYeXjbiwqArwtYxMYizNxpBJTWNiUS+7N2n39TXy7V3L/bFRv6WPieUkDweBvF2hw7
         sqhIBf6MVMqKuUzCzfJWdst4ECcKwg1UfhQtF8kXuEzz3A1ysL3+NxRs7Kcj6jsXFcvM
         gu4eTLfu9DeGVLMa/42PmQ7E8QXCvG2rcvBqnAGRpUwXcsrwmYvbXPYNG7PoCmYS0jAh
         qvmsku7Lk8osrpAmbouBFCZr+v/8dg+V2nBRdLki04fXKhvXclMI+lROitJwKDQnT2mf
         1G9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKo4pGWG9Na4LliFQDlYyWnUDRxZqmhDnlNz8YiV3jlQQNsx83985x+WR/uJ1k9NRk2rX04BZGy1b2j0fWtFT6r4WJ8+8NsAeV
X-Gm-Message-State: AOJu0YwwjmlVqG+vplS68rCg1h/5kYNy6UOUYaf8Wyh6ONu4PabRTaqT
	w2BlcYtgFUp1DJkN7LUWR/9xuHLGz8NXd826VLLrQEtkdDyMMZnyWplT1qvyPrI=
X-Google-Smtp-Source: AGHT+IEPnFkHPz/DzJcjmR5QH1BJYBppD43D0BqAvj9I5k6ZQrBB3ZrienBffgoL+lY/tHnzKwzdTg==
X-Received: by 2002:a7b:cc85:0:b0:428:f650:6a4e with SMTP id 5b1f17b1804b1-429ed7e43ccmr55679215e9.23.1724002218616;
        Sun, 18 Aug 2024 10:30:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	patches@opensource.cirrus.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: clock: baikal,bt1-ccu-div: add top-level constraints
Date: Sun, 18 Aug 2024 19:30:10 +0200
Message-ID: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
index bd4cefbb1244..30252c95700c 100644
--- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
+++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
@@ -134,9 +134,13 @@ properties:
   "#reset-cells":
     const: 1
 
-  clocks: true
+  clocks:
+    minItems: 3
+    maxItems: 4
 
-  clock-names: true
+  clock-names:
+    minItems: 3
+    maxItems: 4
 
 additionalProperties: false
 
-- 
2.43.0

