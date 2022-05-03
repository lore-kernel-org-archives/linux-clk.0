Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DFAC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 17:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240656AbiECRvi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 13:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240645AbiECRvi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 13:51:38 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9289327B14
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 10:48:04 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i38so32302308ybj.13
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=947aJh+pEr7uhg5BlGb1rh+bcGKYp8loqMrGOoU6w+4=;
        b=pOThmmz3gT39SJAqdfBILVMTCusmdZvvKsw9+CzaPlDdFRIo2Ft4figC5DBltX3RrB
         yPKSy8haYbn6qrNUA6/llov9aUz7WTayVoZIfgJePmVMqOjK+O3cW/GojkgJf6zydMeQ
         0o9kzWF9HFgze8tfygDe9vcXWhTYS6VNJaTVEkhB6y4Cg6FnBDc45OZZ49vSXdLn2u32
         rSm28eYdGBykW9luNRSiqDg2m1v/i8dF5/sXuuMqaz8fjzfpSxvdWs9AUGDteyOxZriE
         3/mEoJlldELZj9fS79bosJyDogCKhFE7cmFvZehjRVgiISUlUZoSyMuKX+GCz61UxAdA
         HW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=947aJh+pEr7uhg5BlGb1rh+bcGKYp8loqMrGOoU6w+4=;
        b=pbxlghoqcfzBGdxGIPIl0NStHLHQDfvGb3YBESDojlTvz3YSLN+Z9wmNJ1X2f/FsiM
         v3ccJoSUubDtNDtN2USr/9RAIblOENE70LQI6EXE9rkc7bcVzXdDaEUtD4fwPvSsP1Hj
         RoEN8kuV23IXfaicnMlfqFIisyEv4q8Du4rmu7QKhntrlmuOGAAENbtJar0ze7R5F/99
         9SQMY6v535ppsFSjQxDAKF/ZOxpGwLfmoJA5DlS5z476sNyxh85QIjUXpWLySirdFZiH
         g+9YnHSbquYWNw/JZesHrCQ06iEaCh0oUla3AeOnTygX8CJglWdSWx+/5bCfX6ikBF1m
         WI4Q==
X-Gm-Message-State: AOAM532W4yHDmxOj0nIJfrUovMvOwEcuOgwwEOF3ZLWAwnE51OaPwu0d
        ZpsFJ5PNtLacMq3tNxNUVkeid1Z3S7FWYG4xYWXiuA==
X-Google-Smtp-Source: ABdhPJzm0YF1sjSAAUj4xHDlO7MHxP4AMo9zj4md3lb8ZyaxQHD1hXlwpadeStLd+hwdUUADfHcnsqYtnekDKXX7NY4=
X-Received: by 2002:a25:cfd7:0:b0:648:4e70:a98 with SMTP id
 f206-20020a25cfd7000000b006484e700a98mr15208721ybg.368.1651600083819; Tue, 03
 May 2022 10:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220503130448.520470-1-robert.foss@linaro.org>
 <20220503130448.520470-7-robert.foss@linaro.org> <YnFlzOxrjrfBaaSs@builder.lan>
In-Reply-To: <YnFlzOxrjrfBaaSs@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 May 2022 19:47:53 +0200
Message-ID: <CAG3jFytoV=nAzp8YQmHO6ypEYFy02i1nxAxfodaDuFRzX0UnGA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 3 May 2022 at 19:26, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
>
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
> > bindings. Update the documentation with the new compatible.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> This is missing your S-o-b as well.

Ack
