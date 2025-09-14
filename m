Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98C26CE04
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853764; cv=none; b=FjM9RU0IGhw3jYt222XfWjBZQhqZpLhFhxBozfritfdaw1kW+8Frghc8V70p/B3C0TpmtsWWmokA20Ktt1ne5olWf0UBV+/FhD/Ua5QhNbgwj/HLtK0GT0pgC5JEwTwmqA7xv/w87m6Yf0dlM9TxDcJqVk3ziCiKscqjpoT8yEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853764; c=relaxed/simple;
	bh=BohS/rc6qOfBI1KkyLNcfUimneuQ7sG3nV/JMTpWO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L76mAOYs1TsHOzDQFQqmLdblI3r8Cqbm6ZZgRsYiARkr9r+JxTLRvT5Vv90WDtIV7MwRH47X4FMoVJD4ULmHMaiGsCKL//0+2qBsCa3uUdAEltdI/iyjCbkJzOL0uJ/WCwwO+DdM2rJNSMQXvAam3/ZKwmAT9Sl/zx4YvBNv9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=est7Cdnw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="est7Cdnw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2510600f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853761; x=1758458561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=est7CdnwjfHJ8I8fx2plLYIVT8IyjZE2DFzVong6BRhvoA8lbrCXZFgcTdjDE0ooIr
         YZLx41m0N62rTzdEyAmn62YBdh0PRwYYu/2KAYTYwF202nTo6VB1nqctNgthAa7c/ikY
         oHbkd0hHAg1L31qsPzysIUkLz21GycWMbqbvo8rFidAkFP8TOTfIVWrvl41EokS53Gdp
         D4/H2zWhTZpHlnWlCHTjLcqbWTlWX1fzaqmr2r5INMtDgBJHi5dtnVSaBrowyAUss82E
         sZzjgjnfQnEFjMZAnYu+Q031Ld5x+endnHkbmXkIMkxPQisDTOmYZYPL0rvH1nZ35tmQ
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853761; x=1758458561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJlsN1Jaqy7XiIrMqRe29GOaxskmgZS6O5NApkSCPIc=;
        b=jEQAAzjC0eRYAT5o2EI64Fd+JUJpVsHAjHyD4KWeSz0XD4OF6GVMpvcZUdVHz+GAn9
         JbXxKmLlrqjw5yGYFDfG45C0SpsuvCz26VN25q1ig9LIMMiI+UXiarmbtxk91pR6nlVO
         HFhPPurO/tCMzp1I/GHEeDcZY1CCEnh9xU25YPPSIsstvoNyyphbSha9PHVTpu4V+vWi
         Kg75M2DJxwhX1UBosOc6ImumQ55L/hrWoxAHtzwavSRMtyGfLescGmJj+dWyRH//I6P+
         4f7Zh2ux1V+o1F4OREeDv+JfYreAqdlSeR2+8N/TDAcamzIqOlxOROZkP2MQRngXLXAw
         ge7A==
X-Forwarded-Encrypted: i=1; AJvYcCVGGcozYBw0ykGE0b9lV+fyLTYi8S6wMqa/tAflOUOHhrtxPpWKQn4RcpDFQsujLLxbiufZ6CKkXdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysdnjRWF6HGF4kGRJrp5bcKuGaWyAbgFQsaTzBMni785cPy7BR
	rdpLKXvaqYtbRl8/BoDmgidJ64jUVuHj4lgwLZyb7dDLZ9lVkdwwe0mm
X-Gm-Gg: ASbGncsLaOlZSI1NZomB1IuwP0gyrLz2hkAdnKSkXcK9ZOxvpjA7DEcglwl3juyztB6
	g63iR/z92iHEdzdNIDORFDmd6QD5xQmdVwK/0JLpWqkjMatco1zkSk+tIo4YHBp77CtGghKHoTw
	Gtp1tbBfysY3kx4Csb7VCV1Gcs8FnRc8f7sGlGjpCXfdVJ3YhJ0kb12JaYlwRo7SxpQsWEsOPrq
	COCm7v+m6KBcCA3EiUKVjC6Et+8XC9T66f4pBfSx3l/QTXh/vVJRN/3kApB14CYql68z4/p4/Vk
	LcR1urT3k71dZLA36ewo1uEGgMs1keWB2x/9Ed0fdlw1Hra19Ya7vX88xu5w7FGA1NRQaS+CRTp
	Q46+w4PCdNRFUvdtzxrAkcadmwqJ8zcbeMsu/nYccUXEBa3owFdT9nT1bYEVm5ibu9VREURzp0Q
	==
X-Google-Smtp-Source: AGHT+IEXZd7reUDziErOplgPo67Tm47g/zLW7Hg9UIF0v+P6mjh3cSDXIBSb4wSjeIaZ8c6Ls42mhQ==
X-Received: by 2002:a05:6000:2504:b0:3d2:9cbf:5b73 with SMTP id ffacd0b85a97d-3e7658bc950mr7945343f8f.6.1757853760855;
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:40 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] dt-bindings: clock: samsung,s2mps11: document the S2MPS16 compatible
Date: Sun, 14 Sep 2025 15:42:23 +0300
Message-ID: <20250914124227.2619925-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S2MPS16 PMIC, alongside regulators and an rtc, provides 3 clock
outputs, just like most of the other S2MPS PMICs. Document the S2MPS16
clock compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e605..e1666fff0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -13,7 +13,7 @@ description: |
   This is a part of device tree bindings for S2M and S5M family of Power
   Management IC (PMIC).
 
-  The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
+  The S2MPS11/13/15/16 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
   outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
 
   All available clocks are defined as preprocessor macros in
@@ -28,6 +28,7 @@ properties:
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk
+      - samsung,s2mps16-clk
       - samsung,s5m8767-clk
 
   "#clock-cells":
-- 
2.43.0

