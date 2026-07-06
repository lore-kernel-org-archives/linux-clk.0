Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6B3F9F32
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330359; cv=none; b=c4Mfk0JJSiOgeuFK4nXmsPMi2cAmTGaoi//LwtUbIh2dFPYj9TtnytKeiE8vGTyVjZgWhoQ02HrwuvCWJqGgFyLJ8WyfkrQCs6lHpNtOr4xvYWExW/8mTnN5flYISt0Ht8NGAi5CpUPEGlQFHqy0l51EDmeqpafXgeaSpEzC/Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330359; c=relaxed/simple;
	bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccwGTnd44amxiQaLRZg1JuQvTHXwsAQaNH22RXLXfYKoZQ6mdFUHKJNBKbGSYxrj9Igl11MNUwW6oIef2ybtycfUwDtgoGu/WBRPp7cALvMRgrCSzVINgXzlNnPHckt+SjNKKPy4i863KUKmtKcaGpVwOJjlVLY+pFe2IYEOi3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JcbKcC0i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JcbKcC0i"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b691cb44so19170595e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330351; x=1783935151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=JcbKcC0i07tG1RfyQJRF8IamZIa1Q+qCphPuDN86KHw35CBvvxXXuifVdvtlM7B8EJ
         jfghnhREBgD0a3gpzvy3CSC6loHpWQwnCib35owio8ALvtq9HyqEnSZDToYW7+Ucw6ug
         KyOWX2DRcuPh/hDhHwxI+x0wqf77hRVbz1U0Nv7stvg7krI5sWxd7iHNi+smDuVAi5mL
         lAy8o8WKDo+qloRzo4w33BAnCST/utCLi+mVDtstP3mNhhtUFMEDAFhQjXoUe5QbizoP
         Qc4Y49m7NjSwIGT511VddIRkdSCBe5cYZwCULPXp17EhoKRvpn+3i5hTrZnuy+qoAC1p
         VSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330351; x=1783935151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=bBHYYiC5VIqyOENFBTa2bTd3Yq5AntMBPPrFD7x56nhHzpzPmBg6RlU5E/jXwzlzlk
         eo/1kVPtqRz3KJOMgrdJ8g+LDqx610juuEmkQrhf9JA7lj+QUNMDcmytvbwOHdKoSQJ+
         dvZ7NztyIZ35pdnQDldmyJDi96g659/P4HW6Usb449FdfkfoErqSQsE25h7gF6urhLlj
         mmPO0DcPZ83ZbNAm5mdYjvFI2pnlClrrhnQ7yKFtMJcKlpyBrADV1P6+jwhmpFibaLuK
         wjTZ57M8Oe6SZQrODdOYOvM0vd7gafWV58/n3zhitBSvdN31VCCHqeCU9b6gajl0c985
         xw3w==
X-Forwarded-Encrypted: i=1; AHgh+RpGMn8iDzD1wFA54ibRHd3KuDJ+6Ka2WDOXzgfnSRKWfT9Re8xEknvCs31RCZp4gU6fcaQqfJB5hQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbNpUwZR9CBr1ynVF6V9qqpNC0uqM2jTUcX9NkxinS/oM6aXG
	edOVbk6ugSJZlqWGKzWiOs8j8CWE+yn2T1/5XT9WUAmP8T6BNdg94wSBTn9MyW5Rrc3LnyUJZBW
	OgtYq
X-Gm-Gg: AfdE7cle7hg3LfDXHfsyYgTCDEMg4JvCRlLH7I2Hkbhp/AvEuzUQe4V/kFfjtiWvoPK
	YpXml6XcPpSTDK0HcHYdYg/IYWHGp/6u+wxYu++7MejVlBmh7LaYGru07aCExz9lHLWhm2ZMa2U
	EW8gW1Y8ta0xjoYrmPCDG7MvwqfpC+eM/TEsGO+FJenXlgYp1Cg/lK7Bed1ZJFVcvypDD/gfaJm
	AKKp2zNl/7Z4I6iEAf5COD6xts+XtbTC69KaisONbeL/HZQY4Z3XAS5ANEH1G6piOS8yiQkeBvp
	T22lFgZR+LggWEOmmtdAtzK1ISlYqQAQWx3U4B+I6ZG0k1VVGEdTgGgoqoNad9u3AQsDiM5S6Yi
	+yRzdXHu0l5HbkieoiXcNTMufQQCiegafnYgaR/HT980maQm1/1xtBajdMMvhSXjLjYe8froTbU
	oMINH6picaTBU=
X-Received: by 2002:a05:600c:5489:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493d36ff89emr92048885e9.4.1783330350698;
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493ccdabda3sm274734015e9.5.2026.07.06.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:10 +0200
Subject: [PATCH v4 2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YhNvBcU+zfPLvtdyLov7LJ7ChlSqdXKOljM
 f4B8XMKRMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IQAKCRDm/A8cN/La
 hWYsEACIFKlVSVDxBi/xG8qljHYAcE+Vzkna4KsPA4H3Ghi9EhylEM/gfbNWGsdllumwZ0XfWsh
 G1Ym4aKkaadVriafjEMoEu1YTpCn5Lvm61eurZlkuWSbnw9cN+Ri40dA/MYxE2Na+MtQuDDJS+A
 GHRMZTGV+jxAUV2S+XCKaW/76TBfA4Bynhj5n5CM3fAsMdFUnlNoDc9btLmhXwyeVdGw/Caklfd
 MA1rVBuk9zkXDvmCXQbADSU6FGUj6qKNiLhgh0EpdU7xEaYq+fX/sTDHikjVAALxinGgs9qBT/q
 gtpMiD9mEiny6oclVQrLq0aS6dO34I2pt6Jsei8og6PyOqr0UMS3eKG8qtdx9FDk2ELORkR3kZB
 MJeXEqf0t1Xvt0fm3mYn57mhkkx5YhG3ZHmNQCTPGhL0Dt74Xoj/L/KcLZlVdhjyBLDBpz24GAj
 Mh50U4K5jDu6b38CSuWTm5V/kZ+p4OOU8X/PYg7pPhiK/Gp5j2YDo+DgAggzypTL2au/IJqYKAH
 rSioah1LQmbn2/aWV92ExcoKRLb6iwg87taBJ1keRyHKUVROjuCrElscmB51xVYZ/v9ahWWKEFn
 jI0YS8JdTMWVsvanDYbcg4BhEJPk+IlAMltPsgbQ4TmGcYzACxhMNZZ/UBZ2l180d4q+lWJLIWW
 PfbSdXBZmeKO0KQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

