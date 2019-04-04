Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AE0C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C316120882
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="kK3Y7rCH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbfDDOOT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 10:14:19 -0400
Received: from mout.gmx.net ([212.227.17.21]:40537 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728918AbfDDOOS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Apr 2019 10:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554387220;
        bh=7meYvNMX58HKJlffZ5ZecfjjzOtiDy+tVkCRmGNJt+U=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kK3Y7rCHB5L3miFkhXC1sDfKAJ1HiBojF+lB/YjqeDH0c48vF8XKch2eIWeCqVu6s
         LmQHGt+VR4DsgqRnbWIvC4LnxtG+x1MkjVoNTkpTIcu1Mhi03SIvsaZKZhN4CfmFHm
         kRgiXp3xQHAc2WQB9U8jUJHo2iFZPn3e4A+3ZEAc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from openbmc-devel.mpl.loc ([185.137.174.251]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MFAaV-1h9bLz02oN-00GGfN; Thu, 04 Apr 2019 16:13:40 +0200
From:   =?UTF-8?q?David=20M=C3=BCller?= <dave.mueller@gmx.ch>
To:     linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3] clk: x86: Add system specific quirk to mark clocks as critical
Date:   Thu,  4 Apr 2019 16:13:25 +0200
Message-Id: <20190404141325.21952-1-dave.mueller@gmx.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190328124939.23139-1-dave.mueller@gmx.ch>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sL8Wc5K+q5unPxJKXcKeko/9LqFzAG//5qJF+NgLAFtoyGBkNdX
 FTUmHrsDK753QqlSeLyP9NKJcsmd2UqVDT1UJacXkhRPQHSlaaED94EKGUUE+D+UIm8Ho6Z
 ZBZSqoUIsnpPhyfPiw79ZpsH84TziAbRdM3q4EgpjqL3J57w2OSU0XYng1xlZIdrTMTUF0V
 WNF9vi3AKNdah+RH6JJlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nGRZNSKuSd8=:9VCrIIJ535L9W9CfQVdHl9
 BzvAxGKXuYJYOXF/aCI2B3QH5ApaooSXMam3fM34hyCB6GtUVEPDnX5k/V4EVwhvCqPJ2GnaZ
 NDllBQye96xF/449uPc+/sCfqYMlO4u1ksuWUKFEe0kcVlee6qcmvHtpbSPbLcgpFNVUAaK45
 fSWAmxc9twYuwlJzzrhSDWGP2YJxcdkDo53NW4IwjnSLlvn4tpbc/R2Cp2UIsAU5YnFISefoh
 ZwG7BPFtAd009CTbaTAkQAlSx74yqAgxU43Y08G8zkSnSx4SAJtXV9rY4nWueteYOspXYUAlY
 k/2fypCJc3C8/BWRHSypcfOifxgcSv9sxgNPDOMnm6Xzy+wqIA/0MK0+zx4jLRtoAKe+TdiHc
 w7Ahm1Szd2t2inF8n4XeiYWhIfNy1DAxtt6jIz51whFrssRHOq+pHfgWHboRR7HW3raRF0ajE
 Vt9u/ImTF3F8r/j+SLxtUgzkPtnHcqDOd76/0IBFpXgIlYEt9iojGy3QX8garzyo9i8h2qvr1
 RWQ93WCyt0yaxz2ODjPul2o2CMya7bjwgb1NxuwU/prKVJuVFpKeIRbXLdIWAGxTjQSkt/dNN
 hyVXMbgtLWUJR8Dg37Qs1HKDm+tDH1z5bNfoEILrI7cYpPEwCO0u2gHBbih9RJWSdvTUJzt49
 nm7OejylDVSnInG5xDbMdl3k/5ok7raMV3FdNhUpAjO6WI493J3D4jnOCy+vU7aD4F2bOxdDU
 JxS/eHvu/OAnq96lfbnlGGkzKIAv7jSaGB6KpTzny80mrvzq6Argo43ouUVAncfduVTVlEpH8
 JKs2Xmu+r/Ibk5wgAj9zHTRbi/FvqERN5kr1b1o9IQz8SwtczpP7USx2oW8TTuxu39ucOF4Wo
 h7FwfodcRDDeKdb4WTa0hj7BnnDq4FR5IxY/etI/tnJMRxgyfKgxPOSlpMzleEAA+bGaMeeGG
 JtX6Xi4Mf5Q==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since commit 648e921888ad ("clk: x86: Stop marking clocks as
CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
unconditionally gated off. Unfortunately this will break systems where the=
se
clocks are used for external purposes beyond the kernel's knowledge. Fix i=
t
by implementing a system specific quirk to mark the necessary pmc_plt_clks
as critical.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Signed-off-by: David M=C3=BCller <dave.mueller@gmx.ch>
=2D--
Changes in v3:
- add missing sentinel entry to critclk_systems table
Changes in v2:
- restore previous clk detection logic as suggested by Hans de Goede

 drivers/clk/x86/clk-pmc-atom.c                | 14 ++++++++++---
 drivers/platform/x86/pmc_atom.c               | 21 +++++++++++++++++++
 .../linux/platform_data/x86/clk-pmc-atom.h    |  7 +++++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom=
.c
index d977193842df..e909720cc2e3 100644
=2D-- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -165,7 +165,7 @@ static const struct clk_ops plt_clk_ops =3D {
 };

 static struct clk_plt *plt_clk_register(struct platform_device *pdev, int=
 id,
-					void __iomem *base,
+					const struct pmc_clk_data *pmc_data,
 					const char **parent_names,
 					int num_parents)
 {
@@ -184,9 +184,17 @@ static struct clk_plt *plt_clk_register(struct platfo=
rm_device *pdev, int id,
 	init.num_parents =3D num_parents;

 	pclk->hw.init =3D &init;
-	pclk->reg =3D base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
+	pclk->reg =3D pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZ=
E;
 	spin_lock_init(&pclk->lock);

+	/*
+	 * On some systems, the pmc_plt_clocks already enabled by the
+	 * firmware are being marked as critical to avoid them being
+	 * gated by the clock framework
+	 */
+	if (pmc_data->chk_critclks && plt_clk_is_enabled(&pclk->hw))
+		init.flags |=3D CLK_IS_CRITICAL;
+
 	ret =3D devm_clk_hw_register(&pdev->dev, &pclk->hw);
 	if (ret) {
 		pclk =3D ERR_PTR(ret);
@@ -332,7 +340,7 @@ static int plt_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(parent_names);

 	for (i =3D 0; i < PMC_CLK_NUM; i++) {
-		data->clks[i] =3D plt_clk_register(pdev, i, pmc_data->base,
+		data->clks[i] =3D plt_clk_register(pdev, i, pmc_data,
 						 parent_names, data->nparents);
 		if (IS_ERR(data->clks[i])) {
 			err =3D PTR_ERR(data->clks[i]);
diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_at=
om.c
index 8f018b3f3cd4..d8dcf022909e 100644
=2D-- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -17,6 +17,7 @@

 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_data/x86/clk-pmc-atom.h>
@@ -391,11 +392,27 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
 }
 #endif /* CONFIG_DEBUG_FS */

+/*
+ * Some systems need one or more of their pmc_plt_clks to be
+ * marked as critical
+ */
+static const struct dmi_system_id critclk_systems[] __initconst =3D {
+	{
+		.ident =3D "MPL CEC1x",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
+		},
+	},
+	{ /*sentinel*/ }
+};
+
 static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 			  const struct pmc_data *pmc_data)
 {
 	struct platform_device *clkdev;
 	struct pmc_clk_data *clk_data;
+	const struct dmi_system_id *d =3D dmi_first_match(critclk_systems);

 	clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -403,6 +420,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void =
__iomem *pmc_regmap,

 	clk_data->base =3D pmc_regmap; /* offset is added by client */
 	clk_data->clks =3D pmc_data->clks;
+	if (d) {
+		clk_data->chk_critclks =3D true;
+		pr_info("%s critclks quirk enabled\n", d->ident);
+	}

 	clkdev =3D platform_device_register_data(&pdev->dev, "clk-pmc-atom",
 					       PLATFORM_DEVID_NONE,
diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linu=
x/platform_data/x86/clk-pmc-atom.h
index 3ab892208343..497575a42353 100644
=2D-- a/include/linux/platform_data/x86/clk-pmc-atom.h
+++ b/include/linux/platform_data/x86/clk-pmc-atom.h
@@ -33,12 +33,15 @@ struct pmc_clk {
 /**
  * struct pmc_clk_data - common PMC clock configuration
  *
- * @base:	PMC clock register base offset
- * @clks:	pointer to set of registered clocks, typically 0..5
+ * @base:		PMC clock register base offset
+ * @clks:		pointer to set of registered clocks, typically 0..5
+ * @chk_critclks:	flag to indicate if firmware enabled pmc_plt_clks
+ *			should be marked as critial or not
  */
 struct pmc_clk_data {
 	void __iomem *base;
 	const struct pmc_clk *clks;
+	bool chk_critclks;
 };

 #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
=2D-
2.20.1

