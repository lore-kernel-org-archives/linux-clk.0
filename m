Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC287C28D13
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 15:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbiHVP2f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 11:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbiHVP2S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 11:28:18 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456796431
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:30 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u5so5857602wrt.11
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+v4yKbwJErYTuQ2Ufma5DTI3KicddoMcYUAjV+10QH4=;
        b=jOVa5k+VR0xECB0FvAPknlvOs70kbJwGA0M6vShkkwU/M+ofySHJMBFDImFvCfRy43
         +porc14Ri8mjhpMzvx7NhnAN900R01op2vihQ+M0GZGwamuFkLPbvmcL4f9AoWBVy3+G
         CvVfDCVWKrZTo5LXpnv2tC7Ov19YCStZu2DVm2gw+nTI3ChqsiAoho+n80ZJQN1Kul43
         QXTkjqiQ3O7Czm8qdTQfkKBLy8TI71V5QoDWAe7k9EZrttHfOY6eoQwTY1TipUQ/Wexi
         p6+3SMepTaVRgUqL7NNfzAiF4LcN7QSGHsEqX/4QS8LOE/VGxdo/x6mdLeDb+KOZnmva
         dQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+v4yKbwJErYTuQ2Ufma5DTI3KicddoMcYUAjV+10QH4=;
        b=Y0T16clubfYVrPtpdLYHtiQ94Dq+IehT19ux+3wpmAv8i2CGujw9ooAnZDo6oTqzuW
         9ZYNt1f60RWUWMwZ2SBiDFn6HsvWHwWICndKkdgXuVu30LCNXt4+WSuXQLqXh+ZBNIKf
         hKPon4+Rbewfc8G5Q/arlWhC33wKSUTMshVKP4nvqCNPj+z1G310eSewCuNteLME8ozF
         eBwvoYCH4QOuU1X5QxDzKGoBGIzyDuQNE7uih9uhpy1gopB0NATpkpYJgc76a+W+7tKf
         1dtw6vWQJssMI/mHlhZv1W2GQVuTHSARORos5CTu3J2OKIkTH21OKHxZ3djlZvPWu1oU
         a1Dg==
X-Gm-Message-State: ACgBeo1mF8YpzadTrT+2Je8m9hvMF8f/UHiSHzrGjuNtwhOZ3a8sF2mP
        pzjGuIEp1eqG9KqFz8ga07BhZA==
X-Google-Smtp-Source: AA6agR7oEwBwW1qpYTRjGd7zeB5BXy6D1qbA9ArFwSTnG12IGsnupD9b4ZC3CKX2TbWM1fY8P9y06g==
X-Received: by 2002:a05:6000:1a8b:b0:222:cac3:769a with SMTP id f11-20020a0560001a8b00b00222cac3769amr10524573wry.120.1661182048866;
        Mon, 22 Aug 2022 08:27:28 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:28 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/4] clk: mediatek: Add mt8365 support
Date:   Mon, 22 Aug 2022 17:26:48 +0200
Message-Id: <20220822152652.3499972-1-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This series adds a clock driver for the mt8365 SoC.

Thanks for the feedback so far.

Best,
Markus

Based on https://lore.kernel.org/linux-mediatek/20220813083249.45427-1-y.oudjana@protonmail.com/

Changes in v4:
- Rebased onto v6.0-rc1
- Fixed some minor things documented in the patches.

Earlier versions:
v2 - https://lore.kernel.org/linux-mediatek/20220530214434.1012889-1-fparent@baylibre.com/
v3 - https://lore.kernel.org/linux-mediatek/20220811084433.2598575-1-msp@baylibre.com/

Fabien Parent (2):
  dt-bindings: clock: mediatek: add bindings for MT8365 SoC
  clk: mediatek: add driver for MT8365 SoC

Markus Schneider-Pargmann (2):
  clk: mediatek: Provide mtk_devm_alloc_clk_data
  clk: mediatek: Export required common code symbols

 .../bindings/clock/mediatek,mt8365-clock.yaml |   42 +
 .../clock/mediatek,mt8365-sys-clock.yaml      |   47 +
 drivers/clk/mediatek/Kconfig                  |   50 +
 drivers/clk/mediatek/Makefile                 |    7 +
 drivers/clk/mediatek/clk-mt8365-apu.c         |   55 +
 drivers/clk/mediatek/clk-mt8365-cam.c         |   57 +
 drivers/clk/mediatek/clk-mt8365-mfg.c         |   63 +
 drivers/clk/mediatek/clk-mt8365-mm.c          |  112 ++
 drivers/clk/mediatek/clk-mt8365-vdec.c        |   63 +
 drivers/clk/mediatek/clk-mt8365-venc.c        |   52 +
 drivers/clk/mediatek/clk-mt8365.c             | 1155 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |   37 +-
 drivers/clk/mediatek/clk-mtk.h                |    2 +
 .../dt-bindings/clock/mediatek,mt8365-clk.h   |  373 ++++++
 14 files changed, 2110 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8365-apu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8365-clk.h

-- 
2.37.2

