Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837D4C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 528EE218A5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 15:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wHR4ItWv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbfC2Pdf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:33:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35973 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbfC2Pdf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 11:33:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id y13so3134156wrd.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2019 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCCYZzG5Ka9N2oZ7rttqC09lmztU1e5JZDTYPl18vOw=;
        b=wHR4ItWvESwCW43C9tWHsCFK9V6gu0YOKGckKb8Z3kMeIzkIKTjGuaVv2UIN9aeWzi
         BpjE9VSIjvr5S/K88iK204/7ecIOs6SIiy1t8Tq0i28axpXU+0d/OoBOPVMBNlMV9mvi
         5oB2mYCOffwIo8OBvkEdGVWTlapFH2E7meQy67KN6h38K9NodTEGdnisT+vvKtTFTbCH
         LTZhaunBkQKxO3hr8jBcsTlnygJc8T2DU9DHmz9uPhTpmnd1iQWvZlE8SNBf04m+Tf7M
         2XANNRuO7EbQyMu8FB1x2wPTije34hacTNsJqS1lbVBY/Zi/AMqkxKyrcFFQ1wCCRziQ
         7WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vCCYZzG5Ka9N2oZ7rttqC09lmztU1e5JZDTYPl18vOw=;
        b=rkPbzUlgV/64DoJ+HL4E/9aap8mwUe5skSC6zR0GZwofBo0e4kfvu9eMGujh495Eaz
         4MdWttTmtD9QIpBSVtlhwn0DV/EyD4+wIbWjp1imDm5i0ckW9ttJxPOLC7X1bz48JGC7
         x+epOmsi5AU50O5SO1aUPimbYRf3VZrcONiVOE+SPaa7socmQHIFXIYYP34cXDNJ/ZFx
         Vky3+DU8j55pP8xsM3w5WpaPTubqqEw9F3Tg8+djvMXIDhsPZ5Hd6x0WKBpktg6G466a
         p2d6wRM5lpCV9cXfifsOhFZ+BC2VvKc8i+pUpfwecAJiQVo0X7bxXz9kX20TFug7XsMZ
         bqkg==
X-Gm-Message-State: APjAAAUrFFQNM4IpxBPgkVd+6RBbP51SIXDGpSESp6FLTfw6FcOIZoY6
        hE0qeXavq9/Nipz/0hx4KYsAIA==
X-Google-Smtp-Source: APXvYqxdSf6XsxRRtkdzz5tcSjr7T+I/B+Cef6fa3PvYVwpHHlB36/NXAlsVCkRMNBlvfnX0EP8NvQ==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr14632674wrs.155.1553873613265;
        Fri, 29 Mar 2019 08:33:33 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 08:33:32 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: fix mpll jitter
Date:   Fri, 29 Mar 2019 16:33:22 +0100
Message-Id: <20190329153325.23869-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As reported on this [0] mpll series, We are observing a lot of jitter
on the MPLL outputs of the g12a. No such jitter is seen on gx family.
On the axg family, only MPLL2 seems affected.

The jitter can be as high as +/- 4%.

This is a problem for audio application. This may cause distortion on
i2s and completely break SPDIF.

After exchanging with Amlogic, it seems he have activated (by mistake)
the 'spread spectrum' feature.

This patchset properly set the bit responsible for the spread spectrum
in the mpll driver and add the required correction in the related clock
controllers.

Jerome Brunet (3):
  clk: meson: mpll: properly handle spread spectrum
  clk: meson: gxbb: no spread spectrum on mpll0
  clk: meson: axg: spread spectrum is on mpll2

 drivers/clk/meson/axg.c      | 10 +++++-----
 drivers/clk/meson/clk-mpll.c |  9 ++++++---
 drivers/clk/meson/clk-mpll.h |  1 +
 drivers/clk/meson/gxbb.c     |  5 -----
 4 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.20.1

