Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B72C48BE0
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 09:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00154613C8
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 09:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhFKJEU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 05:04:20 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:46972 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhFKJET (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 05:04:19 -0400
Received: by mail-qt1-f173.google.com with SMTP id a15so2007564qtx.13
        for <linux-clk@vger.kernel.org>; Fri, 11 Jun 2021 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfBuLm9X/ZFXx9ulil7rRE1PalBWgkaUHxCcK7gre2o=;
        b=kMjVqKxFejQZaqNMlqj1gWhBGuhmgh5iPQVRw04gqH3ZfEB6cww+JUptb2jVQlxzKI
         JUvi8JIWUBBUOR97GUCkAlrIZyOciy4wuVi9hEXTzZfZczG21NNBDCIzf3rkgsjqU8L1
         x3Uv13sehkZBRO5vvhL6/l2UADxJgWYHeKLnUHza1K/D43tRVNIoYN4sRCGNVf9vE4hq
         86hCkyEC37HrQY/FPTOE5+rhCwy0JlEITBk3q/d096R7zods0v93ooy2L8mRsAGXYVOT
         sqW01ti1clKi3e/ImMRIMQePftSxwixyGOzyZJQq1hM9lJq6OWoue7pxmyY/UHJ1ZBHt
         iV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfBuLm9X/ZFXx9ulil7rRE1PalBWgkaUHxCcK7gre2o=;
        b=pfJbBinHEqrQFjbsLSBDosA1Rxr3QRc2py/KPrYDi8j21r8xKzIa1GsHz3YTajoA07
         L5pbPoPl3LQb5koJlH6prpwSo2TNwoP6lzTBwWB7PXv+RjnzIlzAdynuntmwTnc35c+2
         VSPx5Kz73rwkx9nMdbP/6mkeBsPM8NMfxHbmegPNtEZOljxoXIEBBZFVMmGV8t1oaqjh
         y12ij3o4mfW5adjljYcLQ2FcrzdpCz/mKoccq/Fs73rSWMFBkJxh38lgv55yTyYsFSVT
         yEPqzMDOn3/AGaYDSYEDWZsLX7ww+fRJNk1EjMZqghjd+rMHiEEGd70Wz6Fyn0MB43lQ
         pC+A==
X-Gm-Message-State: AOAM531MlQzAYxCjAQp+REJb/ebrjhdofCI0uwJD/B6X0I5Um/RQaHNl
        t4eQIAixaMdtUQrn1XMyGnbA4K2A++gPOzTf1sz2DA==
X-Google-Smtp-Source: ABdhPJyoSiWIM25RDZZZ6wPuwrZshCZyw4fcyOTmsNFEelVwi6tVKUBCLG6rTxGVPobpohofx+V8cSeSRpN6ph51sYo=
X-Received: by 2002:ac8:7412:: with SMTP id p18mr2755368qtq.273.1623402067123;
 Fri, 11 Jun 2021 02:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-23-dmitry.baryshkov@linaro.org> <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
In-Reply-To: <CALAqxLVwpLOsvjBVi+xb5S2VQNuGKgeOzrSqwZe5FN6RSeEEWA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 11 Jun 2021 12:00:55 +0300
Message-ID: <CAA8EJprMKydEKQhHr=wk76H_a1-udjspVXSY1j2tqHNErAG-uQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/24] drm/msm/dsi: remove temp data from global pll structure
To:     John Stultz <john.stultz@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, 11 Jun 2021 at 10:07, John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Mar 31, 2021 at 3:58 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The 7nm, 10nm and 14nm drivers would store interim data used during
> > VCO/PLL rate setting in the global dsi_pll_Nnm structure. Move this data
> > structures to the onstack storage. While we are at it, drop
> > unused/static 'config' data, unused config fields, etc.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
>
> Hey Dmitry,
>   Just wanted to give you a heads up.  Peter Collingbourne reported
> today that his db845c wasn't booting to display for him on his 4k
> monitor. It works fine on a 1080p screen, and while 4k isn't supported
> (yet?),  normally the board should fall back to 1080p when connected
> to a 4k monitor.  I was able to reproduce this myself and I see the
> errors below[1].

It looks like I made a mistake testing these patches with the splash
screen disabled.
Stephen Boyd has proposed a fix few days ago (will be included into
the 5.13). Could you check that it fixes the problem for you?

https://lore.kernel.org/linux-arm-msm/20210608195519.125561-1-swboyd@chromium.org/

>
> I dug back and found that things were working ok on v5.12 w/ the
> recently merged commit d1a97648ae028 ("drm/bridge: lt9611: Fix
> handling of 4k panels"), and started digging around.
>
> Seeing a bunch of changes to the
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c file, I tried reverting a
> chunk of the changes since 5.12 to that, and that got it working
> again. I've narrowed it down to this change -
> 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll
> structure") upstream (also reverting following 6e2ad9c3bfca and
> 36c5dde5fdf0 first - but its reverting this change that actually makes
> it work again).
>
> I've not managed to really look into the change to see what might be
> going wrong yet (its late and I'm about to crash), but I wanted to
> give you a heads up. If you have any ideas for me to try I'm happy to
> give them a go.
>
> thanks
> -john
>
> [1]:
> [   19.846857] msm_dsi_phy ae94400.dsi-phy:
> [drm:dsi_pll_10nm_vco_prepare] *ERROR* DSI PLL(0) lock failed,
> status=0x00000000
> [   19.857925] msm_dsi_phy ae94400.dsi-phy:
> [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0) lock failed
> [   19.866978] dsi_link_clk_enable_6g: Failed to enable dsi byte clk
> [   19.873124] msm_dsi_host_power_on: failed to enable link clocks. ret=-110
> [   19.879987] dsi_mgr_bridge_pre_enable: power on host 0 failed, -110
> [   19.886309] Turning OFF PHY while PLL is on
> [   20.415019] lt9611 10-003b: video check: hactive_a=0, hactive_b=0,
> vactive=0, v_total=0, h_total_sysclk=0
> [   20.481062] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.489306] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.513031] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.553059] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.561300] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.625054] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.633299] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.657033] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.697065] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.705316] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.769066] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> [   20.777330] [drm:dpu_kms_wait_for_commit_done:453] [dpu error]wait
> for commit done returned -110
> [   20.801035] [drm:dpu_encoder_frame_done_timeout:2161] [dpu
> error]enc31 frame done timeout
> [   20.845049] [drm:dpu_encoder_phys_vid_wait_for_commit_done:528]
> [dpu error]vblank timeout
> ...



-- 
With best wishes
Dmitry
