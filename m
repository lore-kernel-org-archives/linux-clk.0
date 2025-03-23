Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159031CDFAC
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=sWG+mx/fImk21z1EKYqytGJRn3jpDZrdH0GBv/3k2tx3NWWEwdiOQTawSTBNKp+BHbo6LGV/LDUf8gGFP/zWW6T/JmEmIgRJPu+zZrLecN7Ddq/YkXWIXAKPXHHN1OK5pwenC9FyFmEoSAOmZgsncWbghrRnyP/OQb4JSUnAIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=XTbYOFxDpYMNG8kdQks6GusInksI0MrF0HPSPauW9G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYsm7fKeA+/lY2bKhrZGU2L7ov+JF6DO8jwaecq68TVnyO2EbAsriyvjPg6tVKsPxwKdRQfuMasU+BEWkyQBS2bFMW1B33bbSqV3wJSj98xmi7oEDsT5siH3LE2urmqUc55pERDYOzmZ/fsPFCNXuSH7ZAnNIdHyYV4RZU2b+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzuUTZ3y; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzuUTZ3y"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso650971166b.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769581; x=1743374381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=kzuUTZ3yS73U19jU458nl4lpuBO+pGkSbFABOeVGkrN/8tYQpXfBQzl0846vbtBIy2
         zEPd2TgwH5Rfswn1yHu9Q6sv8fq9JW/UO+OHxwUChNyDghBi87YKZSjr8Bv1J5Vdsyt+
         ii9B2bT6zydNG71B8paDRSfox2UjOaJk8ykufibzIHfrkKvOqayQVTx/rr8R0DJeHvIN
         TlKk2rjhdfebUsMdhdiAkJSgIgSsnj4QmlU1jn8IB+X4OxHQlV19/Wu8kbvoIXl5Xv7h
         Lrv8UBKbL/E34VKwkyDvSjtUVveplHcvAXTkzxXE+QZqZDauZ68Qu/xQDifqWTIr6M5a
         NCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769581; x=1743374381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=lUbsML9AwtyYezq+50i9Bk9TpZulSrCZU+rh8Gz7pazbF+8ir6L0YMvnL7hyEFS3/7
         V7fWqwZAZROl37VM3A8YG70Rd3VQEY2oHM35ry9VwI2bpLZO+keldzyISnototeKLhbK
         FrHhx29ZI77TB2tz4FdFFezO5h/BxXHLpfFmCl6lJP2huDn3eJHsykDPlfDG2E68By+i
         6PZN8q4s9qxMdKyUIbdeepQAzs19zwY8ATHoQQnYOZaoC+UT3qQg75S7hulK9feIslMc
         +BmtSeamh+cKszqXFGbZP853cZLaHTGWAj6jr5gjwanBNfo+kARSLDp6I0HWlM/gruf7
         cZfA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvgC4CEA2Xe3WoNuTiCoVnzIvRXVgAuoRP2m5jPYS8sWBqyuuOECaY1ZhmD4PIjeNnsThBy9u1DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+s+lvkoaMhLMDf9fL7kJzCjvmyVI6cHpyj2zklsR2QipWzRYm
	E6W+LX/2gUiZ6vMj2aDExroDxGr6JDMuNe62WSZuRjHXtmS52poXrzH2dtYxIkY=
X-Gm-Gg: ASbGncvOCTZBqeweDkAPmGTe+98wDDwZ3lFwCqMNFSSmdImAfOD9dcJdezWF5IeaKWE
	jDd5adeQNAd8Yy+U3a75gDp+che4oxoOa7Noudwgocq0jJahz+SK6rL6l/1jhdQ/hawBZkLDltB
	VcPKrtU3szm+SxnmCJSwPM6R4af0xZ0u0i/8g/ycnCwo4efHaYWIPsSKgZyYee4WC27H21ITGPa
	ZvULArJYhbXLhWz/Fv8mWCv9qd8ODz3D9BAV8GUlQu9VbQhSa4t49jrsNbKCvt2s+GJH0xrrSzf
	EwulKHzsGlMPooLmHPWdY2skLh3MM65F8c0pyPw0knsQlUQoOCWNdqi9GS/Km/rrwPh7Olz3tWb
	ZiAbKA7qfTmYC7lSWuOgVn5xAwbzk
X-Google-Smtp-Source: AGHT+IHUwVqfRBATiENga8y2WvKZVKOrHZpSBd488/sJ0QhrasF7WRCnvzn1JwM0TwTxkLrFTUS5Nw==
X-Received: by 2002:a17:907:1c21:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac3f226757amr805060366b.15.1742769581299;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:46 +0000
Subject: [PATCH 30/34] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-30-d08943702707@linaro.org>
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

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.395.g12beb8f557-goog

