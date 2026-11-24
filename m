Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495291;
	b=IJy6yxqN69txybvuAscIbrXgiPsppHmsLHzE4Bo9qy81s4JS03Wi14Lw8LCLeTXF1yZv
	 QUYHEF/qRIeK3Z16ZtcW46LroBASLROe/ypLvHAZPzAmp54Ip8ehOjrOKO8ga4VirLvJp
	 ealujJdp69pL2NnwukzfAwXl4vntMdEwKIMNs+6BujvDd8wzLdGktYzyQ80rn1blr6HMF
	 YEsv3lU2MZDfbcdta7nYjBbqHpZSXd+0yPLQTHuYVWruIiRe5fzkWz33FexIhxyh3F5us
	 /n01x4Ih4EtUPW1I78nVeic80hELK5X47RKF1IeBM2Sjp01Rq7P+hgsufhin/8VNKqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495291;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=iAWnEJRTZo4ZfoxutvsoMJKV0eTQZqJSBo1SrA6HwHQ=;
	b=oZAL1ZGGX1RRiqB3pzPpWt9nXPwXytN+DZJTrgtGj6nmnHo0IauHTFC6TkZ+UJWZjH31
	 j4TIq4VRT0tzU2YucuAnUW57qXYc3DGh6LqnOC+Ifaz+dVvObHfcWk/XGj3cprZwE+ysq
	 G39J+bnBtee8fzYjKe8jcc0dCloLM6rrc9axfb7DyOQqjNmk/G/k/UpoyLo+FfVVftWqD
	 ntyFaCUAzzB0Dy2AiJxZNB1Bs1gcyWZE/MEPvIJhup/rv7eSrvNG54fcyOofpOQNBlRS1
	 kS7DwymkvT1eqoJn86pRNdaOcuSP/b//TUNW+sn1NEEBz3S4p7oedz8Gg18SqX8ELPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uxir5DFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE93606A31E;
	Tue, 24 Nov 2026 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uxir5DFS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495290;
	b=Bno+dxRwY7/zRFuFfmFlsVRt2NiIMqGV7yI8P34+vkpHGXDPLqqphGH/CFVciBgfGIGQ
	 q5V8QUxd6tGZdOxCL0X9Ol+l4rGiIySJ5El15EFw6wkt+LhjZp2tam4JCjpA17uIosBEf
	 TXl2bvk068HVW1M149/doqeLaLhLd2M+aS6sUA5IsAhr5IMieCrdqZPjDFNpKfWnGvmI3
	 2dj937kB76JsqR/9eKqkONrYpsad03zvTCwLg1Di9uLPBKEDQpbKU7Tkj5S+P1J+ahahz
	 SWliBRBvzZzqveN0QjDgdZYQJsPWE2Vr+ZQd3etXDfKdyTMWfs2X4MBf4bR6xUeyIBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495290;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=iAWnEJRTZo4ZfoxutvsoMJKV0eTQZqJSBo1SrA6HwHQ=;
	b=w2yOkkzernR/jtDFrmCvs6NqcbXoqiv/jHAmgT6fCyu2xmNBI5vzr15Nc08r1vjCueYB
	 wArYEWAsdcrlrheCSacLKKo69koXGf9vy+lKLjtUBl5svmmi/ghV8yhzMav3xvOLHX0YK
	 R5g2Dry5LBg1RPAFkoGbbSq9TfD/BO3B11NReSLd+l91kZ5ElmbQC65KtyGgQ+CWacL2q
	 jR2ILKK8/LcZlSEASmsy43e2ji/BY1PN1ASalVQuVZ6zIcGD2JihGJOoLFT9nJZXuA9mb
	 yzlmq1EOIt1dg4yzaEybovYRA/LIij4Lwr/Xa+BlMS+EkZhp1aEFzxZ2lpisdFV/JlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C32991F000CF;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495290;
	bh=iAWnEJRTZo4ZfoxutvsoMJKV0eTQZqJSBo1SrA6HwHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Uxir5DFSvn5Z5yS8gTmy9O0DPG80zPi2I052Ky1dVseOtJZ00fUqvIZnk8qvA7epR
	 rn9ITueds5PAEAGGYdqUTH5lqz+P6307zyZHCsvpZ4GVnjAfNtozaZNccx+fpwVj6g
	 kgirUFHrE66gSChVwOTVmeTNhChPhc5oXZZuPRuo3c7lbH0Ukn/IuiO7eXHBgA31gz
	 DnTJf30qbM6egxQ2i0iF4B3mAvzZwDlV9ZtGiwWBcBfFw1FQock1MPMmGB6mX6mVO8
	 cJsm6mO+NBnERiDACblyXcZdJgXF2NMjPT+hryGnp7Y/OYhJb19A6NnaB84V2Go3U8
	 gdkkOj2j/V1xA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55A734C8A6;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 23 Nov 2026 23:41:21 -0500
Subject: [PATCH v5 1/6] MIPS: Add support for Siflower MIPS SoCs
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
Message-Id: <20261123-sf19a2890-sysm-v5-1-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
In-Reply-To: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495283; l=3355;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=uNFvdHDKF2De/lRMz83ttlgpkFV125CqqDBrcYzphz8=;
 b=XO8OgRpMMYQp2P6aF5Oe27c0j+oCgxc0CskwLlMA5nYZ7FB1EFFRNofjInViYr61fILTRnAPG
 BDRunO7mVH5Bt9HbLynOiZp/3Ox/IznY0Jrn+E2bBnKfyLbL5sucXVz
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
DRAM. A kmalloc.h with malloc alignment override is added to
conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
features instead of using the generic kernel.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - rebase on v7.4-rc1 and use the "MIPS:" prefix
  - longer Kconfig help
  - commit message grammar and paragraphs]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 arch/mips/Kconfig                             | 32 +++++++++++++++++++++++++++
 arch/mips/generic/Platform                    |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h |  9 ++++++++
 3 files changed, 42 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624c..e10145edeb53 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -937,6 +937,38 @@ config SIBYTE_BIGSUR
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
+	  ARM PrimeCell peripherals, so ARM_AMBA is selected, and 32-byte
+	  cache lines, which allows a smaller kmalloc alignment.
+
 config SNI_RM
 	bool "SNI RM200/300/400"
 	select ARC_MEMORY
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f3897..c09a8484db9b 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 # Note: order matters, keep the asm/mach-generic include last.
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
+cflags-$(CONFIG_MACH_SIFLOWER_MIPS)	+= -I$(srctree)/arch/mips/include/asm/mach-siflower
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-siflower/kmalloc.h b/arch/mips/include/asm/mach-siflower/kmalloc.h
new file mode 100644
index 000000000000..0887ae3575d7
--- /dev/null
+++ b/arch/mips/include/asm/mach-siflower/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MACH_SIFLOWER_KMALLOC_H
+#define __ASM_MACH_SIFLOWER_KMALLOC_H
+
+#ifdef CONFIG_DMA_NONCOHERENT
+#define ARCH_DMA_MINALIGN	32
+#endif
+
+#endif /* __ASM_MACH_SIFLOWER_KMALLOC_H */

-- 
Git-155)


