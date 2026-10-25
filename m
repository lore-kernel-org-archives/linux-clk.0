Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955989;
	b=d1R2ykCct2DzQWyvWMcVeGACuGspTPEFMaYIxsMrqGlZDvO5+pFFls7sSSN1yp4j8KLi
	 doaFKiojOaJj8LDF+dL8Tt00AiRGO942UG1FMNrUJQvbNBIPIkU2HWP7Hi13k7/w9jbbh
	 PvuPbTEePTfudgDwab09sgPwRd66aXsYh2u0T6v1vcFxxd9g7130JxL0k1pIw0ncjy4N6
	 yFKh9KDuzDf5b8OFEM667jXiYDBDbJ6ue1eRccoBd2jXhr2yXVRSqGW4RgWmwY95VJ2Cx
	 zj2qCQbf3UA2DTfD1RN0B4sQBDM3DBUqJCgmohtYctL4CVr3HejNq90eNWQNfP11gaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955989;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=kABjzP6vhmonisOUAMydsaWiwxh5YB8qUlHCWM3/0mE=;
	b=tA7NWSlroyMugLnvJ8bH8oE4CJ/z3nKSGapki7+d7UVXIVsVG7V51vFMIbt+1urYZYbA
	 AuAsr7YvPE9vDIuvbg5yEFeePKYGHJksm0j2GlXqaNV4PS0rKeVs4NLtD+vtetQH0JgiY
	 ldkHqwKSZn9V6pPC4gEJrVfn4LW4x7+AYn0i7txr4Y8V9Lj6wRdEeKV0wgQthxnLjqeml
	 yV+iSnbT1ZJcuSgxdTNqT6RbHpSBRrSYEDqT2QgN1xJrtX2lwAIdhKEhA69CguoLM7NeV
	 R9yGIrEs9Gfq4aMIYRKenbFfrxyn5HPkDgJUB3bSMP12fAS6VaOoE2Bfmte/lgvOVqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=mc6JDdMy;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B4606A31A;
	Sun, 25 Oct 2026 19:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=mc6JDdMy
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eU514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eU514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955950;
	bh=kABjzP6vhmonisOUAMydsaWiwxh5YB8qUlHCWM3/0mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mc6JDdMy5tN5josOUsMBXGWVrLJKdZomz2kMEnIP4n24uXGqHe6SnoxvQwVWQj9NI
	 P81BPEgiiVa6kanEECGVsfwvt8T7YWB5dRlyBRPeZf8lQ/rGnA94QgElG8bwTvQKVZ
	 p8nyffFCUE8O9WX1TeTcmN0cREEell29XHXwMRQ8=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] clk: meson: s4: keep the PWM clocks off vid_pll
Date: Sun, 25 Oct 2026 20:18:51 +0100
Message-ID: <20261025191852.208226-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The PWM driver asks the clock framework for the fastest input it can
get (clk_round_rate() with roughly 0xffff/period), so on S4 every PWM
channel ends up parented to vid_pll, the fastest input of the PWM mux.
vid_pll is derived from the HDMI PLL and is reprogrammed on every
display mode set, which silently changes the period and duty cycle of
whatever PWM runs from it.

On boards that use a PWM regulator for the CPU supply this corrupts
the CPU voltage: on an S905W2 board vddcpu read 699 mV at 1 GHz and
the first cpufreq transition hung the SoC. Boards that feed the
32.768 kHz low power clock of an SDIO wifi chip from a PWM see the chip
intermittently fail to enumerate ("Failed to initialize a
non-removable card").

Drop vid_pll from the PWM parents and keep the remaining inputs on
their register values with a mux table. xtal, fclk_div4 and fclk_div3
cover every PWM rate in use.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/clk/meson/s4-peripherals.c | 38 ++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..329cd526749e 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -2588,51 +2588,65 @@ static struct clk_regmap s4_spicc0_en = {
 	},
 };
 
-/* PWM Clock */
+/*
+ * PWM Clock
+ *
+ * vid_pll (mux input 1) is left out on purpose. The PWM driver asks for the
+ * fastest clock it can get, which made every PWM pick vid_pll - and vid_pll
+ * is the HDMI PLL, reprogrammed on every display mode set. That silently
+ * changed the period and duty of whatever ran from it: the PWM CPU supply
+ * (a cpufreq voltage change then hung the SoC) and the 32.768kHz clock of an
+ * SDIO wifi chip (which then failed to enumerate).
+ */
+static u32 s4_pwm_parents_table[] = { 0, 2, 3 };
+
 static const struct clk_parent_data s4_pwm_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .hw = &s4_vid_pll.hw },
 	{ .fw_name = "fclk_div4", },
 	{ .fw_name = "fclk_div3", },
 };
 
-static S4_COMP_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9, 0x3, s4_pwm_parents);
+#define S4_PWM_SEL(_name, _reg, _shift) \
+	MESON_COMP_SEL(s4_, _name, _reg, _shift, 0x3, s4_pwm_parents, \
+		       s4_pwm_parents_table, 0, 0)
+
+static S4_PWM_SEL(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 9);
 static S4_COMP_DIV(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_a, CLKCTRL_PWM_CLK_AB_CTRL, 8);
 
-static S4_COMP_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 25);
 static S4_COMP_DIV(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_b, CLKCTRL_PWM_CLK_AB_CTRL, 24);
 
-static S4_COMP_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 9);
 static S4_COMP_DIV(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_c, CLKCTRL_PWM_CLK_CD_CTRL, 8);
 
-static S4_COMP_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 25);
 static S4_COMP_DIV(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_d, CLKCTRL_PWM_CLK_CD_CTRL, 24);
 
-static S4_COMP_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 9);
 static S4_COMP_DIV(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_e, CLKCTRL_PWM_CLK_EF_CTRL, 8);
 
-static S4_COMP_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 25);
 static S4_COMP_DIV(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_f, CLKCTRL_PWM_CLK_EF_CTRL, 24);
 
-static S4_COMP_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 9);
 static S4_COMP_DIV(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_g, CLKCTRL_PWM_CLK_GH_CTRL, 8);
 
-static S4_COMP_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 25);
 static S4_COMP_DIV(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_h, CLKCTRL_PWM_CLK_GH_CTRL, 24);
 
-static S4_COMP_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 9);
 static S4_COMP_DIV(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 0, 8);
 static S4_COMP_GATE(pwm_i, CLKCTRL_PWM_CLK_IJ_CTRL, 8);
 
-static S4_COMP_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25, 0x3, s4_pwm_parents);
+static S4_PWM_SEL(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 25);
 static S4_COMP_DIV(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 16, 8);
 static S4_COMP_GATE(pwm_j, CLKCTRL_PWM_CLK_IJ_CTRL, 24);
 
-- 
2.56.0

