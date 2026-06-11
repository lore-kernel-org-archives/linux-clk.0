Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EB27A107;
	Thu, 11 Jun 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170865; cv=none; b=GEPvMypYoOaCQM1Gz5Xpbobt3/BgCAC38GbHHZFq+H+dYI+OZdUWrhzXKQ66R5vfyg4+pS3s67DY3lrtPlZ5p78BbaVgO6CO+M2cWOTWctFCtF+DraErAO24Y/2Js3oXTYCaTwuqgdr+T3oEQO47dc+419u4yi7gHH+BR/MT9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170865; c=relaxed/simple;
	bh=R1Q8FrqwKJw9FL7cK9Ek+UiXIxEPBTKq4QR1ZaqiXjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PLXYg642bu//w1G40+4yyLDU/SIGMc1iAz3X8JCuotZVkOEEZgGu0iwh6W86xwxnCXkFS4CYnWwhN13/CsWJ2/yAG/xXuHBqQE9MjAVfqWmfwD6SDCkqSQ991YELHkQdGof0zh8rAI8Obhtc2ZBK3by23ytbctHDFocCiYRJNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpeRnFyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpeRnFyD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 125E0C2BCB8;
	Thu, 11 Jun 2026 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781170865;
	bh=R1Q8FrqwKJw9FL7cK9Ek+UiXIxEPBTKq4QR1ZaqiXjE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TpeRnFyD5aFVQQB1VyrCd5xBQYg4RPXqv3R4qNZKr7xFqFaY5EuT/V5N7m4y3EXo8
	 huKtXToG5/Y6KdUPwk5VoR7rNpk2/CFPyhipmTc/9EtoicQ7TYliVGuRp/ym6z9fsc
	 oG1M5CJ0WDSoR57j3gttPvUc6rsWZgujwBG+hMkNAUaMD0suNFeN1UmCGxN3KZsgza
	 t8xXpkpnZ/CK95aOxX/rHC1G55bQpdO6E03CvIzsq8jomE68VYJ1/ybw+cnEZQmKO2
	 KdEw3W8vKc0MgfcHgOFPaLUbxvhj9uqR+ntgoZgk/+FbF2AlAA8DjifybNJSdRro4y
	 cWn14ckuCcaSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F16CD98CC;
	Thu, 11 Jun 2026 09:41:04 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH 0/2] clk: ultrarisc: add DP1000 clock support
Date: Thu, 11 Jun 2026 17:40:52 +0800
Message-Id: <20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSCKmoC/yXMQQqDQAxA0atI1h0YB1TsVYqLTIwaKyqJloJ4d
 6d2+Rb/H2CswgbP7ADlj5gsc0L+yIAGnHt20iZD8KH0RQhunzZFFSNH00Jvh3msEIu6K32EVK3
 KnXzv46v52/Y4Mm2/DZznBWXabqNzAAAA
X-Change-ID: 20260522-ultrarisc-clock-a1b7aa59f60b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781170862; l=1501;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=R1Q8FrqwKJw9FL7cK9Ek+UiXIxEPBTKq4QR1ZaqiXjE=;
 b=QxWbxOdL58LeJP4aRv2jkyvZGMj/np/LhmSAOWn8iNiLcWmOWSBxK1vWYGvwKqkXPotCINiPW
 myEip9IXSvZBscdqpJmw3JoZHXBFroK20KZqZweK7Sn9QxIZinlkvjR
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com

This series adds the devicetree binding and the clock driver for the
UltraRISC DP1000 SoC.

The clock tree is driven by a single SYSPLL and provides fixed-factor
clocks for the subsystem including PCIe, divider-based root clocks for
GMAC and the UART, I2C, and SPI blocks, and per-instance gate clocks
for UART0-3, I2C0-3, and SPI0-1.

Testing:
- dt_binding_check and dtbs_check on ultrarisc,dp1000-clk
- Kernel build for RISC-V and boot-tested on DP1000

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (2):
      dt-bindings: clock: ultrarisc: Add DP1000 Clock Controller
      clk: ultrarisc: add DP1000 clock driver

 .../bindings/clock/ultrarisc,dp1000-clk.yaml       |  72 ++++
 MAINTAINERS                                        |   8 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ultrarisc/Kconfig                      |  18 +
 drivers/clk/ultrarisc/Makefile                     |   4 +
 drivers/clk/ultrarisc/clk-dp1000.c                 | 152 ++++++++
 drivers/clk/ultrarisc/clk-ultrarisc.c              | 417 +++++++++++++++++++++
 drivers/clk/ultrarisc/clk-ultrarisc.h              |  73 ++++
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h   |  29 ++
 10 files changed, 775 insertions(+)
---
base-commit: 2d3090a8aeb596a26935db0955d46c9a5db5c6ce
change-id: 20260522-ultrarisc-clock-a1b7aa59f60b

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


