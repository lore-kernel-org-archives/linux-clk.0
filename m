Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE61CCA47E
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbiFLTbR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbiFLTaL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:11 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A0F41FB6
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f8so3426650plo.9
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/o2Y6AjEmhBUVI8vWJ11wRlaSeJBqxeukDVIIQuIGjU=;
        b=j+o5uqK+cgI3UFVOq1bK0w/K2m/6HdkPaRADz0Shd30n6BXuLz+AgnmHsORFBtARCr
         7q87Yaotd8tghn51AEpQDqEG4UifsYzBbHj6mJYsBhW82IbDWtYWLyHW+YkPk930hYAh
         KvJConOt4qBJNxEXdLhpMSEloPiOQApT3SXYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/o2Y6AjEmhBUVI8vWJ11wRlaSeJBqxeukDVIIQuIGjU=;
        b=Ydyy7D6SJJFDSl8HaQAlPgBSzfuRKFfLJBj8922tcX1TTnwJNWvs3dzAUusApXhk7V
         YmDaYFL9fOJW4yGWHtZ6Ff90xpHPe0LGuO/k8fN8kqcZTiQhMuG6KyUGMrn4ayJycVAW
         1kfqLRRUUVqEM5YbRRDupPnphpdLljPOH1UIZq5+mTthzdodDiqKGxQ3rmn4g2+VZIOy
         yKNL0vu7WFPCdqo/vchXTQ2+yTam235cu+3Az5S6b8WaBnHioENi2ezKBiUn1usxPHNv
         T4XKFVlG29/2RATgtqWL8Kr8yUieVhZm7ndCo+/PDTRaGxf1Thcv4fiBdUvp9Ma0KYT4
         3Swg==
X-Gm-Message-State: AOAM5315+2wyLElkOnR8yknMrA1oiNZ27Y66VN59kTIOT6catp5PrV3X
        WFLNhsHWtxlhUxV28FHtNFKRE2ZXTNZi2r+p9O92Ow==
X-Google-Smtp-Source: ABdhPJyaPk5oM6scagXtdJWDu5BvR1Bn81dax6ahPVlieZ9FETn0m7MvYh/njWhFh2ZC24HGEU9oqA==
X-Received: by 2002:a17:90b:388c:b0:1e2:f376:b8d with SMTP id mu12-20020a17090b388c00b001e2f3760b8dmr11628007pjb.148.1655062209027;
        Sun, 12 Jun 2022 12:30:09 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:08 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 00/12] PXA168 clock fixes
Date:   Sun, 12 Jun 2022 12:29:25 -0700
Message-Id: <20220612192937.162952-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

I have been working on bringing the PXA168 support in the kernel up to
snuff. I found several mistakes in the clock muxing, and began work on
getting the SDHC controllers hooked up properly. I've been testing these
changes on a device that uses the PXA168 (Chumby 8).

I'm a little unsure if I'm following the correct approach in the last
two patches, and would definitely appreciate some feedback if there is
a more appropriate way to handle this situation where two peripherals
share a clock enable in a single register. In particular, I wasn't sure
if creating the shared clocks without a parent at all would be okay:

[11/12] dt-bindings: marvell,pxa168: add clock ids for SDH AXI clocks
[12/12] clk: mmp: pxa168: control shared SDH bits with separate clock

I'm aware that checkpatch warns about the long lines, but I was unsure
if that actually mattered given that the existing file also has the
warnings.

I plan on continuing to work on additional PXA168 fixes over time.

Thanks,
Doug

