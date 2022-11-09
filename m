Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5E4C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 00:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKIA2p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Nov 2022 19:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKIA2a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Nov 2022 19:28:30 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A94361B8A
        for <linux-clk@vger.kernel.org>; Tue,  8 Nov 2022 16:28:06 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0547D81F4E;
        Wed,  9 Nov 2022 01:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667953684;
        bh=C7vAad7sXzzhq1Yeudml2f5wZKD2bPpimHurEG/z+Nw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UUCzMHRuLsy1G4svXG8F7mHEfAJUkQrhMQsKoKcuu1oK0OL9qUxEHgj8BTX7NwXXP
         hoE+sSX9l6Q+LDEMcNZ3I3gLpObSejD7B4i2+fezfs/ExpVQkZq+218Lhe656ACw+0
         i2XTk9Zxr0ztkP+O+Zdba0aD9s9u9tNw/9OidPmqCMy2OSdjYLcC9hMLHpimlBAdmb
         D6kzMy2yZ8yHT1dwSqwALJ8Lip0VykK773/XEeQto4ctVM/UYxsIVd89xkaYTtRU1f
         yvutVJm9fmctrO79Z9Z7+Umc7HNNRUPZAwUnFCVNd1hlAKf7kVF4jzN4KfAlPaRItO
         S+MoGcEYYuJnw==
Message-ID: <f4df1f39-bb63-7b7c-55d6-50c3ea9e176d@denx.de>
Date:   Wed, 9 Nov 2022 01:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] [RFC] soc: imx: imx8m-blk-ctrl: Split clock prepare from
 clock enable in the domain
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>, Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-imx@nxp.com
References: <20221024150947.10739-1-marex@denx.de>
 <Y1cs++TV2GCuh4tS@pendragon.ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y1cs++TV2GCuh4tS@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/25/22 02:25, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Mon, Oct 24, 2022 at 05:09:47PM +0200, Marek Vasut wrote:
>> It is possible for clk_disable_unused() to trigger lockdep warning
>> regarding lock ordering in this driver. This happens in case of the
>> following conditions:
>>
>> A) clock core clk_disable_unused() triggers the following sequence in a
>>     driver which also uses blkctrl domain:
>>     - clk_prepare_lock() -> obtains clock core prepare_lock
>>     - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class
>>
>> B) driver powers up a power domain and triggers the following sequence
>>     in blkctrl:
>>     - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
>>     - clk_bulk_prepare_enable() -> obtains clock core prepare_lock
>>
>> This can lead to a deadlock in case A and B runs on separate CPUs.
>>
>> To avoid the deadlock, split clk_*prepare() from clk_*enable() and
>> call the former before pm_runtime_get_sync(). This way, the blkctrl
>> driver always claims the prepare_lock before blk_ctrl_genpd_lock_class
>> and the deadlock is avoided.
> 
> I'm afraid I'm still getting occasional warnings from lockdep :-( This
> one happened at boot time:
> 
> [   17.837243]
> [   17.837254] ======================================================
> [   17.837256] WARNING: possible circular locking dependency detected
> [   17.837260] 6.1.0-rc2-00199-gd504fb27855a-dirty #301 Not tainted
> [   17.837265] ------------------------------------------------------
> [   17.837267] kworker/u8:6/152 is trying to acquire lock:
> [   17.837273] ffff000000eab6f0 (&blk_ctrl_genpd_lock_class){+.+.}-{3:3}, at: genpd_lock_mtx+0x20/0x30
> [   17.837300]
> [   17.837300] but task is already holding lock:
> [   17.837302] ffff800009c1e5e8 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x34/0xb0
> [   17.837321]
> [   17.837321] which lock already depends on the new lock.
> [   17.837321]
> [   17.837323]
> [   17.837323] the existing dependency chain (in reverse order) is:
> [   17.837326]
> [   17.837326] -> #1 (prepare_lock){+.+.}-{3:3}:
> [   17.837337]        lock_acquire+0x68/0x90
> [   17.837345]        __mutex_lock+0x8c/0x420
> [   17.837354]        mutex_lock_nested+0x34/0x40
> [   17.837360]        clk_prepare_lock+0x54/0xb0
> [   17.837367]        clk_unprepare+0x2c/0x50
> [   17.837373]        clk_bulk_unprepare+0x44/0x60
> [   17.837380]        imx8mp_blk_ctrl_power_off+0xb4/0x100
> [   17.837386]        _genpd_power_off+0x9c/0x180
> [   17.837392]        genpd_power_off.part.0.isra.0+0x130/0x2a0
> [   17.837399]        genpd_power_off_work_fn+0x6c/0x90
> [   17.837405]        process_one_work+0x294/0x6b0
> [   17.837412]        worker_thread+0x7c/0x450
> [   17.837416]        kthread+0x114/0x120
> [   17.837424]        ret_from_fork+0x10/0x20
> [   17.837431]
> [   17.837431] -> #0 (&blk_ctrl_genpd_lock_class){+.+.}-{3:3}:
> [   17.837442]        __lock_acquire+0x1148/0x1910
> [   17.837448]        lock_acquire.part.0+0xec/0x260
> [   17.837454]        lock_acquire+0x68/0x90
> [   17.837459]        __mutex_lock+0x8c/0x420
> [   17.837466]        mutex_lock_nested+0x34/0x40
> [   17.837472]        genpd_lock_mtx+0x20/0x30
> [   17.837478]        genpd_runtime_resume+0xfc/0x2e0
> [   17.837484]        __rpm_callback+0x50/0x1b0
> [   17.837492]        rpm_callback+0x74/0x80
> [   17.837499]        rpm_resume+0x434/0x6e0
> [   17.837505]        __pm_runtime_resume+0x54/0xa0
> [   17.837512]        clk_pm_runtime_get.part.0.isra.0+0x24/0xa0
> [   17.837518]        clk_core_set_rate_nolock+0xbc/0x2b0
> [   17.837524]        clk_set_rate+0x40/0xa0
> [   17.837529]        lcdif_crtc_atomic_enable+0x98/0x880 [imx_lcdif]
> [   17.837544]        drm_atomic_helper_commit_modeset_enables+0xac/0x2b0
> [   17.837551]        drm_atomic_helper_commit_tail_rpm+0x58/0xb0
> [   17.837558]        commit_tail+0xac/0x1a0
> [   17.837563]        drm_atomic_helper_commit+0x1a0/0x1c0
> [   17.837569]        drm_atomic_commit+0x94/0x130
> [   17.837574]        drm_client_modeset_commit_atomic+0x230/0x2a0
> [   17.837582]        drm_client_modeset_commit_locked+0x68/0x1d0
> [   17.837588]        drm_client_modeset_commit+0x38/0x60
> [   17.837594]        drm_fb_helper_set_par+0xd4/0x130
> [   17.837600]        fbcon_init+0x3d4/0x540
> [   17.837606]        visual_init+0xb8/0x110
> [   17.837613]        do_bind_con_driver.isra.0+0x1c8/0x3a0
> [   17.837620]        do_take_over_console+0x148/0x200
> [   17.837627]        do_fbcon_takeover+0x74/0xf0
> [   17.837632]        fbcon_fb_registered+0x18c/0x200
> [   17.837637]        register_framebuffer+0x1bc/0x2b0
> [   17.837645]        __drm_fb_helper_initial_config_and_unlock+0x338/0x5c0
> [   17.837650]        drm_fbdev_client_hotplug+0xd8/0x1c0
> [   17.837656]        drm_fbdev_generic_setup+0xbc/0x1b0
> [   17.837661]        lcdif_probe+0x2b0/0x310 [imx_lcdif]
> [   17.837672]        platform_probe+0x70/0xf0
> [   17.837678]        really_probe+0xc8/0x3e0
> [   17.837685]        __driver_probe_device+0x84/0x190
> [   17.837692]        driver_probe_device+0x44/0x120
> [   17.837699]        __device_attach_driver+0xc4/0x160
> [   17.837707]        bus_for_each_drv+0x80/0xe0
> [   17.837713]        __device_attach+0xb0/0x1f0
> [   17.837720]        device_initial_probe+0x1c/0x30
> [   17.837727]        bus_probe_device+0xa4/0xb0
> [   17.837734]        deferred_probe_work_func+0xac/0x100
> [   17.837740]        process_one_work+0x294/0x6b0
> [   17.837746]        worker_thread+0x7c/0x450
> [   17.837751]        kthread+0x114/0x120
> [   17.837758]        ret_from_fork+0x10/0x20
> [   17.837764]
> [   17.837764] other info that might help us debug this:
> [   17.837764]
> [   17.837766]  Possible unsafe locking scenario:
> [   17.837766]
> [   17.837768]        CPU0                    CPU1
> [   17.837770]        ----                    ----
> [   17.837772]   lock(prepare_lock);
> [   17.837779]                                lock(&blk_ctrl_genpd_lock_class);
> [   17.837785]                                lock(prepare_lock);
> [   17.837790]   lock(&blk_ctrl_genpd_lock_class);
> [   17.837796]
> [   17.837796]  *** DEADLOCK ***
> [   17.837796]
> [   17.837799] 11 locks held by kworker/u8:6/152:
> [   17.837803]  #0: ffff000000040938 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1fc/0x6b0
> [   17.837821]  #1: ffff80000b74bdd0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1fc/0x6b0
> [   17.837838]  #2: ffff0000003f58f8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x40/0x1f0
> [   17.837856]  #3: ffff800009c1ddc0 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x4c/0x2b0
> [   17.837875]  #4: ffff800009ae4e68 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x1f8/0x200
> [   17.837892]  #5: ffff000002f1ee78 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_set_par+0x98/0x130
> [   17.837909]  #6: ffff0000038611a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x2c/0x70
> [   17.837928]  #7: ffff000002f1ec98 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x34/0x1d0
> [   17.837947]  #8: ffff80000b74b690 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x50/0x2a0
> [   17.837964]  #9: ffff000003863138 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x48/0x130
> [   17.837984]  #10: ffff800009c1e5e8 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x34/0xb0
> [   17.838003]
> [   17.838003] stack backtrace:
> [   17.838007] CPU: 1 PID: 152 Comm: kworker/u8:6 Not tainted 6.1.0-rc2-00199-gd504fb27855a-dirty #301
> [   17.838013] Hardware name: Polyhex Debix Model A i.MX8MPlus board (DT)
> [   17.838018] Workqueue: events_unbound deferred_probe_work_func
> [   17.838029] Call trace:
> [   17.838031]  dump_backtrace+0xe4/0x140
> [   17.838042]  show_stack+0x20/0x50
> [   17.838049]  dump_stack_lvl+0x9c/0xd8
> [   17.838055]  dump_stack+0x18/0x34
> [   17.838060]  print_circular_bug+0x1f8/0x200
> [   17.838066]  check_noncircular+0x160/0x180
> [   17.838072]  __lock_acquire+0x1148/0x1910
> [   17.838078]  lock_acquire.part.0+0xec/0x260
> [   17.838084]  lock_acquire+0x68/0x90
> [   17.838089]  __mutex_lock+0x8c/0x420
> [   17.838098]  mutex_lock_nested+0x34/0x40
> [   17.838104]  genpd_lock_mtx+0x20/0x30
> [   17.838110]  genpd_runtime_resume+0xfc/0x2e0
> [   17.838117]  __rpm_callback+0x50/0x1b0
> [   17.838125]  rpm_callback+0x74/0x80
> [   17.838132]  rpm_resume+0x434/0x6e0
> [   17.838138]  __pm_runtime_resume+0x54/0xa0
> [   17.838145]  clk_pm_runtime_get.part.0.isra.0+0x24/0xa0
> [   17.838150]  clk_core_set_rate_nolock+0xbc/0x2b0
> [   17.838157]  clk_set_rate+0x40/0xa0
> [   17.838162]  lcdif_crtc_atomic_enable+0x98/0x880 [imx_lcdif]
> [   17.838175]  drm_atomic_helper_commit_modeset_enables+0xac/0x2b0
> [   17.838182]  drm_atomic_helper_commit_tail_rpm+0x58/0xb0
> [   17.838188]  commit_tail+0xac/0x1a0
> [   17.838194]  drm_atomic_helper_commit+0x1a0/0x1c0
> [   17.838200]  drm_atomic_commit+0x94/0x130
> [   17.838205]  drm_client_modeset_commit_atomic+0x230/0x2a0
> [   17.838212]  drm_client_modeset_commit_locked+0x68/0x1d0
> [   17.838218]  drm_client_modeset_commit+0x38/0x60
> [   17.838224]  drm_fb_helper_set_par+0xd4/0x130
> [   17.838230]  fbcon_init+0x3d4/0x540
> [   17.838235]  visual_init+0xb8/0x110
> [   17.838243]  do_bind_con_driver.isra.0+0x1c8/0x3a0
> [   17.838250]  do_take_over_console+0x148/0x200
> [   17.838257]  do_fbcon_takeover+0x74/0xf0
> [   17.838262]  fbcon_fb_registered+0x18c/0x200
> [   17.838268]  register_framebuffer+0x1bc/0x2b0
> [   17.838275]  __drm_fb_helper_initial_config_and_unlock+0x338/0x5c0
> [   17.838282]  drm_fbdev_client_hotplug+0xd8/0x1c0
> [   17.838288]  drm_fbdev_generic_setup+0xbc/0x1b0
> [   17.838293]  lcdif_probe+0x2b0/0x310 [imx_lcdif]
> [   17.838304]  platform_probe+0x70/0xf0
> [   17.838309]  really_probe+0xc8/0x3e0
> [   17.838316]  __driver_probe_device+0x84/0x190
> [   17.838323]  driver_probe_device+0x44/0x120
> [   17.838330]  __device_attach_driver+0xc4/0x160
> [   17.838338]  bus_for_each_drv+0x80/0xe0
> [   17.838344]  __device_attach+0xb0/0x1f0
> [   17.838351]  device_initial_probe+0x1c/0x30
> [   17.838358]  bus_probe_device+0xa4/0xb0
> [   17.838365]  deferred_probe_work_func+0xac/0x100
> [   17.838372]  process_one_work+0x294/0x6b0
> [   17.838378]  worker_thread+0x7c/0x450
> [   17.838383]  kthread+0x114/0x120
> [   17.838390]  ret_from_fork+0x10/0x20

Let's see if this works any better:

https://patchwork.kernel.org/project/linux-pm/list/?series=693012
