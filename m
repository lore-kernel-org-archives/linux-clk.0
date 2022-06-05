Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4351BC433EF
	for <linux-clk@archiver.kernel.org>; Sun,  5 Jun 2022 17:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240583AbiFERDH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236455AbiFERDH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Jun 2022 13:03:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A0D36B65
        for <linux-clk@vger.kernel.org>; Sun,  5 Jun 2022 10:03:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id s12so17655988ejx.3
        for <linux-clk@vger.kernel.org>; Sun, 05 Jun 2022 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5b25hqu/oE4geFfetpQJ/jX/t8e9orYohIiTzR/6iw=;
        b=VxlXBXJjqQHn1Fbpgcto9a0Mxhp6Yn8ZBIuuBEInS/ODX1BE5qJbw97CjE6yI3osnA
         frIQSMZ0qRiVr4xaEBoTPbGkhHhO3JbcVMiBMD4SfPxKxhTDc5Q7k4GJ7aVB/bYwtGrR
         rqsCP8mZIYjT55X0Ip37pPgpsSK0ZIq1zv8WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5b25hqu/oE4geFfetpQJ/jX/t8e9orYohIiTzR/6iw=;
        b=0Ygjpr5YEKDzO+rtlJ4fjWbsk29Nw2r6FrTMuKEgb6Eq9GNNUjeiyNKlRLPvln8yK6
         b8Lg/yzBY0ii1BWyWWT1umPF7xzZi03614gdAi/OrC0csxesP4XY0vmoTA0bqReNLxzG
         iKWlB74DHECMwHJu/SVAluKCVs3M4VBkGeUKnfRqSn3g5H9XEHQArQjR9Y5utNA9IrEw
         CBFBRKdYzpUXNLavZa8kqi7GlI3BZXBcwVmbMu7JXjxHg0LNQ4l7LtYPIKGW3PSkjv5i
         YfHGd52XVvLQ1pfw/OSJivPOOTxM6WZ0DBPm7MSc4quiwAkS/qOCbkVa/AyLY/yBt04n
         3v3Q==
X-Gm-Message-State: AOAM531cuKFU8LGAWNGlV8dUPA6WSX93DWBXy666nzA/ZACAjzZ8kd3u
        h2kDLo2ziqEu7e0p1SyAOdfAPA==
X-Google-Smtp-Source: ABdhPJxQmBnXBPiPE2vOpdCYH20kp4YSwXcbJcRi5YwGvKE7otoXWpFgoCCemnx0wc86ZDPK4mTc3w==
X-Received: by 2002:a17:907:1689:b0:6fe:fcf4:128e with SMTP id hc9-20020a170907168900b006fefcf4128emr18390079ejc.446.1654448584176;
        Sun, 05 Jun 2022 10:03:04 -0700 (PDT)
Received: from localhost.localdomain (mob-83-225-9-201.net.vodafone.it. [83.225.9.201])
        by smtp.gmail.com with ESMTPSA id h22-20020aa7c616000000b0042ab2127051sm6948204edq.64.2022.06.05.10.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 10:03:03 -0700 (PDT)
From:   Michael Trimarchi <michael@amarulasolutions.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com
Subject: [RFC PATCH 0/3] Enable clk-critical to bd718x7
Date:   Sun,  5 Jun 2022 19:02:59 +0200
Message-Id: <20220605170300.1565632-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The imx8mn cpu smms2 module is clocked by the pmic that provides
clk32K. If the pmic clk driver is loaded the device can not boot. This
series try to make this configuration possible. We mark the
pmic clock as critical.

Open question:
clock-critical is not documentated as dts properties and could be
clock-critical can be changed as no-int one.
This is a follow up of [1]

[1] https://lore.kernel.org/linux-devicetree/20220604183905.1025201-1-michael@amarulasolutions.com/T/#u

Michael Trimarchi (3):
  clk: bd718x7: Clean up the code, no functional changes
  clk: bd718x7: Enable the possibility to mark the clock as critical
  arm64: dts: imx8mn-bsh-smm-s2/pro: Add pmic clock connection

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |  5 ++++
 drivers/clk/clk-bd718x7.c                     | 23 +++++++++++--------
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.25.1

