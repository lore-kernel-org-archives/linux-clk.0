Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DB9C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 15:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 042E5205F4
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 15:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388888AbfDRPNB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 11:13:01 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:43273 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388457AbfDRPNB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 11:13:01 -0400
Received: by mail-wr1-f41.google.com with SMTP id k17so3381743wrx.10
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2019 08:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Na7ne0rwx9OsW9+Sjra5ZPNgjOpXe+QAGMb8UAdSjxQ=;
        b=qAcYfgj4Ys47rRham5hGDgGilEUIBzwEp8lQI3N4xaTf5GVqG8W3PID1ulbEhm+lwj
         FiM3pvqUPUGatX/+L/ksHp3fj4SPmhzUq0KY0PI5cVMRQzU2hfllSfwdmlA5045Qk/7Y
         t2wNbgWY7H3H941nY59/paoqhv6Pk42xcRqJdJd4LOcQ0aaK1HLHL5L6ZcSVLh95u0II
         bJQEOR/GjvgghSYO+tozEBU52IPri8mBnOxTPOMYwnSHK72NvM84kk/UL2YOpuCfFS2v
         Uta/h07L7rXZZ45PG3E+Ngl7HaV4YUVLw9JFW0gOmNodupc5twH7A+jzdpzAre2EfUkT
         HbyA==
X-Gm-Message-State: APjAAAXj+7Ibpm5F8EoWjkfN1WZqPnwIxqcrKbSsLFbhFDWWW++PKKBC
        kO9Ckti4vbbLdmQgaDTnw4S3Qg==
X-Google-Smtp-Source: APXvYqxt/jAKOjTJx93eNQegoeiuZu+ogsmy13/cWq6mzE2JrYJK/1rYbbQgpqWYOoL17jSz73lkag==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr4620846wrn.323.1555600378723;
        Thu, 18 Apr 2019 08:12:58 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id w10sm1472884wrv.8.2019.04.18.08.12.57
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 08:12:57 -0700 (PDT)
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Semyon Verchenko <semverchenko@factor-ts.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
 <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
 <20190408172111.GX9224@smile.fi.intel.com>
 <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
 <20190409153125.GU9224@smile.fi.intel.com>
 <a05e2ac3-de31-bd7a-6b39-8cdf00190f67@redhat.com>
 <c2fa7ae8-1ad5-1a85-3e25-8bc5a9b5ee01@factor-ts.ru>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <da634f93-9cbb-f5a8-e7c2-4a20368823e9@redhat.com>
Date:   Thu, 18 Apr 2019 17:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c2fa7ae8-1ad5-1a85-3e25-8bc5a9b5ee01@factor-ts.ru>
Content-Type: multipart/mixed;
 boundary="------------3DA5A80BEDAE2B5E86FE6DA8"
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a multi-part message in MIME format.
--------------3DA5A80BEDAE2B5E86FE6DA8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Semyon,

On 18-04-19 15:26, Semyon Verchenko wrote:
> 
> On 18.04.2019 16:09, Hans de Goede wrote:
>> Hi,
>>
>> On 09-04-19 17:31, Andy Shevchenko wrote:

<snip>

>> Ok.
>>
>> Семен Верченко, this means that we are going to need DMI info from
>> the board in question. I thought we already had that, but I now see that
>> you original report did not have that a
>>
>> Please run as root:
>>
>> dmidecode &> dmidecode.log
>>
>> And then reply to this email with the generated dmidecode.log file
>> attached. Once I have that file I can prepare a patch fixing this.

Thank you for the DMI decode.

Attached are 3 patches, can you please test if adding those 3 patches
to your kernel fixes the problem?

Thanks & Regards,

Hans


--------------3DA5A80BEDAE2B5E86FE6DA8
Content-Type: text/x-patch;
 name="0001-clk-x86-Add-system-specific-quirk-to-mark-clocks-as-.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-clk-x86-Add-system-specific-quirk-to-mark-clocks-as-.pa";
 filename*1="tch"

From 7c2e07130090ae001a97a6b65597830d6815e93e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?David=20M=C3=BCller?= <dave.mueller@gmx.ch>
Date: Mon, 8 Apr 2019 15:33:54 +0200
Subject: [PATCH] clk: x86: Add system specific quirk to mark clocks as
 critical
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 648e921888ad ("clk: x86: Stop marking clocks as
CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
unconditionally gated off. Unfortunately this will break systems where these
clocks are used for external purposes beyond the kernel's knowledge. Fix it
by implementing a system specific quirk to mark the necessary pmc_plt_clks as
critical.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Signed-off-by: David Müller <dave.mueller@gmx.ch>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/x86/clk-pmc-atom.c                | 14 ++++++++++---
 drivers/platform/x86/pmc_atom.c               | 21 +++++++++++++++++++
 .../linux/platform_data/x86/clk-pmc-atom.h    |  3 +++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index d977193842df..19174835693b 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -165,7 +165,7 @@ static const struct clk_ops plt_clk_ops = {
 };
 
 static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
-					void __iomem *base,
+					const struct pmc_clk_data *pmc_data,
 					const char **parent_names,
 					int num_parents)
 {
@@ -184,9 +184,17 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
 	init.num_parents = num_parents;
 
 	pclk->hw.init = &init;
-	pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
+	pclk->reg = pmc_data->base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
 	spin_lock_init(&pclk->lock);
 
+	/*
+	 * On some systems, the pmc_plt_clocks already enabled by the
+	 * firmware are being marked as critical to avoid them being
+	 * gated by the clock framework.
+	 */
+	if (pmc_data->critical && plt_clk_is_enabled(&pclk->hw))
+		init.flags |= CLK_IS_CRITICAL;
+
 	ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
 	if (ret) {
 		pclk = ERR_PTR(ret);
@@ -332,7 +340,7 @@ static int plt_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(parent_names);
 
 	for (i = 0; i < PMC_CLK_NUM; i++) {
-		data->clks[i] = plt_clk_register(pdev, i, pmc_data->base,
+		data->clks[i] = plt_clk_register(pdev, i, pmc_data,
 						 parent_names, data->nparents);
 		if (IS_ERR(data->clks[i])) {
 			err = PTR_ERR(data->clks[i]);
diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 8f018b3f3cd4..eaec2d306481 100644
--- a/drivers/platform/x86/pmc_atom.c
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
+static const struct dmi_system_id critclk_systems[] __initconst = {
+	{
+		.ident = "MPL CEC1x",
+		.matches = {
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
+	const struct dmi_system_id *d = dmi_first_match(critclk_systems);
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -403,6 +420,10 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 
 	clk_data->base = pmc_regmap; /* offset is added by client */
 	clk_data->clks = pmc_data->clks;
+	if (d) {
+		clk_data->critical = true;
+		pr_info("%s critclks quirk enabled\n", d->ident);
+	}
 
 	clkdev = platform_device_register_data(&pdev->dev, "clk-pmc-atom",
 					       PLATFORM_DEVID_NONE,
diff --git a/include/linux/platform_data/x86/clk-pmc-atom.h b/include/linux/platform_data/x86/clk-pmc-atom.h
index 3ab892208343..7a37ac27d0fb 100644
--- a/include/linux/platform_data/x86/clk-pmc-atom.h
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
-- 
2.21.0


--------------3DA5A80BEDAE2B5E86FE6DA8
Content-Type: text/x-patch;
 name="0002-platform-x86-pmc_atom-Drop-__initconst-on-dmi-table.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0002-platform-x86-pmc_atom-Drop-__initconst-on-dmi-table.pat";
 filename*1="ch"

From b995dcca7cf12f208cfd95fd9d5768dca7cccec7 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 11 Apr 2019 10:22:43 -0700
Subject: [PATCH] platform/x86: pmc_atom: Drop __initconst on dmi table
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's used by probe and that isn't an init function. Drop this so that we
don't get a section mismatch.

Reported-by: kbuild test robot <lkp@intel.com>
Cc: David Müller <dave.mueller@gmx.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Fixes: 7c2e07130090 ("clk: x86: Add system specific quirk to mark clocks as critical")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/platform/x86/pmc_atom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index eaec2d306481..c7039f52ad51 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -396,7 +396,7 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
  * Some systems need one or more of their pmc_plt_clks to be
  * marked as critical.
  */
-static const struct dmi_system_id critclk_systems[] __initconst = {
+static const struct dmi_system_id critclk_systems[] = {
 	{
 		.ident = "MPL CEC1x",
 		.matches = {
-- 
2.21.0


--------------3DA5A80BEDAE2B5E86FE6DA8
Content-Type: text/x-patch;
 name="0003-platform-x86-Add-Lex-3I380D-industrial-PC-to-critclk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0003-platform-x86-Add-Lex-3I380D-industrial-PC-to-critclk.pa";
 filename*1="tch"

From dcf861e0a71906903189baed4817a90e37dc78cc Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 18 Apr 2019 17:04:10 +0200
Subject: [PATCH] platform: x86: Add Lex 3I380D industrial PC to
 critclk_systems DMI table

The Lex 3I380D industrial PC has 4 ethernet controllers on board
which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
as CLK_CRITICAL and they will not get turned off.

Reported-by: Semyon Verchenko <semverchenko@factor-ts.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/pmc_atom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 3a635ea09b8a..2910845b7cdd 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -407,12 +407,21 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
  */
 static const struct dmi_system_id critclk_systems[] = {
 	{
+		/* pmc_plt_clk0 is used for an external HSIC USB HUB */
 		.ident = "MPL CEC1x",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
 		},
 	},
+	{
+		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
+		.ident = "Lex 3I380D",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
+		},
+	},
 	{ /*sentinel*/ }
 };
 
-- 
2.21.0


--------------3DA5A80BEDAE2B5E86FE6DA8--
