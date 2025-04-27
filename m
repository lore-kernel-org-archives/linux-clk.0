Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E939D1FE471
	for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739851; cv=none; b=X3WZXc8XkyXRlVabkvcP8NVUrxDQjZqaGdJoJWwMUeGh+nJsnqC54g+IBnsWoksoRr5YqDOsZXCpshS9MAKzultE6kWZQLi6n0dVCgMdwjlfl88Hx3eo3t3G3WbYr6gOdGUm98pUPmt0tbu+roLp1qbsFrVhh/VsNrvoYWW4wyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739851; c=relaxed/simple;
	bh=+55CHDPhy7ugVr8afIZtwPoA5z6AhwOB1hiT1fHQRa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS24UKa2geHYmL1qNqLHuqnyDIf3mpPMWgvHdIDxR2HVR6rOvPQ2Ezuni3pVAfUsAgfkZ3WMgcMOKpBrxbWwMlJLZMi7SG+R2NzmL4ga5tLTO4UWQRrWjsr0gukg+d+fO5kpgr2KQ7pzjwr6SYOgqJD+VmB1kTipfDMs3wvmsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=asB6wenO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="asB6wenO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23519585e9.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739848; x=1746344648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=asB6wenOLclOyq7FHXYw1YG2fz2XoC/uueIFoZ8vp99pHKebvqvPfuKdD5JlSRqnos
         P9Hc9OPYmiXfZIPdGUIocm1CYwLpUMoP/OPKSu2bMg30GUs9LThh1263tITDbzP2E55A
         H1RKIoTfbPO8//DtgPMNyZW4/8E0QWjUnmXuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739848; x=1746344648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=fP3gDtYvrdViET1CBXIVZiXD4o+RwykfaXIwXNMJXzJZ4LYPQ7NgUZoZmv4PQxOG3X
         WK85Tup6B2spbfzk3aWTH/QwVM/+eMhRKEmDYdNNQNExIQdKs0qTastrx6qjbjcIegcc
         Q9oakxXbPOMwkVMdKCMCisSEzb5KUj0f89sNb6asUcuEpylOA3k7nn1S7ESRJ/anniKm
         gU2CAwNq0uEKhNNQ1zQwPwVfAtxUQbIptTK77RljygOAOc21OyFFepUmdoYv0s0FFwj9
         JXXO5CsK6QNVXMCDiLQ4p+b6hoFCxURcT8jwEmap+DmggeJ6bVzaXGeyt6R3Gn0riD+0
         yipg==
X-Forwarded-Encrypted: i=1; AJvYcCW2FNVG/7Ced84uhMxJFkojSZH74H9BBJuF0J7+P8EXP84G2KsDppoasmAvGBX2zAx6qxne+xOSf4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzksne8Ee6sxgcZnKrIkEKXZvIUIRCf/BMNCesXyYvTmvYoxTpV
	PpjeGpwbtoNlcvOlSfPoG0U4PcYhC5psqIsZcD+WFhZCoOkZi6hW6JKW1B4RJP4=
X-Gm-Gg: ASbGnctiHf66tR9ycQ3y23UdZts+5nthD2TbPSY0aIR21Th/34T1ZDVCedXjtGNqAoc
	yECeY4A6GGoW0hl77+Ffqq1wN+UXaAc7RiELVJkY8vjXsz8w1PqhTIEd0YSr1gMNzbd4N2ddSJb
	o64HRxCso4ji99wj6ZSiWUHmMIMRNankj1Qw3ceVmOZaO9EBu1ME6qfSF8iVfxFmWt1H9JT8FF7
	0aFMvgdyeuKVEE7lo2kBoXe41DnuQtaB/iM5v3FCpPWYzpvTqs4iAVj9LcnLT+iRsoXIUkMQShU
	YdldHxVeZJU8qeXLR3D9cFGm/O2SP8ZVevk9TfnGmc0RNZKqa7YbtDCsmpCDr2G8FzFw/a1HHga
	M6QlofA==
X-Google-Smtp-Source: AGHT+IG55beBCMeEpoU+v9sBHrbcIgFnVINAwcpqdyMq90VQ1/y+K+5G8xBe1CVGW38gxB0HOPdp+A==
X-Received: by 2002:a05:600c:3148:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-440a65dd132mr80678905e9.14.1745739848202;
        Sun, 27 Apr 2025 00:44:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Jander <david@protonic.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/8] Support STM32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:19 +0200
Message-ID: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for STM32h747i-disco board

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html


Dario Binacchi (8):
  ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
  dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
  ARM: stm32: add a new SoC - STM32H747
  clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
  ARM: dts: stm32: add uart8 node for stm32h743 MCU
  ARM: dts: stm32: add pin map for UART8 controller on stm32h743
  ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
  ARM: dts: stm32: support STM32h747i-disco board

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
 arch/arm/boot/dts/st/Makefile                 |   1 +
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
 arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
 arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
 arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
 arch/arm/mach-stm32/board-dt.c                |   1 +
 include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
 10 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

-- 
2.43.0

