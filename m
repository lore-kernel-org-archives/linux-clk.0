Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97DF44606A;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615031; cv=none; b=Qm3zXCYfitj23NkK+wF36kCS09I9z81K9MXzTZqozUbmV54h06M8LAC6pDX9Q/FFxlvHKfn4QAqwlvnxTKxc6D1KYzTKPAUeq7FVLMvtf9TOle5Ubnqj3wZV70l15E0QSeDtrOwIzB8Hg4YU9KBBIDzbkAJNBKWSuRdm6cOss7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615031; c=relaxed/simple;
	bh=u1O2yyg4IFgXvWdBWEfBf7DSbFAtEAmAyY6MwVpsw88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuSc3sfcVPqUelLUKFi2+FbnhsdnPoUFyPb5X5sjqrspOrFjaoEUwJ44AQlLfKemswL+E9ML+uYFwePpZFK5XUVDNMRm4YI6XZ/QXGecnT37vKMF4eVjKFXH7CQesYHEY7p1/U/LV3vNd6udynusYLJriFsTjzehzm41SPe/F38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBSuYI8P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBSuYI8P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 712CFC2BD05;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=u1O2yyg4IFgXvWdBWEfBf7DSbFAtEAmAyY6MwVpsw88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rBSuYI8PDxgBrevDwj5Va/zkiTPCOCJSYDpXxDYqy7D6z3qOSW+N3MtWqy4GcGsUJ
	 Fg8S/Fh3jG4oLSCk87gwvXQtZSRpk/xCp2Rk+bQwiVMJFCfq9dz5/HPNkOSrvdCHUo
	 m4X4xwyx7Th4+d6RBto8WSncZHnozJ+BCyNiqRSb/ewvYF5tfT76QdDHNaCFLmSa7X
	 wNExHkXwteFYTcR6zKHbXijuU7xW5PuSL59IbE9yDbT2HBtKmeZzb2Qu86x3GBJeOn
	 inPgO5Agc3qTGuhJk0WKzLVJQnuYu8gbLW/SxmrGe664WrIopAU6xTbsdKZ1gbQnJo
	 qRTGKDRsHEFHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D1C5DF66;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:17 +0800
Subject: [PATCH v3 6/6] MAINTAINERS: add ARM/AMBARELLA SoC support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-6-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=1193;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=FMdxZub31R7avQT3Ojw4RWRGTKHK7OVLHXgrDSDBBvo=;
 b=/IQi7jn1+JWAK5SDTA0CYa9LQ8IsAgoKCWXSJ1vjrygfa08jTqnQYQK7RoBkFPXbPUzRStR44
 Tt0+6EgTg3iC0Wg4BUURRCOrjGJpk7Jik3Csir8PaPEUJignncdS9I2
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

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


