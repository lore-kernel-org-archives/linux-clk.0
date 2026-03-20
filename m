Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E6A36B06F
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041321; cv=none; b=Jn9M/d4HWvD/8JwF/XoAmulYSldyVRHK5B6ubCpbvSreaS8mHq7oyUzrBCFkxFn4Xv1fG7GMGbmQskAEA8eBYlOebvD+HzRcBLkZFS3xGGb7w6TDENiRkBqbVrJuYcWq0T2qFmzjFHy1TFIEhDfTlPctxVKLJENmbyEJ/oAN6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041321; c=relaxed/simple;
	bh=VfS6i6Q1Xha9qkU4i3chmoL3Qdz2CyqS9j/LuIP5U1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/aFphD/e/Yeym0TqAXMqfOfybKNT5zR40eV0B4WyVTURMVpPf4rVvYzz2cA0y0oHq3mAx2G1Q2qIWv1lNUksU9UvCuOpsubHxTlNGoNcLEUHo436RW2pvFmHXUW7yRAcraOuuWUDd8iwGO1zgvArXB6DouDUi8TMb9fvkLiIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nN/28SMl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nN/28SMl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b40003d13so1538749f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041318; x=1774646118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=nN/28SMlm6Omv1wie6ls/xdHKrEtBWWzkFJs/V5zuC321Wg9TLWIwcQHUWNttbqR42
         D6dbBWd8fnhp4gwtXC+Soe9tQsEvx/gj3jMufKBW9NlFxUi6GdJtPjVBpihUcvQWWV4F
         3z7ykxIhHnfSrYzHL3sz077w68v4+r4oNxcemT0RiGaPnonwguB3FIicGtN01wFYNo5S
         hqjfCFiOd2SBn4r9pfUpM5GBnbZVpnVdPoj5LhF/EE7ug+ze/2IUnfuNWs2uMpyDy9wK
         jcCGDoxerEKNHChgM6iBFChyF36O0l5n73pQQMR+AX2geLmPqcwhAel9nfflBEqEvab0
         dHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041318; x=1774646118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQFYVJlRe1oBH7q6MuxKAf35Jb0tQ494FakvV5sn5wE=;
        b=LNtV3gT/egg9S4UVI/tm6EjSW/NBt1Owb+NXf6OmI6E2jColmWpIrRpZS0KjUJjnmp
         XUCf/1m4R/OGQK60CEVG1s6naR22iV87+rxx2fsAILMWeAm2S3vaaOaxiq72z2u1DBK0
         EmorW984Q1n/QUVZljygB2payqPpmf4x/UDcwuBexfUXzGqlph2Ac0mZ2cknOwXRjLEL
         lMIscSP+edcxgIheqAitkcoPYisDSoQA3JoCVOMdhxMUJn1W4RTMwPMzNBU3rz0fxHGK
         /y6F/ZT1Q98ffVGiDDLkQEcmBYqteX3F5G14PSc8uC6D95tHFdpeHrqwxoggaUbEvWtb
         SPvA==
X-Forwarded-Encrypted: i=1; AJvYcCXfBHvPKF0gOhHzeO2laeqiYO8b6J0uKJXvfgLaRUYbsb3tM14H/gung/VBtL9i/zTu4hqXCtYy2Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vD297DtOJO+n2yes//jBrtz6qOhunyEfoVoo7oKF/NQXGG/V
	kmY88VvtoOcWtnYW/q47/rB6M0lG82VFe7bBEDBwXHo5zDrQpRajP++0LBO+ImmHHuo=
X-Gm-Gg: ATEYQzzXNVnThKQQOTQbpRSMlubbyOrzuGnI395zK7c0jxFKoNEuE9BSRzZ8rwUDmuK
	Rdx6fM1MwOePvCbaAVLvQR6LpVEhbyRGExCiiczSfnYxsGUftKOMShYA9QsIcHuJJJumQkCOfk3
	rn/W/WHrWmX7UKCNARZLl+2+LpZKRwzed8V68PgEjgS8Fof4d0gVLv33Si6dd5gS6AqLnmVcY5g
	4FMRHOpc33I0am7gqqU11YRmXWiFEnnSQwprNclkQKz7W9Hc8BTnnGKbMDV+PSof3S1QdACi+48
	aCcGTjfe0fwn6m7QB1rFhCMBRmyQf+GGvghbELVa+3Zry1K6tPjYJDpLOjDocEVmMO38ga8NdOY
	2fZrw8PfEM9259edOEherOI2bDNxlK5K66CljZzt1A82lLmNLYE8sQpz4GaIE7UmK0ZLa9x6UFY
	CJF7C/KPtR23KtDLkQpOfvnTmhY+bBjw5t6ya/HzSFtZp85CE2F55lPi/JxWYaw5ps2W6PCvncJ
	nUzCCXOXqcBq391Z86bV/q89g==
X-Received: by 2002:a05:6000:18a6:b0:439:bdba:56be with SMTP id ffacd0b85a97d-43b6424067dmr8157374f8f.10.1774041318039;
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:13 +0000
Subject: [PATCH 1/5] dt-bindings: clock: exynos850: Add APM_AP MAILBOX
 clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-1-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add a constant for APM-to-AP mailbox clock. This clock is needed
to access this mailbox registers.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 80dacda57229..95285589615a 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -126,6 +126,7 @@
 #define CLK_GOUT_GPIO_ALIVE_PCLK	22
 #define CLK_GOUT_PMU_ALIVE_PCLK		23
 #define CLK_GOUT_SYSREG_APM_PCLK	24
+#define CLK_GOUT_MAILBOX_APM_AP_PCLK	25
 
 /* CMU_AUD */
 #define CLK_DOUT_AUD_AUDIF		1

-- 
2.51.0

