Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ABAC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18513610E8
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhDBCVP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbhDBCVO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:14 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74840C061788
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:12 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s17so4274568ljc.5
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L925LIwX/AEyuqnRbSRg5dcDMuoq/xRmNPVHzWMF0Yc=;
        b=NsriI1TT2YsTF0Z9rxrUGCPsIHq+cuxPYpd0NSHqqPJI2IcBXhAX4g/uFEBop/W5xK
         mN/HKiTH4QJr564Jrv0Xy4zyoxjE0QwGWAaJ6myML3aikVjDqY4lM5YtfhpB+dYeRG8C
         gv31lY8ZFhcCvRCHfURkHSXTMtcR2j1ZAHjQa2czJAOvRMyfIs6GdE19wmISsCvUJEwh
         l5fWFXOvOGb0OlY0+i2JIs/Q3SvtQlRg0OA7aDmH3F9aF2WSzCKmYXvSCfostoZfpWwf
         N1wp/k9Ow25A1ATX+14XYJ5JnrmpH8ugVqW7giIH0WP6lrtwux+Z8Fj33lkEuog7Hb+B
         C+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L925LIwX/AEyuqnRbSRg5dcDMuoq/xRmNPVHzWMF0Yc=;
        b=tZOxHtP9SlXDSWOt/3cbEWxEdXlay2f1DII9sMgBSlre7QF4+IbB/Z+rV6tEjWDa0V
         eDDxz9NFKt2BPyNIuLysYhdmUo3EfXTAPQp1dUxRJf1oCBMgx+8PBmlLJKI/m4ANoHto
         UUzjDOlEDb1kDiiV1fCENaSTBFIXDDnKkXggbwhf6yy21SnoGk21ofi6jukyYVrbBLuz
         Z3fTFYF+xPdOiMoY9t5o+5INXJkIyemJUZxqclZYUuVApHD+IwKeQPAauEAbAG8iFiHp
         8pCGNt4ZQXFDTeVQX0zofNfbZ17fBdfobZ9O30hErccD+fXURrIP91zM1vwYxz3b09aa
         ktuQ==
X-Gm-Message-State: AOAM531SSmtnNLy0vtsDiXhirGY/H0SyzIxNCdLKCZd73TASzGXQwhZw
        nQJz/YFKrQeQg6ZizsE0mPv2jQ==
X-Google-Smtp-Source: ABdhPJyjS7IA5ZX7+ZwTZMBZG1bjjbO1CAJI7xfVUgMCc7jbUZ9nASs17OoBShUA5ruz5hOdFFTM4A==
X-Received: by 2002:a2e:9143:: with SMTP id q3mr7158320ljg.378.1617330070773;
        Thu, 01 Apr 2021 19:21:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 00/16] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Fri,  2 Apr 2021 05:20:52 +0300
Message-Id: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-cleanup

for you to fetch changes up to abb5f4ee34095483b5cc16d6b2f6eb683e69a78e:

  clk: qcom: videocc-sdm845: get rid of the test clock (2021-04-02 05:03:06 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (16):
      clk: qcom: dispcc-sc7180: drop unused enum entries
      clk: qcom: dispcc-sm8250: drop unused enum entries
      clk: qcom: gcc-sm8250: drop unused enum entries
      clk: qcom: gpucc-sc7180: drop unused enum entries
      clk: qcom: gpucc-sdm845: drop unused enum entries
      clk: qcom: gpucc-sm8150: drop unused enum entries
      clk: qcom: gpucc-sm8250: drop unused enum entries
      clk: qcom: videocc-sc7180: drop unused enum entries
      clk: qcom: videocc-sm8150: drop unused enum entries
      clk: qcom: videocc-sm8250: drop unused enum entries
      clk: qcom: dispcc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: convert to parent data
      clk: qcom: videocc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: get rid of the test clock
      clk: qcom: dispcc-sdm845: get rid of the test clock
      clk: qcom: videocc-sdm845: get rid of the test clock

 drivers/clk/qcom/dispcc-sc7180.c  |   2 -
 drivers/clk/qcom/dispcc-sdm845.c  | 217 ++++++++++++++++++--------------------
 drivers/clk/qcom/dispcc-sm8250.c  |   8 --
 drivers/clk/qcom/gcc-sm8250.c     |   1 -
 drivers/clk/qcom/gpucc-sc7180.c   |   3 -
 drivers/clk/qcom/gpucc-sdm845.c   |  45 ++++----
 drivers/clk/qcom/gpucc-sm8150.c   |   1 -
 drivers/clk/qcom/gpucc-sm8250.c   |   1 -
 drivers/clk/qcom/videocc-sc7180.c |   4 -
 drivers/clk/qcom/videocc-sdm845.c |  51 +++++----
 drivers/clk/qcom/videocc-sm8150.c |   4 -
 drivers/clk/qcom/videocc-sm8250.c |   2 -
 12 files changed, 150 insertions(+), 189 deletions(-)


