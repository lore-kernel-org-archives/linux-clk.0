Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFEAC3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D5A120989
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I5oxOMlm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbfHSNCe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 09:02:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44727 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfHSNCb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 09:02:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id c81so1133728pfc.11
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=I5oxOMlmoNOBbAK8yXgi9UgRNTFhNomtkzu3X2QO8e9IumF8D/Lpl6NMi/w1GZX9Sf
         ZK5Byq71nZ2OzppGvc/p/9fED/etHr5cTRub8ov86DfOJWPaLZOe1KVajuiPObzWDsR6
         LKJy5pR8DRMaByo2/gse9aaVTDzG31cYw9Fw5DlEoIw89cnqiwqGHVFu17YvBt9wrKmC
         3zA7TriDC5WL4umb/J4R1JektpkfFtoX+dcJvA+bh/0sihHUaITD5cKPOFKmYqXFpwQY
         jqHuiPHRSm+X1JFjqWLu1emfp3f2lpIM1sjpcCFQBb68yXVS83d0gRXS4lU4bHtqYQzX
         GXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=nDTlz/cp3T1r/dco4sn0fnQlT2G5YGGKtCi2F8SiCFS4ftYAvGNs2zxSGGdLTS7z0j
         WLU8jhOxBgc/1ZL8qR4zhTkA9sAxC9mEj9Ur3R7Uz7C74rAzER+KhAq2BIJg389fKSFh
         X6gwxVTTswKmVKmhNNzAxeng+Jp48qrsX0SaqKNYRnGjuSNy/9NSvONV8PtWN0sRybUJ
         Vit2c96OmxDEhkbDofy144g5Lmy4yYSHD7mFMihk1RJ3v9Q2taOC1RWB71PEjzcoSi8K
         fohUUwVCi03yhoM1ZXo8EHDsQRiDsT2MgU4vuPP8FGaeuPm/GA6K6hnLlEBsshxsdXdI
         3AtQ==
X-Gm-Message-State: APjAAAVayqDIFFVjjglTAMK9p61+Qh5UiD5vM8He9CSIjheV/zzZQp5p
        S+TG5R1nCyOse6ch/m3l6QRI
X-Google-Smtp-Source: APXvYqz3130G3+QPHySpMazLaiDQvFYHTuB7P2bgiUvNOFEeeEsILzEH24tPP6zr7ff0S/wJPaVKPw==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr18405715pgv.298.1566219749465;
        Mon, 19 Aug 2019 06:02:29 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id l123sm20626464pfl.9.2019.08.19.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 06:02:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 8/8] MAINTAINERS: Add entry for BM1880 SoC clock driver
Date:   Mon, 19 Aug 2019 18:31:43 +0530
Message-Id: <20190819130143.18778-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
References: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
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

