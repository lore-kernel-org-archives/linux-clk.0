Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A021CA10
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231077; cv=none; b=Xz7uz/CitgCz2frcOdoHH4wIGjAshfgZO1TwbDrcypuF1fxBF/GCjhM5UB5LL5Yj97TyTMQEjm2LPAC2KfmZxCHCr0vLBlVrR9NYs1G1EmTmn73J3G2lpXYFxnzvxmqcH2r+fObSZrPzqpIjoSVKkrUZSB8j2enIZ0FYdHynAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231077; c=relaxed/simple;
	bh=CoKrSJInLiIXwlY1ZZ7M5lRUgwJwFwDmaqWcxDpmqQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdmT6WqSBX/0qR8fDl4j/z9bsCYBDdjY3gUB49ltE9Eq1OgLqq2WQj9p/roMIgR+FqPA/nQj85bhOPfFxlbs3PrLmwaamqa6PKEGeTxwmdQVzrkPv3ByyH5kFawNxT0HPhfzgmeC+sm3UpOx1vPv5FpYV9w5iqYQxOnNbcDHezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ2JPrfy; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ2JPrfy"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so13304766b.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231066; x=1744835866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=uQ2JPrfyUL4InhIYJFfMorllx1mzrBQFlwuQghTNuTEbVA9uzUptUuwbdJBoR7sROh
         daTsVIxDMfBXo7w+dSyQIlEzyUb9SpHT0s+U2OejvKDOAe3f63hTr98Ocglgvzu0kOiW
         5aPEr7xyLzTl/SR6ZlMYr3KMb2J5nR6dp7PwMY4q7l3ifdl5qy1+OgUVTT277z/DVMtl
         2C09nOWOU+haKmfD+V5qqmX+QlaBeru5pUvZXVlQFAbDo2gCCRE1xllwbOGyryoVxG9o
         dXbAP/8Wj70FG/MrKFv2EC/bpoxg3391AilSGNJjDySBH7hlpRXOohBHIJSVpJIL6W02
         aTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231066; x=1744835866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=jikRmuVXsCLTd+JQF7f+ePkn8TCTFcwqsOemM3PYr7m6NQR00zPs+5YmGwGsi+49cP
         /kmTQTZcOCeQsAHfxupUxqk3WjtknKMWtJVZUD2WbViAEOwEKoA8Na0qWnP9JUaVrjuV
         ji0ouD+TLixv7oteO+E438OKQx0LaYoPnwQlI/4cxViE0sHlKUkjZS7pelXkbudFQixw
         kMPFZQayvv4poFCuWVDd9zd/ZgNsAb7o/SFD4vIIp3KIQiOpxFIJLT0G3JSsYdDwbRfw
         zwm2xqlcbLhHgc3B4EcxE/hu/1IbhK/RjSQo4oFWfTZx/+qUQaTw+OoweSOca/ipx0VW
         VtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL1fEVgwTMHC6gSSqDwT340Q8ZVsnAIww1Mzn6Fa7H7Ze4x+0K0nL5yfyGdsjAcC/0PK3H1y1BdYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5MXGrRnz4xLSeiXfos88rtf03DTaXOjIpJ/drPFql+hwM2v14
	NElTTnKRb6Ub1omkwkuW9SEZz2XXIpbzpFgYy0Bfe30ZZSRhrCwHZHBeLsOFcj0=
X-Gm-Gg: ASbGncuLPvCclMe5V4x1arxofziLNoGsBNKAS7RP1DOzZf41bv/fI7PAJhqncwE9fJT
	Kq+rRlp6l2uemPYRZCaBF/YPgW0H3s+yBXdpHdkIbaw2euFNqa15hsKIV+hQLe2hUmrD6vKrQgj
	nHu8xl5pd5VY9csatnEAa0WWYaC8rGsWJeLCzO3xi3IwchNcSexgVFSDgjY2hr3Drt8yt1ia9O4
	qOMriRBQUr7ITQRaB6fzHtmoCkZQHwgMd9T1DjfUPUNudi6hrL5B/WP6gXxu9QjCt7OADb7/FNy
	1mzklKfn+ljoCSB/QRjuMMrusZ/vT7EqbPfzgkWq6BoSLPr4LzAEKj2EX/q3YoTZYOf76CEuhsj
	NrTNXo54t2jGGbAChDwo0Aa1RoDM=
X-Google-Smtp-Source: AGHT+IHIxFKwjUo5uFV6Jyj3wWXPZsF8lPwam2ydOiylWhWcuYhWeTd4XU5X8ZDB51XZhRzJ2FSu4w==
X-Received: by 2002:a17:907:7d8b:b0:ac7:9acf:4ef with SMTP id a640c23a62f3a-acabd4d7131mr6904366b.56.1744231066055;
        Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:53 +0100
Subject: [PATCH v4 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-32-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog

