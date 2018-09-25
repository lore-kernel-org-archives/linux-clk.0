Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4084CC43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 13:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88C722098A
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 13:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C722098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbeIYTTF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 15:19:05 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42344 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbeIYTTF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Sep 2018 15:19:05 -0400
Received: by mail-vs1-f68.google.com with SMTP id w16-v6so4297918vso.9;
        Tue, 25 Sep 2018 06:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPurLZFu3EbxpFQw1HEk4TV4zwcavlgB/7JNOAMBOzE=;
        b=CTCCBPJLsVm27HZiiHXsgY5BBhWSlCzFVAPlPK6W0VhRw3ozvrv8UnymTaWwDGYnhD
         cTkPLeVwB4QRItLPTbbLnDVSe1F1eMEQSFE4e4x5fUg2eAkisu4HyCQYdcJ9WzV+OV/9
         CxzDEG3wno0i11hUyWu02mhPbQV3dG1wot6OgT61PhIWqOqRP2l1cX5qAW3jdp52KjS7
         VqpegP4652knsvifm+xGYg86d94UeAYgUG1bkCLygtOpc5xEM3lZxc7hUpFe1ZkEgBQI
         /yFgQD7m255ftbkRoDfTkLyx+ucJdL4ZJeC5hLjv/atbFhjtdunP6WuIOhMno3JSYwoy
         BbKg==
X-Gm-Message-State: ABuFfoheO1JCABjovvL6eOi0xvINa3LPQm2laX12afKTZw7xeD3QbmyA
        iX0OyvRvnDv7QR6Aq6TYAIzNPw7O+JuE6rGZYwM=
X-Google-Smtp-Source: ACcGV63koq98XlWcgI8/P9v2igcgVjzJPGnuOtqE3VjFRkSOwQpc5EnEMjeeAnOrAoV7zooVGby9HgrkCJxcsRL3N+M=
X-Received: by 2002:a67:3a51:: with SMTP id h78-v6mr247917vsa.63.1537881093832;
 Tue, 25 Sep 2018 06:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com> <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan> <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
 <83d6a10252e7238f326e378957f2ff70@codeaurora.org> <CAPDyKFrthH5djDN=Ves0VK4GpSVWQrerqc-JC6EAkJz4U_nGQw@mail.gmail.com>
 <20180918230023.67076.42969@harbor.lan> <CAMuHMdWdPHOhZFCnswaYoUgbDSaEAOzgN02S3vbww4QKkX69Aw@mail.gmail.com>
 <20180919180726.67076.48303@harbor.lan>
In-Reply-To: <20180919180726.67076.48303@harbor.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Sep 2018 15:11:21 +0200
Message-ID:
 <CAMuHMdU7J0dbK6cPrCoBtJQHARd9K2=x=LM-_11XEBO0my9mQA@mail.gmail.com>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, grahamr@codeaurora.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>, tdas@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        anischal@codeaurora.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        amit.kucheria@linaro.org, linux-clk-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925131121.9uQnetT6hic_HOEV3CjuvLWZvvJIBwJGaQzLg5Cw5WY@z>

Hi Mike,

On Wed, Sep 19, 2018 at 8:16 PM Michael Turquette
<mturquette@baylibre.com> wrote:
> Quoting Geert Uytterhoeven (2018-09-19 00:05:59)
> > On Wed, Sep 19, 2018 at 1:01 AM Michael Turquette
> > <mturquette@baylibre.com> wrote:
> > > Quoting Ulf Hansson (2018-08-23 06:20:11)
> > > > Anyway, in regards to control the performance state for these clock
> > > > controller devices, to me it seems like there are no other way, but
> > > > explicitly allow clock drivers to call an "OPP API" to request a
> > > > performance state. Simply, because it's the clock driver that needs
> > > > the performance state for its device. Whether the "OPP API" is the
> > > > new, dev_pm_genpd_set_performance_state() or something not even
> > > > invented yet, is another question.
> > >
> > > I completely agree, with the exception that I don't think it will be an
> > > "OPP API" but instead I hope it will be some runtime pm performance api.
> > >
> > > > My conclusion so far is, that we seems to fall back to a potential
> > > > locking problem. In regards to that, I am wondering whether that is
> > > > actually more of hypothetical problem than a real problem for your
> > > > case.
> > >
> > > For reference, this is why we allow reentrancy into the clock framework.
> > > It is common that consumer A calls clk_set_rate to set clock X to a
> > > rate, but in order for clock X to acheive that rate the clock provider
> > > might need to call clk_set_rate on another clock. We support reentrancy
> > > for this type of case.
> > >
> > > The problem described by Graham seems analogous. There are times when a
> > > performance provider itself will need to adjust it's own performance (as
> > > consumed by some other parent provider). I'm under the impression that
> > > runtime pm allows reentrancy and genpd allows for nested genpds, so
> > > hopefully this should Just Work.
> >
> > BTW, from time to time, lockdep spews out warnings about genpd/clock
> > interaction. I believe they are false positives.
>
> I'm happy to take a look at a spew if you can capture it and tell me how
> to reproduce.

Unfortunately I cannot trigger it at will.
Just saw it again (on Renesas Salvator-XS with R-Car H3 ES2.0), so here's
the spew:

    genpd_add_device: Add e6601000.crypto to always-on

    ======================================================
    WARNING: possible circular locking dependency detected
    4.19.0-rc5-arm64-renesas-03635-gf5e6b692aefccbe2 #55 Not tainted
    ------------------------------------------------------
    swapper/0/1 is trying to acquire lock:
    (____ptrval____) (prepare_lock){+.+.}, at: clk_prepare_lock+0x48/0xa8

    but task is already holding lock:
    (____ptrval____) (of_clk_mutex){+.+.}, at:
__of_clk_get_from_provider.part.23+0x3c/0x120

    which lock already depends on the new lock.


    the existing dependency chain (in reverse order) is:

    -> #5 (of_clk_mutex){+.+.}:
   __mutex_lock+0x70/0x7f8
   mutex_lock_nested+0x1c/0x28
   __of_clk_get_from_provider.part.23+0x3c/0x120
   of_clk_get_from_provider+0x20/0x30
   cpg_mssr_attach_dev+0xb0/0x1c0
   genpd_add_device.constprop.12+0x94/0x270
   __genpd_dev_pm_attach+0xb4/0x220
   genpd_dev_pm_attach+0x64/0x70
   dev_pm_domain_attach+0x1c/0x30
   platform_drv_probe+0x38/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   sh_mobile_i2c_adap_init+0x18/0x20
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    -> #4 (&genpd->mlock){+.+.}:
   __mutex_lock+0x70/0x7f8
   mutex_lock_nested+0x1c/0x28
   genpd_lock_mtx+0x14/0x20
   genpd_runtime_resume+0xbc/0x240
   __rpm_callback+0xdc/0x228
   rpm_callback+0x20/0x80
   rpm_resume+0x4e0/0x7b0
   __pm_runtime_resume+0x50/0x78
   usb_dmac_alloc_chan_resources+0x88/0xa0
   dma_chan_get+0x28/0x80
   find_candidate+0x108/0x1a8
   __dma_request_channel+0x68/0xc8
   usb_dmac_of_xlate+0x60/0x88
   of_dma_request_slave_channel+0x174/0x280
   dma_request_chan+0x38/0x1d8
   usbhsf_dma_init.isra.8+0x64/0x128
   usbhs_fifo_probe+0x70/0x148
   usbhs_probe+0x2e4/0x670
   platform_drv_probe+0x50/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   renesas_usbhs_driver_init+0x18/0x20
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    -> #3 (dma_list_mutex){+.+.}:
   __mutex_lock+0x70/0x7f8
   mutex_lock_nested+0x1c/0x28
   __dma_request_channel+0x38/0xc8
   usb_dmac_of_xlate+0x60/0x88
   of_dma_request_slave_channel+0x174/0x280
   dma_request_chan+0x38/0x1d8
   usbhsf_dma_init.isra.8+0x64/0x128
   usbhs_fifo_probe+0x70/0x148
   usbhs_probe+0x2e4/0x670
   platform_drv_probe+0x50/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   renesas_usbhs_driver_init+0x18/0x20
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    -> #2 (of_dma_lock){+.+.}:
   __mutex_lock+0x70/0x7f8
   mutex_lock_nested+0x1c/0x28
   of_dma_request_slave_channel+0x130/0x280
   dma_request_chan+0x38/0x1d8
   rcar_i2c_master_xfer+0x154/0x480
   __i2c_transfer+0x148/0x8e0
   i2c_smbus_xfer_emulated+0x158/0x5b0
   __i2c_smbus_xfer+0x17c/0x7f8
   i2c_smbus_xfer+0x64/0x98
   i2c_smbus_read_byte_data+0x40/0x70
   cs2000_bset.isra.1+0x2c/0x68
   __cs2000_set_rate.constprop.7+0x80/0x148
   cs2000_probe+0xd4/0x260
   i2c_device_probe+0x290/0x2b0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __device_attach_driver+0x90/0xd0
   bus_for_each_drv+0x64/0xc8
   __device_attach+0xd8/0x130
   device_initial_probe+0x10/0x18
   bus_probe_device+0x98/0xa0
   device_add+0x3f8/0x620
   device_register+0x1c/0x28
   i2c_new_device+0x12c/0x310
   of_i2c_register_device+0x74/0x98
   of_i2c_register_devices+0xa4/0x150
   i2c_register_adapter+0x160/0x418
   __i2c_add_numbered_adapter+0x60/0x98
   i2c_add_adapter+0xa4/0xd0
   i2c_add_numbered_adapter+0x24/0x30
   rcar_i2c_probe+0x33c/0x450
   platform_drv_probe+0x50/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   rcar_i2c_driver_init+0x18/0x20
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    -> #1 (i2c_register_adapter){+.+.}:
   rt_mutex_lock_nested+0x2c/0x48
   i2c_adapter_lock_bus+0x20/0x30
   i2c_smbus_xfer+0x44/0x98
   i2c_smbus_read_byte_data+0x40/0x70
   cs2000_recalc_rate+0x38/0x90
   clk_register+0x3b8/0x6e8
   clk_hw_register+0xc/0x20
   cs2000_probe+0x134/0x260
   i2c_device_probe+0x290/0x2b0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __device_attach_driver+0x90/0xd0
   bus_for_each_drv+0x64/0xc8
   __device_attach+0xd8/0x130
   device_initial_probe+0x10/0x18
   bus_probe_device+0x98/0xa0
   device_add+0x3f8/0x620
   device_register+0x1c/0x28
   i2c_new_device+0x12c/0x310
   of_i2c_register_device+0x74/0x98
   of_i2c_register_devices+0xa4/0x150
   i2c_register_adapter+0x160/0x418
   __i2c_add_numbered_adapter+0x60/0x98
   i2c_add_adapter+0xa4/0xd0
   i2c_add_numbered_adapter+0x24/0x30
   rcar_i2c_probe+0x33c/0x450
   platform_drv_probe+0x50/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   rcar_i2c_driver_init+0x18/0x20
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    -> #0 (prepare_lock){+.+.}:
   lock_acquire+0xc0/0x228
   __mutex_lock+0x70/0x7f8
   mutex_lock_nested+0x1c/0x28
   clk_prepare_lock+0x48/0xa8
   __clk_create_clk.part.21+0x68/0xa0
   __of_clk_get_from_provider.part.23+0xd0/0x120
   __of_clk_get_from_provider+0x10/0x20
   __of_clk_get+0x88/0xa0
   __of_clk_get_by_name+0xa4/0x130
   clk_get+0x30/0x70
   devm_clk_get+0x4c/0xa8
   ccree_probe+0xa4/0x5f8
   platform_drv_probe+0x50/0xa0
   really_probe+0x1c4/0x298
   driver_probe_device+0x58/0x100
   __driver_attach+0xdc/0xe0
   bus_for_each_dev+0x74/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x1a4/0x210
   driver_register+0x60/0x110
   __platform_driver_register+0x40/0x48
   ccree_init+0x24/0x2c
   do_one_initcall+0x180/0x36c
   kernel_init_freeable+0x470/0x518
   kernel_init+0x10/0x108
   ret_from_fork+0x10/0x1c

    other info that might help us debug this:

    Chain exists of:
      prepare_lock --> &genpd->mlock --> of_clk_mutex

     Possible unsafe locking scenario:

   CPU0                    CPU1
   ----                    ----
      lock(of_clk_mutex);
   lock(&genpd->mlock);
   lock(of_clk_mutex);
      lock(prepare_lock);

     *** DEADLOCK ***

    2 locks held by swapper/0/1:
     #0: (____ptrval____) (&dev->mutex){....}, at: __driver_attach+0x5c/0xe0
     #1: (____ptrval____) (of_clk_mutex){+.+.}, at:
__of_clk_get_from_provider.part.23+0x3c/0x120

    stack backtrace:
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.19.0-rc5-arm64-renesas-03635-gf5e6b692aefccbe2 #55
    Hardware name: Renesas Salvator-X 2nd version board based on
r8a7795 ES2.0+ (DT)
    Call trace:
     dump_backtrace+0x0/0x1c8
     show_stack+0x14/0x20
     dump_stack+0xbc/0xf4
     print_circular_bug.isra.19+0x1d4/0x2e8
     __lock_acquire+0x1804/0x1868
     lock_acquire+0xc0/0x228
     __mutex_lock+0x70/0x7f8
     mutex_lock_nested+0x1c/0x28
     clk_prepare_lock+0x48/0xa8
     __clk_create_clk.part.21+0x68/0xa0
     __of_clk_get_from_provider.part.23+0xd0/0x120
     __of_clk_get_from_provider+0x10/0x20
     __of_clk_get+0x88/0xa0
     __of_clk_get_by_name+0xa4/0x130
     clk_get+0x30/0x70
     devm_clk_get+0x4c/0xa8
     ccree_probe+0xa4/0x5f8
     platform_drv_probe+0x50/0xa0
     really_probe+0x1c4/0x298
     driver_probe_device+0x58/0x100
     __driver_attach+0xdc/0xe0
     bus_for_each_dev+0x74/0xc8
     driver_attach+0x20/0x28
     bus_add_driver+0x1a4/0x210
     driver_register+0x60/0x110
     __platform_driver_register+0x40/0x48
     ccree_init+0x24/0x2c
     do_one_initcall+0x180/0x36c
     kernel_init_freeable+0x470/0x518
     kernel_init+0x10/0x108
     ret_from_fork+0x10/0x1c

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
