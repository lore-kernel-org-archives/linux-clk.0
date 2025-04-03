Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81797243367
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670745; cv=none; b=ApIG0wPB0y9y+qqKbQ3C5p5g85w3H8XcDlTqvQeWHEG33rXlRROrXtgsoW+pFchdbxFlXROeLYlcLK7kgvfX8WWVNHBISoCSuSj6UlkKOoPqgjJzsNCVeUOUpRm2yJZ76RPhnilG1Y+nTrs/L0NwUtNn6qpTLaFLircwaURc+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670745; c=relaxed/simple;
	bh=rtY22MgptB+tLy3QVxclIgluL35Op8OhX0cRjsl/mJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRlmUBFH6AWmjK828nsOdK3k0H07ek/dP1d3VG1vfBZKUIb49evWQ78eVrUWri1Jdm1R+vcHI3jpnkhSp+oR6tNQdeCjPYPLE5HVdD49LGiwOgzXbu5Oz3w/qzt9AnrOIrw8alG/mU+68TWxbxBlLMXUf8tub+u01VRiVh/LzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0NweKEI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0NweKEI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1099475a12.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670741; x=1744275541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=o0NweKEIpkWSH2jwsB74/XPrYsHAW13Na5HzWQ34OX2Ui5O/wl+6+9VOabs+k5g2Xd
         ORYcdHDJCXk3sGRL9TPgxSddIrQ1C/3yEq6pTHUtL0vAV1ruzHoSXV3zBGH/EoPgt967
         wZLqemNLOurWbEOyIO+rzfczLEcU+5aaN5+mZKRW3cefKIpR/VXSRSZhyf96++Vc838m
         VqYRzbh0Kr3rWaD/wuhr7z7KllYhGHR2s+NqY3ZSKdRduqvcLsdWtdZ7COsBWofND93A
         3VKEr4Ur/+97GJrZn38FtaHcig47HMMNgoxyfoJPFGEThbt7sPyYlM8+fp/pcwzMwfNP
         T/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670741; x=1744275541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=LZBKZM895VppVHXLvcVBLFxwkB3Gelb4EpwYwP+vWrI2+p7u4/wwoxrnxMs9IKUJ3e
         DxTa97wUrZOCRb7J+vC0DOFGVS2pgniFNyFujdg3Q5RXgdIAaLJCz5gDJVaf+DIBLb37
         bu7osRE7iokZi0XrUcefVKOUkR6u5SNXMcNX9lDN3ixBjFuu9M5cOThJzrwbvXEQRnuz
         riaMJrxfGL4jD42JVEzfj/relqL9ABvOWsZHIr0qgjUCGyFRRTdnh1gGGusvs+qh6T4e
         vyAdS+UA26IEJhVifLri5JH1sdF7SR1ri0MKUerbM9qPjcJZWtyTqq3eZXpPILMR7Yfq
         vi7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0EHD90mFyfvH/Sck7KJBgGbWFyiyM/EfuTq9JtKSWK6FXwygJXB5sBpdAMo3WsAXxlXjKCjX9Ags=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgFmdXCMZoq0c8JDQ80YUIQbyuBCnGhmicLT7p2gWxO9MZkWK
	SWww/+HV8NP5TeY2G4hiijuS6Mo9EscxHp22Mdp9JBf0HRK2LZQT7deZW/GYfnI=
X-Gm-Gg: ASbGnctEhUTUPeMP0o62ogKxGCIokmqzH9Zx/rWQrGjVwqwMVQkw9QeqwMxL3nviK0e
	PrvbgiNrkx5Ovm6seIhao6n+AYO8EIpbuLQH1EA/XjBRlh4oSFXPFfGFmbfV6ICzOiS82v24LUJ
	SLQKju0zBkcBqaWizhE5mW5OZTJ33CvKgb83MFsStG5bbHSpbVRBQ6nzHFtbu2RldfRoFguPWyJ
	fD8IT/n9b6cx5QDKJA3mobeCoTUAldMyQ4n6WZZl6mzApou8I5ghdf++h/+LfI4MkxDpXdRsnKj
	Wd+yoDALfTC/wyp2RmTJMD+F8493EwTlM0aw2waqu7PJ/ybaREnlMr4lq3osj+VoHtnoEe0cmWr
	J7rYtv2AS/jHPtIgpVMYIq12yXYR/
X-Google-Smtp-Source: AGHT+IHQrHf12EJNK/p+81ZjxQhmjVXLedkpjwoD4qMiwxw3fr2xU8zdguaJrZmoo26ZrVzwsXGVGA==
X-Received: by 2002:a05:6402:2802:b0:5ec:cd7c:de55 with SMTP id 4fb4d7f45d1cf-5f08717ff38mr1640036a12.17.1743670741481;
        Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:56 +0100
Subject: [PATCH v3 04/32] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-4-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog

