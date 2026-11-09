Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215360;
	b=pkZt93v22ku3Nqq5vp+ya+ga+LHWSFNQEMoBW0zvhTUJmSgSIUZ+6zRqPB1FEYVnZt8l
	 7Tf5gVmH9YUsTdKrpd3xOyOWO6pCmjXc2JTcKz93+L5jZaLbQKI37YXUp0ZB0rKHcDDjj
	 ZGM9w9E++G0sNClIPhB6xCevxSsgS35KX5RZDA/tVBOkHGjdhI48kfcJp1hTDPUs+xpYy
	 uHLTdkbkm7UWz/wunDz2KjjCLFSfdwY/CRY/hlaIyeG4GXbiFA1Asaf3/K+mFW6hK+LdN
	 24f5ep0c4sFAE76sNKE9hadqBwUf39iyh2xV2V3mQw3RT0yqkCjkAlNo3wjDANleRcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
	b=L67W/ApmEZKS4XenDfCgeHY2jYm/oe6onFOk0OWqjr4eKllqPqlxoVa43ltrs9m0mmZH
	 J3ks5tFSRQp8nxsWxGJB3v/74sXDbqRwJks1yhzQFSDVGeHOyNC8ohtM5ObBS266D2YOt
	 Drg83OBpmBjOs1FAPCQvUz41C0gud/BCUrsfblWxkvNVqspc2phMnMAIPSIlMfZ+g9A0v
	 k5hocETxdAEx3vMrIwG6W9xdOvAQoOgS8xC8uiAVclTD6Ixqux69VOuWlLTCpN1E1yMfW
	 10n3HdrZ7vnJBL67MUF2fX6gHTwjGVMCfFXJBU7CDPMyvy37baENQY7sPSENBmwP0YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wirenboard.com;
	spf=pass smtp.mailfrom=wirenboard.com;
	dkim=pass header.d=wirenboard.com header.i=@wirenboard.com header.a=rsa-sha256 header.s=google header.b=GP56uGAf;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D0606A333
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 09:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02D0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wirenboard.com header.i=@wirenboard.com header.a=rsa-sha256 header.s=google header.b=GP56uGAf
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so6089525e9.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1794215358; x=1794820158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=GP56uGAfqelAtz+ZKaQKSFJnHPlW7rl/XXFsOM4NhpYtf3oyCLoe/DAXcg/bArFdH5
         8MBGX+H3d0by1/+cPEYkqvKdwXrYv2aP8og9SOSauz5bDB/24hphmYKSGLIBwIMPay37
         90CIcMv7qfHO8+oJjghypJNcIEojMyuwI3z/w7Uc4YDSx4s4Zit+6DlQqdWztnua88kU
         m5WmvkAC/6oI7auisFFVKxYleskNY1zUgtSuopvyeFcQLNGA8pHqhmHfiJVUNZ4lqmxj
         b3g1UhBiwXbpd3fFqofeHZxJ/N2Txu0LjHKTCAuLunbblAdyLBr6gNZiYjiX8iIaNRGz
         2Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215358; x=1794820158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KBLzQyqsR334QCpiwaANoenKn13j8vn07qxRoKBlVI=;
        b=MzRljUlmObAVB6dG67u75svEJ6adpTALtp7mDcfhpEMsTp5s8PJx0sy5ByTebLhVZ9
         41NNlnd/TAVdiXbXo+aw5sIicCBUv7tUKO9BjpStk8mIHw2lc5nolcZ665FoXY/yWfti
         Fyq3JrBP6LfalFpJdU27/ILPaaft6jNc3BJ9VcGCX5mRs8G/YAtSC4P4wZcmFeowq3Hc
         OKqEPTAbVZzuylojRJe+seUieVNKr1QipT68IOLc6PGbXu+RTZ80gEaieskonkhH9JS7
         7n/naJKQwmDL/nGFC8G9EeF1z9D7n38VizZd615/Afjg5vwuzun3j53/ppQSHRH9UfnI
         AzZA==
X-Forwarded-Encrypted: i=1; AL+hErE63CzlVqdI3D5pw0PtO7tf9s3g+uIS3ffQnkAzd8P2nu6+LF72MoxL5Dkki52onyhOxps4M+AYwB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z80md0sxtcJ3hP2mgF3RzWkNon59xRjvPwggE9mqabZlBN5Jwoc
	Kd/a7TQ1iP+eqc77gIprK/E+/prRzPmtPE0zIkdafp5Qzm+LVt/gcOYepWB2IwHZdxU=
X-Gm-Gg: AYBFou1hW5tQKeR1IrVE8TbG+e91MqopM7tB7OtimgaTQ+LLr5O0FbU8tDVF+UEhlvp
	88LrNzTRsrDbD3ibb0M5IxPaaeivwEm8yztkfBZwCsXv9td01OWT+HnNoe5jQv8OXwamVEdH/Zb
	MWO5MFuvpzQ3l8FZnmoNHleLi3RoBQ3LHB1fTU4u2VZn400ODYQysN7rsILoC5WMb22v7XLZ2Nj
	eoKsvMvpaAllmoD7Vgvjk3ZzaxNTSzxmS1eIzZkq4P+DKuCnj/hAJmupB3PqYgqpTRL2mw5jWDv
	nsQ4EccO4wXxHqR7AS6AS3S2rLNu5xNx7oUMwZVvzs4WaPUMJisA0PZQRPwCgQKX0FvHfsycpyI
	O5gi0kr/J6Fp/3sM268w7juKecZu9cqb46KIJkGifki1Nyv5I4kj07AtRRqQIC835tzkBsU9EJD
	xit0Y92JxMtwJy6u2ywIYI17pHfP1vBuMPqOytn5INYxNNGq53gkFE8tSgrB90GqfdQbc3I7U8c
	gaQsqBFEmNso4JqTquq8oYKDMIyhBZKo6XU+DVKBwxLDAVcwrLeOASImjQsvcifz1tlNZG2kibq
	VB1/C7sTncmDqX6z7FOlDDoKPiJ5yHZE8iHQHcPxXHzdabQXprQ/7az6wUnRDJg=
X-Received: by 2002:a05:600c:474a:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b963c6cac0mr68998635e9.5.1794215358048;
        Mon, 09 Nov 2026 01:09:18 -0800 (PST)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8250905f8f.6.2026.11.09.01.09.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:09:17 -0800 (PST)
From: Ilya Titov <ilya.titov@wirenboard.com>
To: sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ilya Titov <ilya.titov@wirenboard.com>
Subject: [PATCH] clk: sunxi-ng: h616: register CPU PLL notifier before mux notifier
Date: Mon,  9 Nov 2026 12:09:14 +0300
Message-ID: <20261109090914.46872-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the CPU mux notifier is registered first, so on
POST_RATE_CHANGE the CPU is switched back to PLL_CPUX before the PLL
notifier re-locks it. The CPU then runs from the PLL while it is still
settling. The comment for ccu_pll_notifier_cb() says it must be
registered first, and the other sunxi-ng drivers (A33, H3, R40, A64,
A100) do it in that order.

We see random hangs and oopses on T507 based boards when cpufreq
switches frequency often. In the oopses and JTAG dumps we captured, CPU0
was always in ccu_mux_notifier_cb() or ccu_pll_notifier_cb(). Other
CPUs were usually stuck on dsb after tlbi, waiting for CPU0.

Running a random walk over all OPPs with some load on other cores, two
boards hung 20+ times in about 3 days. With the PLL notifier registered
first there were no hangs in the same time.

Fixes: 087b4083d3f9 ("clk: sunxi-ng: h616: Reparent CPU clock during frequency changes")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..00b7811f3a84 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1235,13 +1235,16 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Re-lock the CPU PLL after any rate changes. Must be registered
+	 * before the mux notifier, so CPU goes back to a locked PLL.
+	 */
+	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
+
 	/* Reparent CPU during CPU PLL rate changes */
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_h616_cpu_nb);
 
-	/* Re-lock the CPU PLL after any rate changes */
-	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
-
 	/* Reparent GPU during GPU PLL rate changes */
 	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
 				  &sun50i_h616_gpu_nb);
-- 
2.54.0 (Apple Git-157)

