Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22397C63697
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A834924695
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GQxqifaI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgKSOii (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:38:38 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:41601 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgKSOii (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 09:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605796717; x=1637332717;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=h/vlVTfvGypR/VdCsYGzOif32nRLE4zDkZF5gMfsz58=;
  b=GQxqifaI3anWJmAgS2L0vjOejZYf9RaY11A97FWhEGVg8E7Ls+Z7vFsg
   Rcz7I8gcihI1zC3nvqF1tVcg3kdPzBGS5TS/6oCXKsbVeuxORx6Dtg7GW
   ycePMofYZfvOpZ9kS5EPxPZunL/dTAaVvvZfK5jNr577kDcySupl7xWHa
   LbiERkQhRFwHFC0mZs7nTy5gjrg9Xrs0G34fkqG3fbOPboYCYzJb7JvbL
   FddqOrptsOg2drL14JNHUtNM4D0xMNOJcUKPICgQQnH062aXuTqrXWMMi
   NdoFrYphPGAXaT3ScaVmkh4noDV8YCIj55GIIjsoEOm+9q4DwNQLGv+OF
   Q==;
IronPort-SDR: 6u6h4VuBu4pPHzN69CEMWbXqOIEx2KoaZG0R9R+nshUwNh1zQFlXeJwnF6AHWSF25TJdML4WJ+
 o7uOfoUtfL0Svjh/28KcqTZD62Zk5NLcH3SBpRSsvqa8Azjk666pfcdQWLAIyIS0KOZNBlzOKe
 wK0UBxtucgkwm5BHAnQuGeykjAFkVHBgS/bXnbLbvZdujiqpvrBEZPJgOSXFEaqeyf2kWbBsh4
 XtPdsd3dfRRzdyJ8OFuk1YLSYD85z2z+t4yNYNFAVup9NVov9O+Qi71A3yHQVT+4yMoM7WkSd7
 AhQ=
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="94237956"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Nov 2020 07:38:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 07:38:36 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 19 Nov 2020 07:38:32 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 00/11] clk: at91: adapt for dvfs
Date:   Thu, 19 Nov 2020 16:38:16 +0200
Message-ID: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

SAMA7G5 is capable of DVFS. The supported CPU clock frequencies could be
obtained from CPU PLL. The hardware block diagram for clock feeding the
CPU is as follows:

                               +--------+
                           +-->|divider1|--> CPU clock
                           |   +--------+
+--------+   +----------+  |   +--------+
|CPU PLL |-->|prescaller|--+-->|divider0|--> MCK0 clock
+--------+   +----------+      +--------+

When switching CPU clock frequencies the MCK0 is also changed by DVFS
driver to avoid its over/under clocking (depending on CPU clock frequency
requested by DVFS algorithms). Some of IPs feed by MCK0 are MCK0 glich
aware, some are not. For this MCK0 was removed from the parents list of
the IPs which are not MCK0 glitch aware (patch 7/11).

This series adapt AT91 clocks (mostly sam9x60-pll and master clock drivers)
so that runtime changes of these clocks to be allowed.

The CPU clock was registered from prescaller clock (see above diagram)
and no software control has been added for divider1 because the frequencies
supported by SAMA7G5's CPU could be directly obtained from CPU PLL +
prescaller.

On top of this series I also added a fix for sama7g5.c code (patch 1/11).
Please let me know if you would like me to send this one separtely (it
would be nice if this fix could be integrated in 5.10).

Changes were tested on SAMA5D2, SAMA5D3, SAM9X60 and SAMA7G5.

Thank you,
Claudiu Beznea

Changes in v5:
- use separate clk_ops for PLLs and master clock div, pres supporting
  run-time changes (patches 6/11, 10/11)
- use unsigned long type for f member of struct typeof(sama7g5_plls)
- document the usage of CLK_IS_CRITICAL

Changes in v4:
- added Reviewed-by, Tested-by tags forgoten in v3

Changes in v3:
- collected Reviewed-by, Tested-by tags
- add patches 4/11, 5/11, 9/11
- in patch 10/11 use CLK_SET_RATE_GATE on MCK div and MCK pres for all
  the platforms except sama7g5

Changes in v2:
- s/at91rm9200_mck_lock/at91sam9260_mck_lock in patch 7/8

Claudiu Beznea (7):
  clk: at91: sama7g5: fix compilation error
  clk: at91: clk-sam9x60-pll: allow runtime changes for pll
  clk: at91: sama7g5: remove mck0 from parent list of other clocks
  clk: at91: sama7g5: decrease lower limit for MCK0 rate
  clk: at91: sama7g5: do not allow cpu pll to go higher than 1GHz
  clk: at91: clk-master: re-factor master clock
  clk: at91: sama7g5: register cpu clock

Eugen Hristev (4):
  dt-bindings: clock: at91: add sama7g5 pll defines
  clk: at91: sama7g5: allow SYS and CPU PLLs to be exported and
    referenced in DT
  clk: at91: clk-master: add 5th divisor for mck master
  clk: at91: sama7g5: add 5th divisor for mck0 layout and
    characteristics

 drivers/clk/at91/at91rm9200.c      |  21 ++-
 drivers/clk/at91/at91sam9260.c     |  26 ++-
 drivers/clk/at91/at91sam9g45.c     |  32 +++-
 drivers/clk/at91/at91sam9n12.c     |  36 ++--
 drivers/clk/at91/at91sam9rl.c      |  23 ++-
 drivers/clk/at91/at91sam9x5.c      |  28 ++-
 drivers/clk/at91/clk-master.c      | 349 ++++++++++++++++++++++++++++++++-----
 drivers/clk/at91/clk-sam9x60-pll.c | 145 +++++++++++++--
 drivers/clk/at91/dt-compat.c       |  15 +-
 drivers/clk/at91/pmc.h             |  22 ++-
 drivers/clk/at91/sam9x60.c         |  45 +++--
 drivers/clk/at91/sama5d2.c         |  42 +++--
 drivers/clk/at91/sama5d3.c         |  38 ++--
 drivers/clk/at91/sama5d4.c         |  40 +++--
 drivers/clk/at91/sama7g5.c         | 223 ++++++++++++++++--------
 include/dt-bindings/clock/at91.h   |  11 ++
 16 files changed, 852 insertions(+), 244 deletions(-)

-- 
2.7.4

