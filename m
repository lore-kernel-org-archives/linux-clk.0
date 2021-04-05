Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C32C433B4
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0FAE610F7
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236235AbhDEWt1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236203AbhDEWt0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:49:26 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B4EC06174A
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:49:20 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id y5so13086870qkl.9
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OkSbjhz6xE8syqTiE1aa5v0NU7tO6RjOafyM87apJUQ=;
        b=cEZ0emlAnQ59lWZQ+CG0PzBqUiA3jMclJ9ifiMjgtnYA9n3YdWwLkIrPhOa5quYpnt
         M68i+VH5GPO4Qf5To7C74KHAXG/1RoHeg3RH6+LYW/QU8o6nQJae0JV9l/0tF7tBGEPP
         9tP9PXQucIn3DQAOfRH4ai8PfXUkwOcNabYio1qEzrkINIJ1MM+swD7lTJ8uV54m8Tvk
         JL77Mbkehb8F8hPsEVCFJ9ednolHiRcQBU4V9OL4jLCRopJrH+FDfwOJAFlPujUXcGnK
         CAHRkaZPy98ofjK6exIuEgnLoTw3A/0//qbkoWZlX7vo9Zs1HF2WMUh3LhHQqTKFE6yj
         j64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OkSbjhz6xE8syqTiE1aa5v0NU7tO6RjOafyM87apJUQ=;
        b=ZApymXc+Vz18e+Kf7Woxx3FSRbBUp18WI8B+0Rn0cnr3o06LgXk7W+0GRXtIxHAMk4
         82kkj1uOaHchIkGbE47qdvdpZ+DrqsI3e21jWKAtSuLNc1AyNsrc7ZxqaV2yD/0e3Vh7
         TWeJdtazuVrfDT+C8WIDP0NAdknfQE6X3Pl6OFKg+9f7uAigxXIQlvV3gbx/eRHgHoF6
         RcXAnO93hmQQOKi/SK4Uf0Lujvdg+zlaO88Pi+K57USBaFhwR/DXp0QJ0CEBknwPS60+
         +CIawu7HwW6kpjpf/DV4OZtv734LBeERrbeT4LBJ8SSaTS3z1kNHJJT5u30l03CcVgWX
         cNEQ==
X-Gm-Message-State: AOAM532P4hcPtWvR6hqZoCUVdAUJEOP7tfEugvnh794+mydrwdH/bUJH
        L0UgQyriAiR/Ube9i6u5vqQb0IiYh4kvf+TZHWUKVQ==
X-Google-Smtp-Source: ABdhPJx7BfYrPo/9BY8xtRLwUPd2M1lLpiXx9DfiWItGCW0F3eDMebsFZhl6jfdyG8XUZUMEcrJgIMFewmGMt9H3vFQ=
X-Received: by 2002:a37:a016:: with SMTP id j22mr26877448qke.486.1617662959432;
 Mon, 05 Apr 2021 15:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 6 Apr 2021 01:49:08 +0300
Message-ID: <CAA8EJpq_bTcAZUx0mcwFp4uURNoayVdGvbobt72hC2rrqRwGbA@mail.gmail.com>
Subject: Re: [PATCH v4 00/33] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 6 Apr 2021 at 01:47, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Cleanup several Qualcomm clock drivers by removing unused entries from
> parents map, removing test clock, etc.
>
> Changes since v3:
>  - Use ARRAY_SIZE() for num_parents and parent_hws instead of
>    parent_data where applicable as suggested by Marijn Suijten
>    These changes are applied both as a part of 'convert ot parent data'
>    patches and as separate changes to respective clock drivers (which
>    already used parent_data).
>
> Changes since v2:
>  - Comment out unsupported video_pll0_out_odd/_even clocks instead of
>    removing them or just using .name for them. The clocks are
>    unsupported, but mux values are provided for the future reference.
>
> Changes since v1:
>  - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
>    and videocc-sm8150 drivers
>  - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
>    requested by Taniya Das.

For your convenience:

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-cleanup

for you to fetch changes up to 576546d30f7df4813b0bb5874486f08f82f28ec1:

  clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying
num_parents (2021-04-05 23:48:03 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (33):
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
      clk: qcom: dispcc-sc7180: use parent_hws where possible
      clk: qcom: dispcc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sc7180: use parent_hws where possible
      clk: qcom: gcc-sc7280: use parent_hws where possible
      clk: qcom: gcc-sdx55: use parent_hws where possible
      clk: qcom: gcc-sm8150: use parent_hws where possible
      clk: qcom: gcc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sm8350: use parent_hws where possible
      clk: qcom: gpucc-sm8150: use parent_hws where possible
      clk: qcom: gpucc-sm8250: use parent_hws where possible
      clk: qcom: videocc-sm8150: use parent_hws where possible
      clk: qcom: videocc-sm8250: use parent_hws where possible
      clk: qcom: gcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sc8180x: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8150: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8250: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying num_parents

 drivers/clk/qcom/dispcc-sc7180.c  |  70 ++++---
 drivers/clk/qcom/dispcc-sdm845.c  | 217 ++++++++++----------
 drivers/clk/qcom/dispcc-sm8250.c  | 124 ++++++-----
 drivers/clk/qcom/gcc-sc7180.c     | 196 +++++++++---------
 drivers/clk/qcom/gcc-sc7280.c     | 248 +++++++++++-----------
 drivers/clk/qcom/gcc-sc8180x.c    | 122 +++++------
 drivers/clk/qcom/gcc-sdx55.c      |   8 +-
 drivers/clk/qcom/gcc-sm8150.c     | 100 ++++-----
 drivers/clk/qcom/gcc-sm8250.c     | 345 ++++++++++++++++---------------
 drivers/clk/qcom/gcc-sm8350.c     | 418 +++++++++++++++++++-------------------
 drivers/clk/qcom/gpucc-sc7180.c   |   3 -
 drivers/clk/qcom/gpucc-sdm845.c   |  45 ++--
 drivers/clk/qcom/gpucc-sm8150.c   |   9 +-
 drivers/clk/qcom/gpucc-sm8250.c   |   9 +-
 drivers/clk/qcom/videocc-sc7180.c |   4 -
 drivers/clk/qcom/videocc-sdm845.c |  55 +++--
 drivers/clk/qcom/videocc-sm8150.c |  20 +-
 drivers/clk/qcom/videocc-sm8250.c |  30 ++-
 18 files changed, 991 insertions(+), 1032 deletions(-)


-- 
With best wishes
Dmitry
