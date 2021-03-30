Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB0EC433C1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 00:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A2E619A5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Mar 2021 00:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhC3Atr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 20:49:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:57226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhC3At1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 29 Mar 2021 20:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9D5C6024A;
        Tue, 30 Mar 2021 00:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617065366;
        bh=1AEhlMQR7Kcjy4rHT+iMsNAQIfcij05kfYf7xqfywJU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lyWNyVKNAZNH9fBOvHYF5AapC5C5QMCivVQUUg82j1WKyEIDl0fVFX2iV+zoH6OGx
         JjBaU/EhWoTIV6unM5YEcdv7WFeOeYENVEcuMpm6Mq949uxXi37TN7BvfXFETUpgJf
         g2iXOhDQpxqeqLzpaE7Rf6qrU1e2xnKGVBfk/phe5de516ZX/U+bpG5jlx94ZhI6gY
         t4/hx546rNQ0AzhkiGeBgRN+dphdQJ4e+STi/6uDoKzxQIn1BiWBq5yOnpo/VB+2WA
         bPmiKR+nSwCC8Me1H07vsAQvH81dtHNS/6qnTdBGQA21zGiwLi3ABNFRbHN5Q4YOa8
         iYIfD6HoGu9eQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org> <20210327110305.3289784-13-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 12/25] drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 17:49:25 -0700
Message-ID: <161706536549.3012082.7354929654800829210@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Subject should say register instead of registe

Quoting Dmitry Baryshkov (2021-03-27 04:02:52)
> Use devres-enabled version of clock registration functions. This lets us
> remove dsi_pll destroy callbacks completely.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                 |  4 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 35 +-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 50 +++++------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 39 +++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 84 ++++---------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         | 17 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |  4 -
>  10 files changed, 71 insertions(+), 249 deletions(-)

Awesome diffstat!
