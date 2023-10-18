Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC45ECDB483
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 16:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjJRQS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjJRQS5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 12:18:57 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9197998;
        Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3af64a4c97eso3846608b6e.2;
        Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645935; x=1698250735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uiAac1jZIi3qZdHU8sW2jL0PSFVOdaZae73ENz4eTLc=;
        b=NjowKUqFfELCOj/n7Tv7USV+vChsccZdpWB+fCDb+hjX4ARa8RTnrbhGlftMK5G0ov
         MUd/SHvhL4LwYYhlgJX3ofVO6Sr6oGDvFcWFJvm6b7ouCrGVXHr0jjWH4hHqRdaquvIW
         q6uW+RSqGvfrnV1CfvjSZPCbaC8RyzN0sxsemeU9t4kWV5rA8tDokqgflQyMKLJpsj1k
         u4HwDm4JzETIKIDT1CUHQt8s8/0iYidhHqHifWwgliugeiug3SvyQ80nORdbK0K0zNMz
         tZ67nICXJ/xxyezMfFRTiPjvFFfs6pkWHQWDYhP976Dldzgg3frntQmmedo6ABnpm4mY
         L6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645935; x=1698250735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiAac1jZIi3qZdHU8sW2jL0PSFVOdaZae73ENz4eTLc=;
        b=ApZnd7NazuiYYPegP7h5jlYqs3n0BXJKb7ohAlGEGMQbW3vzjHOceDuLRvGg2j92s3
         sD/RL3ozNYhkS6vYisn6QWa3FLvBjZKFk/XPKWNOrzG7P29u2L9PYfJpgaq6lkfL4VMH
         G0l7PJbn6BJO5nmyzORC6EXsaXH2Kr4SnZLiInAIhJ4HMpiHpjAyPIgcPV6988qnIGrI
         juB2FYcrKTY3jaCOGxdUjZfVKQhZOVa6c6KLbN0hl/TkaviE17bIudur1/QXKVLAfISo
         A0VIJ42aRoWVqfTTFQH3HjhgfuT7dDyZHZUp8BKTMuZnl0x39Y20RH72S0oVFR+E7mxt
         sdJQ==
X-Gm-Message-State: AOJu0Yw33sDzYt2oTmPT2vLCkQYQqgxioP2KBgmsBzR17mRHxETUmaQH
        jr1ArdVOEm3QsvbjvfkmPfdjJO7Kmss=
X-Google-Smtp-Source: AGHT+IGbqKyxK8GbZ0wAIqZGZTIkMSeTM0jxfnYCf7QtFaDT8lcGzIBN50xecjZC+J4OyJ5S8XoyVw==
X-Received: by 2002:a54:4406:0:b0:3ab:8956:ada4 with SMTP id k6-20020a544406000000b003ab8956ada4mr5220353oiw.10.1697645934869;
        Wed, 18 Oct 2023 09:18:54 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:18:54 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/5] rockchip: Add Powkiddy RK2023
Date:   Wed, 18 Oct 2023 11:18:43 -0500
Message-Id: <20231018161848.346947-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023, which is extremely similar to
existing devices from Anbernic.

Chris Morgan (5):
  dt-bindings: display: panel: Update NewVision NV3051D compatibles
  drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
  clk: rockchip: rk3568: Add PLL rate for 115.2MHz
  dt-bindings: arm: rockchip: Add Powkiddy RK2023
  arm64: dts: rockchip: add Powkiddy RK2023

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../display/panel/newvision,nv3051d.yaml      |   2 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |  56 ++++--
 6 files changed, 214 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

-- 
2.34.1

