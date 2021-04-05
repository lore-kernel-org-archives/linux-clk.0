Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B126C433B4
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6BF613E4
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241368AbhDEWr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhDEWrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:47:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B41C06174A
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:47:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g8so19612823lfv.12
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kR3LsXvrCWcRRj0gv82Kxzr9iJDIuGioSMojGQ9an5U=;
        b=u11EAT+CbXI3aj4zXNW+rvvpjpeuoYV6AsGH29fKi4OcsGR3dYyFrfRSqfI7Eu6enm
         HFXVDBj03IpkNP39gizyNSu//7f2knEE7/qnOff25FYL67g4RqWG6BqsggcE3lwHtN2L
         QlRSnxS/i2JYxJEB6Sa0+9qNQLBMQ7N4zu6xdqKz2VURjYaftigiDuF9bI3C4s+lvEpb
         vFjKLfeifj8lUr/fGkOSCavWHvGYQ/wpuLbccT5xN2C5tSbAQcQTPJvChbomiVMgZi1v
         +mLx4jgLC0jMdQ7nFaHuB6jJstLL+Ha1NNj8HFwbqa/4MPNYJu/2qsPqYeCDE32TK2Yj
         ASpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kR3LsXvrCWcRRj0gv82Kxzr9iJDIuGioSMojGQ9an5U=;
        b=Yh92oc8JiRvILECK03aCHpM0LhlCN8usC6ILzpMmV4qhv9f/8UmPJS62pG/piAtTt6
         Na0RTtHiG1YZqlda/3SWFO25wq7Pbp0UudeXD7RvkEi+pLWngh3dOH5CrfNnCSUGze1D
         PnsKhfjP2zm3XB6YQ5jUAYSccYgTWCzHostH7yQSS2ebvldbCRIy5rOPHbvg+/Z5tmhm
         RBgh0n3aWDYwQlneJ6EXF7UvbD5g4Uq39Ni/Pbx5eYj5uNNlU8/PRnTzbuOxV2LNhzUD
         2o7ioSlE7flOZc7Jj1FUIx4vnhpSJi8I+AO/456gkxdrV10BxCwYHbdX4KrQSxa9i0GM
         zBiQ==
X-Gm-Message-State: AOAM531xdWixAzEpzw7s5j1k9Tad6LJ8Spnp3Y21/sm5QI0+p64q+uVi
        Jgj58t9a9D+yN7992j8M3KfGTA==
X-Google-Smtp-Source: ABdhPJy57k4WLbk6MWTTHQawcrZMr9h/yNPLYqEB8Uq6OjXtg5oR4k9XM1uJatsLcfjR9znrnfb82g==
X-Received: by 2002:a05:6512:207:: with SMTP id a7mr18822131lfo.393.1617662865208;
        Mon, 05 Apr 2021 15:47:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 00/33] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Tue,  6 Apr 2021 01:47:10 +0300
Message-Id: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

Changes since v3:
 - Use ARRAY_SIZE() for num_parents and parent_hws instead of
   parent_data where applicable as suggested by Marijn Suijten
   These changes are applied both as a part of 'convert ot parent data'
   patches and as separate changes to respective clock drivers (which
   already used parent_data).

Changes since v2:
 - Comment out unsupported video_pll0_out_odd/_even clocks instead of
   removing them or just using .name for them. The clocks are
   unsupported, but mux values are provided for the future reference.

Changes since v1:
 - Remove unused entries from gpucc-sc7180, gpucc-sdm845, videocc-sc7180
   and videocc-sm8150 drivers
 - Restore video_pll0_out_odd/_even entries in videocc-sdm845 driver as
   requested by Taniya Das.


