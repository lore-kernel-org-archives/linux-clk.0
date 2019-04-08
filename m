Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8471C10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 13:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 854B021473
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 13:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lhfYbZOW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfDHNeX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 09:34:23 -0400
Received: from mout.gmx.net ([212.227.15.19]:58157 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbfDHNeX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Apr 2019 09:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554730445;
        bh=k0HUMiq1+Xv7DqsDzzcWwSXCY3Pn98fJuo9J1Wk+BS4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lhfYbZOW+KGVMRfxM18kLYAP4n8p19IqPkgmQSepkWHE4tjQCJJwdqnw9ElJXsViM
         AgGPF8xRz8/YQwcB2+np+EECI39W8I3viApewmzw0WlU9P5uwFS9ozoa+7ssbDmWWx
         y4P1uo54h89NcT8t4FBYGa7QX/Zbnwn3D938NedY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from openbmc-devel.mpl.loc ([185.137.174.251]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0Lt1S6-1gkRB137rG-012Wmi; Mon, 08 Apr 2019 15:34:05 +0200
From:   =?UTF-8?q?David=20M=C3=BCller?= <dave.mueller@gmx.ch>
To:     linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4] clk: x86: Add system specific quirk to mark clocks as critical
Date:   Mon,  8 Apr 2019 15:33:54 +0200
Message-Id: <20190408133354.20460-1-dave.mueller@gmx.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190328124939.23139-1-dave.mueller@gmx.ch>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UIASU+bgmAzOHISRl3CbW+IjGi2XH/tKHsBowgOhu+Vqb1n4ha/
 YMXTDOUK6sFQ70BKZrsfzvwfH62KEXsQT+qYqWS6s/Sg6R5UFGmLWeEe8M3MpnV4nz1bU8t
 ccmXRRVux8jxwPzBay7DO7rT7NrnYpQmB10IexblBk8ii+l6ls4VbwLrR2XoeNKR2c4x1w2
 0Pjumj4QU39V4TQ5b2Shg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tLsgW1FcwKY=:x2ictN3jsAdWYpbgdHNFwO
 JhSrvUwYGo4CD1Dg1pxUWvM2GU6Prc7WU2PuV3DeB5T09Vp91AB6AdP372/VRqlLoZkf+rwxY
 g0gerK4rN+ch3nIv8i678dcEVR+IAIz+1bn/07h3ge6KvzeeJoQs5JtW1Byryhv3LPMGgeA8k
 v9Miy7G/E05k+5NPvV/BqzpyuVqrqNPduVUYUzk2lWtw732yr5wINWZmQVxtYqer1HzhV3JuB
 yGSGgyK/hYPAhHYv8HUx4SvRDmUE9ZUrVFAxQ1DI8BRx9xrCT7pGHSayPNmYqhLPKL/VOjVpD
 dBke7Ipwdx6ryT68GCptq2HJpDP0Siq/8ukxGk97KQwh6VqNNS6CKqOz4Gxz3zknVKqCJHfFh
 UrPEom+aJtwzuaH0YV0/WTMJxlFNImuZ8Wmsm28yFyJkL0EjRTvDkAj3zVNs7rDXck/yIvudM
 TCvkYi8VHXhdHPA3cl7t8ZIS2LaD4RuZPKx8NkNehSS2f97x4OrranJmcpckfbdb4mdymwPKZ
 l0kTc3s9A49UZ4Dk7m2gNJH3Nky/CPY0ui01xa8qWEdafEhwU/1VeGPLaN0AlWz7dPRT3bqv1
 609QDHxlwz+GDjprXHbXAJ5FVzU/G7PGZC5J5lvgKTnJfKBg9iOSDL4XqZjefmMPsKG4Dg3Ny
 gL+1ymKLAdK/sOw1Am0PrGIyT8lLqOaDwPRS0WbjiSny+jpJ0WolUVySn7RJCxOmVmUB4YvRY
 X7KWSsSt7iBSnQbaFucn7IsasutxAAl/n+DZBeWnF7M5akN1Ia3RoW8Psv47uxl43H4r4REQz
 q85jdtRmCSnWU0jgaGxl3CpUcld5vSHNLPlGUnzb5FRAE3tg7KrdM7FocNMAxTR4XT+1VoG6E
 oE8V+LKXeJsrDj6RHBK4GgSHw3tj2eto+k3vtwr9Qd/DN7y1qSrZz0ulZxtKYMjjXE2HN1eAh
 xNEl5sqJiUg==
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
by implementing a system specific quirk to mark the necessary pmc_plt_clks=
 as
critical.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Signed-off-by: David M=C3=BCller <dave.mueller@gmx.ch>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
=2D--
Changes in v4:
- add '.' to comments / rename field as suggested by Andy Shevchenko
Changes in v3:
- add missing sentinel entry to critclk_systems table
Changes in v2:
- restore previous clk detection logic as suggested by Hans de Goede

 drivers/clk/x86/clk-pmc-atom.c                | 14 ++++++++++---
 drivers/platform/x86/pmc_atom.c               | 21 +++++++++++++++++++
 .../linux/platform_data/x86/clk-pmc-atom.h    |  3 +++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom=
.c
index d977193842df..19174835693b 100644
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
+	 * gated by the clock framework.
+	 */
+	if (pmc_data->critical && plt_clk_is_enabled(&pclk->hw))
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
index 8f018b3f3cd4..eaec2d306481 100644
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
+ * marked as critical.
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
+		clk_data->critical =3D true;
+		pr_info("%s critclks quirk enabled\n", d->ident);
+	}

 	clkdev =3D platform_device_register_data(&pdev->dev, "clk-pmc-atom",
 					       PLATFORM_DEVID_NONE,
diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linu=
x/platform_data/x86/clk-pmc-atom.h
index 3ab892208343..7a37ac27d0fb 100644
=2D-- a/include/linux/platform_data/x86/clk-pmc-atom.h
+++ b/include/linux/platform_data/x86/clk-pmc-atom.h
@@ -35,10 +35,13 @@ struct pmc_clk {
  *
  * @base:	PMC clock register base offset
  * @clks:	pointer to set of registered clocks, typically 0..5
+ * @critical:	flag to indicate if firmware enabled pmc_plt_clks
+ *		should be marked as critial or not
  */
 struct pmc_clk_data {
 	void __iomem *base;
 	const struct pmc_clk *clks;
+	bool critical;
 };

 #endif /* __PLATFORM_DATA_X86_CLK_PMC_ATOM_H */
=2D-
2.20.1

