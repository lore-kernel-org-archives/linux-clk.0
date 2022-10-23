Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9609EC433FE
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 23:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJWXZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 19:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJWXZe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 19:25:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B72540E3B
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 16:25:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1465471;
        Mon, 24 Oct 2022 01:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666567526;
        bh=vb5Ow5TTpm6C/XIkcn1/xtUru72wq0xJg7J8KKwQbEw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UPRIARnsIdNDFA3EHiXe+OdAdd0JMnqgmYKItEa6aG72pWeFnLBpLBJ+C+V7j1/HL
         MsDl4eks9VVli+wDEaTdxkjmVHRd9uQ3SOj8xp94oe1/3ixDJsAnigyveKpEpm7J6K
         DTZ16dCziKO2CN30lkJWrfJuT7yk44AR2hhx7aWA=
Date:   Mon, 24 Oct 2022 02:25:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>, Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH] [RFC] soc: imx: gpcv2: Split clock prepare from clock
 enable in the domain
Message-ID: <Y1XNTJXFXqNyFT0Y@pendragon.ideasonboard.com>
References: <20221023164000.555654-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221023164000.555654-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Oct 23, 2022 at 06:40:00PM +0200, Marek Vasut wrote:
> It is possible for clk_disable_unused() to trigger lockdep warning
> regarding lock ordering in this driver. This happens in case of the
> following conditions:
> 
> A) clock core clk_disable_unused() triggers the following sequence in a
>    driver which also uses GPCv2 domain:
>    - clk_prepare_lock() -> obtains clock core prepare_lock
>    - pm_runtime_get*() -> obtains &blk_ctrl_genpd_lock_class
> 
> B) driver powers up a power domain and triggers the following sequence
>    in GPCv2:
>    - pm_runtime_get_sync() -> obtains &blk_ctrl_genpd_lock_class
>    - clk_bulk_prepare_enable() -> obtains clock core prepare_lock
> 
> This can lead to a deadlock in case A and B runs on separate CPUs.
> 
> To avoid the deadlock, split clk_*prepare() from clk_*enable() and
> call the former before pm_runtime_get_sync(). This way, the GPCv2
> driver always claims the prepare_lock before blk_ctrl_genpd_lock_class
> and the deadlock is avoided.
> 
> The imx8m and imx8mp block controller drivers likely need similar fix.

Indeed, I'm getting a warning from lockdep:

[ 3019.012615] ======================================================
[ 3019.018796] WARNING: possible circular locking dependency detected
[ 3019.024978] 6.1.0-rc1-00233-gd15fae6050bd #298 Not tainted
[ 3019.030466] ------------------------------------------------------
[ 3019.036644] cam/377 is trying to acquire lock:
[ 3019.041092] ffff800009c1e5e8 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x54/0xb0
[ 3019.049131] 
[ 3019.049131] but task is already holding lock:
[ 3019.054962] ffff000000f50f90 (&blk_ctrl_genpd_lock_class){+.+.}-{3:3}, at: genpd_lock_mtx+0x20/0x30
[ 3019.064036] 
[ 3019.064036] which lock already depends on the new lock.
[ 3019.064036] 
[ 3019.072212] 
[ 3019.072212] the existing dependency chain (in reverse order) is:
[ 3019.079697] 
[ 3019.079697] -> #1 (&blk_ctrl_genpd_lock_class){+.+.}-{3:3}:
[ 3019.086759]        lock_acquire+0x68/0x90
[ 3019.090774]        __mutex_lock+0x8c/0x420
[ 3019.094878]        mutex_lock_nested+0x34/0x40
[ 3019.099330]        genpd_lock_mtx+0x20/0x30
[ 3019.103520]        genpd_runtime_resume+0xfc/0x2e0
[ 3019.108316]        __rpm_callback+0x50/0x1b0
[ 3019.112593]        rpm_callback+0x74/0x80
[ 3019.116611]        rpm_resume+0x434/0x6e0
[ 3019.120627]        __pm_runtime_resume+0x54/0xa0
[ 3019.125250]        clk_pm_runtime_get.part.0.isra.0+0x24/0xa0
[ 3019.131001]        clk_core_set_rate_nolock+0xbc/0x2b0
[ 3019.136149]        clk_set_rate+0x40/0xa0
[ 3019.140165]        lcdif_crtc_atomic_enable+0x98/0x880 [imx_lcdif]
[ 3019.146364]        drm_atomic_helper_commit_modeset_enables+0xac/0x2b0
[ 3019.152901]        drm_atomic_helper_commit_tail_rpm+0x58/0xb0
[ 3019.158743]        commit_tail+0xac/0x1a0
[ 3019.162757]        drm_atomic_helper_commit+0x1a0/0x1c0
[ 3019.167986]        drm_atomic_commit+0x94/0x130
[ 3019.172521]        drm_client_modeset_commit_atomic+0x230/0x2a0
[ 3019.178449]        drm_client_modeset_commit_locked+0x68/0x1d0
[ 3019.184290]        drm_client_modeset_commit+0x38/0x60
[ 3019.189436]        drm_fb_helper_set_par+0xd4/0x130
[ 3019.194319]        fbcon_init+0x3d4/0x540
[ 3019.198334]        visual_init+0xb8/0x110
[ 3019.202349]        do_bind_con_driver.isra.0+0x1c8/0x3a0
[ 3019.207670]        do_take_over_console+0x148/0x200
[ 3019.212557]        do_fbcon_takeover+0x74/0xf0
[ 3019.217007]        fbcon_fb_registered+0x18c/0x200
[ 3019.221803]        register_framebuffer+0x1bc/0x2b0
[ 3019.226690]        __drm_fb_helper_initial_config_and_unlock+0x338/0x5c0
[ 3019.233397]        drm_fbdev_client_hotplug+0xd8/0x1c0
[ 3019.238541]        drm_fbdev_generic_setup+0xbc/0x1b0
[ 3019.243599]        lcdif_probe+0x2b0/0x310 [imx_lcdif]
[ 3019.248751]        platform_probe+0x70/0xf0
[ 3019.252940]        really_probe+0xc8/0x3e0
[ 3019.257046]        __driver_probe_device+0x84/0x190
[ 3019.261933]        driver_probe_device+0x44/0x120
[ 3019.266646]        __device_attach_driver+0xc4/0x160
[ 3019.271618]        bus_for_each_drv+0x80/0xe0
[ 3019.275985]        __device_attach+0xb0/0x1f0
[ 3019.280348]        device_initial_probe+0x1c/0x30
[ 3019.285060]        bus_probe_device+0xa4/0xb0
[ 3019.289426]        deferred_probe_work_func+0xac/0x100
[ 3019.294575]        process_one_work+0x294/0x6b0
[ 3019.299109]        worker_thread+0x7c/0x450
[ 3019.303296]        kthread+0x114/0x120
[ 3019.307052]        ret_from_fork+0x10/0x20
[ 3019.311157] 
[ 3019.311157] -> #0 (prepare_lock){+.+.}-{3:3}:
[ 3019.317005]        __lock_acquire+0x1148/0x1910
[ 3019.321544]        lock_acquire.part.0+0xec/0x260
[ 3019.326255]        lock_acquire+0x68/0x90
[ 3019.326815] cpu cpu0: _set_opp_voltage: failed to set voltage (950000 950000 950000 mV): -110
[ 3019.330269]        __mutex_lock+0x8c/0x420
[ 3019.338821] cpu cpu0: Failed to set regulator voltages: -110
[ 3019.342883]        mutex_lock_nested+0x34/0x40
[ 3019.342894]        clk_prepare_lock+0x54/0xb0
[ 3019.342904]        clk_prepare+0x28/0x50
[ 3019.342913]        clk_bulk_prepare+0x40/0xb0
[ 3019.342922]        imx8mp_blk_ctrl_power_on+0x54/0x220
[ 3019.348599] cpufreq: __target_index: Failed to change cpu frequency: -110
[ 3019.353018]        _genpd_power_on+0x9c/0x180
[ 3019.353026]        genpd_power_on.part.0+0xac/0x1c0
[ 3019.386800]        genpd_runtime_resume+0x110/0x2e0
[ 3019.391685]        __rpm_callback+0x50/0x1b0
[ 3019.395964]        rpm_callback+0x74/0x80
[ 3019.399982]        rpm_resume+0x434/0x6e0
[ 3019.403999]        __pm_runtime_resume+0x54/0xa0
[ 3019.408626]        lcdif_crtc_atomic_enable+0xa4/0x880 [imx_lcdif]
[ 3019.414820]        drm_atomic_helper_commit_modeset_enables+0xac/0x2b0
[ 3019.421355]        drm_atomic_helper_commit_tail_rpm+0x58/0xb0
[ 3019.427195]        commit_tail+0xac/0x1a0
[ 3019.431210]        drm_atomic_helper_commit+0x1a0/0x1c0
[ 3019.436440]        drm_atomic_commit+0x94/0x130
[ 3019.440978]        drm_client_modeset_commit_atomic+0x230/0x2a0
[ 3019.446903]        drm_client_modeset_commit_locked+0x68/0x1d0
[ 3019.452746]        drm_client_modeset_commit+0x38/0x60
[ 3019.457891]        drm_fbdev_client_restore+0x80/0xe0
[ 3019.462950]        drm_client_dev_restore+0xa0/0x110
[ 3019.467920]        drm_lastclose+0x40/0xb0
[ 3019.472023]        drm_release+0x16c/0x190
[ 3019.476127]        __fput+0x78/0x260
[ 3019.479711]        ____fput+0x18/0x30
[ 3019.483378]        task_work_run+0x88/0xe0
[ 3019.487484]        do_notify_resume+0x20c/0x1430
[ 3019.492108]        el0_svc+0x120/0x130
[ 3019.495862]        el0t_64_sync_handler+0xbc/0x140
[ 3019.500658]        el0t_64_sync+0x18c/0x190
[ 3019.504847] 
[ 3019.504847] other info that might help us debug this:
[ 3019.504847] 
[ 3019.512851]  Possible unsafe locking scenario:
[ 3019.512851] 
[ 3019.518768]        CPU0                    CPU1
[ 3019.523299]        ----                    ----
[ 3019.527832]   lock(&blk_ctrl_genpd_lock_class);
[ 3019.532371]                                lock(prepare_lock);
[ 3019.538212]                                lock(&blk_ctrl_genpd_lock_class);
[ 3019.545269]   lock(prepare_lock);
[ 3019.548590] 
[ 3019.548590]  *** DEADLOCK ***
[ 3019.548590] 
[ 3019.554512] 7 locks held by cam/377:
[ 3019.558088]  #0: ffff000002f0a2f0 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_restore+0x5c/0x110
[ 3019.568034]  #1: ffff000002388a78 (&helper->lock){+.+.}-{3:3}, at: drm_fbdev_client_restore+0x78/0xe0
[ 3019.577283]  #2: ffff000002f0a1a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x2c/0x70
[ 3019.587227]  #3: ffff000002388898 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x34/0x1d0
[ 3019.598036]  #4: ffff80000aa13b00 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x50/0x2a0
[ 3019.608759]  #5: ffff000003b78138 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x48/0x130
[ 3019.617924]  #6: ffff000000f50f90 (&blk_ctrl_genpd_lock_class){+.+.}-{3:3}, at: genpd_lock_mtx+0x20/0x30
[ 3019.627427] 
[ 3019.627427] stack backtrace:
[ 3019.631788] CPU: 0 PID: 377 Comm: cam Not tainted 6.1.0-rc1-00233-gd15fae6050bd #298
[ 3019.639538] Hardware name: Polyhex Debix Model A i.MX8MPlus board (DT)
[ 3019.646068] Call trace:
[ 3019.648516]  dump_backtrace+0xe4/0x140
[ 3019.652274]  show_stack+0x20/0x50
[ 3019.655596]  dump_stack_lvl+0x9c/0xd8
[ 3019.659263]  dump_stack+0x18/0x34
[ 3019.662582]  print_circular_bug+0x1f8/0x200
[ 3019.666771]  check_noncircular+0x160/0x180
[ 3019.670876]  __lock_acquire+0x1148/0x1910
[ 3019.674891]  lock_acquire.part.0+0xec/0x260
[ 3019.679084]  lock_acquire+0x68/0x90
[ 3019.682582]  __mutex_lock+0x8c/0x420
[ 3019.686164]  mutex_lock_nested+0x34/0x40
[ 3019.690096]  clk_prepare_lock+0x54/0xb0
[ 3019.693937]  clk_prepare+0x28/0x50
[ 3019.697345]  clk_bulk_prepare+0x40/0xb0
[ 3019.701192]  imx8mp_blk_ctrl_power_on+0x54/0x220
[ 3019.705813]  _genpd_power_on+0x9c/0x180
[ 3019.709655]  genpd_power_on.part.0+0xac/0x1c0
[ 3019.714020]  genpd_runtime_resume+0x110/0x2e0
[ 3019.718383]  __rpm_callback+0x50/0x1b0
[ 3019.722140]  rpm_callback+0x74/0x80
[ 3019.725638]  rpm_resume+0x434/0x6e0
[ 3019.729133]  __pm_runtime_resume+0x54/0xa0
[ 3019.733238]  lcdif_crtc_atomic_enable+0xa4/0x880 [imx_lcdif]
[ 3019.738914]  drm_atomic_helper_commit_modeset_enables+0xac/0x2b0
[ 3019.744927]  drm_atomic_helper_commit_tail_rpm+0x58/0xb0
[ 3019.750248]  commit_tail+0xac/0x1a0
[ 3019.753744]  drm_atomic_helper_commit+0x1a0/0x1c0
[ 3019.758454]  drm_atomic_commit+0x94/0x130
[ 3019.758815] cpu cpu0: _set_opp_voltage: failed to set voltage (950000 950000 950000 mV): -110
[ 3019.762469]  drm_client_modeset_commit_atomic+0x230/0x2a0
[ 3019.771021] cpu cpu0: Failed to set regulator voltages: -110
[ 3019.776384]  drm_client_modeset_commit_locked+0x68/0x1d0
[ 3019.776395]  drm_client_modeset_commit+0x38/0x60
[ 3019.776405]  drm_fbdev_client_restore+0x80/0xe0
[ 3019.782090] cpufreq: __target_index: Failed to change cpu frequency: -110
[ 3019.787367]  drm_client_dev_restore+0xa0/0x110
[ 3019.787375]  drm_lastclose+0x40/0xb0
[ 3019.811317]  drm_release+0x16c/0x190
[ 3019.814899]  __fput+0x78/0x260
[ 3019.817961]  ____fput+0x18/0x30
[ 3019.821109]  task_work_run+0x88/0xe0
[ 3019.824689]  do_notify_resume+0x20c/0x1430
[ 3019.828795]  el0_svc+0x120/0x130
[ 3019.832030]  el0t_64_sync_handler+0xbc/0x140
[ 3019.836305]  el0t_64_sync+0x18c/0x190

As far as I can tell, I haven't encountered the same with gpcv2, but
your analysis seems correct. I'll carry this patch in my tree for a
while to test it.

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-imx@nxp.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/soc/imx/gpcv2.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
> index 88aee59730e39..ee9294ad25ba1 100644
> --- a/drivers/soc/imx/gpcv2.c
> +++ b/drivers/soc/imx/gpcv2.c
> @@ -319,10 +319,16 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
>  	u32 reg_val, pgc;
>  	int ret;
>  
> +	ret = clk_bulk_prepare(domain->num_clks, domain->clks);
> +	if (ret) {
> +		dev_err(domain->dev, "failed to prepare reset clocks\n");
> +		return ret;
> +	}
> +
>  	ret = pm_runtime_get_sync(domain->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_noidle(domain->dev);
> -		return ret;
> +		goto out_clock_unprepare;
>  	}
>  
>  	if (!IS_ERR(domain->regulator)) {
> @@ -338,7 +344,7 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
>  	reset_control_assert(domain->reset);
>  
>  	/* Enable reset clocks for all devices in the domain */
> -	ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
> +	ret = clk_bulk_enable(domain->num_clks, domain->clks);
>  	if (ret) {
>  		dev_err(domain->dev, "failed to enable reset clocks\n");
>  		goto out_regulator_disable;
> @@ -402,12 +408,14 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
>  	return 0;
>  
>  out_clk_disable:
> -	clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
> +	clk_bulk_disable(domain->num_clks, domain->clks);
>  out_regulator_disable:
>  	if (!IS_ERR(domain->regulator))
>  		regulator_disable(domain->regulator);
>  out_put_pm:
>  	pm_runtime_put(domain->dev);
> +out_clock_unprepare:
> +	clk_bulk_unprepare(domain->num_clks, domain->clks);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
