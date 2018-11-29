Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C84BC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07CCB206B6
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 12:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CCB206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbeK2XqO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 18:46:14 -0500
Received: from smtp3-g21.free.fr ([212.27.42.3]:43898 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727402AbeK2XqO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Nov 2018 18:46:14 -0500
Received: from [192.168.108.68] (unknown [213.36.7.13])
        (Authenticated sender: marc.w.gonzalez)
        by smtp3-g21.free.fr (Postfix) with ESMTPSA id AF40213F8B1;
        Thu, 29 Nov 2018 13:40:42 +0100 (CET)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Clock init issues on apq8098
To:     MSM <linux-arm-msm@vger.kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>
Message-ID: <f4271471-b60a-f056-b453-1cfa593a0fc4@free.fr>
Date:   Thu, 29 Nov 2018 13:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

kernel: v4.20-rc4
DTB: qcom/msm8998-mtp
defconfig: platform defconfig minus lots of stuff to make kernel smaller

When I boot v4.20-rc4 on my APQ8098-based board, the clk driver prints
the following warnings. (Because they are not powered up yet?)

[    1.817128] ------------[ cut here ]------------
[    1.820756] gcc_ufs_rx_symbol_1_clk status stuck at 'on'
[    1.820789] WARNING: CPU: 3 PID: 1 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x190/0x1b0
[    1.830753] Modules linked in:
[    1.839852] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G S                4.20.0-rc4 #13
[    1.842728] Hardware name: Qualcomm Technologies, Inc. MSM8998 v1 MTP (DT)
[    1.850625] pstate: 60000085 (nZCv daIf -PAN -UAO)
[    1.857302] pc : clk_branch_toggle+0x190/0x1b0
[    1.862074] lr : clk_branch_toggle+0x190/0x1b0
[    1.866500] sp : ffff00000807bcf0
[    1.870923] x29: ffff00000807bcf0 x28: 0000000000000008 
[    1.874316] x27: ffff0000089ba070 x26: ffff000008946490 
[    1.879697] x25: ffff0000088c26e0 x24: 0000000000000000 
[    1.884992] x23: ffff000009137480 x22: ffff000008412120 
[    1.890287] x21: 0000000000000000 x20: 0000000000000000 
[    1.895583] x19: ffff0000090e9000 x18: ffffffffffffffff 
[    1.900878] x17: 0000000000000000 x16: 0000000000000000 
[    1.906173] x15: ffff0000090e9648 x14: ffff000089191187 
[    1.911468] x13: ffff000009191195 x12: ffff0000090fb000 
[    1.916763] x11: ffff00000807bcf0 x10: ffff00000807bcf0 
[    1.922058] x9 : ffff00000807bcf0 x8 : 207461206b637574 
[    1.927353] x7 : 7320737574617473 x6 : ffff000009190c8c 
[    1.932648] x5 : 0000000000000000 x4 : 0000000000000000 
[    1.937944] x3 : ffffffffffffffff x2 : 00008000f5260000 
[    1.943241] x1 : e0dbf26541ede800 x0 : 0000000000000000 
[    1.948535] Call trace:
[    1.953822]  clk_branch_toggle+0x190/0x1b0
[    1.955998]  clk_branch2_disable+0x18/0x20
[    1.960167]  clk_disable_unused_subtree+0xc4/0xe0
[    1.964246]  clk_disable_unused+0x3c/0x130
[    1.969020]  do_one_initcall+0x5c/0x180
[    1.973015]  kernel_init_freeable+0x198/0x244
[    1.976748]  kernel_init+0x10/0x110
[    1.981255]  ret_from_fork+0x10/0x20
[    1.984555] ---[ end trace 04df2db406d24e2c ]---


[    1.988702] ------------[ cut here ]------------
[    1.992977] gcc_ufs_rx_symbol_0_clk status stuck at 'on'
[    1.992997] WARNING: CPU: 3 PID: 1 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x190/0x1b0
[    2.002888] Modules linked in:
[    2.011983] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G S      W         4.20.0-rc4 #13
[    2.014862] Hardware name: Qualcomm Technologies, Inc. MSM8998 v1 MTP (DT)
[    2.022760] pstate: 60000085 (nZCv daIf -PAN -UAO)
[    2.029436] pc : clk_branch_toggle+0x190/0x1b0
[    2.034211] lr : clk_branch_toggle+0x190/0x1b0
[    2.038636] sp : ffff00000807bcf0
[    2.043059] x29: ffff00000807bcf0 x28: 0000000000000008 
[    2.046452] x27: ffff0000089ba070 x26: ffff000008946490 
[    2.051833] x25: ffff0000088c2710 x24: 0000000000000000 
[    2.057128] x23: ffff0000091374e8 x22: ffff000008412120 
[    2.062423] x21: 0000000000000000 x20: 0000000000000000 
[    2.067718] x19: ffff0000090e9000 x18: ffffffffffffffff 
[    2.073013] x17: 0000000000000000 x16: 0000000000000000 
[    2.078308] x15: ffff0000090e9648 x14: ffff000089191187 
[    2.083603] x13: ffff000009191195 x12: ffff0000090fb000 
[    2.088899] x11: ffff00000807bcf0 x10: ffff00000807bcf0 
[    2.094194] x9 : ffff00000807bcf0 x8 : 207461206b637574 
[    2.099489] x7 : 7320737574617473 x6 : ffff000009190c8c 
[    2.104786] x5 : 0000000000000000 x4 : 0000000000000000 
[    2.110079] x3 : ffffffffffffffff x2 : 00008000f5260000 
[    2.115375] x1 : e0dbf26541ede800 x0 : 0000000000000000 
[    2.120670] Call trace:
[    2.125957]  clk_branch_toggle+0x190/0x1b0
[    2.128134]  clk_branch2_disable+0x18/0x20
[    2.132298]  clk_disable_unused_subtree+0xc4/0xe0
[    2.136382]  clk_disable_unused+0x3c/0x130
[    2.141153]  do_one_initcall+0x5c/0x180
[    2.145146]  kernel_init_freeable+0x198/0x244
[    2.148882]  kernel_init+0x10/0x110
[    2.153390]  ret_from_fork+0x10/0x20
[    2.156689] ---[ end trace 04df2db406d24e2d ]---


[    2.160880] ------------[ cut here ]------------
[    2.165113] gcc_gpu_bimc_gfx_clk status stuck at 'on'
[    2.165131] WARNING: CPU: 3 PID: 1 at drivers/clk/qcom/clk-branch.c:92 clk_branch_toggle+0x190/0x1b0
[    2.174674] Modules linked in:
[    2.183859] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G S      W         4.20.0-rc4 #13
[    2.186737] Hardware name: Qualcomm Technologies, Inc. MSM8998 v1 MTP (DT)
[    2.194635] pstate: 60000085 (nZCv daIf -PAN -UAO)
[    2.201311] pc : clk_branch_toggle+0x190/0x1b0
[    2.206084] lr : clk_branch_toggle+0x190/0x1b0
[    2.210511] sp : ffff00000807bcf0
[    2.214935] x29: ffff00000807bcf0 x28: 0000000000000008 
[    2.218327] x27: ffff0000089ba070 x26: ffff000008946490 
[    2.223708] x25: ffff0000088c2d68 x24: 0000000000000000 
[    2.229003] x23: ffff000009138368 x22: ffff000008412120 
[    2.234298] x21: 0000000000000000 x20: 0000000000000000 
[    2.239594] x19: ffff0000090e9000 x18: ffffffffffffffff 
[    2.244889] x17: 0000000000000000 x16: 0000000000000000 
[    2.250184] x15: ffff0000090e9648 x14: ffff000089191187 
[    2.255479] x13: ffff000009191195 x12: ffff0000090fb000 
[    2.260774] x11: ffff00000807bcf0 x10: ffff00000807bcf0 
[    2.266069] x9 : ffff00000807bcf0 x8 : 6e6f27207461206b 
[    2.271364] x7 : 6375747320737574 x6 : ffff000009190c89 
[    2.276659] x5 : 0000000000000000 x4 : 0000000000000000 
[    2.281954] x3 : ffffffffffffffff x2 : 00008000f5260000 
[    2.287249] x1 : e0dbf26541ede800 x0 : 0000000000000000 
[    2.292544] Call trace:
[    2.297831]  clk_branch_toggle+0x190/0x1b0
[    2.300008]  clk_branch2_disable+0x18/0x20
[    2.304175]  clk_disable_unused_subtree+0xc4/0xe0
[    2.308256]  clk_disable_unused+0x3c/0x130
[    2.313027]  do_one_initcall+0x5c/0x180
[    2.317020]  kernel_init_freeable+0x198/0x244
[    2.320756]  kernel_init+0x10/0x110
[    2.325266]  ret_from_fork+0x10/0x20
[    2.328564] ---[ end trace 04df2db406d24e2e ]---



Another (totally unrelated) warning is:
CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR0_EL1. Boot CPU: 0x00000000001122, CPU4: 0x00000000101122
Is that bad, doctor?

Regards.
