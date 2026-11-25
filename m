Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638298;
	b=O55UJ5AnWwY8wuuit4mmjMRi+KKkKYeqxeAc28IpvMKvL7oYToR2cpmxCNuPrdv/vaPS
	 o5c5XVe4DKpmBYzTwyK88RnWp5lWYGlWHmUI77mLYi2Kg40bQ9nc18PNWYRkcSvquKxtz
	 QQGj1vQN7IIfYLAIChzSuU/0Pqc7ZGGgF8g7jzA4Xjshpfq1CfrALYOA8GCi9Bbb4mnNF
	 ywzWUiMcwXO9FznHuOh6q9d7oBC7U1NTZrbOQbgJSN2KsND+xja9/5rGKLLUt5adDyLMl
	 7jhVe2arWd4u6kPuhXBlsMgc+iHX4uPObMfwAFFXpw7sQpQwkAWR6EhIvCSQxJ3grWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638298;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	b=O8ObJmXL0+6Ra/LMzNy/0WoPm5zqsC7VtWrgSn+DKwS67+JcjD5I8a2lLh1FEVoHRSxo
	 oQkkDB2FRloFdFAD+Slf/J3pQmDqxynaEevbjjejAabWFyHSFMt00w4AtEicdKRf4LALd
	 8lcRjhmvVafvwpGFrv0UHsi1LDJplqAIy8jvdZ1t8bv9Pr/KzyYoOGuvLHPQGiujjjV+R
	 wk9NU5xFyGUKeAZOlaJcm/tQpLglEOQqEjPnwGa1jeKjcpg3yda+8HNd3X2nWjYrR92Nh
	 Zoa/oCLb0xAOxy6k5tIsPN8Wwf3jMC4J1dmdD/ciHimAbIFFzB9hvHO/1uq1jBuu3oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nmUUS1L/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC2606A31E;
	Wed, 25 Nov 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmUUS1L/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795638297;
	b=l/+S9xYm7JCOeqlgqNHYBLV6MGqqSUbZGuR7DNjnr+BwQXtSKAeqam4U6UPlHv/Gqn8A
	 FuS5EY779HmkxkZ/b/Eqc7/OEbTD/52BOAGq4uVxCx0/H/KueCL1nsY0RUGUua8MZicfb
	 QgO78ceNJvVi+yvbMtmUqvG+kvfHUyfeuwc60HlF0el9Cn/S6d7rn6QY8DzsCm8vZY5av
	 Tf4Qdu6qZmv/0uBOeu6oS7YZ/qwA++YQaxenA4FC764qp1vNGbRvxpg1/snZRC8njEE6e
	 fkkoCQSb23dahaCnaWcNXXBTlObNDGjCoezQrDRJbAKAReNAxYzZSaegpZW45UaPycw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638297;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	b=ppkTzyAbziFg7L6LQDBr00jYXS4Va5OZ5WuZVstu69n1wGl9dS2BTZhnefTdjSOR/2vW
	 9NLQ4rffraf27JV6EdMIn22JzNPNSbfI4vVXjNbLF6rjnQDVqNKIUaOI3qC5hHZLQ/+Y6
	 3OW+S+K1nSQFBgKSqLc9tOLYREutp0R0snNwr+3onRonkjdSf0uWkujJFKwb4tM3jO9cq
	 B+sANhvGXhLYV4atj8qcPkzOylr57tGMRl5ng43UIBWhVrQfvWBf44M5odbzWUD2LQY/4
	 K7ANFybypu1iZugnHc5wUjn1M2uDHzZsLOqOOR7MADcEOm/cWRHX4osxGRxqfgOGSag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD2E81F000C6;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638297;
	bh=p0S9F4LIxQujZ3St8lMsBEBWLRaUd0jAUlDzWizR1eQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nmUUS1L/vfLun0tpXHnyaPve9OGE7dnydqi+dZw+UFTnzQ/+brkssfwNwwm5NJK/5
	 5rISOW3gbrx2oUpRY03lYG+s1/rKv6fHLWHd23HZQyTWmJMLfN7SChVvpWimHHwUMV
	 7lbjy4itMKl6k4qN65h8uXnEvLVP/6UXsQpHJFZNAgcIaMDbbXM6/jrH6DCvLz9TsJ
	 QFAXxvm736fDjQGQ6nDkaFKcUbHY0bgXvf1SLE1Jkq1lQAzDDZ3XAfpmcllA58A7eR
	 UWaJPVbjvJc7mE15QNAci/A1Gsis7OQ5VrplnutvE1x+DcQLhAMYpJ5HtlCmhXEzeQ
	 n8lb8Hp5MtbvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4436F4D015;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 25 Nov 2026 15:24:48 -0500
Subject: [PATCH v6 1/6] MIPS: Add support for Siflower MIPS SoCs
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
Message-Id: <20261125-sf19a2890-sysm-v6-1-181875c10682@telaak.dev>
References: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
In-Reply-To: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chuanhong Guo <gch981213@gmail.com>, 
 Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795638294; l=2176;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=ziqqvVYU3GmZibawv8t72n+ZZ3zc07HtvebkWxBkx+8=;
 b=9uC3DLpXVwKSKJCQxSbqousLs/2Wh8+FP/Fegt/w6HCj1TfMYonkex0FBQ7zwcdkPFbbE84xq
 oOBoCrqtP5vAJ9RKtIEAVrjyPHnyCrgO0KX25JD4zTOjwCSAJuyVlBN
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Siflower MIPS SoCs like SF19A2890 use a dual-core MIPS InterAptiv
processor, built-in GMAC, USB, dual-band WiFi and various other
peripherals.

Notably, they use some ARM PLxxx peripherals, and ARM_AMBA is
selected for the drivers.

Most devices on the market with this chip come with 64M or less
DRAM, so a MACH_SIFLOWER_MIPS is created with reduced features
instead of using the generic kernel.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - rebase on v7.4-rc1 and use the "MIPS:" prefix
  - longer Kconfig help
  - commit message grammar and paragraphs
  - move the kmalloc.h override to a patch of its own]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 arch/mips/Kconfig | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624c..549bc7d13dd9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -937,6 +937,39 @@ config SIBYTE_BIGSUR
 	select ZONE_DMA32 if 64BIT
 	select SWIOTLB if ARCH_DMA_ADDR_T_64BIT && PCI
 
+config MACH_SIFLOWER_MIPS
+	bool "Siflower MIPS SoCs"
+	select MIPS_GENERIC
+	select MACH_GENERIC_CORE
+	select ARM_AMBA
+	select BOOT_RAW
+	select CEVT_R4K
+	select CLKSRC_MIPS_GIC
+	select COMMON_CLK
+	select CPU_MIPSR2_IRQ_EI
+	select CPU_MIPSR2_IRQ_VI
+	select CSRC_R4K
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select MIPS_CPU_SCACHE
+	select MIPS_GIC
+	select MIPS_L1_CACHE_SHIFT_5
+	select NO_EXCEPT_FILL
+	select SMP_UP if SMP
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MIPS_CPS
+	select SYS_SUPPORTS_MULTITHREADING
+	select USE_OF
+	help
+	  Select this to build a kernel which supports SoCs from Siflower
+	  with MIPS InterAptiv cores, like Siflower SF19A2890. These have
+	  ARM PrimeCell peripherals, so ARM_AMBA is selected. Most boards
+	  with them have 64M of DRAM or less, so this kernel leaves out the
+	  generic kernel's support for other boards.
+
 config SNI_RM
 	bool "SNI RM200/300/400"
 	select ARC_MEMORY

-- 
Git-155)


