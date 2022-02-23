Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E549C3526E
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 19:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244274AbiBWTOt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 14:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244231AbiBWTOr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 14:14:47 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75F84161F
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:14:08 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BD8AF40306
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643633;
        bh=HpbyTrdXrFaP+pceEvy/NrkKlPBl1rW1ivTy++yPdQg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=lF+u9h7M8SaGGj+BVyjX0jOZumxyccm+OdEcAbmYNGxAwerixclXgNWSgohMe+KOS
         Z47RNhg+hCoxblhOMU9LreR/HJ+Zn5M7ODjqWJeBuBxeaGwb4nBzg30oV6qCkl050l
         kjQeCvYrlUhxnEXYiywittN0rtgZ2lBKDITs7P/fE/FuRGqlpNonAbQdG7NCymUF3q
         aA268kbG940a/TIehbDStEeaE1qBXigBvVvH/iGe2FsRlPNoBYPtW+Ixw3Bc6xHQAm
         +b8mNNvI7bm3D0CsmZQw1uiYxl4beUlCWgnRlhpyv3S/lQKmPqpvnLZXgnQKU4DRkv
         yd+GYNWHgLfWQ==
Received: by mail-ed1-f72.google.com with SMTP id eq13-20020a056402298d00b00412cfa4bb0eso9246990edb.7
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpbyTrdXrFaP+pceEvy/NrkKlPBl1rW1ivTy++yPdQg=;
        b=wGlex9p8WTOlWh4s3JBRixskazz8WgTa6cxNV0QTm0pWXSh2RCFdYw/rpEZfKr+T/H
         DCd5AZilv0qC8tT5qu6uJ07h/dNrhHYqWRcurcmqJ+C5UWScQdPYYXBg4BB7X5B1H1QT
         JRIgsdrsy8HlDGz5xZjq+2XM2PjEzDTGqVNj4tgIisQM47aiOcjrITDVHEIAIf7wW2vA
         7ooAXz2jgPIVLZuNleeYqQ13l/KJoXKYIYELu3OExOZ81YH/23cXnJU9ctTkS3Ds6ZHF
         PFu3lWid1GzaPWn3BJ2zbChbz2VVN0jv5SwmQcCP0B3H4XLqZkZ2znIguf83dnCWS0Gi
         bs8g==
X-Gm-Message-State: AOAM532IawxEX18ZS+BXQdGSjaxzYEPiCB8hvV/sMYUq/MSXVQANnZDc
        BYDSxzEvj4VTHwry8H8SNqMx12qF+uCGnIiE6Qma6ndEpsdhvqbqnZCx0P/H3JTIV5FOaTeWNc9
        5XTvrWhvSzcVJMaS1hvXaKegl/buM/wXTzZFg7w==
X-Received: by 2002:a05:6402:d05:b0:412:e171:28d9 with SMTP id eb5-20020a0564020d0500b00412e17128d9mr848358edb.169.1645643633262;
        Wed, 23 Feb 2022 11:13:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYG5EE1VK62qsOOiEHtkeJRCih/epa6U/E9Szqr9uJDRTwmiXA+urJE3qxE0O0qjjabVNPNQ==
X-Received: by 2002:a05:6402:d05:b0:412:e171:28d9 with SMTP id eb5-20020a0564020d0500b00412e17128d9mr848325edb.169.1645643633058;
        Wed, 23 Feb 2022 11:13:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id q5sm212611ejc.115.2022.02.23.11.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:13:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v2 02/11] amba: use helper for safer setting of driver_override
Date:   Wed, 23 Feb 2022 20:13:01 +0100
Message-Id: <20220223191310.347669-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use a helper for seting driver_override to reduce amount of duplicated
code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/amba/bus.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index e1a5eca3ae3c..12410c05ec70 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -94,31 +94,15 @@ static ssize_t driver_override_store(struct device *_dev,
 				     const char *buf, size_t count)
 {
 	struct amba_device *dev = to_amba_device(_dev);
-	char *driver_override, *old, *cp;
+	int ret;
 
 	/* We need to keep extra room for a newline */
 	if (count >= (PAGE_SIZE - 1))
 		return -EINVAL;
 
-	driver_override = kstrndup(buf, count, GFP_KERNEL);
-	if (!driver_override)
-		return -ENOMEM;
-
-	cp = strchr(driver_override, '\n');
-	if (cp)
-		*cp = '\0';
-
-	device_lock(_dev);
-	old = dev->driver_override;
-	if (strlen(driver_override)) {
-		dev->driver_override = driver_override;
-	} else {
-		kfree(driver_override);
-		dev->driver_override = NULL;
-	}
-	device_unlock(_dev);
-
-	kfree(old);
+	ret = driver_set_override(_dev, &dev->driver_override, buf);
+	if (ret)
+		return ret;
 
 	return count;
 }
-- 
2.32.0

