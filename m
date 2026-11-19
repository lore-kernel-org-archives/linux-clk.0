Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083213;
	b=cwV5XSQle7EPBrGCnH4RTFNHKAf3O5F10e/evY6R98nbgio+VRlLymgawRgIbVsI5t4l
	 GthDkwD4OD67et3iWIEE3Aem9LNwRPM28dv989DeqTyR9CmvG8H3Ud5JNnWPxTjGHLcNH
	 k8ooTDenu6izKoGxDfxsp8niYLJnviyorrO29aMA0EQR9FykR1jv17meEFlZkmGEkv98L
	 7BcUDy/NFl/E7jJNqyNUcelyRda3z3vacy6j6xYG2Pk+FJX7UEhfDSCrx3R4d8TXxEGu7
	 hCsD/Di25HMpp+ndXYTjQdapQ/brWd1QAun0sBxzFXPXrpOEdZB1HSJWWNWIDbmVYLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083213;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=;
	b=B/htSOae12338ehmgBThBh5So2fs2k9Q8ga4YRLTAbHAkCRgZjzdFAsgK4Tv4sGzzAkL
	 nl2Y+5zsGJxkyPeWMklxGSRN+Ny6dSyPLLh2lRMyL14hxIaZljsqVNu6DKOYF7LHv/zxe
	 U+bdGuZQV0mKaowatZnGbBSQ41dJV+H3gN/Ot1JhoAOeizqR4A9pRzXGUQ78SVXAk66Qd
	 gJlSBzj3fEY5IJwdbXZUJaobOXnVcDwyky2EJuhaZfT6Bl6wEKtOpbGNGFW97y24prWAf
	 9S8JQF5M5XKH7iRIy8MyDZR1gZkBYlqxlSdKaDiuTLkjJ4y2qKSAss14qRMxb8G/Waw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVKaS6YL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A73606A33E;
	Thu, 19 Nov 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVKaS6YL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083213;
	b=XVw1DT81GshVIb+isaOMvcpriVYQPIdGQ/msIr2Vquud0cGhGOCDMbeQAraCIHVGZq0D
	 7R3TtbXNBqoRmiy2HOOGlsHThwXI878lafLIzVZvegnm/3HxHzHuATW6YTgWgkvAcJUF8
	 jUmdrt3xBUpdBJFhmF94isffqemVF12bEUyv3ZB/3vkFyRsKzaxQuDex8OZ26ekrEkZK1
	 rZ3GyUEVExwBrUUWSbVFi3ga6W6w457gjzhnnDvXhfVvaJY/tYFN4AMu/06tYtK7ms6Ir
	 IixFAkO+QDpShPBO8V0CkPTT9juGyOuw4BNXS+Rpp+Jd66g9/lgkRN0X9JrnTNy5ISw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083213;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=;
	b=WIW/nwe+XKRSWhNvGVs1wOqwEnmvyypdR7Yaq7R4kqd2CAtGaBkg8SX5i6U09tmHwNh0
	 4avgYNht/M0wqaOWco2jl30oB0Kegee/2fY88w0tRRkg1uH8TXoSa939Ji3WDFzvSW7jp
	 nvamTExLb9vMrd6MbFwUA5tI94YJAcdQ/v8Ngtwt9smPnFtoifzQC5/COfk3Xm4QeDbjv
	 m6pHC4C+58vb9M4QC/EPEgZHFNqX2bJpXWGOT9tnQ1fsVHyvPlwoc4JRNEHmjsre0Z5Dc
	 BEmLXhFcYPo78XMK7Nkck/Ml5Lu+3gCZTRiHdCwG7UzcJK1EXuEYIexWPRwbWb134Mw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91AE71F000C8;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083213;
	bh=VIgL/O6urWB2GHhIUk6aGQm3b52JD8HwlkLDLPdkbqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hVKaS6YLmCCbkaFSCfQQwwpPWUZR+UL3rtY9alKJQR+q7S63b7tbSI7TNTOL0JPzv
	 H9z6AVPatiwWqafO5MK53jgOCFwDtqzZMVuqwP7OH3je8PjT2xYUtOAfdhFUvNZSnF
	 g4sVW4ceCTF9CXskZxlIlHLyno6eVpeZPaQI/giD94TaZJIyQzkpdsR4KWjna3tqSk
	 va7iB5aO+BJfV7V2ui0EExSMUxd5vtKdXgMUEsocDMSdV+BAg1aadX6rfKqOwEIZ9H
	 vDT5kuXzIwZJan5zVHWc4Ro4t+Q1SNB4eZ8D3Vhyg0k6uDDoI2Kt0cASlmQx5Iohcb
	 e+PbMQzA2mahw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BFCE4B234;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:21 +0800
Subject: [PATCH v12 3/6] arm64: add ARCH_AMBARELLA
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
Message-Id: <20261119-cv75-soc-v12-3-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=797;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=TcxFa2qICxsx+3aVN3CSUHlAvke6t5Kh1BAcv+g84sg=;
 b=kZFuSRx1rCDEBf0F6XJRQOn0urtsVM+m+d/A0Hg3dQg4s56a+VThpSwPDPHmG1mxypFOd/0c4
 GgGrgiUx0HpA3p9Fb84ysUlsA4I3zmUnsZKdxYsu/i4rGEf0lbd5ufd
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Add the platform symbol for Ambarella SoCs.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..16d7e3a4c2d6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -26,6 +26,12 @@ config ARCH_SUNXI
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
+config ARCH_AMBARELLA
+	bool "Ambarella SoC family"
+	select PINCTRL
+	help
+	  This enables support for the ARM64 based Ambarella SoCs like CV75.
+
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
 	select ALPINE_MSI if PCI

-- 
2.34.1


