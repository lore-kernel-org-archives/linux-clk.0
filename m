Return-Path: <SRS0=FIFX=IG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDF6C433E6
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 07:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92EE565146
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 07:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhCHHRn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 02:17:43 -0500
Received: from twhmllg4.macronix.com ([211.75.127.132]:51985 "EHLO
        TWHMLLG4.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbhCHHRX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Mar 2021 02:17:23 -0500
X-Greylist: delayed 1002 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Mar 2021 02:17:23 EST
Received: from TWHMLLG4.macronix.com (localhost [127.0.0.2] (may be forged))
        by TWHMLLG4.macronix.com with ESMTP id 12870ekE007405;
        Mon, 8 Mar 2021 15:00:40 +0800 (GMT-8)
        (envelope-from zhengxunli@mxic.com.tw)
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
        by TWHMLLG4.macronix.com with ESMTP id 1286xkGD005918;
        Mon, 8 Mar 2021 14:59:46 +0800 (GMT-8)
        (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
        by Forcepoint Email with ESMTP id 801AD206CE2A7AD5EB65;
        Mon,  8 Mar 2021 14:59:47 +0800 (CST)
To:     shubhrajyoti.datta@xilinx.com
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        git@xilinx.com, gregkh@linuxfoundation.org,
        linux-clk@vger.kernel.org, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
        shubhrajyoti.datta@gmail.com, juliensu@mxic.com.tw,
        slwu@mxic.com.tw
Subject: Re: [PATCH v10 5/9] staging: clocking-wizard: Add support for dynamic
 reconfiguration
MIME-Version: 1.0
X-KeepSent: 146ABDBB:F4474CC3-48258692:000D1A0C;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF146ABDBB.F4474CC3-ON48258692.000D1A0C-48258692.00266ED2@mxic.com.tw>
From:   zhengxunli@mxic.com.tw
Date:   Mon, 8 Mar 2021 14:59:47 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10 HF265|July 25, 2018) at
 2021/03/08 PM 02:59:47,
        Serialize complete at 2021/03/08 PM 02:59:47
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-MAIL: TWHMLLG4.macronix.com 1286xkGD005918
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Shubhrajyoti,

My name is Zhengxun and I am the engineer from Macronix. We are
using the platform PicoZed 7015/7030 SOM (System On Module),
which is based on Xilinx Zynq®-7000 All Programmable (AP) SoC to
verify our Flash dirver. Of course, we are also using your clock
wizard, our version seems to be v5.2, but something went wrong.

+static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long 
rate,
+ unsigned long parent_rate)
+{
+                int err;
+                u32 value;
+                unsigned long flags = 0;
+                struct clk_wzrd_divider *divider = 
to_clk_wzrd_divider(hw);
+                void __iomem *div_addr = divider->base + divider->offset;
+
+                if (divider->lock)
+                                spin_lock_irqsave(divider->lock, flags);
+                else
+                                __acquire(divider->lock);
+
+                value = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+                /* Cap the value to max */
+                min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+
+                /* Set divisor and clear phase offset */
+                writel(value, div_addr);
+                writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);

Why phase always set to zero? We want to support DTR operation in
Flash driver. Can you add a set_phase function to adjust the phase?

+                /* Check status register */
+                err = readl_poll_timeout(divider->base + 
WZRD_DR_STATUS_REG_OFFSET,
+                                                                 value, 
value & WZRD_DR_LOCK_BIT_MASK,
+ WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+                if (err)
+                                goto err_reconfig;
+
+                /* Initiate reconfiguration */
+                writel(WZRD_DR_BEGIN_DYNA_RECONF,
+                       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+                /* Check status register */
+                err = readl_poll_timeout(divider->base + 
WZRD_DR_STATUS_REG_OFFSET,
+                                                                 value, 
value & WZRD_DR_LOCK_BIT_MASK,
+ WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);

According to pg015-clk-wiz.pdf, Clocking Wizard v5.2 and later, need to 
write
0x00000007 followed by 0x00000002 into Clock Configuration Register 23, to
consolidate the redundant bits that the IP has upgraded, right?

Can you compatible to v5.2?

+err_reconfig:
+                if (divider->lock)
+                                spin_unlock_irqrestore(divider->lock, 
flags);
+                else
+                                __release(divider->lock);
+                return err;
+}

Thanks,
Zhengxun


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================

