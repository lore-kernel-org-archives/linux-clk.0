Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm1-f44.google.com ([209.85.128.44]:53702 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeI0PQo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 11:16:44 -0400
Received: by mail-wm1-f44.google.com with SMTP id b19-v6so5053159wme.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 01:59:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
        narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, carlo@caione.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/2] Meson8b: fixes for the cpu_scale_div clock
Date: Thu, 27 Sep 2018 10:59:19 +0200
Message-Id: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

While trying to add support for the TWD timer I found that our CPU clock
calculation (when running off the "cpu_scale_div clock) is incorrect.

The main problem was the cpu_scale_div clock:
it's divider table has an off-by-one error. the old formula was:
  parent_rate / 2 * register_value
however, testing shows that the correct formula is:
  parent_rate / 2 * (register value + 1)
See the commit message of patch #1 for a complete description of the
problem and it's history.

While looking at the "cpu_scale_div" clock I also found that it's
register width was also off-by-one, so this is fixed in a separate patch
as well.

Both patches are not critical because I haven't seen a case where u-boot
uses cpu_scale_div for the CPU clock. It's only a problem when playing
with the CPU clock in u-boot (by writing registers manually) or as soon
as we support CPU frequency scaling.


Martin Blumenstingl (2):
  clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
  clk: meson: meson8b: fix the width of the cpu_scale_div clock

 drivers/clk/meson/meson8b.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.19.0
