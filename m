Return-Path: <SRS0=Lb92=5B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BE8C0044D
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 09:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 348D820658
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 09:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGp9kG9/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgCPJFi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Mar 2020 05:05:38 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:44490 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730075AbgCPJFi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Mar 2020 05:05:38 -0400
Received: by mail-lj1-f171.google.com with SMTP id w4so2981846lji.11
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2020 02:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3IZEkb1P02o+RMjVvZ+g2Ff/CV4LmCHwPjs3lpjnGyg=;
        b=FGp9kG9/Lb2b7A6jQcLHYtoe0ryDsXt86a9Rvz+X9WtPvyLKzKPLhzhO2TXpOZ1be4
         HZKfB/qNA+Iq92ps14etOG/Ahjks+a+ig9lkQ6AEwSDAJWAwPkrCeUG6NZ52rnXSfLM6
         ydxd1LGjMIRUHUBpLJP2D1N4OBh4Uf4FX3Wce7jzEgQ3pJ1P4HXJZwEUSEzdtZiD24Ff
         pbz3CWn5t8ZYBxnQ8b2vP6G/MYPRq6EEtN2h/OoLgrzNvWSuwRUo9sG15sGQJ7ha0awo
         Uiwj+GAx6lf4xU9en8XZB3Upt5SwsGzaOC37LPrfNaXlJP74IoBlHbRrIf4LEuRVCz2E
         /pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3IZEkb1P02o+RMjVvZ+g2Ff/CV4LmCHwPjs3lpjnGyg=;
        b=tNA/TMw4r+NFREjaCviaWo6B3N5QMXSF90R1PPcEXjxCoQl/hGtkzyFn20uC0vGo1i
         44q7hZjlvVPhCYNfA2Kj0PNj5qL63vr4eemxRX/Hst9xwmGbWrHrBuspGurGKjUGCCqw
         /FiS30mjtwD5gzIh/0UiAU6wyGzT8WrYNbu0fHholV6rNnQP/Pj+WxMTM+reatfL5Wpz
         qAE+fQxOZXby9M9+7JxtO+JKTdPD4I5wAs8elqZ5yWMFKMuJ3MUoyXbl8gY3j9/Z9lS6
         V9t33gsNySUqv6I0F0TybjPyIfl7HFLVMeYRyAxj5O++uXhqcDpUkmX+CwSY1Sm4sSjL
         xYHA==
X-Gm-Message-State: ANhLgQ1C8McaYfwYv2TVH7ob972J1qAY+/DnCtYP47kLRg3uctZmo0lJ
        dDdW6jG61ov6VXuwudvYhge7arXdFkJCzE3PZUV68mL3kDbNZg==
X-Google-Smtp-Source: ADFU+vsc64AABzOLKi3OVfy0A2dT6lRWyVTfFSOWmE9FPZuSSe0jjEc95HZL4ITe/Cg/dGifKXlaFjxhlEfBPaIECsU=
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr9770351ljo.165.1584349535656;
 Mon, 16 Mar 2020 02:05:35 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 16 Mar 2020 14:35:24 +0530
Message-ID: <CA+G9fYsTV66+PYY6LqHdjLx1L3i23ubDuWYg0ABoWuLQZTyL+g@mail.gmail.com>
Subject: WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:4156 __clk_put+0xfc/0x130
To:     linux-clk@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Basil Eljuse <Basil.Eljuse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following kernel warning noticed on linux-next on arm64 juno-r2 device.

Linux version 5.6.0-rc5-next-20200316 (TuxBuild@ccdbe23f0d06) (gcc
version 9.2.1 20191130 (Debian 9.2.1-21)) #1 SMP PREEMPT Mon Mar 16
07:40:45 UTC 2020

[    0.002822] ------------[ cut here ]------------
[    0.002840] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:4156
__clk_put+0xfc/0x130
[    0.002846] Modules linked in:
[    0.002859] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.6.0-rc5-next-20200316 #1
[    0.002865] Hardware name: ARM Juno development board (r2) (DT)
[    0.002873] pstate: 20000005 (nzCv daif -PAN -UAO)
[    0.002882] pc : __clk_put+0xfc/0x130
[    0.002891] lr : clk_put+0xc/0x18
[    0.002896] sp : ffff80001003bba0
[    0.002902] x29: ffff80001003bba0 x28: 0000000000000000
[    0.002911] x27: 0000000000000000 x26: ffff800011c56000
[    0.002919] x25: ffff800011c56490 x24: 0000000000000001
[    0.002928] x23: ffff00097effdae8 x22: 0000000000000001
[    0.002936] x21: ffff000975cc8000 x20: fffffffffffffdfb
[    0.002945] x19: fffffffffffffdfb x18: 0000000000000001
[    0.002953] x17: 00000000e80423fd x16: 00000000e66966f2
[    0.002961] x15: ffffffffffffffff x14: ffffffffff000000
[    0.002970] x13: ffffffffffffffff x12: 0000000000000018
[    0.002978] x11: 0000000000000028 x10: 0101010101010101
[    0.002987] x9 : ffffffffffffffff x8 : 7f7f7f7f7f7f7f7f
[    0.002995] x7 : 6b61ff726b6b6462 x6 : 000000000080636c
[    0.003003] x5 : ffff00097eff3d30 x4 : 0000000000000000
[    0.003011] x3 : 0000000000000001 x2 : 0000000000000001
[    0.003019] x1 : 1989cb6049749c00 x0 : fffffffffffffdfb
[    0.003028] Call trace:
[    0.003037]  __clk_put+0xfc/0x130
[    0.003045]  clk_put+0xc/0x18
[    0.003057]  topology_parse_cpu_capacity+0x100/0x180
[    0.003065]  get_cpu_for_node+0x3c/0x80
[    0.003074]  parse_cluster+0x1c8/0x2dc
[    0.003082]  parse_cluster+0x84/0x2dc
[    0.003091]  init_cpu_topology+0x80/0x114
[    0.003101]  smp_prepare_cpus+0x24/0x100
[    0.003110]  kernel_init_freeable+0xbc/0x23c
[    0.003120]  kernel_init+0x10/0x100
[    0.003129]  ret_from_fork+0x10/0x18
[    0.003138] ---[ end trace 33c8be449b41381b ]---

[   33.765558] ------------[ cut here ]------------
[   33.770234] arm-smmu 2b600000.iommu: deferred probe timeout,
ignoring dependency
[   33.770269] WARNING: CPU: 1 PID: 331 at drivers/base/dd.c:270
driver_deferred_probe_check_state+0x40/0x60
[   33.787249] Modules linked in: fuse
[   33.790744] CPU: 1 PID: 331 Comm: kworker/1:2 Tainted: G        W
      5.6.0-rc5-next-20200316 #1
[   33.799892] Hardware name: ARM Juno development board (r2) (DT)
[   33.805824] Workqueue: events deferred_probe_work_func
[   33.810969] pstate: 60000005 (nZCv daif -PAN -UAO)
[   33.815765] pc : driver_deferred_probe_check_state+0x40/0x60
[   33.821429] lr : driver_deferred_probe_check_state+0x40/0x60
[   33.827092] sp : ffff80001254bac0
[   33.830404] x29: ffff80001254bac0 x28: ffff8000119f7000
[   33.835724] x27: 0000000000000000 x26: ffff800011db3ce8
[   33.841043] x25: 0000000000000001 x24: ffff800011b92228
[   33.846359] x23: ffff0009754a1410 x22: fffffffffffffffe
[   33.851676] x21: ffff0009756d0e00 x20: ffff0009754a1410
[   33.856992] x19: ffff0009754a1410 x18: 0000000000000010
[   33.862308] x17: 0000000000000000 x16: 0000000000000000
[   33.867624] x15: ffff0009756d1270 x14: 646e657065642067
[   33.872940] x13: 6e69726f6e676920 x12: 2c74756f656d6974
[   33.878259] x11: 2065626f72702064 x10: 6572726566656420
[   33.883576] x9 : 3a756d6d6f692e30 x8 : 3030303036623220
[   33.888892] x7 : 756d6d732d6d7261 x6 : ffff800011c058dc
[   33.894207] x5 : 0000000000000000 x4 : 0000000000000000
[   33.899523] x3 : 00000000ffffffff x2 : ffff80096d96d000
[   33.904839] x1 : ff65453dc5583b00 x0 : 0000000000000000
[   33.910155] Call trace:
[   33.912605]  driver_deferred_probe_check_state+0x40/0x60
[   33.917922]  __genpd_dev_pm_attach+0x1a0/0x1b0
[   33.922367]  genpd_dev_pm_attach+0x58/0x68
[   33.926466]  dev_pm_domain_attach+0x48/0x50
[   33.930656]  platform_drv_probe+0x38/0xa0
[   33.934668]  really_probe+0xd4/0x318
[   33.938243]  driver_probe_device+0x54/0xe8
[   33.942340]  __device_attach_driver+0x80/0xb8
[   33.946699]  bus_for_each_drv+0x74/0xc0
[   33.950535]  __device_attach+0xdc/0x138
[   33.954371]  device_initial_probe+0x10/0x18
[   33.958556]  bus_probe_device+0x90/0x98
[   33.962392]  deferred_probe_work_func+0x6c/0xa0
[   33.966926]  process_one_work+0x19c/0x320
[   33.970936]  worker_thread+0x1f0/0x420
[   33.974685]  kthread+0xf0/0x120
[   33.977827]  ret_from_fork+0x10/0x18
[   33.981402] ---[ end trace 33c8be449b41381d ]---

ref:
https://lkft.validation.linaro.org/scheduler/job/1291796#L642

-- 
Linaro LKFT
https://lkft.linaro.org
