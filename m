Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC573C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 22:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbiEWWvv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 18:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbiEWWvu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 18:51:50 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27666541E
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:51:48 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id s5so13117608qvo.12
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vcI1skfMKoqTzgW6PwoPYdHQpeyuuPuHAsg8j4YyY0=;
        b=SK9Ai50QmK6g6drZEH6TCZVx1ybdkR30gnwYdm8OX2MZCjPFMpadH8tfGN3bx+9Td/
         JV4EOdx30Sjs+Wg+3M4XzuL+MmICDQvxsjNn2upQIy/Cr3xj68l6ozh5NDZaEZ1s1MhM
         TP2EZ2UeFyTtIUDrq0OkG13phXlQ3YEFq2qdYhlMDss/hhT0i37Q23MzydGmfgrwxVVD
         1Ynl64Hw5+VjP6MxxOe8LC+afzQGyF94jDraJmba/Q9zz0VC4aa7Y7boG0hwCN5gTW2x
         eABDT1He8d4kgRdJTTSaINbiF16ijulZOPa6HhTqFr7VSpwqjfwhDTQs328T9QCkXIj2
         8nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vcI1skfMKoqTzgW6PwoPYdHQpeyuuPuHAsg8j4YyY0=;
        b=r/twwLY/4vtkzwaQ/cS43hpqrD1mvGY9Lde4CQKvglkT7HSMxwlAkc7WhmVUg/bYEf
         TnyvdvATCCdpetOLnN7uIFqqvmKD/XTWVqI+4a4WmFzj6DFYGrEJJ2sWvisCknfk1jnm
         LTb0nbedWlmE6MKGKmmrA/jtaSEUqSPh9pKrwk8qWPuYoVME2jMwjfZ6T/N6hi+F1Wc1
         S4CamBAFuG/au6wK/v5ePI/YGk46r8zPo5RxTaHFJLrEZBeeN7EWQlJnnF/v1ViJ6HK0
         +TV/N+fS1wIi1SgJxyYYbcI1zREzkAHH7WOOGVDJ/oETs/PUjhyqQri0OYWEI0omkSWl
         Yedg==
X-Gm-Message-State: AOAM533kuZ8/5/+yNlKPD9L7ehat8tXxfs5Jo1lPmnHwmsDIv4LzSckA
        1/3kmShTtEnBWAd10O9k4nKANTPc4H42NzktPRlziB1YRf9QhQ==
X-Google-Smtp-Source: ABdhPJwMUeQdsntLd2uLatzH66lXWsSEabtV+kiZYKsXgWX2xbdL3qvvkkPq6NF2azOSQPNRYAvN0l9Dt1B7OzOioVM=
X-Received: by 2002:ad4:5f4e:0:b0:462:3d31:6faf with SMTP id
 p14-20020ad45f4e000000b004623d316fafmr5677472qvg.119.1653346308200; Mon, 23
 May 2022 15:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org> <20220523213837.1016542-9-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-9-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:51:37 +0300
Message-ID: <CAA8EJpoPv_J=hpc9ETjngyAxxqJYvSFtJUgu3U3r6n8JNMuJWQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/msm/dsi_phy_10nm: Replace parent names with
 clk_hw pointers
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 92 ++++++++++------------
>  1 file changed, 40 insertions(+), 52 deletions(-)
>

-- 
With best wishes
Dmitry
