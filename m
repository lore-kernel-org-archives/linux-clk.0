Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10376C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E077161208
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhKIQr2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 11:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhKIQr1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 11:47:27 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F042C0613F5
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 08:44:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u11so45871465lfs.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEScOF3/fw9hfeuyrd9ku7cHldjk9nIyGiDu/7seULA=;
        b=MR++4vZ4vG4FCKdpRBfywjVFO5yNCXuVnyv1/SHgE9HW9k/XqOQwpFHl9QKRjiSEU2
         woWqOTktxEX30PFTbvJooXG61MnKG8DZP3wwbe2mVbmYch9iWdD/j6enby+LlYeddg+W
         lkxeOBGxiIIm8gDik8QWNiKoi/8drzHwjOHEucz2nMR0nKBkKnjgjUX0ZIz2wHPvJlo7
         l0OJrJObWp4pjLN9/xT8SErv9qPt9O/TAAX/MuMSvrS5GiHl2oBqk4HV2gYcarHA9ze6
         qMaU7SbGOUPgRq6WjRKbbqICd+oddVFAP3vJ+Btcbe/yQKcKmHVbdjOyFrcacQtwOeOl
         Ef7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEScOF3/fw9hfeuyrd9ku7cHldjk9nIyGiDu/7seULA=;
        b=1Xd2XA2GH0r+HQQjAHXzHgbS7NsXKFIXgGV7SNArJ2QlwM91hmWEUgV5AD3vXswoxX
         RVtaA2WOXd1iqFRpQyPESDKtZmYo0sOO03dRMNO33Bqziuxhjmh4kJ6kk6l0eCKBHPPY
         i/MCqOali9gb0B/icww0TLzB9GyGtHbACy6khaF8GAnyk2ZbfD2kMI3jYSOV6lo5bn4e
         zfGatQTOxwVpPuhjVJ5aeONf5GCgCbvubhZ+tdYdEjT3x0uYdLvKl58xBNAuIBw3ayQH
         IYdIBzgJ0gUaz1zA1f+La+uGhpEudeWV2OOkMyJ0QxBLsu3aSXRPsnIObmjpBNTdLjQh
         wHTw==
X-Gm-Message-State: AOAM530udIrJ42hxth0aUk6JYQld8YddMwoZPX/2RIbCuQqoebs+ic+J
        v0yW6F2wxmgZSCiaQiB2Qeo1NA==
X-Google-Smtp-Source: ABdhPJxaqTeGSD5hAODwamYztqyOG/300aI6Te+SWZ1OufFDsvmu2hOQiEmiz8iRKsklyuQnYX/HNA==
X-Received: by 2002:ac2:4313:: with SMTP id l19mr8161739lfh.132.1636476278151;
        Tue, 09 Nov 2021 08:44:38 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w40sm2189475lfu.48.2021.11.09.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:44:37 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/2] clk: samsung: exynos850: Implement CMU_CMGP
Date:   Tue,  9 Nov 2021 18:44:34 +0200
Message-Id: <20211109164436.11098-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds CMU_CMGP clock domain to Exynos850 clock driver. In
particular it needs to enable HSI2C (High-Speed I2C) nodes. This series
depends on CMU_APM series [1].

Tested via /sys/kernel/debug/clk/clk_summary:

<<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                 enable  prepare  protect
   clock                          count    count    count        rate
---------------------------------------------------------------------

clk_rco_cmgp                         0        0        0    49152000
oscclk                               1        1        0    26000000
    mout_cmgp_adc                    0        0        0    26000000
...
    gout_clkcmu_cmgp_bus             1        1        0   399750000
       gout_cmgp_usi1_pclk           0        0        0   399750000
       gout_cmgp_usi0_pclk           0        0        0   399750000
       gout_gpio_cmgp_pclk           0        0        0   399750000
       dout_cmgp_adc                 0        0        0    28553572
       mout_cmgp_usi1                0        0        0   399750000
          dout_cmgp_usi1             0        0        0   199875000
             gout_cmgp_usi1_ipclk    0        0        0   199875000
       mout_cmgp_usi0                0        0        0   399750000
          dout_cmgp_usi0             0        0        0   199875000
             gout_cmgp_usi0_ipclk    0        0        0   199875000
<<<<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

[1] https://lkml.org/lkml/2021/10/22/979

Sam Protsenko (2):
  dt-bindings: clock: samsung: Document Exynos850 CMU_CMGP
  clk: samsung: exynos850: Implement CMU_CMGP domain

 .../clock/samsung,exynos850-clock.yaml        |  19 ++++
 drivers/clk/samsung/clk-exynos850.c           | 100 ++++++++++++++++++
 include/dt-bindings/clock/exynos850.h         |  17 +++
 3 files changed, 136 insertions(+)

-- 
2.30.2

