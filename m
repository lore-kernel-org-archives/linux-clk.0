Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A54E12FB3D
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820481; cv=none; b=TfnuPPk5MHJBLgGq3DKLba4/lu4+rZbW0jfpWTFQDphqLzjsuojfv6/5kGx8TTefzAgD6x+TzStosGUUwghoEAdZVj/GcfKDkj7whbflJcFp1peESovbwk00XppzuLMOjOP7ioMF5jNDI8x5sLkKb/371tt/DAJEhilg2bU0uf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820481; c=relaxed/simple;
	bh=/AU+pESc4q39VuYj6dvjJTIjPU1eYaspCrgu+4GKZvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYBhjmuT9OrIl+G+1A2ApjupQK+r6KrKEk1i+o7nnVP0k3CFFKy39dGwaYisBps2du6cDkGQYm34/kcqaJCCzFU4cVU5tymCiZUr4ffxf4chzGS7kPZdQuZL8JHZGiE+ocF7FIJI8G50Lo6srSO2A321JinnZ/niK2S3q89pbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KGBSS+MS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KGBSS+MS"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso99181466b.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820477; x=1710425277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1enE41924FjnPvc41bprhOHCOVjCwwdMHom0HcmXLA=;
        b=KGBSS+MSq3YJQ1swQ5us/jY5/JrUPFq+eA4hUTC4ymI7poJ6D9tcRmSZbs9AsTdsDR
         GwwLAxhmOGnH3iFSbMNGPky2RJZJ8HNhIG3YISRLXLsaPW4T5pEoy457OFpQzR0MAZvW
         iDgSQa93Z8dvrDHj3SA1pU13UkODPVAdtCVnmX/uEekfOecB7jdZhZYmA5/pLt4A2q+9
         bskNeLCUdPZe+Mxrxl31PuDNATSLLxdnpm+t7g7cZtF0ud8086wKTwg1ZB6cY1JmCSHy
         8zHLa75Lfktg5UiQ+Inzg0IBRQ/sbjoj31MPLey0iHfd/rYyvgl+AS9mnwapaI27SLJS
         +8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820477; x=1710425277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1enE41924FjnPvc41bprhOHCOVjCwwdMHom0HcmXLA=;
        b=Y7CJfVEu7w0vkJpxM2xDhamlKNQW9/Xw8s4LYG+7ZmKWVq4RxsI4++uFmH0tBRhSxZ
         9F7R7NMVG9/PeUHy4XTFDxuAG1PH0EviBo93cP6JNJs2i7Z5zU2obUai8d/HaTkxFD9H
         PLy5J4YqrU4S8DfXkVmbMu8S6KP8mthg4Wzs1sSUyPrQrS6FubuKmTG77ypqUs9Cd4VR
         tyCUH9dTx0W2Px6n/nYNXvYb6GBccDJWB2wLL6odX55Yt08RZR+SLEjbAwGVnuyjzcqB
         0PKbKCnAnWoazQfabbO+nSzaeOpbRfAxDLC8VaZZE56V/SPEg/hVG6w/5qxq0bB4ay3r
         y6LA==
X-Forwarded-Encrypted: i=1; AJvYcCX21RYq8wPTfPFcbfXFY2VQHjgCEXRARsMUZYLzJuADPf2bLKi/5LLGqpy7A2Faa3rhnjgcqaiYVGBNtQWPQCqmgNU4qCW8vO5p
X-Gm-Message-State: AOJu0Ywym1WBi2qTsMi6RElzYdtSGDLgM5DDWhIg6aFuher/cFa0I3cL
	OWgOdiFq50/qw+rWedflvbOwSWFi247CPn+d7l3WsMKpfGfSn8aGhwnW0Sz/xjY=
X-Google-Smtp-Source: AGHT+IFDtF3Rr1S3adBb0GZlaHYYf10NNukNNS7tU1R2HGoIfSaU6y9HctOXpPo5TVVlG7o67kamjw==
X-Received: by 2002:a17:906:24d4:b0:a44:2761:b6db with SMTP id f20-20020a17090624d400b00a442761b6dbmr11499734ejb.67.1709820477650;
        Thu, 07 Mar 2024 06:07:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:57 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/10] clk: renesas: rzg2l-cpg: Add suspend/resume support for power domains
Date: Thu,  7 Mar 2024 16:07:26 +0200
Message-Id: <20240307140728.190184-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S supports deep sleep states that it can reach with the help of the
TF-A.

RZ/G3S has a few power domains (e.g. GIC) that need to be always-on while
Linux is running. These domains are initialized (and powered on) when
clock driver is probed.

As the TF-A takes control at the very last(suspend)/first(resume)
phase of configuring the deep sleep state, it can do it's own settings on
power domains.

Thus, to restore the proper Linux state, add rzg2l_cpg_resume() which
powers on the always-on domains and rzg2l_cpg_complete() which activates
the power down mode for the IPs selected through CPG_PWRDN_IP{1, 2}.

Along with it, added the suspend_check member to the RZ/G2L power domain
data structure whose purpose is to checks if a domain can be powered off
while the system is going to suspend. This is necessary for the serial
console domain which needs to be powered on if no_console_suspend is
available in bootargs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 66 ++++++++++++++++++++++++++++++---
 drivers/clk/renesas/rzg2l-cpg.h |  1 +
 2 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b36700f4a9f5..b18af227177e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
+#include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -139,6 +140,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @info: Pointer to platform data
+ * @domains: generic PM domains
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
  */
 struct rzg2l_cpg_priv {
@@ -155,6 +157,8 @@ struct rzg2l_cpg_priv {
 
 	const struct rzg2l_cpg_info *info;
 
+	struct generic_pm_domain **domains;
+
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
 };
 
@@ -1570,12 +1574,14 @@ struct rzg2l_cpg_pm_domains {
  * struct rzg2l_cpg_pd - RZ/G2L power domain data structure
  * @genpd: generic PM domain
  * @priv: pointer to CPG private data structure
+ * @suspend_check: check if domain could be powered off in suspend
  * @conf: CPG PM domain configuration info
  * @id: RZ/G2L power domain ID
  */
 struct rzg2l_cpg_pd {
 	struct generic_pm_domain genpd;
 	struct rzg2l_cpg_priv *priv;
+	int (*suspend_check)(void);
 	struct rzg2l_cpg_pm_domain_conf conf;
 	u16 id;
 };
@@ -1676,6 +1682,13 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
 	struct rzg2l_cpg_reg_conf pwrdn = pd->conf.pwrdn;
 	struct rzg2l_cpg_priv *priv = pd->priv;
 
+	if (pd->suspend_check) {
+		int ret = pd->suspend_check();
+
+		if (ret)
+			return ret;
+	}
+
 	/* Set MSTOP. */
 	if (mstop.mask)
 		writel(mstop.mask | (mstop.mask << 16), priv->base + mstop.off);
@@ -1687,8 +1700,14 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
+static int rzg2l_pd_suspend_check_console(void)
 {
+	return console_suspend_enabled ? 0 : -EBUSY;
+}
+
+static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, u32 flags)
+{
+	bool always_on = !!(flags & RZG2L_PD_F_ALWAYS_ON);
 	struct dev_power_governor *governor;
 
 	pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
@@ -1700,6 +1719,8 @@ static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
 	} else {
 		pd->genpd.power_on = rzg2l_cpg_power_on;
 		pd->genpd.power_off = rzg2l_cpg_power_off;
+		if (flags & RZG2L_PD_F_CONSOLE)
+			pd->suspend_check = rzg2l_pd_suspend_check_console;
 		governor = &simple_qos_governor;
 	}
 
@@ -1719,7 +1740,7 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 
 	pd->genpd.name = np->name;
 	pd->priv = priv;
-	ret = rzg2l_cpg_pd_setup(pd, true);
+	ret = rzg2l_cpg_pd_setup(pd, RZG2L_PD_F_ALWAYS_ON);
 	if (ret)
 		return ret;
 
@@ -1778,13 +1799,13 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 	domains->onecell_data.domains = domains->domains;
 	domains->onecell_data.num_domains = info->num_pm_domains;
 	domains->onecell_data.xlate = rzg2l_cpg_pm_domain_xlate;
+	priv->domains = domains->domains;
 
 	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, &domains->onecell_data);
 	if (ret)
 		return ret;
 
 	for (unsigned int i = 0; i < info->num_pm_domains; i++) {
-		bool always_on = !!(info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON);
 		struct rzg2l_cpg_pd *pd;
 
 		pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
@@ -1796,11 +1817,11 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 		pd->id = info->pm_domains[i].id;
 		pd->priv = priv;
 
-		ret = rzg2l_cpg_pd_setup(pd, always_on);
+		ret = rzg2l_cpg_pd_setup(pd, info->pm_domains[i].flags);
 		if (ret)
 			return ret;
 
-		if (always_on) {
+		if (info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON) {
 			ret = rzg2l_cpg_power_on(&pd->genpd);
 			if (ret)
 				return ret;
@@ -1890,9 +1911,43 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	dev_set_drvdata(dev, priv);
+
 	return 0;
 }
 
+static int rzg2l_cpg_resume(struct device *dev)
+{
+	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	const struct rzg2l_cpg_info *info = priv->info;
+
+	/* Power on always ON domains. */
+	for (unsigned int i = 0; i < info->num_pm_domains; i++) {
+		if (info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON) {
+			int ret = rzg2l_cpg_power_on(priv->domains[i]);
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void rzg2l_cpg_complete(struct device *dev)
+{
+	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+
+	/* Prepare for power down the BUSes in power down mode. */
+	if (priv->info->pm_domain_pwrdn_mstop)
+		writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);
+}
+
+static const struct dev_pm_ops rzg2l_cpg_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, rzg2l_cpg_resume)
+	.complete = rzg2l_cpg_complete,
+};
+
 static const struct of_device_id rzg2l_cpg_match[] = {
 #ifdef CONFIG_CLK_R9A07G043
 	{
@@ -1931,6 +1986,7 @@ static struct platform_driver rzg2l_cpg_driver = {
 	.driver		= {
 		.name	= "rzg2l-cpg",
 		.of_match_table = rzg2l_cpg_match,
+		.pm	= pm_sleep_ptr(&rzg2l_cpg_pm_ops),
 	},
 };
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index d9a7357c4873..abff85644270 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -301,6 +301,7 @@ struct rzg2l_cpg_pm_domain_init_data {
 
 /* Power domain flags. */
 #define RZG2L_PD_F_ALWAYS_ON	BIT(0)
+#define RZG2L_PD_F_CONSOLE	BIT(1)
 #define RZG2L_PD_F_NONE		(0)
 
 /**
-- 
2.39.2

