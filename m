Return-Path: <SRS0=Arik=P3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680A6C61CE8
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 20:51:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 348BB2087E
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jan 2019 20:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EJZhMqa5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbfASUvc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Jan 2019 15:51:32 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:52810 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbfASUvb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Jan 2019 15:51:31 -0500
Received: by mail-wm1-f42.google.com with SMTP id m1so7507616wml.2
        for <linux-clk@vger.kernel.org>; Sat, 19 Jan 2019 12:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mfga5LPr/J3+vtuLs6sE/4iTgznBPBA3E+j5LobqNYM=;
        b=EJZhMqa5fQqTJmlghkIfuLCEMOmi48PSWTE5qyegX9Uubem0S/mX2THXZEkvuwKQ1T
         z/4mwV1wNpAKZ4/aYapso4cq30p/1S1M2h6fdwDqBW+JV0ZI9ogTPOlqtazC3DjySZAz
         dgnGd1NwjKSYx9z95K5rpcwELS133MLnPKXm8zOzuGVLssHyC2ym02zsQcE6ulBwZ/pE
         aHB6CQq7YlvPOfo6GNNsQZQmPip/eyFKzUVMHoP7nuO6Dr6DfoSg26leMksoxIFs0Q8b
         La2VLE/WvfzNAI+396CCgwhJN+Rt8VkUx+tHxyX1MeSoOaHPp1v0kbUYM7WT0rlhp90q
         kYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mfga5LPr/J3+vtuLs6sE/4iTgznBPBA3E+j5LobqNYM=;
        b=fsSYMTcsCmkC2zN7dSVRrWgC26zQRx6KgBNVOIzkrMMPyiMx/zhZI2SVzO5BgPZhHg
         1PaROZJvwiReRk/2Ob3sp/hgf+wYswG4te3grdAJoXY0Nz25qhdY9j9GPBhOprT+XxKu
         7TwdSo3SVyZV62omrE2pIVAo5cMruoXMO3NyyrSC9Yuaz4HavZXwvPxmw/cf3EyI9Ks9
         kr+q42S1+/gcELlaFhrxuH6EeprIe2wii1Wfg4MJda8RiJz1Gob0CrJQ5B5RtjrBDyty
         +YGEwgUsIjpNWuMMIEJcHM7+o5BbMErMIobWL1+2b7M94+pPkFO23KsKBbd81FEZUaBu
         AtyA==
X-Gm-Message-State: AJcUukeH4TDM+zMjPrG1YREGk9bQkii4Aiuko4zzOVnAIf9q65S1q6sL
        JeXCGdK5gjnl+UzZaMaP+6g=
X-Google-Smtp-Source: ALg8bN4y5b0+bvYgqHjfawOqam5SUACzfUYhonkChTE8cEjTKNxwf5Rdy6cPF/WFZPTbvp/63Mx3eQ==
X-Received: by 2002:a1c:8acf:: with SMTP id m198mr20859820wmd.143.1547931089236;
        Sat, 19 Jan 2019 12:51:29 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD73A8100FDA9BD4E9DEACC2C.dip0.t-ipconnect.de. [2003:dc:d73a:8100:fda9:bd4e:9dea:cc2c])
        by smtp.googlemail.com with ESMTPSA id 10sm58176662wmy.40.2019.01.19.12.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Jan 2019 12:51:28 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
        jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] dt-bindings: clock: meson8b: add APB clock definition
Date:   Sat, 19 Jan 2019 21:51:20 +0100
Message-Id: <20190119205121.9621-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU
post dividers") added a clock with the name "ABP". The actual name of
this clock is "APB".

Add a new #define with the same ID but the correct name. The old #define
will be dropped in a follow-up patch because each commit in the tree
must compile on it's own (the old #define is still used by the clock
controller driver).

Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post dividers")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 5fe2923382d0..8067077a62ca 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -104,6 +104,7 @@
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
 #define CLKID_ABP		124
+#define CLKID_APB		124
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
-- 
2.20.1

