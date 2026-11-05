Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876829;
	b=1xoR2oXYiDs/XcGAF4O8j6Z9XJ6jc+TbI/n8hP8OuHK4kzYGXCpb5GIhU9KmSGZoGTqS
	 4hVkK6VRjvEnJaU/BmE9qsQ5OFz0LnWhCohWhPkKc58rsVp4QavSsCYMJosHapAa8gk2o
	 73Pv7Lk5OXEbEltjfwwAYcHHSlEkXumdCQ/Bh03VH68uLeYxkT0ltxNHtXLhp2UYbdo74
	 3n7jLKaHbkQPQRqqtQEhDuEQeudBcY9Q7r0YJHrPotykZItUUX1f1V/sHK99uzsaqI7iS
	 j/xrx8vP5E+KOTyjnLI/5phfagWcP4/L+O0FODUuFyoqtYfhSNa52aDtKbQGKTbLkJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876829;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=W3iPapZE4IAOkIjzlezpmkTkPYJTM0HuqevdQGkJz77qpPuJwmDNOmvpuFtOoYbRtJm/
	 DsdiZZtrhGIRyRkFUhDupYdYmyrc3zi+vr044+zVdnpr2cD0qa3xRwhDv8bOQLNpMoE0j
	 HfNaUTJ10Iz1Zyzb9BSkXlBZRpbtG6hSXMhC2smO8QIyXcsymghNZ22QDuiL7zeE+X+Hw
	 21oHvsGy3laVPD2NTjCdxH1R5TwXxrhaLBtBdNG0Tv5/D0sut6SuIGGpEP0NfNk99q+GW
	 e2jog4sAVdEoHD7i0wHXoHvJxt6O/JCt4SnYc4wh5VdOGLsrd606ig2/xD8D7PyvYRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUAaUuz4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394B606A329;
	Thu,  5 Nov 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUAaUuz4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876828;
	b=s96P2GJdw+RyW5J4ghmu1liE3uEatmNjgoWMFYvtoss7yXQveo+GKM5YOa4ciOvU3fAp
	 NaOHffNW2iQIBrM5g8jqLsygOlYXNQsERW6ui1uM6PY9H7WGc0GqMp5QytvR9DW8jvTu7
	 iUgYky8ptbYA/BmYTg4IA2PSKe6Ug290vWJyX52zUU1uyobKhMqYc0B63Q4hWNyTfW1Z6
	 5G8tkYDvGBb0cE9Sl5A0uG6f9dqoS9GZ8MgfepPD2R0Rfbv+Nyybn1X7uKMNWBwVx/HLn
	 7f7s9XkulnS8CcTSRgvT1PP5lMPOvQCNAwQ1NIvXXeyW6wozw20WQ9ZS6LxaG2lXpDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=jCrPANQEZ3M4E5yLEYdEaAz8fdHDrQrwqk2ROuNyipHsL9v9N10u3BZmVBsqM1Wr7c8k
	 RpHJlAFjKF6JullJLG43ZDYpMh6gIubTljQrnGC0loN2PfABDwtDqQR3k8+8TGLkmthDO
	 biH7ozcvgDjcn8LysHNydOnPnVQJ7x0kWFhRXYCylZEW4TvmDblVekCV61Q9JEnz4ch1b
	 hlYGdDArlya/mSmPQX3edAaBiETpp3aLHYu78POMfyXe33EQ6lr6UWGSTgP6/0qivbCVB
	 /bc7skJxNOjM8dsv5Wshe7eOJG8MdXV9yU5mNhE5FVMzdse/Iu7AmqaHRbdzWgSBE1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2FF41F00A02;
	Thu,  5 Nov 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876828;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gUAaUuz4bH4JwQ5ITO9U5C/moLkQm6VlKx7w5Kgmz9W+VJ+V5iHYCNUM/jPuuK85C
	 O5gSErDnsU5fQr86s2xKaW/nbw0lysOqQ0ELlqHbzriPR5j93V4qvHAFqGe8TbGhzA
	 9J29EIHd6VfrES1N/A6lxTubeeZkoyo/gNiC7T+nA6sXrHHsO/jPa/c05rCXadteA1
	 BWskZGNHEEXXv74hZgUprNtoh1l7/Rue2F53qxunlq89ef1J8m+Ss9CUTyf7LLDYk1
	 YT+Dlvoa0dLX8wMUJ5AIwhfElbND4oJTZ32rDT4O+Ympw5GUXwR+vdfNyQzA8sIvx1
	 G75tqdILPuwKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 83AC147213;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:39 +0800
Subject: [PATCH v11 5/5] MAINTAINERS: add ARM/AMBARELLA SoC support
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
Message-Id: <20261105-cv75-soc-v11-5-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
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
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=xAh3tkUI2kmwUkqlbkc1QWPFQD/HdhXVQhlU8BXpEX2u+sz+O9JyPIE8rVMYW/JtELUrTdBSD
 NBuBvxdiaj5CHQ8X5WOgk94QE+DZNn1Jtq5NrV5bnbRUOwSp7uOhT/v
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

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


