Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987536A02E
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957792; cv=none; b=Fpqsgb7kZYfgmShTHZ4W9FU/pq7p60oU4B6vzXYUqrxlALFuY4/g+QgdyXkEupmNUc8U9M6ZQ+CZ92zBmgpja4O09HCSNlQ/SU+nRA5FGCfN86QTl1YIwdAvpwRQi1djY2JPIE5Fzdb84aOiCDaRkF3rjRzdqymETqs1qN+f2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957792; c=relaxed/simple;
	bh=7AhKBHwg3sF5ZQfICMhVBtTO5MM//2w9hYFIb8IP1yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBGBwgHdWbUuFB6N3jKY8akD5YoCnV3MPS+PcUtpZqMNFJxHZCyQPMXXwmyVXD5WakHxBLFTXa0VgXMTNsCRDJuypzBg8sbwcFO00Ct5rZkGzSj+F4Q9QsS/56qsd5zbKv9jn8uj57Xl1eq8CbPM/C9sfkrXHAqSWYSfx1GadlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlF05pQf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlF05pQf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso29625975e9.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957787; x=1777562587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=NlF05pQfvz30iToZPuVXHWFBWmVK7cb2B/KJwOeVySZZIS2ikJt/BRj8IKg6pIxHv8
         cobX1fG5uyLrMm+Vdqy968vKWoEUqRGfqtY5KtwKujTgl1/4Kn05ZwVaXVqelo9b2zCO
         97Dkd9+Vgbm0cjBed31iAYcU+snjv+sEABYNWuOp5DY1t9uITqW8zwMrXyyKoRNu3Y7t
         3SLzLsp2ocgYTz+XykRUIKZIWoslHdaTb7hfDjVTguhqM0RVjMLD2Hj1q2Y3BHcfZxZC
         /LSbphCxg2KsVqMkY5j9Y2SFMjLzGfv3KpB0or7azjs+kiZMhNUkgCi6CsE+zW1y66Gj
         9yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957787; x=1777562587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45rJAXYOq5QzWK7uWpAJrY/aJNT+spUoA8Oj8mxs4Uw=;
        b=H0e1lcIOxxt2BrvnRW4HxxxwSt+s2JpWuHkFEcLoOH7SwA+gdI7hZXy8NmMjlIs4Wt
         MvQvtZoE1HqHEPKgemUBO3bKMy4XNL+716ez0tjJN215mrE3UuaEP5mpyHEc52m1duxb
         hGhPwaBeBytggit9vPVcZm+lcmwrflnESrNfqImKP1SdO3pKZKAoSZy0rOzWWBoI7a02
         gI/2TosN4yRz6Jv9zY5bVg4sDTz8rbzhyNBEDVOoIhX8Nn1RS/WtYMD/Fvv0QcUIlFCW
         592xh9QhUCUlDZJny0AjGmASb/8fX3UP7u+QcTtgZ9I5dPE5F23/EQYz4IAA8lJvDeLV
         CNVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FXCL7hcBClWlyyipU/IofxkCSidpprGd9/ns4043wbMuo2JN4/9Z5FO6C9HqC0NVCnvtbTZA6PQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlmQWUUSo1vq3wvaEygJTVoRZQdB1fMno3pHfQs2junxHPTFvA
	VljIjvzMa0i4/9zFYiAUvzE0lg9AahkhJ0ei5C2fMNZOz6SFPVtiMjRP7+SJTLTGS9s=
X-Gm-Gg: AeBDietlduCsgmsZBxQhZcUQY359kXHfA9t42ipKDniQBL9tbZrd/VvTEEM1e49ZZJl
	ASgO8jt77swspjDJKXDsSbUcHhpy1fB55O7oIJbfp38LXy9bK0/BnubSm9SJ2qbUTLqSmnNFNB4
	HKin7jSbm+GxOobm8UJqfpATOCjwLmdMRAFEd73MKjMJ8IwiPdhXze2htQZRYSb6iL0C+J/dVyh
	lF7mLZnVIr2MjAFpdYLw1Wfyvv+fhMvOq3GFgqLhv9/hqNfaCuN8kZnZ68H2RnC9kflbzMkRRVA
	9ehEZ/PCMy3XWU/+bZeibwCBzS1r3Xf58cV8kmM+8qUbuorY/Fw0b+kugnbvYGi8nwVJUiQKwiW
	Qgtw0brN0slwfCtwLAJ/I6vugpJ8afDjN7kbumO9WrgjGrAkyu5b11OC+ROP6U6QLL0nMeXsSXl
	+mxM7UV/yRT7WGcVRZzx9ojBrEh/4/AgEdCb74LlLmbPg1bU8xXnnzwe5O6g3Pkz2D8gz3B+Bc4
	FjNKsPnYnlpDlPEyw==
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr299536255e9.30.1776957786885;
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:59 +0000
Subject: [PATCH v4 11/11] arm64: defconfig: enable Exynos ACPM thermal
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-11-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=812;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7AhKBHwg3sF5ZQfICMhVBtTO5MM//2w9hYFIb8IP1yU=;
 b=5VX9qU+w1MAGCTcm/KONCzXTpE/zawPv8s4NGdTf7+yTo8O2OSQ5R1ITDc/bhnFX4LjS7V1lm
 qjj5hM1FeU8CPP2c5DU5SvgZzv7wBhNlnAt3R1NZBOCz6liqK8uA6Jp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.545.g6539524ca2-goog

