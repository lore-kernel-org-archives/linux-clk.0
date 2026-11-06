Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=jNuDBgGX/iOn6Zen8nxjpk6JoW5LSu3vDV0+KM4Uprg9BvmJWV22KCsb1VfJHgQZY0Dw
	 jxmTq0FfZvDE12S+atUfPRLCbgIeOifI7U6YTzTjo5RCkhaJAfKFe71DdV73mOF8MJbDo
	 HiIxGuEc3Sy0A341nYPGIetYyvyvMp4F1+QFLVw9imSrRdBytoof0gycg5Cz3F5QMPhx7
	 sC88ozELCp0hC7pb7l+hnL7riK7lNeqrQWc3JZZ4wfastDGhh5Jtmi++LgbaXauNv2kyK
	 yX3B6GftciqiaVyD2tqwf8amd8i2Hw7VBq7ahWFtItVEF4tTLnhwVs01FcOhLCFNrXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
	b=rKd7bZ3J6uG1rZfU5VdqJ/WGa1oPF8MNT9WQxwLJUFLS0pSemkHMQzviYLOVR4NjQ0hl
	 CeSyftY43iXZD0Q2cpYoELAyZl2L6VwgShU8Ldqkp0fhIxwTGQQ8artoQ6xGOUCPBW632
	 D4GcdQwwDvGecSllqsqmN4xUM4g2IDC9GwcKtthlavEOq6GofZk6VOIHa51s6tOn/mEk/
	 km0GaDnzyZZGEXt4C5XRduxOyOTQO9beQ4pD4tRNwbsLukxP1sReq9aKiIMKhBmOUu+NR
	 u1f3h/88dfbeQUevlfVdCDRSg+9yYwUXZbsf65ha86lnl6VhWOmVTaZ+27YyGsvc75Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4AF606A339
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4AF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2110495e9.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953834; x=1794558634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=pPS7RQZ9YBzITvDyMolV1tUP/Z6xqvmB37nu+uq5cSyvHODwwotp31XxR2mfuDWi8Y
         RcPxx4nAKwRpth29Tam+Pzc87rAJ0xLSV5klykO1tlWzDJhJLd7hG9bjoZHEXYC8cr1b
         y+dxjfqb3fDdlqtMO9mE30hFh/KW06qlRHGgurVNTASuEZeSukhQEwzzXOGiOaKSsDyM
         b5/bj6VW1bMYdOH1IcM2ytAOVm7EY/1HHXD23XeYwBBnp9kDXzvPHRjopnTpH88NaVXh
         1G3kF0BzUlNiY7XVgKh3KbPLWNtc4gCyXTEIDFO19wbzbv5fKzsqIjx2IbaqPYW1lz5X
         4SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953834; x=1794558634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=SEg8vpQr1FEV7Ur0/FP2zO01a4oorFj75Q3nH1v7No0a9qUAS2yOUrWS+HMWJrymIr
         wsudBDRJdPQQ/OZZNSOSFrH+Hyasqosu0F9ttXVaba19dZlVGe2KlMiZSSfad2VxDyQZ
         /vUHXenQCyO/uEX+1YFu4bcIe9pT53t411Ko9yMoaFFujdpY7CipYycwq0xYJOqi9jmP
         iAZbFvEDysidpks8wVtuoopmopPpKeYltiQlWozBCM1xbYUlAymx5L8e1kIJhEYS418a
         FwkozI6yCS/loGejW5FZuEv8ImGPbmhV7Og/UWTYQTWo37/+xHdEU8qo8nSzPdLZk+zL
         oUIg==
X-Forwarded-Encrypted: i=1; AKwUvBwowUpBezQ+ZFBbpmrSDvdRNG99cgwza8cg8V8a6QrHas2JA2ceDqo99t3S5a+Z2/3CZIsZz/+Ke6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BVGXa7ig0L9AvJdicratxMMfjAHpjuG/p2Tygdoxt+uy0lYBh
	+RJ1weNemYfUaWvgLtOF6dfkfvsr0bIsd6OOJd5sdPKJ8QovHh/V7vPM2pyoMhN98CE=
X-Gm-Gg: AYBFou33coRZ3YrCtbnS556AvCrb5pTUILrOrUIThoP2hv/PZhEviMe21xysYEaPnRq
	6PrzKmGO0G+pJ8MhFKnp1retO85W+/y1GKITRsVPYKt7A6sLRa7QwInbNCUPVCJp7gCx4U7YrN6
	7vKpCj1K9BqDYUIO3QjSOGH1vdJIbDQrapeZNCJxCozOwX2LQcs0xW4H/sCrohSb8gvujrQ0fau
	34B6fASn3qv2NzSRK6YZWLAgUFSmQdvXwUUJL1GO+dvpxPF33MlP9kZjJEdtTQppm4PB/rluR6L
	GD2tPZUthZlxhepMu7nay79fB3b+XYJ3sbMEj5M76d5B82tOXDrYkz8shWdVEeYYVj0N0VN1/Mq
	nIgbSccbQdFhAZuYI85kY2Vk98J+nCaW8pEhDtzxM1+aI4WmgMhY9eTokL6TgxBRLaF0J3CIRrr
	SP0lySNMsoCU2n0geT2MW2wLyiZeVSIzcKEBI0i4U46kQs7k9zd+Yo+wW51KVJnuarcuWp+I9d5
	3emDIfJUSm3cDDom28O/YKDWFetjzNtBy+KfdFSYNc/9Exa++hVCaNKsSrQ5CiR/ObzWlp3oUjy
	4PuZXsuXV04jkjTQWEbfhwXX18w9uyDI8rbw6ppTL/ogxIeDa+MKqMZw6kJksSyt56syzOVXYGn
	lkfYCF5S1/4pSfDGWYs1qn7CP3J0uC8jrOay++rJHQ9vgvQ==
X-Received: by 2002:a05:600c:34ca:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b6deb5ff00mr24355375e9.22.1793953833711;
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:24 +0100
Subject: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 firmware exposes clocks through SCMI, including sources needed
by the other clock controllers.

Define their identifiers so devicetree can reference these
firmware-provided clocks.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
new file mode 100644
index 000000000000..10d7caa5d1e2
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __AMLOGIC_S7_SCMI_CLKC_H
+#define __AMLOGIC_S7_SCMI_CLKC_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __AMLOGIC_S7_SCMI_CLKC_H */

-- 
2.56.0

