Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7423AC4332F
	for <linux-clk@archiver.kernel.org>; Sun, 13 Nov 2022 18:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiKMSHU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Nov 2022 13:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiKMSHT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Nov 2022 13:07:19 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D517DFF0
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 10:07:18 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m22so23322098eji.10
        for <linux-clk@vger.kernel.org>; Sun, 13 Nov 2022 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbv7YYKlaqSppuU1zpOZXnIyvEOv2ULOF9JVyKn6+Xw=;
        b=fxvPUTLqsIm1+J2Ts62ndnV7ICW6YwIkVpo8McvZKG7yUMkZckY7GINnpYInrjwS51
         Hboxd+hcBu1QJ24jaq7tzbm3XIIuHOwXDzh+JgVmpC4AoGL1GAeQcBF1tuYUI2+Fec7K
         9tQV4KXFHv1yQQIrF6yOG0jFJWYg9JuG5pZFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbv7YYKlaqSppuU1zpOZXnIyvEOv2ULOF9JVyKn6+Xw=;
        b=7EAbSCJu2eKh6sVfoNai+VTF2HMxMe7pGhGIp1NX9LFgKonFVdwRtjRaBAdFZdjeDO
         ozySdosKTtIAYGwUcBgHzN9zUdL9TYr5h8s0kZ3QaNBd1xo+ta9zR5Th894jBSGOSy+H
         sIjSBtB+gOAQz5jQonE3USoKaGj/wMtI2OLehoBD7dtQlgUt5xOIPGuAgAObaoDHIx9z
         vSoNAT68dMhCFnmfbAI7rkhcdfrMgELubWqV12Kdc0FDduHv/H3aKX2TuerJGXfFfpz1
         XGdDAOry7MPJN0zsA7sVVYCVkXJRCbS0auu9NlwJIqgWMlhd3S4w5dFE/1CnvlRy9wiC
         xvUw==
X-Gm-Message-State: ANoB5pnEV+rJ61L96FuZQLjTG6IfttIrBfSqpRZJry56mmDdSyVtkFwc
        JF3XE3vd1KAqYiBG6dICBVGqVA==
X-Google-Smtp-Source: AA0mqf7lu8C0kyXaO7BpjF202Z9EWjiXLW+WtZKt4PDhB3t+Rantekcub5Fy+PNuyYGHpOwi/1V5NA==
X-Received: by 2002:a17:907:1749:b0:78d:4f05:6ba7 with SMTP id lf9-20020a170907174900b0078d4f056ba7mr8110993ejc.590.1668362836684;
        Sun, 13 Nov 2022 10:07:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-40-103-33.business.telecomitalia.it. [79.40.103.33])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906118b00b007a8de84ce36sm3171058eja.206.2022.11.13.10.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 10:07:16 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/5] clk: imx8mn: miscellaneous cleanups and bug fixes
Date:   Sun, 13 Nov 2022 19:07:05 +0100
Message-Id: <20221113180710.1625410-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series has been tested on the BSH SystemMaster (SMM) S2 board.


Dario Binacchi (5):
  clk: imx8mn: rename vpu_pll to m7_alt_pll
  clk: imx: replace osc_hdmi with dummy
  clk: imx: rename video_pll1 to video_pll
  clk: imx8mn: fix imx8mn_sai2_sels clocks list
  clk: imx8mn: fix imx8mn_enet_phy_sels clocks list

 drivers/clk/imx/clk-imx8mn.c             | 116 +++++++++++------------
 include/dt-bindings/clock/imx8mn-clock.h |  16 ++--
 2 files changed, 66 insertions(+), 66 deletions(-)

-- 
2.32.0

