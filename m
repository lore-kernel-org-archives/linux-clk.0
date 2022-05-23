Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967F8C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 22:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiEWWpE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 18:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiEWWpD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 18:45:03 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A426BABF53
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:45:01 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id y20so13096547qvx.3
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
        b=k21oHGm0XlDpBA85Iv8KLMxGl747dSSdXE/EQyrLw9mufTBWj0M6QTD5xziStZGSax
         rsRSKgHWBLMlhZ92G8QYix9zssd7roGkDcKcOVZ78tx2ubdiDauy3Vbkx008q6bxygJ4
         DUmQ26ZXi3O2lWLDlZDoUFt85gOIQ6f1dlS2AhQ9k28X+yfGX3ow6kOvQNJgZHpnnzvF
         FWbQfK8KuSu9LWM1QZyd6uCIrhja4Y/y3XPc/g+P4FxJwERhcMptBoMl3Xb/l+rYfkJh
         8rebEvtWe+YSg431tnavm1SWe+NxnNWr/h9TNjHOIcf+Fj+ppVEv6ttuw9iIYwaoBIu5
         4SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
        b=vz2SCrHiWWtYGqnkJuEJYa5ps8v/skSLO9dPOZGZin5KXJexbwZkWYBGAQfQrNJjFz
         mEzDT8s7WDGpTtKzM5EdxtMxLP/zSiFVSkuywjq3L+FKv1ntWI5IwC7VEt7wBNLhSx76
         KvTQv/ZDaNF/7TqW6IOabKwevKyuFn+93J3y8MyAra09ds8ENDUwcJWMz5BH7MA96s/D
         qgLKHcCUyEhi/C+7YU8WIITw5wZL6EsJazxDdjol/P0p7wOiZ+e7sodvM76d2HPWKgsg
         c4arTOfLnjvR1aNVET6pNgUEegSMj5aorYh2U91HIJerkB6xyVWWcY8oTjpR+j+/NhOg
         4nMw==
X-Gm-Message-State: AOAM5312xcXwS8L5wRwjyz110yvkjM5hIA9ck9CnGrQ+aMR5W+/aWPPI
        MJPGX5S0nWlDzs4LJndPDaJPDKvg/xJ3gyL7hO4o1Q==
X-Google-Smtp-Source: ABdhPJzz71U22o77PPLCWll4LOjtW5ov17NvyPyylFN9GoUFs7JpXdQIQhFptHaspJJWWce0ytJssabLtNao3p4Y8No=
X-Received: by 2002:a05:6214:3e1:b0:461:f0b1:6b12 with SMTP id
 cf1-20020a05621403e100b00461f0b16b12mr18964358qvb.122.1653345900868; Mon, 23
 May 2022 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-6-marijn.suijten@somainline.org> <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
In-Reply-To: <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:44:49 +0300
Message-ID: <CAA8EJpqB4wAZo_EVX9dgTvAyX7yqTUUPNeEUsG58nckdDKxr-A@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/msm/dsi_phy_28nm_8960: Replace parent names with
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
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 May 2022 at 01:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 24 May 2022 at 00:38, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > parent_hw pointers are easier to manage and cheaper to use than
> > repeatedly formatting the parent name and subsequently leaving the clk
> > framework to perform lookups based on that name.
>
> Can you please add a followup patch (or a preface one) removing the
> rest of devm_kzalloc()'ed clock names.

Argh, stupid me, you did that in the next patch. Please ignore this.

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
