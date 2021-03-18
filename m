Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA6AC433E9
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A55A64F21
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhCRGJH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Mar 2021 02:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhCRGIk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Mar 2021 02:08:40 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4814C06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so4484345pjb.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
        b=OSNnFQJ9g8WOy5HU5t5ON2uOn4RJGZMdvNEVS7gPDoKYMWj5hT9NOo4uNGCU1rGI24
         YDs3ITxQETXVdDATX47Mhz5PZWYxMB3D6sSosj3gAyn4DPOxJOqeVZlZRs53D+F6xWii
         sSOvo8gRXLWdiA37HtSSapyLmvChWTbOq5btpITekVRt5hgngQlRnliZm2+2cd5EnILC
         E8n47jJBgMYvijJr+8tS80hyq9gTssWkATn1tMJg0FxLMBQuneDDx/ci5KDdpNZypjAG
         LJQAoRliyLoG4BSiXQY0QeYDNgOK437xpOPo8m8oUULUoR3tYZLX3qw0/wB7up3/czEf
         Vx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
        b=PJ1xk2rsNEU8hB11DYCOzxQ6fY7ObRe9jzLmD+08E3oyAGPWJwD9gHMsKOOSZ+WVDz
         szjutiphoA3lgQDpR53e/p8Sywq0EtuI1G3Pp85r0UdAh0vKMUeA4GRhpY4Rn7N7EjPU
         tkdvVxddNIV4R6ZZqkVGLIYpQGzLTKOxNr3ruVlO1RQvgbjwKTUZHLGxZGh/w6zkokDM
         EMUeHQJ7gtxoee3QT4ma4mk1AuE9Yowxt/AQCm4+/oSmmrHJnmmttJK6dmAgC/V5QKTA
         XnPkxvSO/tCCn79QmdR0/Wgrb9t/WebWdNT2jZbo6lSYzEyd3Upaez9vofvfw5Gfkf/J
         etRQ==
X-Gm-Message-State: AOAM531iGkE1RJ/S+EwLdrxpQ9o0jj8FHaJZSD2lZNxAm33NFu/Iis9h
        0MHZvF0qg5t4GXkp5Nv6TWW1CA==
X-Google-Smtp-Source: ABdhPJx16mWqhA7ExfAYAyXajYSVjGOiyGqdUj61KCpCqrNusOxlG5QHcFo4hqVoLue2bm3E0Fbd3Q==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr2541894pjp.48.1616047719436;
        Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
From:   Greentime Hu <greentime.hu@sifive.com>
To:     greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
        erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
        robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        mturquette@baylibre.com, sboyd@kernel.org,
        lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
        alex.dewar90@gmail.com, khilman@baylibre.com,
        hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
        jh80.chung@samsung.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        helgaas@kernel.org
Subject: [PATCH v2 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
Date:   Thu, 18 Mar 2021 14:08:10 +0800
Message-Id: <e32c9700ba07b6e07e7923c0e680b7f643cec8ee.1615954046.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Here add maintainer information for SiFive FU740 PCIe driver.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfc1b86e3e73..4da888be6e80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13592,6 +13592,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
 F:	drivers/pci/controller/dwc/*imx6*
 
+PCI DRIVER FOR FU740
+M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Greentime Hu <greentime.hu@sifive.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-fu740.c
+
 PCI DRIVER FOR INTEL VOLUME MANAGEMENT DEVICE (VMD)
 M:	Jonathan Derrick <jonathan.derrick@intel.com>
 L:	linux-pci@vger.kernel.org
-- 
2.30.2

