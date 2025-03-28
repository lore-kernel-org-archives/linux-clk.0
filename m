Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F9E235BF0
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168684; cv=none; b=P4j1cCSo78ne/NNOX6A0SHottgROxHAml2X0Kcabxa3nTQphyUI+B6idlODbDqK1I/R9rdSuTKzOmuQM3BvfjiN1gG+zzxNUuuau3yi/eiDc0K1nDY3wKlffKnUC9ElBEWK9eI6hG38SOvkGHx1nG+4Sb59+syjX1qNln6U2MN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168684; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWQi08OIKKoP1LnajIfDhmAZ6aCdGtMiq0TddYTUL1yjB6kmCcFgON+6h/gV+vx23jGXKtO5WiftKGJBjeqw2qgpHbM6svxKyyRffTFEOVdjGVMZawPlsIMVLutqrqHgrHQm45IMM5Be88ZW66RP5HxekjQsozyaEoH4fQzjYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwUlwKuB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwUlwKuB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4139194a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=hwUlwKuBZEhEFyR8lpcPfVHC15a0AICLojQ4JY2LoB6ggUiO1gF2pWCHuo0ybTNct2
         PBTFuFIKhzTIsmSw5vSpcBv8NzrSQDM7DNl9v47UiFwpQ131T7Nz88eKxeI1kzZj9UwC
         dJseQsWqRladaQF4AkGCI9LJTvUm48xYFe/btTW/A/DR7soJxqQE1rdihrKMO/zHtr0x
         h2w1oK8ulWm9FMQB5KDIFnACJ0tmPINxSFJMhIMdzhgk80K0xzSPxFrMVV9wtiPv5uGX
         fI6im/mzTtm9OoEPXTgDYKoJkPu3zgkFrEKro/FHMCQvkuY/Yd4ZS1MverqaiK3Npatx
         4JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=oKrHF/tgiDxV13kmcgHUCvAJacJMJz3EIUQz5KXN2Ne8tU6RdULAa34hUNG83IX+8C
         EQYL8xGJWN4Fl7oSdJyRRAfkXpF+apNTntqnTJ8jsmtJfL7PBtiMY37Uc1i5snSh702n
         ZwHiTJHwO3i4ce1RyXp4eBv3tnrf15ND+2FqVBiaRV4IAPO7mcN6w/J4j/fM7ebS6x2T
         ceBR2BvT+Mc1a7u0drkxkhaZpdBmyJo8F6re0lBfvZL04cCOIzZx2TahgG8zD0NJHt1R
         VuHR632IUfXK78GkTA3McdnSrj5iUQZEZ+8+IRR4DqUD7OO19q7yeTNQD1XvFPLfQCv2
         qDHg==
X-Forwarded-Encrypted: i=1; AJvYcCUoKwXWbq4aR2fs9wE9vXivQUZ9yCejXA+pwBSSFQCBM+ED2QieGBvIBvVkDIfPRsdpcZosnXhBqzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxpJr4IXC5N+OfUGBYD92OT8EWpyYNiQq9BF8JsZSgWVaownGD
	Fe/4ourGiAGY4Gb/Tw2eYhbb2p1vmsc3i1wp31CUDKBOxTNRW0R+l/wPmKQSkDA=
X-Gm-Gg: ASbGncuBtWIuLFadgyCxAd4b/J/cCPKjlQFMJJfhgr3ieY2E+d4pezhMINURdvmlHZm
	1mbjLTrLDGpGDPHnMEBvUiEYKqi0Akq0mWBGOJnLPhcspDjR3eim1jbxM8NFdA+dOE7HL9ZGpCK
	MXG/QuxS6l2Psl4894/CNh9GYbDf4lWzSToRWrKBq5qzEBFLVZXxypSJ/zsGv7n0pT9Dew5thtb
	EweEXPmkdEX/hNu0Oqb4aoymNnhoHPLz+7YSFm8FfXbIvQiisQ6TdM4GQsL42PvA4mDZhM8qxn4
	uDL4jFQJsEWhhmojrwhI2QPtGHCEc1+uX1pDSDXd6IV2TsESkMYHG+fBJxRYMxpjT2lXYfLkj4y
	szg5tFsteuLKHNycyRR1905fKzW8G
X-Google-Smtp-Source: AGHT+IFcXivfke8CF3Ua6fUT95VkCgqgOsG78wJbvWFT6tJJvWhz2bwcboGbcdFVisEshC8NwxZTJA==
X-Received: by 2002:a05:6402:2547:b0:5ed:3228:cfee with SMTP id 4fb4d7f45d1cf-5ed8be108a2mr7864450a12.0.1743168671175;
        Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:18 +0000
Subject: [PATCH v2 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-32-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog

