Return-Path: <SRS0=a61j=R2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A38C43381
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:17:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 886E121873
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZfoJ8FWW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbfCWVRD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Mar 2019 17:17:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34500 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbfCWVRD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Mar 2019 17:17:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id o10so6721090wmc.1
        for <linux-clk@vger.kernel.org>; Sat, 23 Mar 2019 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDrizs2/2ZAftGyDtPa0UqsjZPPXfl5+5ooldcgiEvQ=;
        b=ZfoJ8FWWjKGpcf9d8YwDrrIirJDbmWiEjOXqDMQPc8rWiEWNMYPlq1pRe8QH+BaV6H
         pkrLqStBymgTLCR5hhVa9XS/OndbeL7zySXywosVPnf95crPm6DXiIq7K1kIo3xrhs36
         pvZIuTX23bTXySIbRHTULrEB4Vu0bxx0I/dsLemhJ1ID/pUBe7s6X5AJXbLjVOCKOKCC
         O8LPKDU+NZ2tFgvLKMJzAjeLaiTHVpCIHyXb0J1Ua1kYxpdvWG0yf1zNgYhHiWcyGoKJ
         Wrz6wRK3KeNHqnpmlYcE1SfcxeU1v5wcz9/CYzAa6pZoJ26NTBmbEI3wcBHFs4iAMjCz
         wvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDrizs2/2ZAftGyDtPa0UqsjZPPXfl5+5ooldcgiEvQ=;
        b=fhEJurdN5PDugnFfR6wWiTIGUOSAzpC1RvVAb3M6jY+lbGCnihURNeuWv0a24T2N32
         pzVckVldWPe7T0l9e7rlyfDH6CVjwNe44QMLWoeuyt7vd5VSt6FH1aEQL3HK+jJH1Jg7
         dbvwiLA5FWc9sMYV5Z+gcbI0tjKfeWtMirBtkwDx7rSISpXGf0WKQwJeLNRBsTbZUmic
         nFKq5AVEDZ4Dz3vZ7yMcTA5JuqnG/11Ueeq9x8eburQG2A4EZJdUdyjyf3XQbuKK+c6i
         Dc4ui48Z20WIrVsqPBY1mJxQdJ6SVDETbxdFcVcFLyyzQdw+fx1aUzsJh3bfmPtUdGcV
         B6QA==
X-Gm-Message-State: APjAAAUPmW0ytP8Rty2uY7kuWuLYlXaCsfSzFKT2ZLN1crz1ANxKtqpX
        +3LTkga2z6kZhw6tjV7pBDvkzA==
X-Google-Smtp-Source: APXvYqynNilWbzifjm8V9o5qdrR1Mbct64Bkz7ip1tKMi8jiaJiaxwasknDL/Rs9NTJNNkzHIdVr6w==
X-Received: by 2002:a7b:c404:: with SMTP id k4mr927170wmi.117.1553375820854;
        Sat, 23 Mar 2019 14:17:00 -0700 (PDT)
Received: from localhost.localdomain (cag06-8-78-203-165-84.fbx.proxad.net. [78.203.165.84])
        by smtp.gmail.com with ESMTPSA id y66sm8050503wmd.37.2019.03.23.14.16.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2019 14:17:00 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     sean.wang@kernel.org, ryder.lee@mediatek.com,
        hsin-hsiung.wang@mediatek.com, wenzhen.yu@mediatek.com,
        chaotian.jing@mediatek.com, yong.mao@mediatek.com,
        jjian.zhou@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org, stephane.leprovost@mediatek.com,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 09/24] mmc: mtk-sd: check for valid optional memory resource
Date:   Sat, 23 Mar 2019 22:15:57 +0100
Message-Id: <20190323211612.860-10-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190323211612.860-1-fparent@baylibre.com>
References: <20190323211612.860-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'top_base' memory region is optional. Check that the resource is valid
before using it. This avoid getting a "invalid resource" error message
printed by the kernel.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mmc/host/mtk-sd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 833ef0590af8..573aa127d00b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2123,9 +2123,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	host->top_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(host->top_base))
-		host->top_base = NULL;
+	if (ret) {
+		host->top_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(host->top_base))
+			host->top_base = NULL;
+	}
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
-- 
2.20.1

