Return-Path: <SRS0=a61j=R2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23143C4360F
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:18:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E278B21873
	for <linux-clk@archiver.kernel.org>; Sat, 23 Mar 2019 21:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FT1WzEVF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbfCWVSl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Mar 2019 17:18:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41543 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728595AbfCWVRU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Mar 2019 17:17:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id p1so5950513wrs.8
        for <linux-clk@vger.kernel.org>; Sat, 23 Mar 2019 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxFyf3iGCzky6hYo5GBIQf4Vm1JfhvCOSwUzC5ba4VM=;
        b=FT1WzEVFRl2Mc4LCsx9r8aU1OM1JlPanNNk/sIfuv7GiGjtpMTfCd5GEMInr4v+gnJ
         o/VUtCJxB5Zvq5pfF61Ppnp76b3lVzop6e09LY4BC3GOhZROAfLTltxW+IbxehlKzxpy
         J5T12PYGt4eZpGk7lI/0IjWEmxx2bSPcfmdlLmkXB6RB/tNFIEOzGJgVCmlcepXzxaiQ
         elVMmJppS9aB0T5I7pGMn4TrvbWhiU1VBE9GAaRgIilFfW8GZp1KtIHnBb6WHR538FZu
         mCDcPlyucrDQbtft4vMkiGp9aZvoprjZ5lsbPmlZtfjb4kSNmjxPcI/kGd2DIHAz9kZy
         QJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxFyf3iGCzky6hYo5GBIQf4Vm1JfhvCOSwUzC5ba4VM=;
        b=LG7Q0qak4fxlBlVNQ5X2i7f26i1xcWzc/X6gFBDIeyrSqT33C7qXw4BfBxuRnooLV/
         VrQtg/626IYdL/6myhIMcDjIj5KM38IXq+34BxWsgSYNnRM4NMSRlN3r/0kdjIxjBaSg
         +zVzBAYBi3mn4kNRSYm/W3fEj84fWy9VR3W3eHD3WVztM98k016Vwax8keCaWBl1G0Qy
         k6hCDPtYKg8ACiItbWQgefbhlIFWaNZD8r3NYUpuhXtXJ+VzWP90hR4tqpaTGWsFmr4N
         C2JV0OiRenjHq4gQvXM8Kfi8BV48pawmcPZ3PLUrcgeZ+DJMfd1JKpdn49a4FmM49NS9
         stfA==
X-Gm-Message-State: APjAAAUrgoUGijbbMdnr4aWoqH25gUqbmRuEPT1Ib38DwrQ3LOiNW6va
        KR7D0YVM70qmD/fBZftuekx/ZA==
X-Google-Smtp-Source: APXvYqwQbslBtW3BEz6P7fx084A7x94qUBVWZHEB8F2Vc9kI0VXkL3AafNkKIhvIuNwjnIQ+5hx5Sw==
X-Received: by 2002:adf:afee:: with SMTP id y46mr10592700wrd.217.1553375838551;
        Sat, 23 Mar 2019 14:17:18 -0700 (PDT)
Received: from localhost.localdomain (cag06-8-78-203-165-84.fbx.proxad.net. [78.203.165.84])
        by smtp.gmail.com with ESMTPSA id y66sm8050503wmd.37.2019.03.23.14.17.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2019 14:17:17 -0700 (PDT)
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
Subject: [PATCH 15/24] dt-bindings: pinctrl: pinctrl-mt65xx: add support for MT8516
Date:   Sat, 23 Mar 2019 22:16:03 +0100
Message-Id: <20190323211612.860-16-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190323211612.860-1-fparent@baylibre.com>
References: <20190323211612.860-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add binding documentation of pinctrl-mt65xx for MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index e7d6f81c227f..205be98ae078 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -11,6 +11,7 @@ Required properties:
 	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
 	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
 	"mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
+	"mediatek,mt8516-pinctrl", compatible with mt8516 pinctrl.
 - pins-are-numbered: Specify the subnodes are using numbered pinmux to
   specify pins.
 - gpio-controller : Marks the device node as a gpio controller.
-- 
2.20.1

