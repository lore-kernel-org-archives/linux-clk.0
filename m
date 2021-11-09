Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E608C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 02:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16BC161279
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 02:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbhKIC2y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 21:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKIC2x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Nov 2021 21:28:53 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05C8C061764
        for <linux-clk@vger.kernel.org>; Mon,  8 Nov 2021 18:26:08 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c4so6200352pfj.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Nov 2021 18:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q2XXtoLJL00suV9nfAUEcGT4qZnNfnnIEyDWr+YV8w4=;
        b=xfChmhnwRfWXYIb8SdijH7DpY1iPLgrmKu4oTqF8k/lmajZxwzxHZ34rHA/+ASiWE1
         LhNzzQIcAMViGlhKi8O+tw9zVPSolI4VyuXB9ZoJQ7yO3s8ayOlIZEpoLCUqApa9930S
         lnYcxkZcNZWV8ah/Qx9sxYo65ytsIaKqK6Jegk26pNkGsQslPdTvmuUbverWtKTYvnmy
         S5NqrxsnOOqGIs2Hrl3ikBt2kQsxDQesNn0Swa0y69LBW+0r9/tvQRa4ZkrxgqEpHx/G
         odxRMKLl04bQQwOiHI8xAi9845Ul+GLQdpK2d9Erkqg+Mkk6V98BMo8Rik8iEMzy6vSK
         3Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q2XXtoLJL00suV9nfAUEcGT4qZnNfnnIEyDWr+YV8w4=;
        b=qPO1op+G2qkMxUUhH0oAQXRoQnkIFBTPJEnUo//AZuj1K1SrHGT1e5+FtEZWpwtauX
         A/R6ObKBFRpO2ykbkYlZkkCZndk5UrGWYIoNvgo+hqU6tKHlumzDsK8zFg8sOUteedma
         oteE2Hbf8u8w2whNn90bvD21pDNvqOeSlXOu/cTySf4qDmPKUImzeIGzLWk8Yn9mOL3K
         Xf3sRfeqMmDoBF4K0d02UtJXGdv/8Kkx6MAqs35J5AQvpNrhWaIPnEQc6kqtf7MmKiGH
         j6RQ6h94UB43s5ywvXWFYgM/ZfJB5WBXh1mLX9eR3L0Nhxkrm2XVnZES/hl4qsIaD2MN
         6OgA==
X-Gm-Message-State: AOAM5315NdOnAVMz4sWpbuECSIOqf2813EZCBOyd+33mohcAS56ZBtx4
        UmgLvW5jn2dkh7dhm8pMQbry8g==
X-Google-Smtp-Source: ABdhPJxNrOgRZxk1kFYUbbDWZbNMjuMIgU76QUqpRw+t2ghhx3bkHXXLY7hb/02cr3EXaXM2ASmIVA==
X-Received: by 2002:aa7:8019:0:b0:44d:d761:6f79 with SMTP id j25-20020aa78019000000b0044dd7616f79mr4395020pfi.3.1636424768218;
        Mon, 08 Nov 2021 18:26:08 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id om8sm589619pjb.12.2021.11.08.18.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 18:26:07 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Date:   Tue,  9 Nov 2021 10:25:55 +0800
Message-Id: <20211109022558.14529-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the enable state of smd-rpm clocks are not properly reported
back to framework due to missing .is_enabled and .is_prepared hooks.
This causes a couple of issues.

- All those unused clocks are not voted for off, because framework has
  no knowledge that they are unused.  It becomes a problem for vlow
  power mode support, as we do not have every single RPM clock claimed
  and voted for off by client devices, and rely on clock framework to
  disable those unused RPM clocks.

- The clk_summary in debugfs doesn't show a correct enable state for
  RPM clocks.


Shawn Guo (3):
  clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
  clk: qcom: smd-rpm: Add .is_enabled hook
  clk: qcom: smd-rpm: Add .is_prepared hook

 drivers/clk/qcom/clk-smd-rpm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.17.1

