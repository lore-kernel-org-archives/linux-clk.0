Return-Path: <SRS0=UvOF=6F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501E6C54FC9
	for <linux-clk@archiver.kernel.org>; Tue, 21 Apr 2020 14:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30311206B9
	for <linux-clk@archiver.kernel.org>; Tue, 21 Apr 2020 14:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8icSWD3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgDUOX5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Apr 2020 10:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726780AbgDUOX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Apr 2020 10:23:56 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC679C061A10
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2020 07:23:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h2so3758969wmb.4
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2020 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=C8NIwCivSbybOBZnvPmTd91wz/835bpX2KyVDORkEAs=;
        b=k8icSWD3xgDKR/NxXq4CNo9Zp4AwQH+W/bgSj1aYmfnt33/wDztPmkZvRf8oSsZbCL
         dvkEePuSkEqIYf+PHMHJzqAGt3uFgMtPGokYxtQASj5jvOBgulUpWntaU3fzXyw9yrCf
         GfKFC5ifrp6AZ/odJAMg7wGojQKHnlO8B2YBsjovrx1cJfDvno4NRGQj5+ZAWCJtUOEc
         rBoI4T3NizrkzBZssD84WYOqY9dQ3JQ+aS8Ib0cehN1H/yzB8CoA8cebsuKVxSczUfUt
         y345h6NLxtmUsZHY7P/JbDf34sDkVpCimMAq52txWLM0d3QCiMjzTvphSk2UvZv2fEBa
         VTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=C8NIwCivSbybOBZnvPmTd91wz/835bpX2KyVDORkEAs=;
        b=a1ikUOyahOinAOn3xuQsDj+mlCthfI6XXbAzTNKtG5zq0MP5J0GQwGpBJtg2R5Q6Ap
         ns3ieE4Ehg9ryuJBXXxB7AJDY+VKicLuEl9mAiEYKxqmlGw6+GKvJguDsdWwCIf8plCi
         0jJbn6eN8ByfFN22xp/JJ/m3GpbkZ8LTutPkYYutIBGHtxgzxmOQ++1XpYAl/slz+8Oy
         eMCEnSEaAbj/aRN/BoK+wNynX+RDpDyUPyVjGyVNOlAfNuU7RHt60M0SDJ1uXhg5NDX2
         k0nx4G+T5gL2zNl1TTY1hXVQ1OVKmLhdBcHNoZ6IEClBF2b7RUFKZ3yz+AgG8BgCFrgg
         VSFw==
X-Gm-Message-State: AGi0Pubu6RBCirTcFFPPLmNgSqWWtS8nB1IOYJbpyD707CneGq4g2mUY
        Df4AyyDGQ9Ar+imi2ktHUxA=
X-Google-Smtp-Source: APiQypJT84J/+hspL+i+aNTR8pe4P0J039iDVfbHEb537/FXuZumuZ7eD7KOGRJg9gCsQb/Jq1CCzg==
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr5018739wmi.78.1587479034264;
        Tue, 21 Apr 2020 07:23:54 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id 185sm4178067wmc.32.2020.04.21.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 07:23:53 -0700 (PDT)
Date:   Tue, 21 Apr 2020 16:23:50 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        linux-clk@vger.kernel.org, oliver.graute@kococonnector.com
Subject: imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed with
 error -110
Message-ID: <20200421142350.GA77260@archlinux.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

I run into below clock probing issue, after upgrading from next-20200214 to
next-20200420. I use the following patches series ontop:

https://patchwork.kernel.org/patch/11143351/

Some ideas what's the reason for this behavior? or how to fix this?

Best Regards,

Oliver


Linux dmsse20 5.7.0-rc2-next-20200420-00062-gdeb4ab568a65 #29 SMP PREEMPT T=
ue Apr 21 13:30:56 UTC 2020 aarch64 GNU/Linux

------------[ cut here ]------------
[   31.817971] imx8qxp-lpcg-clk 5a4a0000.clock-controller: deferred probe t=
imeout, ignoring dependency
[   31.818035] WARNING: CPU: 0 PID: 122 at drivers/base/dd.c:270 driver_def=
erred_probe_check_state+0x44/0x68
[   31.836647] Modules linked in:
[   31.839709] CPU: 0 PID: 122 Comm: kworker/0:1 Not tainted 5.7.0-rc2-next=
-20200420-00062-gdeb4ab568a65 #29
[   31.849276] Hardware name: Advantech iMX8QM DMSSE20 (DT)
[   31.854593] Workqueue: events deferred_probe_work_func
[   31.859738] pstate: 60000005 (nZCv daif -PAN -UAO)
[   31.864532] pc : driver_deferred_probe_check_state+0x44/0x68
[   31.870198] lr : driver_deferred_probe_check_state+0x44/0x68
[   31.875859] sp : ffff8000120ebac0
[   31.879168] x29: ffff8000120ebac0 x28: ffff800011957000=20
[   31.884485] x27: 0000000000000000 x26: ffff80001006bce8=20
[   31.889792] x25: 0000000000000001 x24: ffff800011ae8d58=20
[   31.895109] x23: ffff000975ff7010 x22: fffffffffffffffe=20
[   31.900426] x21: ffff000975ec4600 x20: ffff000975ff7010=20
[   31.905742] x19: ffff000975ff7010 x18: 0000000000000010=20
[   31.911050] x17: 0000000000000000 x16: 0000000000000000=20
[   31.916367] x15: ffff000975ec4a70 x14: 6f656d6974206562=20
[   31.921684] x13: 6f72702064657272 x12: 65666564203a7265=20
[   31.927001] x11: 6c6c6f72746e6f63 x10: 2d6b636f6c632e30=20
[   31.932318] x9 : 3030306134613520 x8 : 0000000000000000=20
[   31.937634] x7 : 6f6e6769202c7475 x6 : ffff800011b5584f=20
[   31.942951] x5 : 0000000000000000 x4 : 0000000000000000=20
[   31.948268] x3 : 00000000ffffffff x2 : ffff80096d9d0000=20
[   31.953584] x1 : cda1879e3af41400 x0 : 0000000000000000=20
[   31.958904] Call trace:
[   31.961351]  driver_deferred_probe_check_state+0x44/0x68
[   31.966667]  __genpd_dev_pm_attach+0x1a4/0x1b0
[   31.971109]  genpd_dev_pm_attach+0x60/0x70
[   31.975214]  dev_pm_domain_attach+0x50/0x58
[   31.979401]  platform_drv_probe+0x3c/0xa8
[   31.983411]  really_probe+0xd8/0x320
[   31.986990]  driver_probe_device+0x58/0xf0
[   31.991093]  __device_attach_driver+0x84/0xc8
[   31.995454]  bus_for_each_drv+0x78/0xc8
[   31.999292]  __device_attach+0xe4/0x140
[   32.003131]  device_initial_probe+0x14/0x20
[   32.007310]  bus_probe_device+0x9c/0xa8
[   32.011141]  deferred_probe_work_func+0x74/0xb0
[   32.015683]  process_one_work+0x1a0/0x328
[   32.019692]  worker_thread+0x1f8/0x428
[   32.023447]  kthread+0x138/0x158
[   32.026680]  ret_from_fork+0x10/0x1c
[   32.030256] ---[ end trace 33d4174015850150 ]---
[   32.034947] imx8qxp-lpcg-clk: probe of 5a4a0000.clock-controller failed =
with error -110
[   32.046365] platform lvds_backlight@1: deferred probe pending
[   32.052154] platform 5b130000.cdns3: deferred probe pending

