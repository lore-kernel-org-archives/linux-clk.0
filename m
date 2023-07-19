Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01473C0015E
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 23:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGSXLk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 19:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjGSXLj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 19:11:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257141FCD
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 16:11:38 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6687466137bso113748b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689808297; x=1692400297;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9tMql7XKYHsJ3mfohDhQ+PtbCN9HeiT6gesIInUPYY=;
        b=ZIT3Lhvr91D4xOUv2uHrQoo+tETKzhnPaZzXvwI3PVLu1uRgtAJjiqfwNoYCto584J
         KCwYCUbQHJSL8a95tuM84xiDE/eJog0VntL5r/7NZk3+WTeLX1o55mQaHb5olhwchgfB
         3WX+6w8LIHCXLk0pKcka92AmblzmydEN4Pi6ieKWCwqspDXn9afdQzeVlXHBP4VctPXo
         P3jSJGEGOmwv5JOwHRkawv6qzkPumFigia02AH7WUXw0ZwEGPbny5gugOhqq2Vw6OeHA
         3nKOR+Lc99WdOUtUT8vYdnUfDR+UIhNUEVzCYuJSBZGiBx7UW3MoYAgqnfkNXPxNJML1
         yTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689808297; x=1692400297;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9tMql7XKYHsJ3mfohDhQ+PtbCN9HeiT6gesIInUPYY=;
        b=Pmhovd+iHRtegqMWSH1PNjecO3hu6IcWokhU5u+4QeRPLztFaPUxAUNJ8gParTrPJR
         mjd2ZsbDG05+FavXkl3sq54+ZrTDG13THGOQPSv2WYyrLopQ1PlQmvOpUDOJkWisIoeC
         rwYWDoiGLIL6l+FYht+D+3aVOBYTboRQUVKMTw5z8gD1beh827NPHTKLt+FrkrNFivAt
         SPluV8olkNexPN+K7wXFalSNS2WYl3rrWhAtgcFz7QkoPSCAZVTbQZDOy2Sisrqa6hYc
         bsveEhQwKXAYUS87Bn44Uf27G315iJwDI45sE88R1FEStQH7murujkeXeCa3m91sRvIC
         XM1w==
X-Gm-Message-State: ABy/qLY81qAiOx/j2uw7wYxy5ArXk4YbpqLqho5aLINLSuQQ5Hyl6CbN
        Cc0VpszRuQ/Lr1ZXwNYD+vM6PHdlZso=
X-Google-Smtp-Source: APBJJlGRv4lvNeFhadBhhayzeMeaCh34ttuuwoNbfQUgqQdenPqDh1ffw808bxN06Pw3ZysSgJS0zg==
X-Received: by 2002:a05:6a00:1952:b0:62d:8376:3712 with SMTP id s18-20020a056a00195200b0062d83763712mr3807756pfk.28.1689808297415;
        Wed, 19 Jul 2023 16:11:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f24-20020aa78b18000000b006815fbe3240sm3905704pfd.11.2023.07.19.16.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 16:11:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 19 Jul 2023 16:11:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Backtraces with CONFIG_CLK_KUNIT_TEST=y+CONFIG_LOCKDEP=y
Message-ID: <2b594e50-2bbf-4a2d-88e6-49fc39f3957a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

when booting a kernel with both CONFIG_CLK_KUNIT_TEST and CONFIG_LOCKDEP
enabled, I get a lot of warning backtraces such as the following.

[   11.119313] ------------[ cut here ]------------
[   11.119797] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:708 clk_core_get_boundaries+0xdc/0xec
[   11.121064] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N 6.5.0-rc2-00046-gccff6d117d8d #1
[   11.121580] Hardware name: Generic DT based system
[   11.122046]  unwind_backtrace from show_stack+0x18/0x1c
[   11.122429]  show_stack from dump_stack_lvl+0x38/0x5c
[   11.122712]  dump_stack_lvl from __warn+0x7c/0x134
[   11.122978]  __warn from warn_slowpath_fmt+0x7c/0xbc
[   11.123247]  warn_slowpath_fmt from clk_core_get_boundaries+0xdc/0xec
[   11.123569]  clk_core_get_boundaries from clk_core_init_rate_req+0x50/0x90
[   11.123899]  clk_core_init_rate_req from clk_leaf_mux_set_rate_parent_determine_rate+0x60/0x264
[   11.124287]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
[   11.124702]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
[   11.125017]  kthread from ret_from_fork+0x14/0x3c
[   11.125345] Exception stack(0x881a5fb0 to 0x881a5ff8)
[   11.125710] 5fa0:                                     00000000 00000000 00000000 00000000
[   11.126084] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   11.126531] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.127384] irq event stamp: 1047
[   11.127717] hardirqs last  enabled at (1057): [<80166cb4>] __up_console_sem+0x68/0x88
[   11.128177] hardirqs last disabled at (1066): [<80166ca0>] __up_console_sem+0x54/0x88
[   11.128553] softirqs last  enabled at (0): [<80110cc4>] copy_process+0x810/0x216c
[   11.128941] softirqs last disabled at (0): [<00000000>] 0x0
[   11.129327] ---[ end trace 0000000000000000 ]---
[   11.129704] ------------[ cut here ]------------
[   11.129991] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1595 clk_core_round_rate_nolock+0xec/0x214
[   11.130455] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        W        N 6.5.0-rc2-00046-gccff6d117d8d #1
[   11.130891] Hardware name: Generic DT based system
[   11.131160]  unwind_backtrace from show_stack+0x18/0x1c
[   11.131446]  show_stack from dump_stack_lvl+0x38/0x5c
[   11.131721]  dump_stack_lvl from __warn+0x7c/0x134
[   11.131987]  __warn from warn_slowpath_fmt+0x7c/0xbc
[   11.132266]  warn_slowpath_fmt from clk_core_round_rate_nolock+0xec/0x214
[   11.132594]  clk_core_round_rate_nolock from clk_leaf_mux_set_rate_parent_determine_rate+0x6c/0x264
[   11.133001]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
[   11.133397]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
[   11.133699]  kthread from ret_from_fork+0x14/0x3c
[   11.133962] Exception stack(0x881a5fb0 to 0x881a5ff8)
[   11.134238] 5fa0:                                     00000000 00000000 00000000 00000000
[   11.134592] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   11.134943] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.135244] irq event stamp: 1131
[   11.135473] hardirqs last  enabled at (1141): [<80166cb4>] __up_console_sem+0x68/0x88
[   11.135828] hardirqs last disabled at (1150): [<80166ca0>] __up_console_sem+0x54/0x88
[   11.136203] softirqs last  enabled at (0): [<80110cc4>] copy_process+0x810/0x216c
[   11.137215] softirqs last disabled at (1169): [<80118fb0>] __irq_exit_rcu+0x12c/0x164
[   11.137649] ---[ end trace 0000000000000000 ]---
[   11.137993] ------------[ cut here ]------------
[   11.138279] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1467 clk_core_determine_round_nolock+0xc0/0x134
[   11.138732] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        W        N 6.5.0-rc2-00046-gccff6d117d8d #1
[   11.139164] Hardware name: Generic DT based system
[   11.139423]  unwind_backtrace from show_stack+0x18/0x1c
[   11.139703]  show_stack from dump_stack_lvl+0x38/0x5c
[   11.139996]  dump_stack_lvl from __warn+0x7c/0x134
[   11.140273]  __warn from warn_slowpath_fmt+0x7c/0xbc
[   11.140563]  warn_slowpath_fmt from clk_core_determine_round_nolock+0xc0/0x134
[   11.140909]  clk_core_determine_round_nolock from clk_leaf_mux_set_rate_parent_determine_rate+0x6c/0x264
[   11.141323]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
[   11.141758]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
[   11.142112]  kthread from ret_from_fork+0x14/0x3c
[   11.142422] Exception stack(0x881a5fb0 to 0x881a5ff8)
[   11.142696] 5fa0:                                     00000000 00000000 00000000 00000000
[   11.143061] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   11.143386] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.143674] irq event stamp: 1223
[   11.143910] hardirqs last  enabled at (1233): [<80166cb4>] __up_console_sem+0x68/0x88
[   11.144277] hardirqs last disabled at (1242): [<80166ca0>] __up_console_sem+0x54/0x88
[   11.144645] softirqs last  enabled at (1174): [<80101494>] __do_softirq+0x224/0x3b0
[   11.145053] softirqs last disabled at (1169): [<80118fb0>] __irq_exit_rcu+0x12c/0x164
[   11.145398] ---[ end trace 0000000000000000 ]---

It would be great if the problem can get fixed so I can enable
both options in my boot tests. I'd be happy to submit a patch
(or patch series) to fix it, but I have no idea what is actually
wrong. 

Guenter
