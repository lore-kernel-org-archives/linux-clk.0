Return-Path: <SRS0=7G01=VW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0177FC7618B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 15:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1E062238C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 15:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vBZFUbKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388489AbfGYPII (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Jul 2019 11:08:08 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:54315 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387422AbfGYPII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jul 2019 11:08:08 -0400
Date:   Thu, 25 Jul 2019 15:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1564067284;
        bh=5/gp7z//zdyzOVZMJS/BKUb2NSsCQRWoLYLF4TrUYoA=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=vBZFUbKJnYEJxdBQvaIIMLwUBpZdbefIMFtAxSR9PM5Zuc4rxuozKh+slMMSUbOGs
         x4A+r4MgcOWVEXAZ7jInUN66Ec6tkbh2/nx+6BgFYLn9ProqVIVAESs5pEJF+G08j4
         kk5BCXdKU/Ahy6Di8+e+xALvvAXHSh8HYFT6zsyA=
To:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   "andre.nyman" <andre.nyman@protonmail.com>
Reply-To: "andre.nyman" <andre.nyman@protonmail.com>
Subject: BCM21664T: __peri_clk_init: error initializing gate for sdio1
Message-ID: <lxUuNcs7vcH8U6lqjuv3xv26OGjSurM5IzA9aYvvmJR1dzHD4WTcIL-XBv2x2zCVqyRAlQ0y2RZfI7EYYQ-O27AGPuSG2A_IbinD0-2jruA=@protonmail.com>
Feedback-ID: Q07r-2pDM3QyAoHhr1bWYxyL6DVgprX7hK7-UgeyyAR0eG22Z8qfz9xYf51y31b3KDx2LfigCrPrusVx0jR7RQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I'm working on getting the mainline kernel to work on my device
(Samsung Galaxy Trend Plus), as part of the PostmarketOS project.
The device uses the BCM21664T SoC, which is a member of the "Kona" family o=
f Broadcom SoC's.

The clocks for the peripheral devices are not getting enabled:

[    0.000000][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    0.000000][    T0] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000][    T0] random: get_random_bytes called from start_kernel+0x=
29c/0x488 with crng_init=3D0
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0358 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio1
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0364 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio3
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0360 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio4
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0358 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio1_s=
leep
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0364 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio3_s=
leep
[    0.000000][    T0] __ccu_wait_bit: master_ccu/0x0360 bit 18 was never s=
et
[    0.000000][    T0] __peri_clk_init: error initializing gate for sdio4_s=
leep
[    0.000000][    T0] Broadcom master_ccu initialization had errors

I've confirmed that the register offsets in "drivers/clk/bcm/clk-bcm21664.c=
" are correct.
But the status_bit (bit 18) isn't set, indicating that the gate is disabled=
.

Here are the clock gate register offsets from the downstream kernel:

#define KPM_CLK_MGR_REG_SDIO1_CLKGATE_OFFSET                              0=
x00000358
#define KPM_CLK_MGR_REG_SDIO1_CLKGATE_TYPE                                U=
Int32
#define KPM_CLK_MGR_REG_SDIO1_CLKGATE_RESERVED_MASK                       0=
x6FEAFFE0
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_PRIV_ACCESS_MODE_SHIFT           3=
1
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_PRIV_ACCESS_MODE_MASK            0=
x80000000
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_VOLTAGE_LEVEL_SHIFT        2=
8
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_VOLTAGE_LEVEL_MASK         0=
x10000000
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_SLEEP_STPRSTS_SHIFT        2=
0
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_SLEEP_STPRSTS_MASK         0=
x00100000
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_STPRSTS_SHIFT              1=
8
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_STPRSTS_MASK               0=
x00040000
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_STPRSTS_SHIFT          1=
6
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_STPRSTS_MASK           0=
x00010000
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_SLEEP_CLK_EN_SHIFT         4
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_SLEEP_CLK_EN_MASK          0=
x00000010
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_HW_SW_GATING_SEL_SHIFT     3
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_HW_SW_GATING_SEL_MASK      0=
x00000008
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_CLK_EN_SHIFT               2
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_CLK_EN_MASK                0=
x00000004
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_HW_SW_GATING_SEL_SHIFT 1
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_HW_SW_GATING_SEL_MASK  0=
x00000002
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_CLK_EN_SHIFT           0
#define    KPM_CLK_MGR_REG_SDIO1_CLKGATE_SDIO1_AHB_CLK_EN_MASK            0=
x00000001

