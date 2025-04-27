Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB124A049
	for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739857; cv=none; b=iJaZr6NWv10LRswb1gN/D0Izs7LUJQoPGsSvTbTWIUta2E1QSWvlSQVWZDQNQJdG/f/RjLB/v2EhWpYqNKgOywmjsI+6EzTpvVz6yEO3MKxPNupNChI1mZAi+Ex5kje9pjUgyk7q8CVe+gaJA5plMRg161GBJCwiJMF45z2nT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739857; c=relaxed/simple;
	bh=LU18ejxajg8FSFquzPkM9qPx9/7bPG977mh2EZyZ0mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ayv7Ht7VfJ7qhDBB+ymLe9Dub0ZAqqa+KzoNRRSFNCeXbOZ/LYcVBItV/fUf7G9LMT3q1djj8ovBMI9jq6xf7EgsTUrRqq4bHP7C4ntXNy9z34Wn5yp1S+u2wgMgq6DADtnNxEH+6sKf6c0tGP+KbHzlENitYKyKCHxhHWch1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rKSXAuxx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rKSXAuxx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so35315075e9.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739854; x=1746344654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=rKSXAuxxFzuyNBE/+d49pB9UVcTTf0tvWvVRdd+nsXVDN0YoKKHtihV7i1Lz/OIiNY
         AhuZARQE4vx4lkCIsIJCJXuoTQNCxag/NQXC6vN5dUHgR3GvMJsi3wahDhkEK9knvfsZ
         Z6KReS0bTtDoSpuZcQE4O1Gaz5pDRflqQjpPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739854; x=1746344654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=KNqSjSBzY9intTz9vnyhWo6iJaoaBSofffM+aZWe0NasLfxk8r+L0gV4UuzDhbf/hl
         xW18WaFTzvpta5RM2MJ00CIJX7qRORCuiR554kcUHCRNOjf58u+JHDGCYeXmmXZyDCef
         83iAuAccr+aDokooxTNWwK740baAsCtAIN1RRoDEipW6vh1J98borkAf3Bl708puYOaD
         QJN+acndolWX3Nwv1zLx8mr2qFnLP6bGt2rUeY7s5NY81ozhvu1gxyhtMhDsEYB/sQGP
         z9pnamQ7PbkMWok7Xc/GU8d3whLJIXuA3PHK60ulW2MxvjjofXOk/l6ysOTbJ4mORTF1
         Au5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/UrYa9m9+KjAAVdrVT8PwAsaANQHAT1ZqM2SuhElETyVgaVpvmlqMvs7PDV+2gfmj/WWoNi0DYSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLJB808xtyXWdHP6YeYdtAMXJmTB6+K9Rfy91pkOXlSQcZ6z3
	m8GcWlR+oyKYNLKoENsciMOyhs36jXKsj97t8wxRMp11x5ttEAj/mwGPBDgVKPU=
X-Gm-Gg: ASbGncsL/91eleENtyi4bKBCRPDqfar0iZvuUGIYAd+WcuNt5B92DibbNACmzPlLalA
	ZOjxqBUnU1BViw/HumWs2gKwAKxzRMgnEETUdVmDFG3LMfTLiJik9kC9m6/LOAD37LoCgbbN/bF
	Z4WfS4Fl4miOhW0oBkqCoPV8p63j4EHeYuUqivkDjOMOXwhm1gUvRpfTZE192nOhqPckJ6jmn41
	qmGM4Yq3sgsPuv8kHKnrblXOa4Q4iLcp5wPz9AUMn8eNuINcs2JrvhlDOAj/CCoUYFDFc4Df7cL
	pUq6qJSkQr01/89AYtNqEc73GA71XIz/JMtAuaJs0ZLHxCkZxaSqJmVbFMmDmDFyg0J64G1u8Gw
	rq/tctw==
X-Google-Smtp-Source: AGHT+IFmKdlug3XBTeQtHBTWufSsMQj6wGtrXk30tYDh/x80OEhGe1hDn/XAFAGgsIRKs0/u6QDg0Q==
X-Received: by 2002:a05:600c:a02:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-440ab76b5e2mr33817675e9.1.1745739853968;
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/8] clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
Date: Sun, 27 Apr 2025 09:43:23 +0200
Message-ID: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As stated in the reference manual RM0433, the STM32H743 MCU has
USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
macros for the serial ports consistent with the documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32h7-clks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/stm32h7-clks.h b/include/dt-bindings/clock/stm32h7-clks.h
index 6637272b3242..330b39c2c303 100644
--- a/include/dt-bindings/clock/stm32h7-clks.h
+++ b/include/dt-bindings/clock/stm32h7-clks.h
@@ -126,8 +126,8 @@
 #define ADC3_CK 128
 #define DSI_CK 129
 #define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
+#define UART8_CK 131
+#define UART7_CK 132
 #define HDMICEC_CK 133
 #define I2C3_CK 134
 #define I2C2_CK 135
-- 
2.43.0

