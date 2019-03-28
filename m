Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E07C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 12:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3106206B8
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 12:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="jfBgw17p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbfC1MuP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 08:50:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:55999 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbfC1MuP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 08:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1553777396;
        bh=iLfNBwVWtiSsTOcGOC8Pe221q29uVdCJbSNyZT+LsmE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=jfBgw17pDbcMSu4uJ1izprhXlFcUU8ddzmLZpt3mmtxh5NkfJNyi+ViPj6dqSx2jK
         olrSgDRbo4IqwyreexnpZ3XhCCoO7pgMXtKGiFqsLCSn1zUP/GXELkWzifqAX0M8aH
         zLuojWX5xD/ErfFC6iia6BHjEIhNkrHMSZ1yNjOI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from openbmc-devel.mpl.loc ([185.137.174.251]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LeuUB-1gc8vD0c8t-00qnBC; Thu, 28 Mar 2019 13:49:56 +0100
From:   =?UTF-8?q?David=20M=C3=BCller?= <dave.mueller@gmx.ch>
To:     linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] clk: x86: Add system specific quirk to mark clocks as critical
Date:   Thu, 28 Mar 2019 13:49:39 +0100
Message-Id: <20190328124939.23139-1-dave.mueller@gmx.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DamLuXO27RBDX9Z2yApqucus5yYovgwLjvO8ix7HUm5W513T4Ey
 P4Xd6APbDauG3Fn/IYZtK84M5Z6JhI0OvNCuBGRWkwhX5JgB5B8hT1larg2zRvSy9Y7P+F8
 xHGjJOthAKMi2jzOcl52LaWHxdmedU9yriH43aSxE+fFEYBh/hm6+zo+4yZNY6dH8XjwdoC
 Q7HghUz7ixL3VXXPvEoPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eHx5js6EF/s=:JvUVmhUOrH7pJ8JehUGjQM
 eQr99GBDte1qSGRw8tWc9ycrPSYLfZT3KlKrZmyU98XNS+/2KKFXYjkm7mwdUIUA3a2Kt8G2e
 rl9zOLgupFdRS8qzGbcoAp5Tz2i1eqJ8Hjiby//m/5RfLXm+zzoMPcQKxAYbo2Je/yftp0eaK
 EZI54M18XfRXIhF2i0nCCBensXnmTFfSMbtqsbUSYyFaD35jGTQNtBksvj4lLOwm4FkC/MLZ8
 SwJ/IZKGDLqhVpc3omdj3y0MWOv30s+UPPTSP6OMqo6wpFsestkWdezPrnKh49udxNqTmfkYU
 bt3Ivu0I7MOAjyquWb0s/ukS3j8YU89iCwp34oy2hV8TgJotFTi9GnP0JVZWuWN9pOg1N82P+
 Ulw8YdWyDs5i5XQCxbJKicA0Z9RfzDFU1C/8nFG/Hf7b2mj2+LucegtH17dr/umuNgXj5Ktss
 rna5zQqi7JxBVwkNLHOc/mMOwFPm8qrJ+4WxEeykygPl+d/Spf/PLVUxG964Mkjw3s4YhlHOU
 Nvo2YO2EkFG7HNaTGGqGVpx7NxUD1XLumka7mYsqDrvMr2jgDStT8yg01J0gyc+uW40U4EXaG
 e6mHS7g9b/Eqt1jUVFHSFshhcGYAM85BSBh30R4WKFWpRAfclJ1k0GGEYgjZLBubBRVEWF1nk
 Qcn7e49PanLog6Zz+eJKcdVDeUjrVMmpHDRxDjcQsRETeKMO3794VZ2w/+BsSxPQPXoXUs2A7
 jZ+i1mK9nEpoh7+pmxbOCvNQyoAytP5i6WDdqf1Vz6wLcGj7+fqDHwJBtgkn06mtUiRvBbUUx
 rFfOTgJgdvqVhdFzJS5BtBF/W5JFrh5hYOlgZwO+0EKpIIFj//rYZiR5JuTalBrC1/fyTFKvd
 FLMI61K31FNLeef3ZopTePs0GGR6kyk1tVEcNJGHHzRi/cKdEsjxjWnZ6OnpEO/G06DPQ6MVA
 SlRhSieTd5w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since commit 648e921888ad ("clk: x86: Stop marking clocks as
CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
unconditionally gated off. Unfortunately this will break systems
where these clocks are used for external purposes beyond the kernel's
knowledge.
Fix it by implementing a system specific quirk to mark the necessary
pmc_plt_clks as critical.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Signed-off-by: David M=C3=BCller <dave.mueller@gmx.ch>
=2D--
 drivers/clk/x86/clk-pmc-atom.c                |  9 +++++---
 drivers/platform/x86/pmc_atom.c               | 22 +++++++++++++++++++
 .../linux/platform_data/x86/clk-pmc-atom.h    |  2 ++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom=
.c
index d977193842df..882ea0c4c050 100644
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
@@ -183,8 +183,11 @@ static struct clk_plt *plt_clk_register(struct platfo=
rm_device *pdev, int id,
 	init.parent_names =3D parent_names;
 	init.num_parents =3D num_parents;

+	if (test_bit(id, &pmc_data->critclk))
+		init.flags |=3D CLK_IS_CRITICAL;
+
 	pclk->hw.init =3D &init;
-	pclk->reg =3D base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
+	pclk->reg =3D pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZ=
E;
 	spin_lock_init(&pclk->lock);

 	ret =3D devm_clk_hw_register(&pdev->dev, &pclk->hw);
@@ -332,7 +335,7 @@ static int plt_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(parent_names);

 	for (i =3D 0; i < PMC_CLK_NUM; i++) {
-		data->clks[i] =3D plt_clk_register(pdev, i, pmc_data->base,
+		data->clks[i] =3D plt_clk_register(pdev, i, pmc_data,
 						 parent_names, data->nparents);
 		if (IS_ERR(data->clks[i])) {
 			err =3D PTR_ERR(data->clks[i]);
diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_at=
om.c
index 8f018b3f3cd4..d25b2423afe0 100644
=2D-- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -17,6 +17,7 @@

 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_data/x86/clk-pmc-atom.h>
@@ -391,11 +392,28 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
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
+		/* on this platform, pmc_plt_clk_0 is a critical clock */
+		.driver_data =3D (void *)BIT(0),
+	},
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
@@ -403,6 +421,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void =
__iomem *pmc_regmap,

 	clk_data->base =3D pmc_regmap; /* offset is added by client */
 	clk_data->clks =3D pmc_data->clks;
+	if (d) {
+		clk_data->critclk =3D (uintptr_t)d->driver_data;
+		pr_info("%s critclk quirk enabled\n", d->ident);
+	}

 	clkdev =3D platform_device_register_data(&pdev->dev, "clk-pmc-atom",
 					       PLATFORM_DEVID_NONE,
diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linu=
x/platform_data/x86/clk-pmc-atom.h
index 3ab892208343..8d00b6bd83b4 100644
=2D-- a/include/linux/platform_data/x86/clk-pmc-atom.h
+++ b/include/linux/platform_data/x86/clk-pmc-atom.h
@@ -35,10 +35,12 @@ struct pmc_clk {
  *
  * @base:	PMC clock register base offset
  * @clks:	pointer to set of registered clocks, typically 0..5
+ * @clkcrit:	bit mask of pmc_plt_clks which are to be marked as critical
  */
 struct pmc_clk_data {
 	void __iomem *base;
 	const struct pmc_clk *clks;
+	unsigned long critclk;
 };

 #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
=2D-
2.20.1

