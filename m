Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED039A4B3
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 18:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237972; cv=none; b=Akrcv/mlzZXDGl/2JNN0rrUHYp90iaGR0L5/FRRXWxTdPpn/2H8qpXjZdfy9+NJIN53qUaxh/SPYpUHxC//xryTb3mTC6+YPPPYdQDTm42w3nzYZTQQ42PgHNmsHxQg9LF3UaLVY1v9FTyjch8pBXDw+Oa3NEVCeamwsvLLffXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237972; c=relaxed/simple;
	bh=kjP5JtckQ81EhZbmB1tB2Jw41rIoGsoQz3j/P8a8WNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GmoKle8nvMvd6IUA7jMF0mSQos8gFJCee9p0N9LxgZSW1vV5+C/18HD4VDoDsfjWBzFrmmQ1dOpkQei6xons02aoggrbx8f+NXB/FBHdriF0bmOOip6zFk/O6mmGs+ZI7nhOjqU1Yq7UUdf9gDOZPNAJbP4tetBhTxuOyRZK0Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqmbK+46; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqmbK+46"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4bfec71901fso660065b6e.1
        for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237970; x=1789842770; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pyGOuWl1kIoFr1BB5GPKM41t/39zE+ryKhiJyT6xB7s=;
        b=SqmbK+46tdU0QfSqcKSJnezGCt/eO98oe7Ac5/UF7utsbDC6jzPLvvkSfLC/eJtS4Y
         N13xiiEIY+TTxnrhYvcTZK6FPN5Tfag54dXEVoOhcwajL7qv3M42Vv0+v1XvMYfLBj9p
         zOyGMOWCSeV5WA/CHWm5GwHUxOvY5s6iIF0ASuCALj3qRDVb6CsGwXI2gKuZbQhGtrtT
         47S9Pq0cYKiilZY6p1DGvkvNZ85Iuww3SIORTlatSzNcXBES+g9KtGXIsyltqJyXleop
         6DjcKpxe9IhqOTyNU+qRUDnVyXlVKOyBLznKgoZmzjZS5XSn3YbtzmxsC9W1Efg93xN9
         elyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237970; x=1789842770;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pyGOuWl1kIoFr1BB5GPKM41t/39zE+ryKhiJyT6xB7s=;
        b=aG1uN9fpI1EZ7XsWQxcctHkbAZEoGIa82NYqgyZqX7w2wDO8prFqeOEa7YO6K+maHG
         xnTEcSUAQu4ohT8rvde3RN7cxOI/ouxpBmpsQomY9nGT++yNEx2BPAW/olj/tfxUJKaN
         2a3GG05R+G99NR/6wFUJ9GlDdFzK/NgjxYV5Jo5hcHRsz9Wmm04MpLJhfwU1W8xq3v/9
         nmN/DxNWR1eLQMCM3KdMUqzL3SXP5dDX25rk2JzVefYuwdLn99JTKvzaU3VmmyFYCM8t
         xu9DqFZqbCXowe/IQtsl0ZIyvRm49G5ejBctIxNs+3ZxI85R1RSicYkAyrACJGLcRGBx
         qxoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjg4baQTO7uP9K0cOUy3wHtsl9Yeu7acXkXfJtXZLUJJKznaV4tBiD85usMb8A5EKWYa1j2rUhylI=@vger.kernel.org
X-Gm-Message-State: AFuF++k6rikQVSaglF1gYUFSuyNUq0fPze2EtnQICCRNdk0MuIgBQgd7
	x/4w7n7lz3mOxvjRLm6KbnhlYDpk5uslelRei0aXQXbklznG3/FM+ToY
X-Gm-Gg: AYBFou0jM0LIxhjavVio8J1y/mcHTvun70MF/CQ45zEk75ksyXtsExTd952jUgWKqOJ
	3jDxV29oyq6FEm1XcMT0DiUuqgbqoY4sJSskvx/PHcstcerteytBdXEfG6VwolmJWGyG1utWCDq
	yRCYsaHJBU00eM7mmXt/Tf6N5USavsID9ZiGsrUaTRywB1oOrAN+0mKSSUjd5cK6yFmBiT7tG0f
	SYGmfrEiyOGPBXC+2++4JLzli7tWAb6LvmVt3/mK42vfXkWmcKPu1obfZGgaZ3q1fvp5gvPeoX/
	LngVjunaVMOMSar5iEKYC92XD/ySmqioWf7PsiQKWnlLsjmwxhqGqDgwyE7I2O9CJEJmHku4TIp
	YIIyH4h/LI5vvC4sXhHBLgRdzkY1NgqKrTUu8FENwYzxDGG3IDARxXDtsJehzZ4oqB83Io+3st3
	F6pQGS0ujsM1brC+Lu4gy3hHGTBxEhGyzJQ/1kDGGV9vVQMPDms4puenHTieuVrTKIaaU=
X-Received: by 2002:a05:6808:309a:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4c31d65af5dmr8802662b6e.10.1789237969836;
        Sat, 12 Sep 2026 11:32:49 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c330dac382sm5738229b6e.6.2026.09.12.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:32:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 13:32:40 -0500
Subject: [PATCH] clk: mediatek: mt8173-mfgtop: do not use the clk API from
 power_on
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6CMBAA0KuQWTtJacVEr2JcDHWA8dNpWhQSw
 t2tsHybt0DmJJzhUi2Q+CtZNBTUhwr8QKFnlHsxWGNP5lxbfHf9qBGDon89kaJg1IkTakBq2JC
 jo2udgxLExJ3MW3697c6f9sF+/I+wrj8G4Qv0fgAAAA==
X-Change-ID: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237967; l=5480;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kjP5JtckQ81EhZbmB1tB2Jw41rIoGsoQz3j/P8a8WNk=;
 b=EoNfJiuU+dJD/9bK48PUcfIjZmE6xoozgkowDFLKya8/Wm+3V8PyJc4FDLJqz1oB/jWF+Fvz8
 IZaSWfrqN5JBsqIIcVKZ1a3Zk5bsc9O+BY6mG9nN0OjhT8aFCanUqgp
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
that this same driver provides. That is a layering inversion which cannot
work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
-- this driver's own device -- and genpd power transitions run at _noirq
time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
-EACCES.

Measured on mt8173 (amazon-suez) during resume from suspend-to-RAM,
immediately after the secondary CPUs come back up:

  clk-mt8173-mfgtop 13fff000.clock-controller: 26 MHz clock enable failed: -13

The failure is not survivable, because genpd_sync_power_on() ignores what
power_on() returns and marks the domain on regardless. The clock is then
left ungated-but-unprepared, and the next power_off() underflows its
refcount:

  mfg_26m already disabled
  mfg_26m already unprepared
  WARNING: drivers/clk/clk.c:1048 at clk_core_unprepare
  Workqueue: pm genpd_power_off_work_fn
    clk_unprepare / clk_mt8173_mfgtop_power_off / _genpd_power_off

Gate the bit with a direct regmap write instead. The vendor driver
(mtk_mfgsys.c) also drives the four MFG CG bits with raw register writes
from its power sequencing. The runtime-PM path was never affected, only the
_noirq transitions of system suspend and resume. mfg_26m stays registered
as a clock for any consumer that wants it; nothing currently does.

Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 39 +++++++++++++++++---------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
index 5669ca9954dc..fed6fa6100dc 100644
--- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -30,6 +30,12 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 	.set_ofs = 0x0004,
 };
 
+/*
+ * The 26 MHz gate, addressed directly rather than through the clk framework.
+ * See the comment in clk_mt8173_mfgtop_power_on().
+ */
+#define MFG_CG_26M	BIT(3)
+
 #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
 	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
 
@@ -46,7 +52,6 @@ struct mt8173_mfgtop_data {
 	struct regmap *regmap;
 	struct generic_pm_domain genpd;
 	struct of_phandle_args parent_pd, child_pd;
-	struct clk *clk_26m;
 };
 
 /* Delay count in clock cycles */
@@ -66,12 +71,16 @@ struct mt8173_mfgtop_data {
 static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
 {
 	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
-	int ret;
 
-	/* drives internal power management */
-	ret = clk_prepare_enable(data->clk_26m);
-	if (ret)
-		return ret;
+	/*
+	 * Ungate the 26 MHz clock, which drives the block's internal power
+	 * management. This is a raw write to the gate's CG register, not
+	 * clk_prepare_enable() on the mfg_26m gate this driver provides: that
+	 * would call clk_pm_runtime_get() on our own device, and genpd power
+	 * transitions run at _noirq time, where runtime PM is disabled and
+	 * that returns -EACCES. mfg_26m stays registered for any consumer.
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
 
 	/* Power on/off delays for various signals */
 	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
@@ -102,8 +111,11 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
 	/* Magic numbers related to core switch sequence and delays */
 	regmap_write(data->regmap, 0xec, 0);
 
-	/* drives internal power management */
-	clk_disable_unprepare(data->clk_26m);
+	/*
+	 * Gate the 26 MHz clock again; see power_on() for why this is a raw
+	 * register write and not clk_disable_unprepare().
+	 */
+	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
 
 	return 0;
 }
@@ -155,16 +167,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 		goto put_pm_runtime;
 	}
 
-	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
-	if (IS_ERR(data->clk_26m)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
-		goto unregister_clks;
-	}
-
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
-		goto put_26m_clk;
+		goto unregister_clks;
 	}
 
 	data->genpd.name = "mfg-top";
@@ -197,8 +203,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
 	pm_genpd_remove(&data->genpd);
 del_clk_provider:
 	of_clk_del_provider(node);
-put_26m_clk:
-	clk_put(data->clk_26m);
 unregister_clks:
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 put_pm_runtime:
@@ -217,7 +221,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
 	of_genpd_del_provider(node);
 	pm_genpd_remove(&data->genpd);
 	of_clk_del_provider(node);
-	clk_put(data->clk_26m);
 	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
 	of_node_put(data->parent_pd.np);
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

