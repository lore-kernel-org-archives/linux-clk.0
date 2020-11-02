Return-Path: <SRS0=CNvH=EI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D737BC4742C
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 12:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FE8F223B0
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 12:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20150623.gappssmtp.com header.i=@vt-edu.20150623.gappssmtp.com header.b="ZCCUSnwZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgKBMCK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgKBMCK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2020 07:02:10 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201A3C0617A6
        for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2020 04:02:10 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id q1so12700939ilt.6
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2020 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:mime-version:content-transfer-encoding
         :date:message-id;
        bh=4lUtMbemKtwULeWB/GtzN61KZP8PLo1ylcMvc2DrBNE=;
        b=ZCCUSnwZrwi0KVDyv5VwDc84EmLHx5WwqlwF9WWaUWvMCVM/ngqnFIOG2D/5Y+qAgr
         XDX5mBhr828bKSJMlhawIGKOhA3cG1gtj6pGsyUMfS459qxW5xgBKxA3gUGjEDZt0NXL
         +W0Iarc3kuaCKRlq5h+NkbPD03yhhAm4hqGp+6AcTYi+98Gb5kcCKP6pN6ua4NSAi4S1
         R3pIh1L0CG1j8QwsYCK6ubZJDttbdLkIniasV9Gkb5dwBcd6vd6TIRGIiUpszKqh7B31
         nH2zE9iM9PCPaQyAu57y2o0tETBek9PlroR3tpoYZIDAu8WAbwagV8tJ3UUALtd2q3AL
         Cu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version
         :content-transfer-encoding:date:message-id;
        bh=4lUtMbemKtwULeWB/GtzN61KZP8PLo1ylcMvc2DrBNE=;
        b=kE8BVMN1lfnWoK3YbtubPerPeLRNq67/tD2gXdBk+w343HJQIA9AlLCMi2SoArehD8
         TLUHFI+E6t7wN3WclDX8/xwTK5fGxgh/KQbgxavDbykPYL0z9QHEHm3XYw+wK5r6v8an
         PnHa0pdceNaM5ln3NrvXmlHC/xgp6cTfaFHl3HorlBbMeyHh/uvQl2RS0RhMKDxP8NQO
         EJfLpEYIQpQLFuyrgpTpwL4MmLvQYxJAuxPU9OjS4+MCkf2vyTTgmSgZqoY2ZiFlOsVS
         Nyd7pND2WknM317RSGpC1NJiwLELo4FiJTudHxV4cWT/xYyar4esF+wdbCGAmpWqxJsb
         fLMw==
X-Gm-Message-State: AOAM531wPCAF91zoPR5RpwJNB7tG1IjWs4sphzXmlrEuPwt12LkVPi4I
        01FBuKv/bu1CGv9vf75xPBxWWA==
X-Google-Smtp-Source: ABdhPJyXxscq1wNR3piVhMnm5hW9AcsE7JlM6nPhY+kolBvI4nSMh63pvoyBanFPGM7hw59EiRiYGA==
X-Received: by 2002:a92:844b:: with SMTP id l72mr9784093ild.244.1604318529367;
        Mon, 02 Nov 2020 04:02:09 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id q16sm10359649ilj.22.2020.11.02.04.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 04:02:06 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: scu: Fix compile error with module build of clk-scu.o
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1604318525_168427P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Nov 2020 07:02:05 -0500
Message-ID: <208469.1604318525@turing-police>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--==_Exmh_1604318525_168427P
Content-Type: text/plain; charset=us-ascii

commit 77d8f3068c63ee0983f0b5ba3207d3f7cce11be4 (HEAD)
Author: Dong Aisheng <aisheng.dong@nxp.com>
Date:   Wed Jul 29 16:00:10 2020 +0800

    clk: imx: scu: add two cells binding support

This missed a #include, which results in some nasty errors when
built as a module

  CC [M]  drivers/clk/imx/clk-scu.o
In file included from ./include/linux/device.h:32,
                 from ./include/linux/of_platform.h:9,
                 from drivers/clk/imx/clk-scu.c:11:
./include/linux/device/driver.h:290:1: warning: data definition has no type or storage class
 device_initcall(__driver##_init);
 ^~~~~~~~~~~~~~~
./include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  builtin_driver(__platform_driver, platform_driver_register)
  ^~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(imx_clk_scu_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/device/driver.h:290:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
 device_initcall(__driver##_init);
 ^~~~~~~~~~~~~~~
./include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  builtin_driver(__platform_driver, platform_driver_register)
  ^~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(imx_clk_scu_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: warning: parameter names (without types) in function declaration
In file included from ./include/linux/device.h:32,
                 from ./include/linux/of_platform.h:9,
                 from drivers/clk/imx/clk-scu.c:11:
drivers/clk/imx/clk-scu.c:545:25: warning: 'imx_clk_scu_driver_init' defined but not used [-Wunused-function]
 builtin_platform_driver(imx_clk_scu_driver);
                         ^~~~~~~~~~~~~~~~~~
./include/linux/device/driver.h:286:19: note: in definition of macro 'builtin_driver'
 static int __init __driver##_init(void) \
                   ^~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
 builtin_platform_driver(imx_clk_scu_driver);
 ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:283: drivers/clk/imx/clk-scu.o] Error 1

Fix by providing the include.

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 229a290ca5b6..15d382f6f9f8 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -8,6 +8,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>



--==_Exmh_1604318525_168427P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX5/1PAdmEQWDXROgAQIOzQ/9Fh7u7CjJVVvYfQl56BjwcIOwsPn57c65
vQ6RAXnr84O89rd4vWtCP2WVmiWXp7kvsYOrB5LJtGCdhTMoeh80pcJmpJUo2y0G
6MLBdcPoXIUbbPt57pjA77EzV/KydYT1FUeZuiyZrdFCuG1yBpSz6J8tZ9nokFzY
Nv9QHT7H6HVS+y4FtCOmL3ivdsQrSHBBQ7MX9A7AsMrNymfOTvkmeIDK9NJk2E87
uAtIpuSM3WwEl1/ImYlAscXnEBeHuN3Eo+C0iqDp4fVCcb+qFXgdUEr32cTlROmh
HhzENBi1AAIyZnudkPcpbViJyUmEXtklvJYjckQKVHhcI5ewj7whG/x1H+hDkZ+r
hJRxFHp0iLvaIwDqhDDhqz6Yzonk898l+RyhXd0XLpu+9XytrpUnbH+GkslvY8yo
qmeQXvYcDK+B07CvIavfwr92woS+0w7c8JUT66Z9g7obDLlsxkUOw4NsBmple/Nq
WziGk8FcWJA9QwHC0NFyMGIMQ2DmXyN1gZ001R3F4GoJF4SzhcV9FmF1lI5qiCkd
FEQu3//fbNeSVMJQCEjTaXGciglNVSv4SzIChCjPZ6GFhC69ILAqc5TeGWVq8K9G
JhxrvUmz79K6NYh6fp1ijsjN4JnHmYZsbl0Sw+IcYMfzywFbU0tQ7BmOS4eI/kd1
I/f+VaDSDO8=
=LaUB
-----END PGP SIGNATURE-----

--==_Exmh_1604318525_168427P--
