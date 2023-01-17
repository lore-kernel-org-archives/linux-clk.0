Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BA3C678D4
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 13:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjAQN7G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 08:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjAQN6i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 08:58:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E07D14EB4
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 05:58:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id h16so30653704wrz.12
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 05:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ko9Au63T5jQD1W8bikN9mMCHcytumVvcya0Oe8Eicbg=;
        b=Kob2MhDYec2Ei3hdYCTd/Vv8zLzCzgSCWLUK3e2lGxNTiIrSgg23+DIH5gDVZNnG1S
         3gd9iXF/LoqqsHvopx9+Mv9KrHHLQi995wvmlxMpo//Vg63X6VBg5Mha3lx/DTWSAFB0
         IBQK6ETJC2Eng73cJsXu8mWMBMII7cHREyPhZQGrburhtnpUNNfDbiwaAMK9FnSWY4d3
         6YBCrMloJFthRdkUb2nYcgOwW+18NcawPhLsB+AjW+ASA4QTeA54qCjRgCw3ZA4u0oqf
         czHLS1ewpR3jZSj2LR4/wbtWb2J0h3HalAalAbeDn0WvepFt4kV/Rbi7lFiY/0iryNY3
         Lksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ko9Au63T5jQD1W8bikN9mMCHcytumVvcya0Oe8Eicbg=;
        b=KxcSZH8zNFSbTBbERiikzBdjMzs1fkP8nTeE657SLkyaf/4kMJy3qHc8GYZRfKvWh+
         fhIz6FtBxa9HLcmNOmyB2Vpdbqw0hH2YDerRVxFZnK9Np1qASu4hd8JzkI4Zhxfj0xzg
         jMmZvpVbyw7287VhnSplraaHlELDmrkq9pDonwoUzqYAMVr68bsgRHJrfai0IlFWfYQ1
         fMpOM9uC+qll704AR/WUpIRrYPguuUUgMhq+4aHQLk7Mn3ULoGv1BXZ1UO+XFZ7IQG3h
         eDxpJjME4LcP6cd4xCzqPuMRLQ9KlwggbQoRHm4L5UZgUW74Lj7qjMiGQbnE0CuJWCcb
         0RQg==
X-Gm-Message-State: AFqh2kodFiNt04rO7Qkb7vKwpGMdgSe7N6oZOiv2J2Q9ywv+OeQeRZul
        q4KI66R2iZ7yIL3oU1cF9M8=
X-Google-Smtp-Source: AMrXdXvFUkBiwSHWkje1Ft9rEwXpUqAGRGJM1be982uNGwnlP8TWQ1rN0yr+YnuZLhcH0UIimZcNyw==
X-Received: by 2002:adf:fa43:0:b0:2bd:c225:1fe8 with SMTP id y3-20020adffa43000000b002bdc2251fe8mr3249737wrr.14.1673963908732;
        Tue, 17 Jan 2023 05:58:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b002423dc3b1a9sm28398888wrm.52.2023.01.17.05.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 05:58:27 -0800 (PST)
Date:   Tue, 17 Jan 2023 16:58:12 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     atenart@kernel.org
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] net: macb: convert to phylink
Message-ID: <Y8apdBlLDcqydGcG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Antoine Tenart,

The patch 7897b071ac3b: "net: macb: convert to phylink" from Nov 13,
2019, leads to the following Smatch static checker warning:

	drivers/clk/clk.c:133 clk_prepare_lock()
	warn: sleeping in atomic context

drivers/clk/clk.c
    126 static void clk_prepare_lock(void)
    127 {
    128         if (!mutex_trylock(&prepare_lock)) {
    129                 if (prepare_owner == current) {
    130                         prepare_refcnt++;
    131                         return;
    132                 }
--> 133                 mutex_lock(&prepare_lock);
    134         }
    135         WARN_ON_ONCE(prepare_owner != NULL);
    136         WARN_ON_ONCE(prepare_refcnt != 0);
    137         prepare_owner = current;
    138         prepare_refcnt = 1;
    139 }

The problem is that cadence/macb_main calls clk_set_rate() while holding
a spinlock.

The call tree is:

owl_uart_set_termios() <- disables preempt
-> owl_uart_change_baudrate()
rda_uart_set_termios() <- disables preempt
-> rda_uart_change_baudrate()
atmel_set_termios() <- disables preempt
macb_mac_link_up() <- disables preempt  (THIS ONE)
-> macb_set_tx_clk()
   -> clk_set_rate()
      -> clk_prepare_lock()

drivers/net/ethernet/cadence/macb_main.c
   666  static void macb_mac_link_up(struct phylink_config *config,
   667                               struct phy_device *phy,
   668                               unsigned int mode, phy_interface_t interface,
   669                               int speed, int duplex,
   670                               bool tx_pause, bool rx_pause)
   671  {
   672          struct net_device *ndev = to_net_dev(config->dev);
   673          struct macb *bp = netdev_priv(ndev);
   674          struct macb_queue *queue;
   675          unsigned long flags;
   676          unsigned int q;
   677          u32 ctrl;
   678  
   679          spin_lock_irqsave(&bp->lock, flags);
                ^^^^^^^^^^^^^^^^^
Spin lock.

   680  
   681          ctrl = macb_or_gem_readl(bp, NCFGR);
   682  
   683          ctrl &= ~(MACB_BIT(SPD) | MACB_BIT(FD));
   684  
   685          if (speed == SPEED_100)
   686                  ctrl |= MACB_BIT(SPD);
   687  
   688          if (duplex)
   689                  ctrl |= MACB_BIT(FD);
   690  
   691          if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
   692                  ctrl &= ~MACB_BIT(PAE);
   693                  if (macb_is_gem(bp)) {
   694                          ctrl &= ~GEM_BIT(GBE);
   695  
   696                          if (speed == SPEED_1000)
   697                                  ctrl |= GEM_BIT(GBE);
   698                  }
   699  
   700                  if (rx_pause)
   701                          ctrl |= MACB_BIT(PAE);
   702  
   703                  macb_set_tx_clk(bp, speed);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Takes a mutex.

   704  
   705                  /* Initialize rings & buffers as clearing MACB_BIT(TE) in link down
   706                   * cleared the pipeline and control registers.
   707                   */
   708                  bp->macbgem_ops.mog_init_rings(bp);
   709                  macb_init_buffers(bp);

regards,
dan carpenter
