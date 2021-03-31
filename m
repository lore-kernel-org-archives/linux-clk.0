Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB7BC433E4
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 938F0619C7
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 10:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbhCaK57 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 06:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbhCaK5j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 06:57:39 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4972FC06174A
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 12so18103267lfq.13
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
        b=T2l1mkshCl6YEr2sg1PpgXbvvm/1CotkrF/GcTGYx7oF8cy3+4seZQ7q+wc3xZmSgg
         O57t6sdxREYa5YWhKrfD2ZxjaF/BBfa51oC9m9HXrwZfBaKaHH3p93e+F3jHQiKp4WJS
         sEIrO8xpUNxiYnzaZ52ZRZHSaG2jHw2r+xMzTHMeC4UEr8sIGCijKNwQPaFNyiJheU/Y
         wBaOCSJlnyoP9HW7F2L5eCzOwLx1bIDeNJvL4djxZBN4AomdnakpYFv1ZHfSDy7mPssz
         8M+BZvmQjysRNTSOMsvPcQRO/V5mFfk18EYIMHpFx4NfBIWPcaZNFP//z4fmkA3cA1VO
         YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
        b=U/mQ6Bqq6H8FLxUQK1aeSJ3XsEb1ciqHhw4JwGTf426gzRJywFleCnGX9Linpy6oGx
         rICIkS1d7n8O0iZxsLWqoG6sX7Zk1aj2mc8PKk0p66hS78EomgCaqfRQFPrd5sEg8gOZ
         cmsVDmDMyTiS0Bg7vDy3mMLuYzn3DwxyBX6nMX3fD1Nn72MXikTm475vFXecggr+xRqT
         bniycQDZcF51LLa4W0pnPMwt0/7+HQ19cXTLaoXX8N2A/oZV/29URZSkEvhVWhhLi05q
         JvuKxYbD7ED0FgBU6ek5iDaiKYI+RqkWxJJCucXXhHDBZwyUAoN0gn+J83biLlF9SQKe
         uoPw==
X-Gm-Message-State: AOAM531CG/Z1JeCKOR1JZQddom41u8nuFuMDBs3fr/5awXac+ltPnNfB
        UZWuYIXEL6nN4eRMp0PPmfnRgg==
X-Google-Smtp-Source: ABdhPJzinUMr68L3H0gNll59ZE9d2mkq7SzhhgLoSGMm3q7hf8wIK1TFkvYKx2COry8hY5RNKVo9Bw==
X-Received: by 2002:ac2:4e43:: with SMTP id f3mr1830598lfr.206.1617188256679;
        Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 00/24] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date:   Wed, 31 Mar 2021 13:57:11 +0300
Message-Id: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

This patchet depends on the patch "clk: fixed: add devm helper for
clk_hw_register_fixed_factor()", which was merged in 5.12-rc1:
https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com


Changes since v3:
 - Rename save_state/restore_state functions/callbacks
 - Still mention DSI_1 when determining settings for slave PHYs in 14nm
   and 28nm drivers.
 - Stop including the external dependency merged upstream long ago. It
   is properly mentioned in the patchset description.

Changes since v2:
 - Drop the 'stop setting clock parents manually' patch for now together
   with the dtsi changes. Unlike the rest of patchset it provides
   functional changes and might require additional discussion.
   The patchset will be resubmitted later.

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.


