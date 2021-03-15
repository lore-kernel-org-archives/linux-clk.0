Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD5EC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 07:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8154764E40
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 07:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhCOHH7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 03:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhCOHHc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 03:07:32 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C3BC061762;
        Mon, 15 Mar 2021 00:07:31 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id d5so8396899iln.6;
        Mon, 15 Mar 2021 00:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=OMZlpxOALJ+FhkjgrI4Loi+DAr/PRLsQSLLeynmAtnM=;
        b=iwZqH2Y77+XZlCK9uRpPzdW/6/4INrA0nwhaKooTX3cSMmWlydoYRrhRJI+RRjryH8
         z+JhCoyNpi0c14VeHevwpMnA0RfX9Lk9ZzxYUMD3svLd5olt6SetcTpj5QBU7rTLstNn
         +gj6goImNPGHKVahQxCF1Cac9J2vzfVS2pcl6YfwKpRSbLysOCSu/nssA2ba63Kiz22P
         xJYVu5zVsBZaM+2SdeOrVypkyQCswM1q2dm343YXOrkM8kgtK5ZuVRBJdY1ORuHYi3aH
         VtP8Onw9UPtlkX8uxkJO0ZwT0U8Q0K8ZyNkPXYUp2lK8VXuZk+4ptXZs1ilN2IwyWBmQ
         RHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=OMZlpxOALJ+FhkjgrI4Loi+DAr/PRLsQSLLeynmAtnM=;
        b=Qt4iOCTpfC+Jzah6+6hcmv4p5w0zxF2cTbwUQCSycFtl0fpvhg6W18I7YgDnDekzGi
         DFgbumZ7/BNeThpMR+8Lo6UtTY4d5nQcrP9tLAFvQ36FRXkkFa5hNd0L0GVnntqiY9Pf
         Fmka/BFgXvusEqmXcGyryJuxrGyOU9Fkk3Se4mQ1Rh1/QkVlokEyiBppAW1RrE8kwAJj
         93SPEW9xOgDuZiIUhJKdHqSIYgw1C5lTT9Q5E6uWCunbh0yb0QfZ7TZFnh12ulExx7RG
         tFuINaPxShli2e7IUqKqPN+b2XIppxi6xu60FGznDlcvmQN45UfTI4dcVHJjsd3cy8ZO
         yOWQ==
X-Gm-Message-State: AOAM531GoeSvq42vlm/jgoA7uvkXByOGm0wGl1bV5J+8P6fZhTu8g1Yb
        VFGvcGcAzrq7Cy0WPdQBCwq+sX4Q901n47Tc0Wgi4yoHsl4=
X-Google-Smtp-Source: ABdhPJyr3bKTMG1gM6aPnfPIpFl9M1E+asL73SRqTWwsJY9y4+jxxTl1ypBmbtmMRmD2D4p4esMhEpaTBHIewaIcmn4=
X-Received: by 2002:a92:d2c5:: with SMTP id w5mr11041765ilg.244.1615792051376;
 Mon, 15 Mar 2021 00:07:31 -0700 (PDT)
MIME-Version: 1.0
From:   Zhengxun Li <zhengxunli.mxic@gmail.com>
Date:   Mon, 15 Mar 2021 15:07:20 +0800
Message-ID: <CACY_kjSRbgSWsfo+JTyQdqorQ+wcy8OqAtKSbJt6tL4t-AUciw@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] staging: clocking-wizard: Add support for dynamic reconfiguration
To:     shubhrajyoti.datta@xilinx.com
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        git@xilinx.com, gregkh@linuxfoundation.org,
        linux-clk@vger.kernel.org, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
        shubhrajyoti.datta@gmail.com, zhengxunli@mxic.com.tw,
        juliensu@mxic.com.tw, slwu@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

My name is Zhengxun and I am the engineer from Macronix. We are
using the platform PicoZed 7015/7030 SOM (System On Module),
which is based on Xilinx Zynq=C2=AE-7000 All Programmable (AP) SoC to
verify our Flash driver. Of course, we are also using your clock
wizard, our version seems to be v5.2, but something went wrong.

+static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate=
,
+ unsigned long parent_rate)
+{
+ int err;
+ u32 value;
+ unsigned long flags =3D 0;
+ struct clk_wzrd_divider *divider =3D to_clk_wzrd_divider(hw);
+ void __iomem *div_addr =3D divider->base + divider->offset;
+
+ if (divider->lock)
+ spin_lock_irqsave(divider->lock, flags);
+ else
+ __acquire(divider->lock);
+
+ value =3D DIV_ROUND_CLOSEST(parent_rate, rate);
+
+ /* Cap the value to max */
+ min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+
+ /* Set divisor and clear phase offset */
+ writel(value, div_addr);
+ writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);

Why phase always set to zero? We want to support DTR operation in
Flash driver. Can you add a set_phase function to adjust the phase?

+ /* Check status register */
+ err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+ value, value & WZRD_DR_LOCK_BIT_MASK,
+ WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+ if (err)
+ goto err_reconfig;
+
+ /* Initiate reconfiguration */
+ writel(WZRD_DR_BEGIN_DYNA_RECONF,
+ divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+ /* Check status register */
+ err =3D readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+ value, value & WZRD_DR_LOCK_BIT_MASK,
+ WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);

According to pg015-clk-wiz.pdf, Clocking Wizard v5.2 and later, need to wri=
te
0x00000007 followed by 0x00000002 into Clock Configuration Register 23, to
consolidate the redundant bits that the IP has upgraded, right?

Can you compatible to v5.2?

Thanks,
Zhengxun
