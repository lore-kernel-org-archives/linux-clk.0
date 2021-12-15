Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68232C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 00:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhLOAyq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 19:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbhLOAyq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 19:54:46 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36694C06173E
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:46 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id d10so40061290lfg.6
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVgkiLE97N0iul+V2pjFMo/DYrLzQeV66i7a5YrCjf0=;
        b=SC9cJJyv201rprwgWDGqOFW4MN8UqCAWK/1aWF+0cFtIP9bK3/EZ+djmXSDHHCxQ5k
         kl4YtzyT06v+oAaCv0cE8js0fdMEZdj3vbk3L1eNFSbaDfmwrgwTSs+TQfAsUnhFZxhD
         2XuK5fh8K9rkC2WVulpnG5IS14nduwjQiUtwaZepmOHy6NcomUpHZNF8U0ZkAfv9UZ+V
         Y2PypOwOufYvnNKRsnbM1tf3RKigKfRxmQK1VcZ3zy5c3RVkZTnCaRl7vtLEWN7GyNwf
         q4p7oMTMJ/k0uXVHhj5VLnIkI+8XiI7ytvADPBfhv//EVlLQ0jajPSEdxqsxWW5QcUJ1
         WW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NVgkiLE97N0iul+V2pjFMo/DYrLzQeV66i7a5YrCjf0=;
        b=vQBi9ms09DagQhQ4WCI0wlPM48QKNHfNdrYPHElrb99VXq3EeoRXNolRUHV1Lh7dRU
         Lu1dvEcZ+KMr4FgoqHkgUyH5HxUMLRDeGmd9gFIOjW40eyFgsS9i2/JODHwj0cwOE46U
         TYf6oEJIX1WoDtSfZ/IzyW999tbjdfVX6u4fLHqjk08PEA3KsstBfsMsJEQfZfe/Xfaa
         O/aHZjJfDUbbcxjHVOMBayYYgxextrOn2U/fnoWrkKeIm19NdIgz1wkUYE7he0+KfHtU
         Ic3Y6A1l/w6VP7nlyVp4BqpS3Rr6PNAQ59WJ1E9+vwhIiB0XDu9UdVM7ueEdtudDom4D
         mhLg==
X-Gm-Message-State: AOAM532kShhharsEhQpp8OCUo614f+WNLV4jO/hTO4GPeUCf/ZuDgTzr
        ydFK7FyNziduSAoZfMEKxLZmug==
X-Google-Smtp-Source: ABdhPJz4KwJr3b3GP9C1jHKVUmhvSsvAfDAAUb+A9DpT91Oixkc/zayHc204KGVc9H3I4Ol6hwml5Q==
X-Received: by 2002:a05:6512:344d:: with SMTP id j13mr8013031lfr.347.1639529684239;
        Tue, 14 Dec 2021 16:54:44 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 00/15] clk: qcom: another round of clock drivers cleanup
Date:   Wed, 15 Dec 2021 03:54:08 +0300
Message-Id: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Another bunch of updates for Qualcomm clock controller driver, removing
unused enum values, test clock, using parent_data, parent_hws and
ARRAY_SIZE.

Changes since v1:
 - convert two parent_names in gpucc-sdm660
 - split camcc-sc7180 patch into logical chunks
 - split camcc-sdm845 patch into logical chinks
 - reorder gcc-msm8996 patches to put ARRAY_SIZE in front of the rest of
   patches

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-clocks-bulk-2

for you to fetch changes up to b8d6e03173f2945c62d200257ed28f74b09403b5:

  clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names (2021-12-15 03:33:53 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (15):
      clk: qcom: gpucc-sdm660: fix two clocks with parent_names
      clk: qcom: gpucc-sdm660: get rid of the test clock
      clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
      clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sc7180: get rid of the test clock
      clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
      clk: qcom: camcc-sdm845: get rid of the test clock
      clk: qcom: camcc-sdm845: move clock parent tables down
      clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sdm845: convert to parent_hws/_data
      clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
      clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8996: drop unsupported clock sources
      clk: qcom: gcc-msm8996: move clock parent tables down
      clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names

 drivers/clk/qcom/camcc-sc7180.c   | 221 ++++-----
 drivers/clk/qcom/camcc-sdm845.c   | 323 +++++++------
 drivers/clk/qcom/gcc-msm8996.c    | 971 +++++++++++++++++++++++---------------
 drivers/clk/qcom/gpucc-sdm660.c   |  21 +-
 drivers/clk/qcom/videocc-sc7180.c |   8 +-
 5 files changed, 874 insertions(+), 670 deletions(-)


