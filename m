Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F32C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 12:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C81C161285
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 12:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238860AbhERMnI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 08:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244002AbhERMnH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 08:43:07 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704AAC061756
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 05:41:49 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s19so5045257pfe.8
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 05:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPV3K26dvdjDa+ECWwQHCEA6qNfiJm2G6Q+0tfcH888=;
        b=Tt+B6a2rdcAX4dIBAi4uk2CUSsO2+nNbX68xBKA/UwZ/MJWld7KBHa4qubivIbumT7
         7KyEpxYTSDxfUEfxljz1Plbi3NG+6Yd+hcCi3fMuJxMThhHqbPDpIsk/h5YFd798KNNK
         coFJS6+qRap0isyl969mzL4PAuf6a0wF01wQfRLe2cI/DL2r6gREon5VvLO5XebqFXi7
         O7hgogVqkEKxzGI1eGEgoqgqKWBonlS7eypSqh1HpzJwwTnbi+FhhWb9/LSrEYU75dvh
         W/O+ghJVjlZqH32eZtFeh2fYNxKFaJVKLZGSEKJX1FSM42bfAwAyidMQEGNwMRkWmjp0
         p0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPV3K26dvdjDa+ECWwQHCEA6qNfiJm2G6Q+0tfcH888=;
        b=YcN8oA0OykSrUfHeDoGwO3tQRCK0OH+2CR2Rc7y/GqJ+3VnFFNS2tBr8KNqcoLTZYf
         LXGQK3NLjWabLVyMbdbDYs55pgdzuhtA3VXLAP8BX5DrUBkmV6VQpK/J1GI9swXIyB+h
         kU1rzwc1ks8J7eoKGpQdx3AYZcSWy3XjpjFx98ep2ffNoTIU7XMUCt01Ml6/msVwK3WU
         nOiPMk1AUyXaJbws/KY+AeFyuYdjlm8CUZKUtQsOj4wsWazFxA5LqWF7ehC6GcXSCI+1
         p+hOS/wWN+ikYrHKxYvrn9LdytuL7j/yIkfPXanVGjDLnaCQAW28haAOolyfW3LUfUsh
         rN9A==
X-Gm-Message-State: AOAM531owPl+w2F5BSXsnJAW/eFYu/ZzvhVTXUno+LbuNL8H+Cz2Pxnq
        ucWhAg75Bzf8E+oI7lfwjTtMZU2kspt9X1PS1oDtLQ==
X-Google-Smtp-Source: ABdhPJxW4B3qGcX6cEKCQ8WUmerHMrOS7cH3Pbc8td72A61NZ0Ff/irZw3kjZJK3b/Y2W7YuGFdpv0vOztLdp0Wo+/A=
X-Received: by 2002:a62:6544:0:b029:261:14cc:b11d with SMTP id
 z65-20020a6265440000b029026114ccb11dmr5120874pfb.12.1621341708972; Tue, 18
 May 2021 05:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210513175258.5842-1-jonathan@marek.ca> <20210513175258.5842-4-jonathan@marek.ca>
 <CAG3jFys=aCJOnP11EC_PK-KBJxMksT78McKb6pLTHuBxhU2qdg@mail.gmail.com> <aea11d40-a5df-d3b5-195b-d790c5df400e@marek.ca>
In-Reply-To: <aea11d40-a5df-d3b5-195b-d790c5df400e@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 May 2021 14:41:37 +0200
Message-ID: <CAG3jFyuXpruLb265w5j0gfv81byaRsGVfiiyqB3RhJNmz9dnJw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: Add camera clock controller driver for SM8250
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> >
> >> +}
> >> +
> >> +static struct platform_driver cam_cc_sm8250_driver = {
> >> +       .probe = cam_cc_sm8250_probe,
> >> +       .driver = {
> >> +               .name = "cam_cc-sm8250",
> >
> > Maybe conforming with the naming scheme of "sdm845-camcc" is the
> > better way to go.
> >
>
> On the other hand there is cam_cc-sc7180. But it doesn't matter either
> way, I will change it.
>

Ah, I only looked at sdm845 for prior art. Either is fine then.

With this fixed & Vinods feedback, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
