Return-Path: <SRS0=KID9=QW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AF4C43381
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 19:18:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 807C921900
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 19:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FVDzK8O8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfBOTSe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 14:18:34 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35416 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbfBOTSe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Feb 2019 14:18:34 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1FJIQbm097065;
        Fri, 15 Feb 2019 13:18:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1550258306;
        bh=BD3ZeppXGX39JsovemU/FaJt8tmEPC80zyOZa+7o16U=;
        h=To:CC:From:Subject:Date;
        b=FVDzK8O8ifzmcmaSBE19VbrFEs8mh/VsStkJCV6RgciqvgahUm+UopDAqsdcMJ9XH
         pa+lNT9SsHFjTJMk938mc0Zbo6WQunl50Wpu87xgbHghxNWk+2slELoNuNKLqolld0
         r2ixZ93j3Nn7egcafEGn+nljthL7xlrztlHRINkc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1FJIQuU092365
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Feb 2019 13:18:26 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Fri, 15
 Feb 2019 13:18:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Fri, 15 Feb 2019 13:18:24 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1FJIL9q010857;
        Fri, 15 Feb 2019 13:18:22 -0600
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: updates for v5.1
Message-ID: <64201386-3f8d-6f0b-3e4a-447a78722a41@ti.com>
Date:   Fri, 15 Feb 2019 21:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Mike,

Please pull these late TI clock driver changes towards v5.1 merge 
window. Contains one patch against hwmod core, which has been acked by 
the maintainer.

Thanks, Tero

---

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/ti-clk-for-5.1

for you to fetch changes up to 12af39cad78e9cb8172793ca5d7f369eb144578b:

   ARM: OMAP2+: hwmod: disable ick autoidling when a hwmod requires that 
(2019-02-15 16:48:11 +0200)

----------------------------------------------------------------
TI clock driver changes for v5.1 merge window.

Contains the CLK_IS_BASIC flag cleanup, getting rid of the flag
completely from TI clock driver.

Also contains the autoidle clock support series from Andreas Kemnade,
which is needed for handling the hdq clocks properly during low power
states; at least on gta04 board.

----------------------------------------------------------------
Andreas Kemnade (3):
       clk: ti: add a usecount for autoidle
       clk: ti: check clock type before doing autoidle ops
       ARM: OMAP2+: hwmod: disable ick autoidling when a hwmod requires that

Tero Kristo (4):
       clk: ti: move clk_hw_omap list handling under generic part of the 
driver
       clk: ti: add new API for checking if a provided clock is an OMAP 
clock
       clk: ti: remove usage of CLK_IS_BASIC
       clk: ti: generalize the init sequence of clk_hw_omap clocks

  arch/arm/mach-omap2/omap_hwmod.c |  16 +++++--
  drivers/clk/ti/adpll.c           |   2 +-
  drivers/clk/ti/apll.c            |   4 +-
  drivers/clk/ti/autoidle.c        | 101 
++++++++++++++++++++++++---------------
  drivers/clk/ti/clk.c             |  72 ++++++++++++++++++++++++++++
  drivers/clk/ti/clkctrl.c         |   2 +-
  drivers/clk/ti/clock.h           |   5 +-
  drivers/clk/ti/clockdomain.c     |   2 +-
  drivers/clk/ti/divider.c         |   2 +-
  drivers/clk/ti/dpll.c            |  11 ++---
  drivers/clk/ti/dpll3xxx.c        |   2 +-
  drivers/clk/ti/gate.c            |   2 +-
  drivers/clk/ti/interface.c       |   4 +-
  drivers/clk/ti/mux.c             |   2 +-
  include/linux/clk/ti.h           |   1 +
  15 files changed, 165 insertions(+), 63 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
