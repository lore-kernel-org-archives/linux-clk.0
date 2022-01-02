Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B0DC433F5
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jan 2022 11:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbiABLyL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jan 2022 06:54:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59580
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233004AbiABLyJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jan 2022 06:54:09 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB1593F206
        for <linux-clk@vger.kernel.org>; Sun,  2 Jan 2022 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641124446;
        bh=8Iiswqq3lRgfFSSwuunIJRGY+0Um9RImCxO/Z027Tqk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=G7dlxXTDy4r2hZ5xIkwCc/sPfrOx01iWJoihHGkXUzNrcNvaeAIDWMHI0E0P15mV+
         jtwzqGskSy+CxCwadYhDtnikmf+itgeT5UwtIudPyrlc2rYj1TVg8C/dgwo+mgxM2g
         QzvxxWRV6tj7teIxvyAtLrGGuCdLnwlpTyivNxBXgnADloQFFXkYgarOud0fAbXm29
         04mpROrQMY+X4YHe+R8p3fXzwB9z2TmVwyH9hFf53ogHQ2MJDm/ojcAVBYeAXnF4Xl
         JseUWxPgfOG386ihMnSA80xI7dSCs03NnmzcYemPhzgoxS1zA97N4G3blZuBpp9nfT
         5y2QnHg5Jh8jw==
Received: by mail-lf1-f72.google.com with SMTP id i16-20020a056512319000b00425efb1c65eso5736546lfe.5
        for <linux-clk@vger.kernel.org>; Sun, 02 Jan 2022 03:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Iiswqq3lRgfFSSwuunIJRGY+0Um9RImCxO/Z027Tqk=;
        b=roxcPxjVCNFLml+yYkgD0IK6C8Jb3QMI5qCfTxQmxVguvRXqIWrzPuScbdN/slnhmz
         u64a2RcOaHjuMIoN7VmvS0zrvYHSYOZikxy6Qt3NFUund3BKgyGiucB/jQtx4j/4fmY4
         GxUoERZIDTCxUMR1xzWMpgxUxNpMkk274BDxX68zG9E9e8afBuQhCcBu12/VSAYRFGnP
         Fe1mfAP4zLrfPOfU4YdC2ARjzyD+AlA690+T7/z4ZI+5yxOVEOaEurKdB3bDtbVcSGNP
         5b1ZnJXF6erH95pj+IVOkCXwwaVMhOpU3qs91KdYEA9/ZtEyukfRi5ED/+h5n3xUTcXx
         Hvrw==
X-Gm-Message-State: AOAM531+uBHoh9O28stexZzw1F9Qorvfo2lQQYahd6qBKqnQ5UEfK/96
        gD9sqJpvkyFBh1p2ClXgfjl0+RzlbmSXyftuYYcw9/ZcWY/oIp2631VJImq6fGSOAcQo7DwTxQd
        VnsCdlzm04DADybAVyp95dmj3A/bqLKAXh7HD3A==
X-Received: by 2002:ac2:490f:: with SMTP id n15mr20601488lfi.141.1641124445745;
        Sun, 02 Jan 2022 03:54:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1GLEvNRCyNXDFJt1JJlRQIBOZJk+LUIbE17ZkCXTGpyGMuiMGyECp9GHjOloBT5pb9ZPESQ==
X-Received: by 2002:ac2:490f:: with SMTP id n15mr20601481lfi.141.1641124445591;
        Sun, 02 Jan 2022 03:54:05 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l2sm2368014lja.51.2022.01.02.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 03:54:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] dt-bindings: clock: samsung: extend Exynos7 bindings with UFS
Date:   Sun,  2 Jan 2022 12:53:53 +0100
Message-Id: <20220102115356.75796-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
References: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The UFS for Exynos7 SoC clock controller requires additional input
clocks for the FSYS1 clock controller.  Update the bindings to reflect
this, at least in theory.  In practice, these input clocks are ignored,
so it is rather adjusting of bindings to existing DTS, without affecting
any real users.  I understand that is not how it should be done,
though...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/clock/samsung,exynos7-clock.yaml   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
index f3fa6c7ef48b..599baf0b7231 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
@@ -209,14 +209,17 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
-          maxItems: 4
+          minItems: 7
+          maxItems: 7
         clock-names:
           items:
             - const: fin_pll
             - const: dout_aclk_fsys1_200
             - const: dout_sclk_mmc0
             - const: dout_sclk_mmc1
+            - const: dout_sclk_ufsunipro20
+            - const: dout_sclk_phy_fsys1
+            - const: dout_sclk_phy_fsys1_26m
       required:
         - clock-names
         - clocks
-- 
2.32.0

