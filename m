Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE688C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 17:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243775AbiBQRfc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 12:35:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242565AbiBQRfb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 12:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 411192AE2A9
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 09:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645119316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DZsl4nXyfSH8LqSPjL0oKykjopTH/CSytqMZi4biHO0=;
        b=a3HQnQXKjAhvDZP8T39i3rpV9djlvNkPKB/RBzojX6MAdC3z6490GZE5FDb2n81I3UjP0q
        uXSp7ML2zIS56xruXWoSCCRxVEausWCi/a8MdsitQzXnzSvVC53qnh2EKxAAYsAuhkwwaE
        4+BR5B3e11tQj5m9dvGbu+bDBjNfTfk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-bjpDqUFbO3K6YG1XLcLjAg-1; Thu, 17 Feb 2022 12:35:15 -0500
X-MC-Unique: bjpDqUFbO3K6YG1XLcLjAg-1
Received: by mail-oi1-f197.google.com with SMTP id bq20-20020a05680823d400b002cf93c09f23so163434oib.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 09:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DZsl4nXyfSH8LqSPjL0oKykjopTH/CSytqMZi4biHO0=;
        b=444/5Tbgo2I+yK+YNj16yEbqC5UR+VVOpCLgsYkquxtRSF+LN5eAQbltz5XbptlviF
         buRXLfIl3o1D/WqLi7H0csIL7VDSDoxJhKvm4w0TZMlRhQIw6d5ncH0jDnx62eBqqNmM
         f+5Kfs+OMPJnNoGK29mM8R+mk6fj+l/TRkQyGvtpHgixy1f/BYV9F0McH7TR4g+cdXRK
         af5EBp31rxbZ4JD4MSmz3HbeJD1wLG2Ju4uNUwbdWmTj/vlk+g5Amn1zJQa0NfFG1EQQ
         mYZjP2MFrSXz3LUuZjUsZBQrXAjYo4WySiwm4p8tu/JJgM1A5JvYGb1sCrhhIMKGz5kV
         ek7w==
X-Gm-Message-State: AOAM532PCM8nLEE0b1vQzhlynINk0OPVeziZpJVg5iMJjfBeHYmFKzvG
        CNA35QlB0akol4tWeAAFHRi7rshCrJRLt43QDT+yUb4aG0wJpXhXF+4qOhc4wVtPyySKve/WPeq
        t1/p6AZdQNf258vLj3N+D
X-Received: by 2002:a4a:4346:0:b0:316:7659:3fd0 with SMTP id l6-20020a4a4346000000b0031676593fd0mr1114489ooj.42.1645119311463;
        Thu, 17 Feb 2022 09:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl2V9nqsG9LlpbFpV7Btyn+CUYFrNOE/K7Kquyb4vznOqw25KLJa10rY6evLvTaSfrNjz1tA==
X-Received: by 2002:a4a:4346:0:b0:316:7659:3fd0 with SMTP id l6-20020a4a4346000000b0031676593fd0mr1114483ooj.42.1645119311275;
        Thu, 17 Feb 2022 09:35:11 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id 2sm16957210oaz.24.2022.02.17.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 09:35:10 -0800 (PST)
From:   trix@redhat.com
To:     dinguyen@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: socfpga: cleanup spdx tags
Date:   Thu, 17 Feb 2022 09:34:53 -0800
Message-Id: <20220217173453.3262672-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Replace tabs with spaces in SPDX tag

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/socfpga/clk-periph-s10.c | 2 +-
 drivers/clk/socfpga/clk-pll-s10.c    | 2 +-
 drivers/clk/socfpga/clk-s10.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/socfpga/clk-periph-s10.c b/drivers/clk/socfpga/clk-periph-s10.c
index cbabde2b476b..f5c1ca42b668 100644
--- a/drivers/clk/socfpga/clk-periph-s10.c
+++ b/drivers/clk/socfpga/clk-periph-s10.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017, Intel Corporation
  */
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index e444e4a0ee53..1d82737befd3 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017, Intel Corporation
  */
diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 4e508a844b3d..9b2e0275fbf7 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3

