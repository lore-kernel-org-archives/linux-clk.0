Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A614AD29
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 22:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122779; cv=none; b=QB/7sizpNhVad+y/rz7wL0AYUq0efs4+l86tGQN88LWw8Xk8aEGMY1gNsHoQnz/Nyo824h1zOK4OuFi7/P1gwfttlBofUx2DJ+nN2NzkXqqmSXHdAqJhqidk1d9Nxgi0HLIAV74OO+nbjJsdRNAgQ1zFlFQLN5FzGdq9h6N9QmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122779; c=relaxed/simple;
	bh=xY1LMobodbRh5wNGfmOsFYW91hGkyg6ukGBHJClJZUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GrDFdLSUQEmALejUFgAWqIVXZjzCawxRMiQ3K0zuZrsiXqnhgIj8Yy2kwcLlGo9aEc1ITAWy7//rO8JLKFt0zafLCp0OUhFVGjeVvDfQVfuiUfr6fgv1LWwbkpi4HiB4fcb+pK+FbJfdQiDq++VA4uQh4heCGKKTPoaEch4KK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjqb3dH7; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjqb3dH7"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-20503dc09adso1504782fac.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 14:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122776; x=1708727576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv24mbqztn1Vrin55e28olHgU7+Z3ekpJo7z50Ef2KU=;
        b=cjqb3dH70MuznxMRQvKlLu3suaxnTb6MeZc8p4AyXY7cktSQ7rSQ7cZZtBQxKUImXt
         J/Ae9MlwqtFhZfHQJc7Gw7uElUf0Tow+rTuEUgFoeMurmADUNlkNGul+VnkGnUdng3tc
         mMso8PQuMgWsTqp9A3FQXEUnC8Xk67+dyft1Y/JlXi5Y0s8c8BiphvL5KUTPwktH+xKA
         tVFnbGjP8v0w/KjWdLX/L9zvctYzwikMAuH1yYVaDxyNuu3j2tMsicUKPlSF0KzSDLcg
         Eyv2BdEsiG/tRSPPmgWD8ggV6SJKVxiQCH0hex58Qu3HvuFJwa0tYpmvSYiM+6ZyHeF8
         yeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122776; x=1708727576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dv24mbqztn1Vrin55e28olHgU7+Z3ekpJo7z50Ef2KU=;
        b=bCxpTnNV4qcpyYYNLeXIOsGJnHwDeliM2OnGUb5z31qXRAyJGZy7/2r3QKNorTtbsW
         cAOElhvBoX3YR9jHi4nHzauTLkpH+tv6M7AOgMq0wFyg9QwJp6gPGovyzCcPGfo5yFxd
         BXpihFP/f4bbzcFtUA5j+ArPWYvaXCiYqV2q73yfbS63atg210srUEkfc/DWLD+FFfLa
         Kih3HSe3ygHHiuQ7Hw2b7yBU91ocMlt6p/oEH1Ccz0IihXdE8LwJp7YjejXS3G1Sb16G
         5Y9LKi5VNmqJ+oVEjEzpAkAdzbS1BKThySNLEfUnUcxscShB7gNSxnW4g/29rFd7GX1g
         sECg==
X-Forwarded-Encrypted: i=1; AJvYcCXQIu3/I9ALhravJie6caNeSNbLPeiNBvmdxjB707Bh++C4ohUXbMR1Jfwuo3oNR7Dv4dQOkBqjIoYqQtutVl8qs8QQFjFVS/Ig
X-Gm-Message-State: AOJu0YwyBw4zfeRI2W81AWrCsFrJf1Lcc0gQ4RkkiHcL5Yxd87LgcSvL
	rLVNBarfZFcpQ5UoqAph/NX1sve5uAdiH4uabreUMQ8V74to3hlLNjqq13lQFMA=
X-Google-Smtp-Source: AGHT+IHSp7Y+lZqtIwhuV38Vy9LKfAOo074hUyw0pXjuu9Ts+M1Gi0UOFUXmjH8H0xsqSEj6G14+kQ==
X-Received: by 2002:a05:6870:8192:b0:21e:6672:a46f with SMTP id k18-20020a056870819200b0021e6672a46fmr3255262oae.29.1708122775911;
        Fri, 16 Feb 2024 14:32:55 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id ov11-20020a056870cb8b00b0021e70d17dc7sm199912oab.30.2024.02.16.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:55 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] clk: samsung: Pass mask to wait_until_mux_stable()
Date: Fri, 16 Feb 2024 16:32:41 -0600
Message-Id: <20240216223245.12273-13-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216223245.12273-1-semen.protsenko@linaro.org>
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it possible to use wait_until_mux_stable() for MUX registers where
the mask is different from MUX_MASK (e.g. in upcoming CPU clock
implementation for Exynos850).

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 744b609c222d..5ea618da0bc1 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -134,16 +134,16 @@ static void wait_until_divider_stable(void __iomem *div_reg, unsigned long mask)
  * value was changed.
  */
 static void wait_until_mux_stable(void __iomem *mux_reg, u32 mux_pos,
-				  unsigned long mux_value)
+				  unsigned long mask, unsigned long mux_value)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(MAX_STAB_TIME);
 
 	do {
-		if (((readl(mux_reg) >> mux_pos) & MUX_MASK) == mux_value)
+		if (((readl(mux_reg) >> mux_pos) & mask) == mux_value)
 			return;
 	} while (time_before(jiffies, timeout));
 
-	if (((readl(mux_reg) >> mux_pos) & MUX_MASK) == mux_value)
+	if (((readl(mux_reg) >> mux_pos) & mask) == mux_value)
 		return;
 
 	pr_err("%s: re-parenting mux timed-out\n", __func__);
@@ -248,7 +248,7 @@ static int exynos_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	/* select sclk_mpll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg | (1 << 16), base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 16, 2);
+	wait_until_mux_stable(base + regs->mux_stat, 16, MUX_MASK, 2);
 
 	/* alternate parent is active now. set the dividers */
 	writel(div0, base + regs->div_cpu0);
@@ -289,7 +289,7 @@ static int exynos_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
 	/* select mout_apll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg & ~(1 << 16), base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 16, 1);
+	wait_until_mux_stable(base + regs->mux_stat, 16, MUX_MASK, 1);
 
 	if (cpuclk->flags & CLK_CPU_NEEDS_DEBUG_ALT_DIV) {
 		div |= (cfg_data->div0 & E4210_DIV0_ATB_MASK);
@@ -361,7 +361,7 @@ static int exynos5433_cpuclk_pre_rate_change(struct clk_notifier_data *ndata,
 	/* select the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg | 1, base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 0, 2);
+	wait_until_mux_stable(base + regs->mux_stat, 0, MUX_MASK, 2);
 
 	/* alternate parent is active now. set the dividers */
 	writel(div0, base + regs->div_cpu0);
@@ -389,7 +389,7 @@ static int exynos5433_cpuclk_post_rate_change(struct clk_notifier_data *ndata,
 	/* select apll as the alternate parent */
 	mux_reg = readl(base + regs->mux_sel);
 	writel(mux_reg & ~1, base + regs->mux_sel);
-	wait_until_mux_stable(base + regs->mux_stat, 0, 1);
+	wait_until_mux_stable(base + regs->mux_stat, 0, MUX_MASK, 1);
 
 	exynos_set_safe_div(cpuclk, div, div_mask);
 	spin_unlock_irqrestore(cpuclk->lock, flags);
-- 
2.39.2

