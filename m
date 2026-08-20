Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D03CC32E
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212475; cv=none; b=sAKPuGXyY/ukPuv2o409Wmk/vzA2J+7STg8bNoKlVMT30WhzL2ZrTUyuUB9DT88sZQczf/7T9h1UVp442FmALmF8jwAaQfDvwDI6IdsdmjsIJDFe1ZCZ+qbQZs1VQoBJNWbJ2MYFt7LeZn6+/0lyHy5ITe3a0cDJB1W3LOxatps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212475; c=relaxed/simple;
	bh=JVLxKY/C0/D6kBrPgCv1rh4oFIk66KfsKNnW+q8Oe5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ol7/ZiI3hto9Mp9AqI5qQJdC576dG6YUm1WKzGEjDiRaastplXnvv5BPBhVOJHhPgyLYFNUUswCOHe+iIpUwyQZLIZFyO+lIVlTvHhpDAropqMjhgv+k7JtkrzksUh7yXIJW4F4TqkRd5+mTbCi+qKJ82pdwyiYm64wXFgUnEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=GmnRVakY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="GmnRVakY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1004451f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787212472; x=1787817272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gzOxx9oE6eKHxFZ2hWUiqIgHk0IssfaFnjK3QXCWkg=;
        b=GmnRVakYGgA8Vki6/jrNgpFxqM4y/aqj3SNzu8hD82Xtv2ybzklwItHfQNtxByiWzO
         qK64tp3JQIgRRWI2eLc0r+dV1vx8bqCUYmUi2KSPvFgJS0zsM7l/9d5BZuJxaYepWO8j
         HXOC+BcUBXyOBM5VDYy/JxlRBXPon/dV5DtZwtHW7ufXa+aG7/KnZHtrlG5ItKJydJO5
         4W02nEeBw0UN2bTBfVhdFjaCw446/iVWI1GqFw1Y/pxX82RMFp11quEWdoFsYYdYcz81
         AdlFnhmXIcAo5NBIcqQAY+brogxPPrY1gucwwDdbT8IZJVqm382E3ZG3sqaRN9dVuHxI
         d0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212472; x=1787817272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gzOxx9oE6eKHxFZ2hWUiqIgHk0IssfaFnjK3QXCWkg=;
        b=AarNov0MR1nfj1es/5Ff0tmmZIIBN+V9a1bRMW394I0nbw9/giXPpHONpKPz1Q+YQa
         pU318kMniHsgtA+YYEY7pGa1v8ZJUbQ6lmXxvyiDpKRs1WrpiodBqHhAr7xkN/2upLRg
         lu0DPE2wqhevQKWpDitkVKjqmMNaAYfFgPnEiwUA5ZXyGB9DZX/PnDpN8RU66GPcSS2Q
         mmGast3beYLres24bicBBpB84YjTonFfNbAR+pihQ+hJCm2/unpBcxyU4An4WbzhgzRy
         oZ3NJSLkbUXo5+nLIvNq8nq38/GbyP+luSipmFWFSIzP3iqNeUc62sBJY4dR42ZHc246
         XWEA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr/XDn1Pe1ln3YZzu8SWOKKFPGDzZuhjtgx1gek5Ab9UZERqy0XmqLmHNbquYsQ7MSmPmNHDUSb/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mux7CfaetflT2P5nnD2Qx7LlDoOwBoC36lN7MsgDgITqHAswdd
	xtkaZbPwTRG05okWNwSJW0qhXuqQz7/pgEeGa+Rpw9C3E1S84w7DAoonp6OOhimVr7E=
X-Gm-Gg: AR+sD11j9UjuVGCkS4k1sfXVFqs66gGh6YZyRqZm4RmZsQ/BJbX28QQ8j0HRbE42DRe
	JqoxyHWQhdJVahW01m7e+rQAuplEviwYlRPyBp7X3q9R/lYh67NhsUc6KOTgpqQUXq/ms6jaRzi
	azBEFkGUKlw+0pVB34ZdWrHXylYMT9IkoTu0JQrxJ4lB+9ekaNtsEfN7Awb6C26WA7lvcIucy9s
	BxY2bPMXkglNMSsRCPaLo5l7OmlcgbSOkiJVgE87TDgRDXQU1RIcT7jgT7aH6jOLKwSqHts9H6c
	r9PPSvKKBxzm2Uw92/BvheDeDVfyRt95gHWch5Uwv1Qs8oXabcVeqW4QWiSQCCn/w2IiH7fKiuC
	OD+UhYhk8hRslO/Wq2fKaEMJPgisEC3+g8FeqEvHls5Yv+1NVcKRZ2ihYz/cpPtROE/NUmJrSno
	BRxWkZq0H9SJCQDsqhinUPAFiUb5Me4m/tXDJVsZX/6Cn5rKdOfEmyVdqXQywAvMmW6ou+7+joG
	rI4OrKjaJ5skA==
X-Received: by 2002:a5d:5d0f:0:b0:481:51b5:7503 with SMTP id ffacd0b85a97d-482b1e92a63mr16850901f8f.7.1787212472136;
        Thu, 20 Aug 2026 00:54:32 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d0360sm10342800f8f.33.2026.08.20.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:54:31 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	heiko@sntech.de
Cc: bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests reach the divider
Date: Thu, 20 Aug 2026 10:54:27 +0300
Message-Id: <20260820075427.67050-1-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every MCLK_SPDIFn gate is declared with flags 0, while the CLK_SPDIFn mux
immediately above it already carries CLK_SET_RATE_PARENT. The rockchip
S/PDIF driver calls clk_set_rate() on the gate, which has no .set_rate of
its own and, without CLK_SET_RATE_PARENT, no way to pass the request up.
The clock core therefore computes "new rate == current rate", returns 0,
and changes nothing.

The visible effect is that S/PDIF is stuck on whatever divider the
bootloader left behind. On a board whose audio PLL is parked on the
48 kHz family, every 44.1 kHz source goes out at 48 kHz, silently, with
nothing reporting an error. Measured on an RK3588 board playing 44.1 kHz
material, before and after:

  mclk_spdif0   12287999 Hz    48000 x 256
  mclk_spdif0   11289598 Hz    44100 x 256

Add CLK_SET_RATE_PARENT to all eight MCLK_SPDIF gates so the request
propagates to the fractional divider that can satisfy it.

Propagation stops there. Each chain terminates at CLK_SPDIFn_SRC, which
is declared with flags 0, so a rate request cannot reach a shared PLL and
pull unrelated consumers off frequency.

Two pairs of gates share a divider - mclk_spdif2 and mclk_spdif2_dp0 both
sit on clk_spdif2_dp0, and mclk_spdif5 and mclk_spdif5_dp1 on
clk_spdif5_dp1 - so a rate set on one moves the other. That sharing is in
the hardware and is not introduced here; before this change neither of
them could set a rate at all.

Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    Generated against broonie/sound.git for-next. clk-rk3588.c
    carries no ASoC changes, so this should apply to any current tree.
    
    Tested on RK3588 hardware running 7.1.3: without this a 44.1 kHz stream leaves
    the S/PDIF transmitter at 48 kHz; with it mclk_spdif0 retunes and the receiver
    locks at 44.1 kHz.
    
    checkpatch --strict reports "Alignment should match open parenthesis" on the
    touched lines. That continuation indentation is unchanged by this patch and
    matches every other clock entry in the file; realigning only these eight would
    make them the inconsistent ones.

 drivers/clk/rockchip/clk-rk3588.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 2ba9976654c..b3d577dccfc 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -960,7 +960,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(33), 0,
 			RK3588_CLKGATE_CON(9), 0, GFLAGS,
 			&rk3588_spdif0_fracmux),
-	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", 0,
+	GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(9), 1, GFLAGS),
 
 	GATE(HCLK_SPDIF1, "hclk_spdif1", "hclk_audio_root", 0,
@@ -973,7 +973,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(35), 0,
 			RK3588_CLKGATE_CON(9), 4, GFLAGS,
 			&rk3588_spdif1_fracmux),
-	GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", 0,
+	GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(9), 5, GFLAGS),
 
 	COMPOSITE(ACLK_AV1_ROOT, "aclk_av1_root", gpll_cpll_aupll_p, 0,
@@ -1868,9 +1868,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(123), 0,
 			RK3588_CLKGATE_CON(57), 4, GFLAGS,
 			&rk3588_spdif2_dp0_fracmux),
-	GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", 0,
+	GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 5, GFLAGS),
-	GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", 0,
+	GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 6, GFLAGS),
 	COMPOSITE(CLK_SPDIF5_DP1_SRC, "clk_spdif5_dp1_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(124), 7, 1, MFLAGS, 2, 5, DFLAGS,
@@ -1880,9 +1880,9 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(125), 0,
 			RK3588_CLKGATE_CON(57), 9, GFLAGS,
 			&rk3588_spdif5_dp1_fracmux),
-	GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", 0,
+	GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 10, GFLAGS),
-	GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", 0,
+	GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(57), 11, GFLAGS),
 	COMPOSITE_NOMUX(CLK_AUX16M_0, "clk_aux16m_0", "gpll", 0,
 			RK3588_CLKSEL_CON(117), 0, 8, DFLAGS,
@@ -2059,7 +2059,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(149), 0,
 			RK3588_CLKGATE_CON(63), 6, GFLAGS,
 			&rk3588_spdif3_fracmux),
-	GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", 0,
+	GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(63), 7, GFLAGS),
 	COMPOSITE(CLK_SPDIF4_SRC, "clk_spdif4_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(150), 7, 1, MFLAGS, 2, 5, DFLAGS,
@@ -2069,7 +2069,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKSEL_CON(151), 0,
 			RK3588_CLKGATE_CON(63), 10, GFLAGS,
 			&rk3588_spdif4_fracmux),
-	GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", 0,
+	GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", CLK_SET_RATE_PARENT,
 			RK3588_CLKGATE_CON(63), 11, GFLAGS),
 	COMPOSITE(MCLK_SPDIFRX0, "mclk_spdifrx0", gpll_cpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(152), 7, 2, MFLAGS, 2, 5, DFLAGS,
-- 
2.34.1

