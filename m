Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563BDC10F00
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27B6E20989
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKH3YWLU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfCRTkz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 15:40:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35952 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfCRTkz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Mar 2019 15:40:55 -0400
Received: by mail-wm1-f67.google.com with SMTP id h18so5695854wml.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2019 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ahIMuoESdMu5R38KiM1/7f8+T+ghV4vTUmrgse54dwM=;
        b=pKH3YWLUlw4OZuBixmTJ9AO8g9yutoaF3pjWe/mrnCF29bCAO6LUrJNVZqWFf7HS6c
         FaSOzf+HBm4diSAXXarb2tJe4oHjnQx1fuSyl8+e71GXh5gWaBG6VVSzkV9Q2gI8EfDv
         uLv2eXbfUJR1tozBQcXJVkzU3oLmAusWJ6fnNPJX8HJGtSwhseCPcuQMVyrJt3Ok2tu0
         zTzV8UmzFOUwzqg+bEujFcmUoR6cylZSkZ8t2+z/08/kYAjfcybU2dUHLX+6yrMdm3Bu
         Ql+OEiIjRN+LTn9nOcOOeaH1V4GbIeUU8rFKtK/tQj+MMsbjfbvwAdXC1s6jtpyZ7NPF
         UJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ahIMuoESdMu5R38KiM1/7f8+T+ghV4vTUmrgse54dwM=;
        b=ggb/hokWxGKRdBT7/r87/78sbogXYWOGZmb05Jpr+pAIJg9I5QXcC0s4qu8RIOWjDe
         5IaYjxvqpu5lZi8iPhCaC1CA76j8zFQGglpXq7/e4BGF73dy2BVd54hgqMPIUmIwwCAU
         8axhfcnehcYLdvwFj32ex8DovbaEYDSf02G9eC51lThhzcXyokNxtE+zUOL2W3k5uA1f
         HLXdcXZB7Axch/miZTs4AzyJBeurdLapZPt6wt1Z0CPWiBllhzBkFfZ5Y+CO30JGeZrA
         2PnIpUPfiEOXUkMEZ/8r/dFsxg+QOorR2nvNQm7dTDny1vmVwIkf7zPE3pvs+pXf4oWG
         nOaw==
X-Gm-Message-State: APjAAAWnIFyMdodUxnK7w1d3bF7Cc2svRJYGw66HFOfcn4M1jGXuHyGC
        mLmrwsJVqlAa3J4UBkb1FuEoQg==
X-Google-Smtp-Source: APXvYqwMnl6/oFPYIByWun0v1IvE8rYmnA7Af3sT1KvNyg0ca+6RXPfTxfw1x9N/MolkfPd2bYmU/w==
X-Received: by 2002:a1c:152:: with SMTP id 79mr417492wmb.152.1552938053739;
        Mon, 18 Mar 2019 12:40:53 -0700 (PDT)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id s10sm4583941wrv.56.2019.03.18.12.40.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 12:40:53 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     john.stultz@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        yuq825@gmail.com
Subject: `From c152138a8ec2bcd8faaac8db01dbb9be547fd021 Mon Sep 17 00:00:00 2001
Date:   Mon, 18 Mar 2019 19:38:45 +0000
Message-Id: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi folks,

This series adds support for the Mali450 MP4 GPU found on the
hi6220 SoC from HiSilicon. It has been tested with the out
of tree lima drm/mesa driver hosted on freedesktop.org gitlab,
and validated using Weston and kmscube.

regards,

Peter.

Peter Griffin (6):
  dt-bindings: gpu: mali-utgard: add hisilicon,hi6220-mali compatible
  dt-bindings: reset: hisilicon: Update compatible documentation
  arm64: dts: hisilicon: Add Mali-450 MP4 GPU DT entry
  reset: hi6220: Add support for AO reset controller
  dt-bindings: reset: hisilicon: Add ao reset controller
  clk: hi6220: use CLK_OF_DECLARE_DRIVER

 .../devicetree/bindings/gpu/arm,mali-utgard.txt    |  5 +++
 .../bindings/reset/hisilicon,hi6220-reset.txt      |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 38 ++++++++++++++++
 drivers/clk/hisilicon/clk-hi6220.c                 |  2 +-
 drivers/reset/hisilicon/hi6220_reset.c             | 51 +++++++++++++++++++++-
 include/dt-bindings/reset/hisi,hi6220-resets.h     |  7 +++
 6 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.7.4

