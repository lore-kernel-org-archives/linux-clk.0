Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70145CCA47B
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbiGAOvl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 10:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbiGAOvl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 10:51:41 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EB630F47
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 07:51:40 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n10so2641898plp.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkLsmDIy0AahYUW8g9Esgr6pvhc7me0usMRBZRidXhs=;
        b=ffwCwlDaoOkaH0gGVsYaT4ThDo/miD0dBxIsiG0YQ2DadoOPIzyZ+BjgxppTMHaIRb
         sojCGPgv5ZvRaEuI+Tu2VUmEDV028jJrDoaOtRAs4x9NBRjWbS4sXoVCKflouxwMCkPy
         w3haGmfWKPx0x+YQACzZQqvuGpsdQztdBcOg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkLsmDIy0AahYUW8g9Esgr6pvhc7me0usMRBZRidXhs=;
        b=ZV3uiam3QmB9DMCfOnLek4ELFGoypsc3FMiqahEt/mHr4XlN6Kkc+bmjRGq3Um3+qh
         SUDgg57RfZnZ58cqFcTItJ/pw8ZzJRRddNpdQx7H884xW4jSluZLOQZiGryCwH5jNo+4
         2DY/6O5tdX2UsHo0XxwiRxiZbaDIskU0gBgQG8W7MyNpe7BFD0NPUHzbobqrEUVx9pR3
         dE9e9aLabU0KPNso0fuTM4IcbYOqD5jlA0nPW8gzHFs2KyJoo2fOB6AvVa52QS8hC3CL
         2NRTA6KwEph9il/sdCBwNIzjjTxTmfrbeL26rGQ3scDWILkgKxYTvI2oTlr+rsudopJS
         V25w==
X-Gm-Message-State: AJIora87/G0RPk3s+ti1XsES4JTiqCaKa4Ms2eotqZXmdLbsrn2S1Cri
        /Yc0qgeApcmIskdcdkjbsJptqw==
X-Google-Smtp-Source: AGRyM1vMyAY5ZgoPt421IVDHIPT6UJZNTrC3UubKNP59oeP8S8flayelqZc1t+7PxEyZbImcTFD6Ww==
X-Received: by 2002:a17:902:d591:b0:16b:a170:8586 with SMTP id k17-20020a170902d59100b0016ba1708586mr13893903plh.91.1656687100324;
        Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: mediatek: mt8183: Simplify with mtk_clk_simple_*()
Date:   Fri,  1 Jul 2022 22:51:30 +0800
Message-Id: <20220701145133.1152387-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As part of clk driver support for MT8192, a pair of "simple"
probe/remove functions was introduced that provided boilerplate
driver functions for clk drivers that fit a simple model: they only
needed to register clock gates. Using them reduces the redundant
boilerplate code needed for each driver. Instead, only a data structure
pointing to the clock gate array and the number of clocks is needed.

This series converts all the MT8183 clock drivers that only contain
clock gates over to these wrapper functions. For instances where the
clk driver not only registers clock gates, the extra action is properly
sequenced with the wrapper functions instead of outright replacing
the probe functions. The converted drivers also get removal support.
This also reduces the overall size by nearly 600 bytes.

Patch 1 converts the MT8183 clk drivers that only do clock gate
registration.

Patch 2 converts the audio clk driver, which also populates sub-devices.

Patch 3 converts the mfgcfg (GPU wrapper) clk driver, which also needs
to enable runtime PM, as it is tied to a power domain.

Please have a look, and merge if possible.

Thanks
ChenYu


Chen-Yu Tsai (3):
  clk: mediatek: mt8183: Convert gate only drivers to mtk_clk_simple_*()
  clk: mediatek: mt8183-audio: Simplify with mtk_clk_simple_*()
  clk: mediatek: mt8183-mfgcfg: Simplify with mtk_clk_simple_*()

 drivers/clk/mediatek/clk-mt8183-audio.c   | 40 +++++++++++++++--------
 drivers/clk/mediatek/clk-mt8183-cam.c     | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-img.c     | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu0.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu1.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c  | 23 +++++++------
 drivers/clk/mediatek/clk-mt8183-vdec.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-venc.c    | 21 +++++-------
 9 files changed, 95 insertions(+), 115 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

