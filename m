Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B5CC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 16:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbiECQ1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239523AbiECQ1S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 12:27:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2043D1E5
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 09:23:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id gj17-20020a17090b109100b001d8b390f77bso2720084pjb.1
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBkRzMAF2fmEnDOx5cm8C4yWv3/2n1bAuqgP0781Seo=;
        b=rwEXmlzY2KoxV8/zMOBhFvw5DlF20vRth0I3M6jTU1SBvoigzfwCSX0X/3TwY2FX2g
         cUK1K/5FcUA7Ds5MteSf/FmNEkvAmYM0Kd9Q7c+dLfOp55GMrUpz6uvxaFzw0EdNqNyI
         HIhMr8cPEAJly2++bk272jmYqqVUihy7jEA1ZeKD65Nh6jnDVbolLI22uffyumPkn8Ks
         zm4zXgSuKOzZI5I7zxUae+wyl3GCh7sfk2jLoiLjX526hGjIY5kayZiEhiSesv40gSnp
         rdilNPxeJBSUaNxrRchYjHVsOocXcNuzbPUPjZvJi3qsLrsReOcmcmgq/xg+G0nr8sAv
         BWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBkRzMAF2fmEnDOx5cm8C4yWv3/2n1bAuqgP0781Seo=;
        b=Mq1LRlSiinoAuNaXBeQ9ZSSSpg8GNBgxqXtU0OtyJl9gkEjZFWxFQrHvcGoDo7Kdir
         UKiTe+N9YcBjCDOQ09PtuCweOWmJ12IeDVlcZZBbK50LRXzCT/57sETlyw+tf44YudlW
         aggWUctZmuGbOeLvuCPRHaGDDPEmPEwsbfiU3u4UyRroMX/fQA6q/KhkrSKXlOPUttBo
         eieYopmXjUBjogiXcb/8Ld340AlptO23C9+b3yw0IueIjBk5vySUHngc2wxV41ZPJ6LF
         6w4nul/jWgKj9zS8DD+V0ynCA6SXlKFNhY1eeqZmWcBxXOU5QysiQt1quAbYF+bofSFV
         uJng==
X-Gm-Message-State: AOAM530O22WNqcdDNhLCvyglh++J/tcYyf1yK8A7IQsq9xBhRkNkuEf8
        WapnJuCHCmiHBsMdm9OeDiQHiXGYnKIiKYWpq2cIaQ==
X-Google-Smtp-Source: ABdhPJw39icUVJEDcTiertqWvLPqVUfip6kCDsWWoVMMdikQYdwVn01b80vuxcGqwl3p1a4PT4NkwLxO/a7Xy7YvTmk=
X-Received: by 2002:a17:90b:1e4e:b0:1dc:583c:398 with SMTP id
 pi14-20020a17090b1e4e00b001dc583c0398mr5517440pjb.232.1651595009809; Tue, 03
 May 2022 09:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220503130448.520470-1-robert.foss@linaro.org> <YnFDwUvFCgrH12zY@builder.lan>
In-Reply-To: <YnFDwUvFCgrH12zY@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 May 2022 18:23:18 +0200
Message-ID: <CAG3jFyvMFZbELm8eydGm4Fp+UYQq9SCSUnfF79Y6QvZe4guYDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: qcom: rcg2: Cache rate changes for parked RCGs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 3 May 2022 at 17:01, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
>
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > As GDSCs are turned on and off some associated clocks are momentarily
> > enabled for house keeping purposes. Failure to enable these clocks seems
> > to have been silently ignored in the past, but starting in SM8350 this
> > failure will prevent the GDSC to turn on.
> >
> > At least on SM8350 this operation will enable the RCG per the
> > configuration in CFG_REG. This means that the current model where the
> > current configuration is written back to CF_REG immediately after
> > parking the RCG doesn't work.
> >
> > Instead, keep track of the currently requested rate of the clock and
> > upon enabling the clock reapply the configuration per the saved rate.
> >
> > Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > Tested-by: Steev Klimaszewski <steev@kali.org>
> > ---
>
> This patch has been iterated since and the latest incarnation can be
> found on below link. A reference to that in the cover letter would be
> sufficient.
>
> https://lore.kernel.org/linux-arm-msm/20220426212136.1543984-1-bjorn.andersson@linaro.org/
>

Will do, thanks!
