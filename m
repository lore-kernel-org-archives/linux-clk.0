Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D96C433C1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 01:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D22061601
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 01:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhC3BcE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 21:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhC3Bbu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Mar 2021 21:31:50 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCC4C061762
        for <linux-clk@vger.kernel.org>; Mon, 29 Mar 2021 18:31:50 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso8609486pji.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Mar 2021 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VqsB/KspzBLfleMt3X13JmN72hr7Ivn8/G3NW35scDU=;
        b=oRBLwNnRiMTNEnj51Rq5J4ROOQVEMOXQc65rWkdsGb61Eb9XiBO4U7R1oLHxuk76VD
         FyfJin7DBYDeLTSb9LU1SeGd6S74jUTts+u9bUreWZZ35CKoPhBAcb6P0SNGXH3k5YD/
         bOK85QLLJDWXsqtcSwXKaBRpouNUpmItdFAHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VqsB/KspzBLfleMt3X13JmN72hr7Ivn8/G3NW35scDU=;
        b=rt/2u7j9JhQ3Qg4N7B0q0ravMdVxMdIbvNF5IASKbbO/HMdcGYPndLiL57OMQVSLdv
         TWAHkuiTU+nf97O62WWuS9TP/Zk4uqdpx89Zj9w7kDVTKi4ulMrrH9JRy7wpX3YSpOo/
         ke7Z4mkuLX3i+tEpNB/ETBbo0UTSF7nLhgi7ZtIUHjesZmNVnosrPlmE/NpXbBHw41aT
         xK9SRSgfLKIMi/nAmHEe5KYIPYR31vd/sueN5FYJp1tMMvMbabPyfmYeW3KlfObK3anl
         MIaZBbr/X4hiqefNvecbzBm7DqRsYutYLImR9Wt9lnqPMFadBfMeEN1GjOH/hCjSWwGC
         xJQg==
X-Gm-Message-State: AOAM532nuWI+k6Z2wM+WoRZD/JqaWTa3BcnaFVIpOENefG9Nfds/MJhM
        cfULaza0IL8vElThxLpAHYU4aA==
X-Google-Smtp-Source: ABdhPJzTWrDchk39egDoT3Ebv23CG0wZ+YVzjMmD32zht97vToqfNhx8RT3pByjL1TOX4a53kpISlA==
X-Received: by 2002:a17:903:22c2:b029:e7:1f02:434c with SMTP id y2-20020a17090322c2b02900e71f02434cmr19483596plg.73.1617067909560;
        Mon, 29 Mar 2021 18:31:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id k5sm18792164pfg.215.2021.03.29.18.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 18:31:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 00/25] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 18:31:47 -0700
Message-ID: <161706790759.3012082.10513147344813330034@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-27 04:02:40)
> Restructure MSM DSI PHY drivers. What started as an attempt to grok the
> overcomplicated PHY drivers, has lead up to the idea of merging PHY and
> PLL code, reducing abstractions, code duplication, dropping dead code,
> etc.
>=20
> The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
> 28nm-lp) and lightly tested on RB3 (sdm845, 10nm).
>=20
> The patch 'clk: fixed: add devm helper for clk_hw_register_fixed_factor()'
> is already a part of mainline as of 5.12-rc1, but is included here for
> completeness to fix compilation issues (as msm-next is based on 5.11-rc5).
>=20
> Changes since v2:
>  - Drop the 'stop setting clock parents manually' patch for now together
>    with the dtsi changes. Unlike the rest of patchset it provides
>    functional changes and might require additional discussion.
>    The patchset will be resubmitted later.
>=20
> Changes since v1:
>  - Rebase on top of msm/msm-next
>  - Reorder patches to follow logical sequence
>  - Add sc7180 clocks assignment
>  - Drop sm8250 clocks assignment, as respective file is not updated in
>    msm/msm-next
>=20
> Changes since RFC:
>  - Reorder patches to move global clock patches in the beginning and
>    dtsi patches where they are required.
>  - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecas=
e.
>=20
> The following changes since commit 627dc55c273dab308303a5217bd3e767d7083d=
db:
>=20
>   drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume (=
2021-03-22 18:52:34 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-3

I tested this on sc7180 lazor and the display comes up

Tested-by: Stephen Boyd <swboyd@chromium.org>
