Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1880C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  3 Mar 2022 08:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiCCIWo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiCCIWo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 03:22:44 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8E4171EC0
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 00:21:59 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id d3so3415265ilr.10
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 00:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7suCs499Q089tHCM2SND3Dw+QYoA5ouYgqyYernBKK8=;
        b=KgtU2TPvF6aTpGm0JZAu/2VbNyjDWFxvDbzuwyZ7PNnlwoEM1H3nxSuujodJ4ykwgb
         Mc5b/0uE2jYwkTo9RSo3wFjXGfvPw0qqAN11GgWZd0ZnPHU6nJhnZO1+tN747bRhtQYV
         M7by3huCRHVHV2HlEQi6tEDUxLYH446nE3UHNvrp1txtSsPVV+iIcl9GHAyLoya4zR2A
         kn6Mw13E7B55bITcYw7IirJhPh6eiOyhNRZKm9RsJdw62kTCEmxTYZMrZLsQ6oRphi90
         qNQEWNLcup9KU4L831Bt36vU084RfMtgTehtSrwB2tXmFeHqMVHg49zEihso5taLmvfG
         F2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7suCs499Q089tHCM2SND3Dw+QYoA5ouYgqyYernBKK8=;
        b=qshnatGNi/tr7nTSVJT6AjmDwjmWwMdRdicbBzjGMlIt8/idfYFfIE+sZxPE0XZhTI
         p+g1u6E3C3nQptPDhBFVKu6NUZmwaj/sqwYRj5AqfcRidfZ/f3jDn32YxSMdEqZ7LzJd
         LpQzJrqDyGKlV+VWAQlCfufLsdfGQxFKD+gl0ORHkidM7haowdQIoClyc+VpY7qSjYJk
         /pl0spp7J+QzqvoN7BXkD6BwfGtNmMHGpPx45sC/Dgn9+4bq1zP//DF2A4XVNj+H9Q5Q
         ZoA9It/RW32QXxRS6uYP73Opy5NF+WHxJ/OcsOtJT9BImBsDKjUqHA5bUX4bgg9zlGku
         ovvw==
X-Gm-Message-State: AOAM530oX9rgTs/A6OeWDTvmFUyQHteseKeEUH2/eYvew9085QdNCvdc
        s7/RTzdNr3yVSKjc9TInEt5MIA==
X-Google-Smtp-Source: ABdhPJzGHhaYx5+V8/MlwEElvDEmzYHbAGANh+CEgaHibHVdTyQ3RJtk7e0oRN4TY5n55RsNU9AtHA==
X-Received: by 2002:a05:6e02:1c8b:b0:2b8:ba1d:859b with SMTP id w11-20020a056e021c8b00b002b8ba1d859bmr32391917ill.233.1646295718722;
        Thu, 03 Mar 2022 00:21:58 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id l187-20020a6b3ec4000000b0060523f4e92dsm1204569ioa.28.2022.03.03.00.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:21:58 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 0/2] Add ufs power-domain entries for SM8150
Date:   Thu,  3 Mar 2022 13:51:38 +0530
Message-Id: <20220303082140.240745-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v2:
----------------
- v2 can be found here: https://lore.kernel.org/linux-arm-msm/20220228144607.456194-1-bhupesh.sharma@linaro.org/T/
- Modified [PATCH 2/2] from v2 to include gdsc driver structs and
  support code for UFS_PHY and UFS_CARD (in addition to defines for the
  same).

Changes since v1:
----------------
- v1 can be found here: https://lore.kernel.org/lkml/202201220442.bMRI74m1-lkp@intel.com/T/
- Broke down another separately sent out PATCH (see [1]), into a 3 patches (one each for emac, pci
  and ufs gdsc defines) - one of which is carried as [PATCH 1/2]
  in this series, which fixes a compilation error reported by 'kernel test robot'.
  The rest would be sent out as separate patch(es).

[1]. https://patchwork.kernel.org/project/netdevbpf/patch/20220126221725.710167-4-bhupesh.sharma@linaro.org/

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (2):
  clk: qcom: gcc: Add UFS_CARD and UFS_PHY GDSCs for SM8150
  arm64: dts: qcom: sm8150: Add ufs power-domain entries

 arch/arm64/boot/dts/qcom/sm8150.dtsi        |  5 +++++
 drivers/clk/qcom/gcc-sm8150.c               | 20 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  2 ++
 3 files changed, 27 insertions(+)

-- 
2.35.1

