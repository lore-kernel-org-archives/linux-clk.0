Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4453C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3DD020828
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Yzff3i2P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfCSKME (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:12:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54297 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfCSKLw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:11:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id f3so16120940wmj.4
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 03:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
        b=Yzff3i2PZkBeTqGtwPOqQ3j+XCInyjGqJpt75KA6x3Wi4/yB/Agb2kr+MuD1TBLdpU
         YgYXNPHo4dHtLViLE7GuWBZwPpDE5einCa9RiFhgib2LgmXwV0KDHuNVYZAwuEq/XXry
         d57tSGALrwsnHn8NT+XJrEd9jXhlB5+CDXHZLoJqhZMMSgmpJrKtejHaiOOTJ3BuG8/Q
         /UXCYgyxcTpuIUGzWZ9QtlqEDCm7hmc2SskCXsyY2qpaY6F2CKKUjwXUBG2yjEPHsSK0
         BqynV/Fv1O6R42iwoiW3gHU/pELm8A9wB68+A0Uk/7ezW8pBrL3cGNsC6rUB+PLDZpOc
         rtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
        b=da+YMGNahFJz35qOyKx3ukjmsVxIXMx0wYz+1axM4xzs1jmf50IW0+hiKejDirvtfK
         8iua/EMpwii/wszU35h8kbVFc/kDaUo8RjoRpO1tdpRbr0qxUqwIHKeanug1PFjARSLi
         AWvYr7hw6egVdRvv9Z9MTArpJndKqMsyUYSp9o8e8xmR23bRGbmNa4q+8WzgoVux7PGo
         nPxOdnpVpy4io3jPZXNmrbr5f+SUd37K0wiAtbizFthUYnDg4YJjpukqht6n7/DVpYLy
         H6fi1qw2iXMQeUVgDP24tMBQA+aYiQT6InrJobofKtlEARtkDtAsFq+zYnMKC8W3LiMa
         PkGQ==
X-Gm-Message-State: APjAAAVVmuV15NBIBdoNJ2d+rB1PJBcYhywRNtIYkkJmqZ+zzMp06uvq
        BUAKKR4ATapY2aEoR9JfkzfFnA==
X-Google-Smtp-Source: APXvYqwpFmH36r17EpnbWypN9BNTp/txPpd62YnFCcbyy5KtOAXjRmASH8ayjcpFinwMcEVSZ1VEPw==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr2941028wmi.50.1552990310936;
        Tue, 19 Mar 2019 03:11:50 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id h10sm3911245wmf.2.2019.03.19.03.11.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 03:11:49 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        devicetree@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add VDEC clock IDs
Date:   Tue, 19 Mar 2019 11:11:37 +0100
Message-Id: <20190319101138.27520-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319101138.27520-1-mjourdan@baylibre.com>
References: <20190319101138.27520-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Expose the three clocks related to the video decoder.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..82c9e0c020b2 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,8 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_VDEC_1				204
+#define CLKID_VDEC_HEVC				207
+#define CLKID_VDEC_HEVCF			210
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0

