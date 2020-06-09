Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F18DC433E4
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 00:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DFFE2072F
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 00:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhPrsjWm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730995AbgFIAIf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Jun 2020 20:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731553AbgFIAIc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Jun 2020 20:08:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1357BC08C5C2
        for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2020 17:08:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so7294661plo.7
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2020 17:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5v5ZkJHiVxc0CCV+m7EWgZgucSL1mD5JdfSNb89gnyg=;
        b=dhPrsjWmeNrQF4t/k1BX+jYnpI0fVV/qfhwP8dUG8xfeFPDM42ZOfkFGa4dusvGpL+
         +PUPss1/UaE/6Son2Jbf9lC3ZdaVeDd8V5JeFHyJkgWUhPuSY5eS/Bo9vVBgwpYo1d/u
         6a7sCzmfSPC8l7MCCYnqquJ4G0DacaVXplXNM1oqQ9GivJz7AfB06M0JFqCUPpsPAACV
         TZi6mvN8G5Zd8QLcRm891jKKSOEribu8w3GOh56H5avodLDqbsY9yErpZjbZHaK+VRP/
         JyZ0UGhNfyiU/l9H6E364ENYJ8po/YjiXL1NC9kuOaWoVbwGBe+Nfm/q1U0HS5+8FhN/
         ySDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5v5ZkJHiVxc0CCV+m7EWgZgucSL1mD5JdfSNb89gnyg=;
        b=aE++GhEkWAAHkX2Xx3uSgg2C9zuFKapG17gDOqIrqotNMy0uqid5eFETXcvHQ5JlKu
         oqCA+SyT20b+wOA0gVIwXs4+BVNqBmsPls182fpQHH180viN/aCDFE1RbiPQ/zINM5QC
         Apitw82qKkdkL2DedcYtKLGCnXdWqCVBOWhV62ebwYs2kEJcQqjcsvsDg2KMBRJtzOPd
         cUUc8jtkPClTpgii9K0LsK7en/ckwKN53uugE4mBBEzYhWtCIQhLJ9YdoXZBNVgkHZQ4
         nRWmhcd8gTxDJkygf8LS9YBNu/yJ9k7zIXScu4sTNG1XuFdTTLAiP36r4eAGqJA4Wwce
         NgCw==
X-Gm-Message-State: AOAM532exKqlT/InpTor5gyY1KIGQMB2BiJvpEcR/m5/ROysYZCgu8+j
        H9hJZVmy+BZFQSgWT4NpTPI=
X-Google-Smtp-Source: ABdhPJyEzrmmPy2T7FHrrFp+iJzOPHpzmjagQEsjQ6AOMUd97E32acGIIFqkCl5mA/A5s521nZLDBg==
X-Received: by 2002:a17:902:8346:: with SMTP id z6mr1056475pln.27.1591661312384;
        Mon, 08 Jun 2020 17:08:32 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id p8sm6768516pgs.29.2020.06.08.17.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 17:08:31 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: [PATCH 0/1] Lockdep assertion caught with clk_hw_round_rate()
Date:   Mon,  8 Jun 2020 19:08:15 -0500
Message-Id: <20200609000816.23053-1-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

We use a downstream kernel tree from a vendor that is based on v4.14.
One of the clk-providers in this kernel tree uses clk_hw_round_rate()
in a call sequence where prepare_lock is not held. In such a scenarion,
with lockdep enabled, we caught the following assertion failure:

>>>>
    [    1.192562] ------------[ cut here ]------------
    [    1.192575] WARNING: CPU: 7 PID: 1 at drivers/clk/clk.c:1190 clk_core_round_rate_nolock+0xd4/0xe0
    [    1.192579] Modules linked in:
    [    1.192590] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G S              4.14.151 #1
    [    1.192599] task:         (ptrval) task.stack:         (ptrval)
    [    1.192603] pc : clk_core_round_rate_nolock+0xd4/0xe0
    [    1.192607] lr : clk_core_round_rate_nolock+0x38/0xe0
    [    1.192610] sp : ffffff800805b950 pstate : 60c00045
    [    1.192613] x29: ffffff800805b960 x28: ffffff8302a174b0
    [    1.192622] x27: 0000000000000000 x26: 0000000000000001
    [    1.192630] x25: 0000000000000004 x24: 000000000000000b
    [    1.192638] x23: 0000000000000001 x22: ffffffccfc7415f0
    [    1.192647] x21: ffffffcce81e8a80 x20: ffffffcce81d7080
    [    1.192656] x19: ffffff800805b970 x18: ffffff83037a307a
    [    1.192665] x17: 00000000c28f5c29 x16: 0000000000000003
    [    1.192673] x15: 0000000000000004 x14: ffff0000ffffff00
    [    1.192682] x13: 0000000000000004 x12: 00000000015ccc3c
    [    1.192691] x11: 69d3af68d5202400 x10: ffffffffffffffd8
    [    1.192699] x9 : 69d3af68d5202400 x8 : 0000000000000002
    [    1.192708] x7 : ffffff830228f2a4 x6 : 0000000000000000
    [    1.192717] x5 : 0000000000000000 x4 : 0000000000000001
    [    1.192725] x3 : ffffff800805b848 x2 : ffffff800805b980
    [    1.192734] x1 : ffffff83030d0038 x0 : 0000000000000000
    [    1.192744]
    [    1.192744] PC: 0xffffff830193b998:
    [    1.192747] b998  d63f0100 b7f80060 f9000260 2a1f03e0 a9417bfd a8c24ff4 d65f03c0 3941a288
    [    1.192777] b9b8  371000a8 f9402288 2a1f03e0 f9000268 17fffff8 aa1303e1 97ffffcd 17ffffec
    [    1.192804] b9d8  d4210000 b5fffb54 17fffff1 d10143ff a9034ff4 a9047bfd 910103fd f000b848
    [    1.192831] b9f8  f9470508 aa0103f3 aa0003f4 f81e83a8 d503201f f9400280 910003e8 91002101
    [    1.192859]
    [    1.192859] LR: 0xffffff830193b8fc:
    [    1.192862] b8fc  a8c357f6 d65f03c0 a9be4ff4 a9017bfd 910043fd aa0103f3 aa0003f4 d503201f
    [    1.192890] b91c  f000bc28 b944f108 340000e8 9000bca8 913f2108 9101c100 12800001 97f00dc7
    [    1.192917] b93c  340004e0 b4000334 f9401280 b40000a0 f9400808 f9001268 f9402008 14000003
    [    1.192944] b95c  aa1f03e8 f900127f aa1303e2 f8018c48 f9400689 f9402928 b40000a8 f9400a80
    [    1.192972]
    [    1.192972] SP: 0xffffff800805b910:
    [    1.192974] b910  0193b9d8 ffffff83 60c00045 00000000 0805b940 ffffff80 0153f088 ffffff83
    [    1.193001] b930  ffffffff ffffffff 0805b970 ffffff80 0805b960 ffffff80 0193b9d8 ffffff83
    [    1.193028] b950  030fbda8 ffffff83 00000001 00000000 0805b9b0 ffffff80 0193ba30 ffffff83
    [    1.193055] b970  00000001 00000000 00000000 00000000 ffffffff ffffffff fc992128 ffffffcc
    [    1.193083]
    [    1.193088] Call trace:
    [    1.193092]  clk_core_round_rate_nolock+0xd4/0xe0
    [    1.193096]  clk_hw_round_rate+0x4c/0x80
    [    1.193101]  clk_populate_clock_opp_table+0x16c/0x320
    [    1.193105]  devm_clk_hw_register+0x88/0x9c
    [    1.193110]  devm_clk_register_regmap+0x54/0x60
    [    1.193114]  qcom_cc_really_probe+0x110/0x204
    [    1.193119]  gpu_cc_sm8150_probe+0x1e0/0x248
    [    1.193125]  platform_drv_probe+0x5c/0xb0
    [    1.193129]  driver_probe_device+0x2ec/0x420
    [    1.193132]  __driver_attach+0x9c/0x120
    [    1.193137]  bus_for_each_dev+0x8c/0xd4
    [    1.193140]  driver_attach+0x2c/0x38
    [    1.193143]  bus_add_driver+0x138/0x240
    [    1.193147]  driver_register+0x90/0xdc
    [    1.193151]  __platform_driver_register+0x4c/0x58
    [    1.193159]  gpu_cc_sm8150_init+0x1c/0x24
    [    1.193165]  do_one_initcall+0xe0/0x1b4
    [    1.193170]  kernel_init_freeable+0x1f4/0x28c
    [    1.193175]  kernel_init+0x14/0x14c
    [    1.193179]  ret_from_fork+0x10/0x18
    [    1.193186] ---[ end trace 555f6d784089f197 ]---
<<<<

It is likely for other clk-providers to run into similar situation as well.

I see 2 options to fix this problem,
1. Fix locking for clk_hw_round_rate() API.
[PATCH 1/1] submitted here is an attempt at that.

2. Improve the clk_hw_round_rate() API contract documentation to state that
it ought to be called with prepare_lock held. And then fix the call sequence
in vendor's kernel tree for this particular clk-provider, based on this API's
updated contract.

I would like to get some feedback to see which of the above options would
you recommend. Or, I may have likely erred on my understanding of clk API
so I am open to your suggestions.

Appreciate your feedback.

-Thanks and Regards,
Sarang.

Sarang Mairal (1):
  clk: add lock protection to clk_hw_round_rate() API

 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.1

