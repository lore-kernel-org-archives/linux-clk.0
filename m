Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2624293C
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670770; cv=none; b=B/7C+Y76vpIYD31d/74HccdRRnoQoUBuJueJo+mdvgUjFp2hBi/3PuIx3CkKYodHP2IojGdAShoHujld6XDJXae0XnqgxuOopneIMKhvr/cf4dHQ1p54jWyu9t7WzS0MK6C1XChn1hRkicDsGApvI5r8VhqBDnlvmidzfs6onJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670770; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGk4eIIojL4Vo6HsCtcXfsztO3SICCQs4pmyXY5VzHcbhf7Z9EiJnwIdxG7YUuC16Dx8Gga4HYTfkjdPqxfki4h/n2Mnz4Mfu9+XqPcKw45WUKGTd/PGEpHFOzjx9PkUY0bppJR1db83kqNw+9Xhnfv/qUH9thO7sbZ8aybXQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKCadj3y; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKCadj3y"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1220917a12.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=sKCadj3yJo3JCJcQbG8ljCh98ao0jmPNWJjFoo/83PbHsIxh1WRJrXCyEFNnjHnnaE
         dUnPsC5DCafvc49EySVtc6597ytJncgH42PRCo04bQmbkSfbIK8oOz1gxmGqWtISnEP9
         Y81Do0JzErnbwsdNRiAub5aQmyDszrvT6IHnEJrMu+1HIThiYzIVbUWrNYO/s0sU7+qz
         K+J2UMlFbL96hqJRIuonbrQU/oO/dJBnij6zsYA7161bz6kXiOSV0cWg/KcDTunezmP2
         ZrjZDHF2uyeROZ/8ugTOmcsHo+sKLhOhcfPy82/jB/eKIoaIUD0ra9VN+O58Y+igJE2w
         fdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=tJ820Eip2ulYIfUfGRwp89OPm/3igNpfSopuEMZtFUmyiOwvzlVTaOOLdDMUu9krkk
         mD6s4R9MDFl7xm07KAgX41tnHaeZ1JeXOD70nYh78f6QZq2x3uE+EWsdcp5YjFD772+C
         TDo0PYmIACFrT5teDDzonbzVddDPIeF0ctq++EIW5Aak3gqkb78xMewa5JaYYKvlTF7g
         JJwQhyKC5x+/bpasT5U48GgbAAVQY/wUBClRSa3RAj9BdPuLBW0omBvtCWSVJv7VpXVx
         4IzC1u1aonq8IcEMEa2juRRONkGmBgOpVRaKwK2Or/QQ28wZP6LcnkijdW0aN79chVur
         hxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy/UC0B0MPKFR95zKcRXD/FMnkRRFyUH/c6dDeeHLfvAF4bjLgri/g8daVb9iHuMe+TE938CtXsoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqCLA3oE8+IAXlhqE4J8eMOj359Gq2PXTjyJncUfgFRnAd/Oh
	WOGUtQVYYaj4yOIb5PdE5zBwpQoJg3cV6gIbi0vgEgWLz5lO8Q7k/GlJgmm1wok=
X-Gm-Gg: ASbGnct9AAdh+F/kSnIXKrjh0WFK9J09+BMbZO6ShYfzIJpAxFYwIFMRnPiSXgP9bNF
	p2iHNR1rZVk1yMFVVArc1jKwr3XJB0aalPcmCMUQiEyaKQKSvkuCWHOGHWLgfYw+Ib8HMaVSp6g
	advW1DeY9YajYNIZEjbjalLMAWFQRFPbtYEfh+qFHoJNA3Z+NW6DwpKDGJeb2+9BSxyWvq7ykiZ
	41BhDWH+KQ+9/+ZvQXuBCQ6B5vUcjtRa2aMdKhApOhh36oL7/Go2Mfc/y+PI/1zfZ6rgw05JRIw
	EK3Xwz2IVgmtwmujpZODTg0adAYpO4EPmntTzpBXul/X3H+6eYTj2YXfSe050it8Skr3RAqX7Gs
	IQRYwSnjxbGdXJMUm2i/RhnOpVfA6yrLGM3p+kkk=
X-Google-Smtp-Source: AGHT+IFW856PFsje+adb2s76FgPUdBl97yj4uiiEZ9rOztAG85/+V2CgHnNshHz2zvEqYifTEoo+Rw==
X-Received: by 2002:a05:6402:1d55:b0:5ed:5cf6:e168 with SMTP id 4fb4d7f45d1cf-5f084177cb9mr2170046a12.9.1743670759408;
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:24 +0100
Subject: [PATCH v3 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-32-b542b3505e68@linaro.org>
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

