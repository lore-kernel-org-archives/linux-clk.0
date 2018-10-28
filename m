Return-Path: <SRS0=wuwk=NI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA2FC6786F
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D941520870
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ufdYSmxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D941520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbeJ1Uxh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 28 Oct 2018 16:53:37 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39728 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeJ1Uxh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Oct 2018 16:53:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id y144-v6so5301217wmd.4;
        Sun, 28 Oct 2018 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZcNye7bp8Lh312QmBxfba01jhDxiJnCwrhtON7+cjw=;
        b=ufdYSmxWPjsLSDVEPTg7fWmNPgF4L6Hb9p1rxEh8UdteHsEzIJhmW0qceOlqK5eVJc
         2I9U8YfyDCjcv63kVwQCXeDT/KGZdgoYFmyOSz9HCDrwbwq1RuVThYbVOemF9DBrZKpK
         DS4c1WHSDM/zVMKLhqy9+gmb4+mJdtbCYSwAMCNI+2X8SrubCbC6IMxhQTNbOoQxdA1C
         lU/cAtKLjvVrQMwyvwNsQ2D/p80euWXLoglmu8o7TJFxaRGC4p/ewNdntHZrMb7zullQ
         GjRhDM/dAZYH5ItYgN7g+nxf29dvQsoCq9jFitr8OoTSjkCTnn9hLwYeAtzX9tQq/VDC
         19IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZcNye7bp8Lh312QmBxfba01jhDxiJnCwrhtON7+cjw=;
        b=R6ptm0kJCIZihzS8uA/ozVDbVdr1yuSBu5QrH2uwnUkwTjNJws/8tdCrGk0/ompxcr
         PpqrCH7ug5semri1Srt54OIqKzSTxBMuFdbImOx7FqhFFzH+s+unUcjH14FK1kFLJr3U
         lKNM5JaICprsub6A2Nafz5nO/gm2so6VYexZCtQoJbUSsedWj+3zdSJ9KgIIaX7vOS6Z
         FJ1KK5GitqWv/RxlbS9WgyXZx0yC5l1+5rP6oaGj6R2m5CyQXFCGGRwwCVck0iaM1Sju
         3BljaNi6OMbb+ZcsTe44ugMwhrCO+MQq6xRlMHQV4NP1Lt/d0VHlLN8M1+fP3B11gTYB
         Orzg==
X-Gm-Message-State: AGRZ1gJFnl7BGam1C9hVq1qlFkQwDLJtLlDC1phG0lxie4Wc/rsjGnKs
        NhzUxl3N5Vdhu1izosGhxRs=
X-Google-Smtp-Source: AJdET5f8fZRk6t3fPkTMnanL2aJeo6eo0JH7171CR3AeHadm2Ou4bXFwMQS8cUQ8kreu7y641WHvnw==
X-Received: by 2002:a1c:5e49:: with SMTP id s70-v6mr10580003wmb.131.1540728547786;
        Sun, 28 Oct 2018 05:09:07 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD7072200691979D1FB980407.dip0.t-ipconnect.de. [2003:dc:d707:2200:6919:79d1:fb98:407])
        by smtp.googlemail.com with ESMTPSA id 193-v6sm11699772wmj.21.2018.10.28.05.09.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Oct 2018 05:09:06 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
Date:   Sun, 28 Oct 2018 13:08:56 +0100
Message-Id: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
There is a register area called "HHI" which is used for multiple IP
blocks of the SoC:
- the system clock controller
- a few reset lines (there is a separate reset controller, these reset
  lines are not part of the other reset controller). this reset
  controller is currently implemented in the clock controller driver
- a HDMI controller
- temperature sensor calibration data (by "data" I really mean data,
  the ADC driver has four bits for the TSC data in it's own register
  space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
  is stored in the HHI register area)

The first three could be implemented with a single node (either in one
big driver, or using a MFD driver which would register function-
specific drivers).
However, the TSC data is a big problem, because the ADC has it's own
set of registers but needs to write one bit in the HHI register area.

NOTE: this series has multiple dependencies:
- the clock controller changes depend "meson8b: add the CPU_DIV16 clock
  for the ARM TWD" as well as "meson8b: register the clock controller
  early" [2]
- the dts changes depend on "fix clock controller register size on
  Meson8/Meson8b" [3]


Changes since v1 at [4]:
- added a "amlogic,meson-hhi-sysctrl" compatible to the syscon node
  (which is the parent of the clock controller) in patch #1 and #3
- added Neil's Acked-by
- rebased on top of clk-meson's meson-clk-4.20-1 tag and my other
  series "Meson8b: fixes for the cpu_scale_div clock" from [5]


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006733.html
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007890.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007900.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007897.html
[4] https://patchwork.kernel.org/cover/10539051/
[5] https://patchwork.kernel.org/cover/10617617/


Martin Blumenstingl (3):
  dt-bindings: clock: meson8b: use the registers from the HHI syscon
  clk: meson: meson8b: use the HHI syscon if available
  ARM: dts: meson: switch the clock controller to the HHI register area

 .../bindings/clock/amlogic,meson8b-clkc.txt   | 13 ++++------
 arch/arm/boot/dts/meson.dtsi                  |  7 ++++++
 arch/arm/boot/dts/meson8.dtsi                 | 15 ++++++------
 arch/arm/boot/dts/meson8b.dtsi                | 15 ++++++------
 drivers/clk/meson/meson8b.c                   | 24 ++++++++++++-------
 5 files changed, 43 insertions(+), 31 deletions(-)

-- 
2.19.1

