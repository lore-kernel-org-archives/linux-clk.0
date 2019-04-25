Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63E5C282E3
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 10:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1272217D7
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 10:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbfDYKlG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 06:41:06 -0400
Received: from mx.socionext.com ([202.248.49.38]:5354 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730396AbfDYKlG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 06:41:06 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 25 Apr 2019 19:40:55 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id F03686117D;
        Thu, 25 Apr 2019 19:40:55 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Thu, 25 Apr 2019 19:40:55 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id 7169440371;
        Thu, 25 Apr 2019 19:40:55 +0900 (JST)
Received: from M20VSDK.e01.socionext.com (unknown [10.213.118.34])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 5A3B7121BD0;
        Thu, 25 Apr 2019 19:40:55 +0900 (JST)
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Takao Orito <orito.takao@socionext.com>,
        Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
        Shinji Kanematsu <kanematsu.shinji@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v3 0/3] Add clk controller for Milbeaut M10V
Date:   Thu, 25 Apr 2019 19:40:59 +0900
Message-Id: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Here is the version 3 of Milbeaut M10V clk controller. Previous
versions are here.

v2:
 - driver [1]
 - binding [2]
v1:
 - driver [3]
 - binding [4]

[1] https://lore.kernel.org/lkml/1549628837-31574-1-git-send-email-sugaya.taichi@socionext.com/
[2] https://lore.kernel.org/lkml/1549628823-31388-1-git-send-email-sugaya.taichi@socionext.com/
[3] https://lore.kernel.org/linux-arm-kernel/1542589274-13878-8-git-send-email-sugaya.taichi@socionext.com/
[4] https://lore.kernel.org/linux-arm-kernel/1542589274-13878-7-git-send-email-sugaya.taichi@socionext.com/

changes from v2:
 - Fix commit subject.
 - Insert a line between structs.
 - Insert a line between for-loops.
 - Use readl() function instead of clk_readl().
 - Drop unused callback struct.
 - Make internal function for readability.
 - Convert the binding to yaml.

changes from v1:
 - Refine whole of clk driver.


Sugaya Taichi (3):
  dt-bindings: clock: milbeaut: add Milbeaut clock description
  clock: milbeaut: Add Milbeaut M10V clock controller
  ARM: dts: milbeaut: Add a clk node for Milbeaut M10V

 .../devicetree/bindings/clock/milbeaut-clock.yaml  |  73 +++
 arch/arm/boot/dts/milbeaut-m10v.dtsi               |   7 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-milbeaut.c                         | 663 +++++++++++++++++++++
 4 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
 create mode 100644 drivers/clk/clk-milbeaut.c

-- 
1.9.1

