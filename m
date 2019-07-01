Return-Path: <SRS0=aD5i=U6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2CBC0650E
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:13:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F6DD2145D
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 09:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nVj4kZjP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbfGAJNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Jul 2019 05:13:22 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:33252 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbfGAJNV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:21 -0400
Received: by mail-wr1-f51.google.com with SMTP id n9so12958045wru.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=nVj4kZjPsghODf8pIYMBdQTJlSwuNFTN6LsNESZwAy+s3XPZgxLAc9G5YNpLsK8F8l
         MFC2qNPQCvPYWeIssqBDmsmeTnJ+sQE4t8OQK1OkFv58nn4CaTGmOt4Om5+AEw5oxrAg
         viqJz3Gz9bdBpEJRK5faApunYLOKpkyBcsb/S7OY2py+WNG6ThDKp4krYMduM1gficTU
         ZZin5WAl30gP7LP/+mmIC1mipA120aXCYbxX4o/bZX2fc+zVCW+OQ0x99IA8Im2x2e8D
         MsfXe37/sDUycbobHLlc9L4ugM+YZypY+3CH9exoSzbbLH/bi0ShBQpgh8cG5ZzpysSX
         iDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=X+jobMffaPTt4+cR9alhF7T/o/EcB6g4tPl0rLHxbSOEtSai0XylVbXeapiHwGrpaI
         GOf+gghGgu2SoNZ2HAI+wL8ttlLnvbsYWlVR56Brd5SLvbVfRq35D+KOVOCwpWXXLQvm
         7Sx985bBHjJMnADRnb/40QtGofU88zuMF5iVOA0IEc2hkE664mU93oA3BRbjVKQvOn1J
         9b0HEWv6dXr8jqQGCF+OpQw9pSHd2PSZ9TaoWfHMsf0n8Y+7k0ccuYYcalup024L9+xm
         5qUhtnx8yCqP33gi070cZuuSGYLYHmQicwQkrMHfhBfIyswr1Z6SsZzXYYJlGxE6nltu
         dyjQ==
X-Gm-Message-State: APjAAAWCmLtRB9NBwelmoMO4FvD7jpti1cE0ERcSpwHRow83p0E6BGRY
        uRuzPdIYfp/RPEr7m2LpyWviZg==
X-Google-Smtp-Source: APXvYqzv3VoNE0QJ3qVFoa2fNSEmM/eDXNEDXdsWqAqO9ZhU482BSwxibAPMdy0qG7HfgH7P4bBC7A==
X-Received: by 2002:adf:c541:: with SMTP id s1mr17881931wrf.44.1561972399431;
        Mon, 01 Jul 2019 02:13:19 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
Date:   Mon,  1 Jul 2019 11:12:52 +0200
Message-Id: <20190701091258.3870-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Expose the CPUB clock id to add DVFS to the second CPU cluster of
the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b6b127e45634..8ccc29ac7a72 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -137,5 +137,6 @@
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
+#define CLKID_CPUB_CLK				224
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0

