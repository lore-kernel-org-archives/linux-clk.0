Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EC3C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 08:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B04DB20854
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 08:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LPqwZncP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfCSIu4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 04:50:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36714 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfCSIuz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 04:50:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id h18so7097700wml.1
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
        b=LPqwZncP48YbBVdGto3gLx4EesNFzYGcq3CWvVdtZF/9cW9yE/v5xmftFjqXquxr3f
         yb9Nkt9FB7yQbQPs4wagzhglDWFIBh9730VZniZdgVIcQnzhIKWjtqpcajgtbEq+iTgW
         BPfOVMCkzkiKLB8uzgrny4vnemApV6hX3LuCHAxYLd+qp4SK9cBlYuVdYg5BmZkVcALW
         /euhWk5CZDZjuH2n3hK9F+QE5a1uIW4Y8SzRKGXg1cOzhxkqSAKZivJaQ5XJvqJvyj2H
         vvKJqWFhZ8tkvi/KQwYhuSbjM8Xzz77SUBCNpjNr5YxEYSUo3xEfH86+5p7sB6kcy+UA
         Ov6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
        b=VdMl06Fk7G2Dxupf2Hz4XJyOeuMn/dovCs0HAdG/dLm3nc1wKm0fsfXHZrEQGwv61G
         G5aX2dQ8EsxvHuYvSWAfCoVeOpQLQBmNadO1yu15NIhRhvlwO8foMGMq8V03tqp5konX
         kTzWDkrGlZcZxOo17e1SCiCyq1HSR27bBXsfWX3Vr0q7FJegGXBwwGgf9+axBB0/pZDQ
         kPx2FHmYtOCTPLpumK3e8faVy6qIQvpHZoQvCPX0Xdt4pyx7nWUHmAowCJndbkYYQsgN
         MQfng4qU6sOxL8QgA/h4U1I0/YzdWHbhGjMc9Ro38MsB4g0znYeECtGcOllswXz+1cmt
         nLlA==
X-Gm-Message-State: APjAAAV9ak8BVfLTG7nbzWNgZE5Zcadatld0pSEM4wv1VXIOEpPA0NKo
        DOPmBurRCQOfJqjdWhSK+3uJMg==
X-Google-Smtp-Source: APXvYqw83qHRKWh0mRm2INlgYcqK32PwGK7PWt2hJbmf1chMs+hSs96ZfVB7FWfICvoe7jKj03H1VQ==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr2710540wme.48.1552985453234;
        Tue, 19 Mar 2019 01:50:53 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id n4sm9411047wrx.39.2019.03.19.01.50.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 01:50:52 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        devicetree@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add VDEC clock IDs
Date:   Tue, 19 Mar 2019 09:50:43 +0100
Message-Id: <20190319085044.8581-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319085044.8581-1-mjourdan@baylibre.com>
References: <20190319085044.8581-1-mjourdan@baylibre.com>
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

