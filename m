Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6643C3F58;
	Mon, 19 Oct 2026 04:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385747; cv=none; b=GbxhnTVrj0bs0UcjqCH4uuqQiAb1+LeE4QX8ebctc4lLmbbSRGQYPuP58oq1E8msv7azpMPPu5W27KnN/PeiaHCJwHB00RadSqveHUiMVdzi5rfg4sGHquOSPtXtK6q8rAa6NL9QPVlFvyAAwGybyWshK2COtSF01WQfAbLnGRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385747; c=relaxed/simple;
	bh=zgU3iQM72YbxnsGmykO32NltLNkwhLgTNSOphGXHrLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVGsl9Fxc6m+SycP/Fc5EFCmP5YT+hO+uAlqCVlZBfkzGv19lmXEC4tKmssDMUVmXUfNpZBCBN8DjlRAltU4H+D+FZkt13MPWUC4lRhk+QTwpM2Fir3NvanQ8Mfr4certjx4EGJF7N1ce07g8EOdJQL+xSEs/zcByYH9pRdaVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDUOh1na; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDUOh1na"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F11EC2BD00;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792385746;
	bh=zgU3iQM72YbxnsGmykO32NltLNkwhLgTNSOphGXHrLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dDUOh1najE5HwJKKBPGOlvwphz8vKNHYlwMo/Zn6uK+loUruSTaUzEUvMxDfgaraN
	 2nIZZjvStcCpi43Q3C2ToauRNydNK82MSgUATWoauDVw9J2I+X+fZs5H/b298Es4/0
	 SL9CqfWfWWV1HdM05mC3L4mJuXSfhxTbu3R+2xWc4QrA76RwKsQe+UNpaNUP9Fpdo/
	 DwK8aQVsp1Ln6iBJlA92v7ergIUmnepXm5JUL4w8M+fVOPdNV/1WtlX+8sTekM+OEs
	 v2bRE72xQeblrCDyUiCNB5hhnki940UNjgJVCILU+vyOygfUq90uxzpYwflKie4jNc
	 KP6iD96NrS9ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB86CCF2D3;
	Mon, 19 Oct 2026 04:55:46 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Mon, 19 Oct 2026 12:55:43 +0800
Subject: [PATCH v10 5/5] MAINTAINERS: add ARM/AMBARELLA SoC support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-cv75-soc-v10-5-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
In-Reply-To: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792385744; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=+2HZXt/Q1o7OE8loSEe3SRjzhikyIx1oW7WWR5j768z5zP8/8XhOMTTprPKVPUvp/qWlqsLLA
 h/uxZj1JR3oBcnfZXwmupuPJLt8PwULXa6I9OlYVXjJmUnMczA1BChx
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1


