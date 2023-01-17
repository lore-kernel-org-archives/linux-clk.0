Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722FFC63797
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 15:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjAQPbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 10:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjAQPbl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 10:31:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943573FF3A
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 07:31:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E6EAB815AA
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 15:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96049C433EF;
        Tue, 17 Jan 2023 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673969497;
        bh=imNKKvwGeYTi0VT9EZz6STGB+vhoK/hp+MR3BmdMQ0U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pL9Kn8Uwpd23mILxS8ZOzB3+S9YBeYxPgPrfYNC0GErzM6P6uKBa6aOCdBvxAuBbT
         qEVPaWJzHQTCyrsiGTebKsraOjgmSTXEXN6HlYNiLkVlwHCekA4gXJeRHfW6TrCPmy
         MkteqrW0AqjYPy+918AusRw71w4CfE0cQuy0t39uWjJ9Pxy4g3KIGxQT+sFrwDV+Fy
         5YxCdzgD9gqKou9gHC/mVo1/dUTviV+yGtbHRk0xRMojYwF45qZKQquDpqHL8YulA5
         6rLmKERx7if2XpqO4M7g6gHXcsrC4vvNaIDuz3TAxxxl/ypddkFtW1btyThVN/Lexl
         i2Ss98VJCeGLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y8apdBlLDcqydGcG@kili>
References: <Y8apdBlLDcqydGcG@kili>
Subject: Re: [bug report] net: macb: convert to phylink
From:   Antoine Tenart <atenart@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Dan Carpenter <error27@gmail.com>
Date:   Tue, 17 Jan 2023 16:31:29 +0100
Message-ID: <167396948997.3401.13412978788541812942@kwain.local>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-01-17 14:58:12)
>=20
> The patch 7897b071ac3b: "net: macb: convert to phylink" from Nov 13,
> 2019, leads to the following Smatch static checker warning:

I don't think the above commit is the right one, macb_set_tx_clk wasn't
called while holding a spinlock at the time. This behaviour seemed to
have been introduced by commit 633e98a711ac ("net: macb: use resolved
link config in mac_link_up()").

>         drivers/clk/clk.c:133 clk_prepare_lock()
>         warn: sleeping in atomic context
>=20
> drivers/clk/clk.c
>     126 static void clk_prepare_lock(void)
>     127 {
>     128         if (!mutex_trylock(&prepare_lock)) {
>     129                 if (prepare_owner =3D=3D current) {
>     130                         prepare_refcnt++;
>     131                         return;
>     132                 }
> --> 133                 mutex_lock(&prepare_lock);
>     134         }
>     135         WARN_ON_ONCE(prepare_owner !=3D NULL);
>     136         WARN_ON_ONCE(prepare_refcnt !=3D 0);
>     137         prepare_owner =3D current;
>     138         prepare_refcnt =3D 1;
>     139 }
>=20
> The problem is that cadence/macb_main calls clk_set_rate() while holding
> a spinlock.
>=20
> The call tree is:
>=20
> owl_uart_set_termios() <- disables preempt
> -> owl_uart_change_baudrate()
> rda_uart_set_termios() <- disables preempt
> -> rda_uart_change_baudrate()
> atmel_set_termios() <- disables preempt
> macb_mac_link_up() <- disables preempt  (THIS ONE)
> -> macb_set_tx_clk()
>    -> clk_set_rate()
>       -> clk_prepare_lock()
>=20
> drivers/net/ethernet/cadence/macb_main.c
>    666  static void macb_mac_link_up(struct phylink_config *config,
>    667                               struct phy_device *phy,
>    668                               unsigned int mode, phy_interface_t i=
nterface,
>    669                               int speed, int duplex,
>    670                               bool tx_pause, bool rx_pause)
>    671  {
>    672          struct net_device *ndev =3D to_net_dev(config->dev);
>    673          struct macb *bp =3D netdev_priv(ndev);
>    674          struct macb_queue *queue;
>    675          unsigned long flags;
>    676          unsigned int q;
>    677          u32 ctrl;
>    678 =20
>    679          spin_lock_irqsave(&bp->lock, flags);
>                 ^^^^^^^^^^^^^^^^^
> Spin lock.
>=20
>    680 =20
>    681          ctrl =3D macb_or_gem_readl(bp, NCFGR);
>    682 =20
>    683          ctrl &=3D ~(MACB_BIT(SPD) | MACB_BIT(FD));
>    684 =20
>    685          if (speed =3D=3D SPEED_100)
>    686                  ctrl |=3D MACB_BIT(SPD);
>    687 =20
>    688          if (duplex)
>    689                  ctrl |=3D MACB_BIT(FD);
>    690 =20
>    691          if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
>    692                  ctrl &=3D ~MACB_BIT(PAE);
>    693                  if (macb_is_gem(bp)) {
>    694                          ctrl &=3D ~GEM_BIT(GBE);
>    695 =20
>    696                          if (speed =3D=3D SPEED_1000)
>    697                                  ctrl |=3D GEM_BIT(GBE);
>    698                  }
>    699 =20
>    700                  if (rx_pause)
>    701                          ctrl |=3D MACB_BIT(PAE);
>    702 =20
>    703                  macb_set_tx_clk(bp, speed);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Takes a mutex.
>=20
>    704 =20
>    705                  /* Initialize rings & buffers as clearing MACB_BI=
T(TE) in link down
>    706                   * cleared the pipeline and control registers.
>    707                   */
>    708                  bp->macbgem_ops.mog_init_rings(bp);
>    709                  macb_init_buffers(bp);
>=20
> regards,
> dan carpenter
>
