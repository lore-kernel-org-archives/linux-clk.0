Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DFDC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 13:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356017AbiCPNLB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 09:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356021AbiCPNK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 09:10:59 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2FA4F9E7
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 06:09:45 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 783393F5F4
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647436178;
        bh=hMpVGD6o3TsybJH5wrGEkbZ3q6M86lmXlzkdgti+gZM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=ajmhVyosPjPHewC9eWeEy8Gk5x03HOhY37sldJdEb7V8LzWc1AkFlEv3Fdz4MHxIS
         9xIvzmA8QuKUDHjGdO0R2yBl6DLFjbC0I1UBWVgVkQ5byHYT6cOYiRYBHk1FYVDgu5
         86JBj7OphBtExVKE0G5zNFSvj1vBF+21WIw4zbXN70B0kBtvymXH7MtOb/1ZSHLBkI
         5jINgdOUHZwZjGpxJnkm0Hfr39IyA83XqnWSJ1vE4fbDFd3TDN6aN5RXFqnMcoOhUI
         VpQPig8CWRv54gq1292rNP4cQRfGwJ5CsGPe7o1zABJFEg3lQ8CqhGwJSVnoS6sswE
         FmJTkBp3GraRg==
Received: by mail-ed1-f69.google.com with SMTP id l24-20020a056402231800b00410f19a3103so1295443eda.5
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 06:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMpVGD6o3TsybJH5wrGEkbZ3q6M86lmXlzkdgti+gZM=;
        b=2Thr39gj4mZ/NUqTyz8rSy/zV5CRO/FYzg5DEG/36USNrfvTfQNgjPuPbWMYGc/3XY
         eD/SfwUXlTreC9l1eLLjsZpj95Nt0A+IQWl7vCuJqC8wWGUug1fgIPKRYxWT+0wqAcbw
         gCizKIqJuPQHwI8JohiAcODHH/I33yYxE10HFSEf0Kj3Ms5l8pNZqSgAXk6lBkzkhvT7
         hYtbpRBrp5/XuAgUVKNRSmqUtRJx2ZllozHnHS3oTT/sX9IHNw4OdZ+NBO4tAYlRo06v
         0x0Cv1/gsAxEtStmOMfRp1DLsKvwyjdZ6ibecezLjISsFau2Tdu7kz/shXLqBmXDb6Dx
         XkCA==
X-Gm-Message-State: AOAM531s+ZLndpTZnWpYni/WDXnDbbFIJrapZ740oFbNHWEpZyDNxjs8
        5XCM/H5pOyt+I4dvSwzDEHM67xARmqQ41tQdwRlrW8EAWX4TYfc6VgRowicc/leJvL2507j1j/s
        cXjhqBnGaV9bjFPeKBE2xUEtLzlTkHzTjBqSQQg==
X-Received: by 2002:a17:906:dc8c:b0:6df:831e:76d4 with SMTP id cs12-20020a170906dc8c00b006df831e76d4mr1659347ejc.139.1647436177722;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFY00Fte9yceTYtdcLIDEMUngEA7Vv2XIZrc94QHM+xHDidA3EN1sRimJG9UK5kh8CSQEOXQ==
X-Received: by 2002:a17:906:dc8c:b0:6df:831e:76d4 with SMTP id cs12-20020a170906dc8c00b006df831e76d4mr1659302ejc.139.1647436177483;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id mp33-20020a1709071b2100b006db6dea7f9dsm861597ejc.168.2022.03.16.06.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 06:09:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <shc_work@mail.ru>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: drop useless consumer example
Date:   Wed, 16 Mar 2022 14:08:57 +0100
Message-Id: <20220316130858.93455-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Consumer examples in the bindings of resource providers are trivial,
useless and duplication of code.  Remove the example code for consumer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index b6a6e742b66d..dc0fc8fc4839 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -190,14 +190,6 @@ examples:
                               "chg-status+red", "green", "blue", "en-esata",
                               "fault1", "p26", "p27";
         };
-
-        ts3a227@3b {
-            compatible = "ti,ts3a227e";
-            reg = <0x3b>;
-            interrupt-parent = <&gpio99>;
-            interrupts = <14 IRQ_TYPE_EDGE_RISING>;
-            ti,micbias = <0>; /* 2.1V */
-        };
     };
 
   - |
-- 
2.32.0

