Return-Path: <SRS0=EXyH=XL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16BAC49ED7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88FFF214D9
	for <linux-clk@archiver.kernel.org>; Mon, 16 Sep 2019 16:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKCX6scH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389877AbfIPQPl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Sep 2019 12:15:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39116 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389875AbfIPQPk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Sep 2019 12:15:40 -0400
Received: by mail-pf1-f196.google.com with SMTP id i1so184352pfa.6
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2019 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=GKCX6scHAe3UgbcWbSYj9UhGEhnAp5igFirmxVhIfdKD8kUhLG7HkdCa3KCBbyZhAH
         rIqB/2HAR4MJMVczIAFlhjR5sVZ7da7ARxPGdNx/3HjK3U9OsDPIaESzw/6d3XA+XLiw
         rWOES6DHJZCepE4RMrM71uDIgj/gOim8P4/CxBzgQmAlfHMFPDPYH1EMw385Vhmj7kRg
         xxr0K3OY3BQpgGKupuHIJxDAqQ6On0B7Q+4+zFXLCMzZ2J14y38HeSZbZ4XNO9nZYtZE
         gB0CKeHt6XChPihg5meAzZLbTLYT3C1+k31AiUqHJ15NKzADZwQ2mAOng2KtEJdDfpUX
         cdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=YjP8R5HTf2hLKfsczWU7eyUrc1aG9r9MmYE8zkii70ALuMlpLtxhkTTmg0xqZ79maX
         dyr6A1kXAkKL4GYkgvrrv9Z9cUwhqxyks+lD7ru8OwqC9gA5q0x6PuaopXP1Z8P0+Vsn
         /N0U1OvLBExWdozI1h2vv7mCKkP2nvw2HahHqah6+bdmoqbqFwSvBF+ssb7IiO7fqssn
         XnZWlldVkcqxEazNTE6yinhqS++S36nZBhvXNlkUkBqiG1+hitBLYileBMWGIHvZQrEv
         Ppjvi4B+YuVpPhzSfSLVgPTH3v1UccOXsAhYxPjMqfRpE0yNrJ7c6NQR0o5Os8kCM1kD
         jpGw==
X-Gm-Message-State: APjAAAVVtnS7c8sAkFsuKpnkOvXRW9bUCIaf87QW0IdFT/2wnGHaLEe8
        X+MDD15mk3C5Go1sWT05k12/
X-Google-Smtp-Source: APXvYqwaTIjGBFw6rlJrBeKVPsJzm0fIpIu190y0N7zwgbmlpXO1k7N9rTebjfrkX62HrT6vruUWJA==
X-Received: by 2002:a65:57ca:: with SMTP id q10mr877pgr.52.1568650539809;
        Mon, 16 Sep 2019 09:15:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:90b:91ce:94c2:ef93:5bd:cfe8])
        by smtp.gmail.com with ESMTPSA id h66sm614134pjb.0.2019.09.16.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 09:15:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 8/8] MAINTAINERS: Add entry for BM1880 SoC clock driver
Date:   Mon, 16 Sep 2019 21:44:47 +0530
Message-Id: <20190916161447.32715-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MAINTAINERS entry for Bitmain BM1880 SoC clock driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997a4f8fe88e..280defec35b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1503,8 +1503,10 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/bitmain/
+F:	drivers/clk/clk-bm1880.c
 F:	drivers/pinctrl/pinctrl-bm1880.c
 F:	Documentation/devicetree/bindings/arm/bitmain.yaml
+F:	Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 F:	Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 
 ARM/CALXEDA HIGHBANK ARCHITECTURE
-- 
2.17.1

