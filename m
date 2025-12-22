Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A86A31618E
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398954; cv=none; b=nzzql/ntaWt74FGmVkUDxIqFA0NGa+hssfpqsGg0MERuEdirRkS1o5LF56KgeaL5YQ6bfbZSSWLSXtvoz2v7nQ6I3nfaW1MvRIOf6JMZ+tyLSYUlpz8UCm1c0rdyOD/6hgCGmAkZqGkNVR5warqJU8DuWLCgjKagVbmsQQ1Ux98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398954; c=relaxed/simple;
	bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5TC0F9yUgcDnWqnT+xZBkENj/8zEpgrgqnHIVSsvnl/y4p55Qaef5ON1QxR5Hr9dZ0C2QOuvhd+vDijQRRSciG07e52pZFzGssx+vsuCFOPhakYI51OxthlqV/jfgVXOkTQ4/zANoFnb359E374YfCRuiujwz1XOR3Xe3FQaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lg47hCeS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg47hCeS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2303801f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398951; x=1767003751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=lg47hCeSmMjUvQrEtb7Ezuxlb16OX7yrns6rgEIhkV5XxN1j/6gdcrGiWsJ900OeBr
         K6RoL5Tk347+AFFWB3yOlZHpa0Wo9fQzg05GSrZZ3ymbv5UOqDvRpCWaMz1ldebzN9FY
         kqMPeQLCIvSJC/HI2cdHm0IdbDjTHCPvFqmQ9ShQSZCpdLP+cP7M+8etUlL+hhwK2nNr
         FbN93hCpKdcvuf8uiboRFZpItxJUwUOr+XCXOTrRxQEAGwkUVWOdJa9/GYrc15d78G/x
         0dA+0ViljaUfRL2z7g9q+FiJKoFs74QIgpt98WhQwDvY7WG2RuUy3Zl9jkP8bDTtc/Ge
         oZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398951; x=1767003751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=Caw0BfhZ79/aGzmTZ8RRndA8lbWj6VZmRiKYcLMvARhaASAhQQoWXxn+RghSBkpIuf
         z7beYg+WLi20Z2Rsm/xN8vY16evxSYUrkGcNI1ahe2gX8Apw9GsQdojHU2UnI/Rj0TAD
         bpkKxACudD7PMc8xgDhP5WxzCl+vhYQmKTR9raOCtNfYp6UitqOsha+sqWBdWe/kdd9W
         vVjM/iSZhuxUWaxBXSFcgnnyQlZx8jhPVaYnX6JB0CJdcbQLUpoV/3BO1fqBBqTmap5f
         JgleYG3rOXmUyLjM1F7efGxg6K/JkUs6gWyUuE/U3RjaErF1Bp8bMxisXA1ueAGqy3ME
         dOUw==
X-Forwarded-Encrypted: i=1; AJvYcCWBR/Au8N3bA+cXXdngjgmhU3Q6PJnaKtxrd5ek9XPdeIHqtAcuWws2LGeSO8CGOHTzRCt4HMn16b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZn5WbRndIPLX78qA3+DTYAxb96Ch8FLp40k/lszorPlcA1eQ
	F8yOAvRVDx/hM0iq6fby34WsdaiJWHSFRc73CfYT1qctLTLa48C30UdyiYiF77IsfyA=
X-Gm-Gg: AY/fxX7TnJhNv94OjzV33kzjqnw3rWbRxINCIujk5Xa8zv2N0AKrJPIt26AJu/b9o4r
	F4iS1Zq8VwkGIOuNy/5rixs7cC5a7Q/usC63RMthEv5JLYL4I+uYPOvH16ytTEYOZ6+Fs0h/CTQ
	TnXJ/I+gzYsYWYOWfVwZWxlGewMnRRdfh5bS4Rsq8JxHYhGVYiqXpkL1AmRUwbw6CuPgdVNGCMF
	lHb7C1QSPzC1ZZ0/fPS+u+Ku2JSwXlqc+I4Pqkb91gDTWqAapztRa8pYfl02JM4PLSz9PdXsYo2
	vsbWUFf6KHxryBacsQmQW0MI6XYAyJTM2q6iKyEqm78Yh2oVJaF3P9Sb9rojdwEuVuxpInRnW6S
	Ypv/U5+AnPvQGUBMUhCiHdFSMAArpMYdBeddWqz21CoILAI1/XdIqlLC6Mg3hqw16JgCEQretHy
	9Qlm0yaPoEniqCJseT3FbpkdMEMiXcvBCaeyPQVSg=
X-Google-Smtp-Source: AGHT+IGxik5wZb6PJ3ZvxaBK6HnP18pgqXLZsVTlxUcURxM01dwk5X4GOejTSgcqBo9Mh0RevTTv5Q==
X-Received: by 2002:a05:6000:2203:b0:431:4c6:724d with SMTP id ffacd0b85a97d-4324e4fdb00mr12420505f8f.29.1766398950600;
        Mon, 22 Dec 2025 02:22:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:15 +0000
Subject: [PATCH v7 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-automatic-clocks-v7-4-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRve79sRE6Wiibe1gwos813YqTCmnceQ/Jgxj
 ODyrBDXma2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3gAKCRDO6LjWAjRy
 up+3EACCbn7AeVJ7SP/7s4uvGaRUCmaTr06pvM6zozJEYE+UeOH9TaLN9jslCVOvFFCAwS8b8tf
 NjFfpkUdp3yqWM6Nq0k79AKldDt85/ay/S8coqz4d/HxeJizxgKnnXUes1aYZgPk3Gj6qsCDzjP
 WigzwpGEZGeUWlEng5E6AX1p/GDo38haM4tasUTJSKJ9fIub8K3+HrMur/vncCKwR5o0Y/HQuPS
 I/1cNb559uo+JhGUmkpoMZFprCBxZquuOxL/YGas0tv7xP+rKXT9PhxI9Rn8YDh+TTAfc9C/X+t
 jCBIKqNUq4seCMq0JQsnRIKWklAmMvysUBZii0rTk1e2G6zKUXfmjEbplMIV+Y5ko6oWXTX7Rk9
 FeSvR7UAGlBM2zOgxAXszmYI6uOnIBL01bV7nE1Bc93DtbH1N8G9kboJcOiwzz/eXdD1kxEc+cC
 yAig1+wRjENdZhs9fTx4Ugmm+FhOR28v3peBDOZBi7XSgAxNKYgqbStE67MQxBjYT5/kt+beTlt
 7JXRW9/792mhNEBAL6VN+daYxGsD4gpJ8iCuO4FIHabBNke+wTv/35hZfI6HLy1WbprqkP3mp4P
 +22N9tplsARHac5+SPa1Pq+yW3EFdM0erf1ZuW1RoG3P3G4J5xpdJ8imcy758Dxo0iJ0YIQPWqV
 RZM4gcywVoUk0bg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Remove unnecessary header of_address.h (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..8551289b46eb88ec61dd1914d0fe782ae6794000 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -26,6 +26,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1437,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1907,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
+static const unsigned long dcrg_memclk_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+	GS101_MEMCLK_OFFSET,
+};
+
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.mux_clks		= apm_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
@@ -1912,6 +1924,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_APM,
 	.clk_regs		= apm_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
@@ -2375,7 +2393,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI0,
 	.clk_regs		= hsi0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI2 ------------------------------------------------------------ */
@@ -2863,7 +2888,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI2,
 	.clk_regs		= cmu_hsi2_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_MISC ------------------------------------------------------------ */
@@ -3423,7 +3455,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 static void __init gs101_cmu_misc_init(struct device_node *np)
@@ -4010,6 +4049,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4063,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC0,
 	.clk_regs		= peric0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- CMU_PERIC1 ---------------------------------------------------------- */
@@ -4368,7 +4417,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC1,
 	.clk_regs		= peric1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- platform_driver ----------------------------------------------------- */

-- 
2.52.0.351.gbe84eed79e-goog

