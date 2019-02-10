Return-Path: <SRS0=QJXt=QR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4916C282C2
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 22:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 670122084D
	for <linux-clk@archiver.kernel.org>; Sun, 10 Feb 2019 22:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dfbqIpIy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfBJW03 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Feb 2019 17:26:29 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39876 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfBJW03 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Feb 2019 17:26:29 -0500
Received: by mail-wm1-f68.google.com with SMTP id f16so13359926wmh.4;
        Sun, 10 Feb 2019 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0VNVBLfeMjVI3jgvlleGnqheZI5FIaCWf24UqkIZVw=;
        b=dfbqIpIyT7tIU7DCGZ1kMLCz1tsQ64q+jSr3EMLek7FVU3QWCuV1AB9D2bj5owXDlQ
         It9AlrdsQHz9ru/4xPj7Y2XvM7n1Pfj01sVYRZuoFzyFUvm1l/dADiAiU4V8S6phoiCG
         ltGdkHNwrrXiz58RNo2P9Jip9MfeXeWxSukGvRKMjrKH0b1VBJg3HlQlPoGyZ6gBLr+Z
         YUZzIVmB8xUzR2ENWkm257rqrb3JR7t3rKBbP/Q4m2UbqpyWlXohSZKPrOWyNYIaPv3b
         83Dfi9fnNCr3ixv9nc5bfIRCEGrRDDkn/00Ur7/SPXQ7Mx0mD4iaqyma0+OnJ2+lXH7P
         NeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0VNVBLfeMjVI3jgvlleGnqheZI5FIaCWf24UqkIZVw=;
        b=f+p9itsT8ML0QMLl2LWtY9qH4P2h0GVg2eFaFjb0w8/MmSiLO/eWaNPrAEKj0JpDsk
         Z1tJusZyfbbbEzgWbdq2XGgubFyNDaJ6/e9F0NJfeq8iLSi/et8af/qEv7IB7QoEZfpi
         G2/amEJsnwv1ATghes48fGZ4nV2zgQPoqJ2bIkRes1wgirKWCIsOfIxwaPV4KpMXjM9M
         3in4G+1In2ymapPbgWyITmUyoMgOgOKYHUrz+D+xmbODkDJrmyTDm4OA1KkAlCppVS0l
         6L8pknisPO4VBxF3BeFKSgJr2VFNVPnG28cgzU8WdeQ/mOhKPkXR82gmLoxC3jQdO8rH
         J0Gw==
X-Gm-Message-State: AHQUAuYHXJ9sqvnBfyBrZtPNT+z2vF3U9iEQLuie9UTxtm277UrlVjQP
        NPziwbhkORCQlj4bbipJ2Y8Ijub+
X-Google-Smtp-Source: AHgI3IYUeFOpVMeqnkBbllGykDGA8NKIZkt1iXsShS9GP0FIqAjNz+WXawdELDgMkFsvmecslMPFqw==
X-Received: by 2002:a1c:9dcf:: with SMTP id g198mr6573118wme.116.1549837586256;
        Sun, 10 Feb 2019 14:26:26 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD70B4600C064670D88EA61CD.dip0.t-ipconnect.de. [2003:dc:d70b:4600:c064:670d:88ea:61cd])
        by smtp.googlemail.com with ESMTPSA id b14sm15523330wrx.36.2019.02.10.14.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Feb 2019 14:26:25 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     jbrunet@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        mark.rutland@arm.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RESEND PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
Date:   Sun, 10 Feb 2019 23:26:01 +0100
Message-Id: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It turns out that I'm not good at spelling "APB". Unfortunately an ABP
(instead of APB) typo snug into two clocks in v5.0.

Currently there are no users of that clock yet, so fix it now
before it's too late (meaning before it's used by <something>).

I decided to go the "normal" route where we can have separate
branches for the dt-bindings and the drivers in the clk-meson
repo. This means:
- new (typo-free) clock #define
- change the clock controller to use the new #define
- (next development cycle) drop the old #define

resend - changes since v2 at [1]:
- include the device-tree maintainers / mailing list

Changes since v1 at [0]:
- split into a dt-bindings and clock controller driver patch


[0] https://patchwork.kernel.org/cover/10742001/
[1] https://patchwork.kernel.org/cover/10772199/


Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: add APB clock definition
  clk: meson: meson8b: fix the naming of the APB clocks

 drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
 drivers/clk/meson/meson8b.h              |  2 +-
 include/dt-bindings/clock/meson8b-clkc.h |  1 +
 3 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.20.1

