Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709EBC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 17:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240605AbiECRuq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 13:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbiECRup (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 13:50:45 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DEF2716A
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 10:47:12 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id s30so32336054ybi.8
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wH9AqNVAXAx+G8p70VLB9NLbw+BOxltF83VPYgsU5tU=;
        b=V6/QN94FhhxIxqe8YbyaOCHnphbTgJrBTkf0BsoQbw1QuH//ynFGSx01fnUpHsY+2f
         AKNPpBEP4ZaHDvIoEYvZUEdYNRB52cLValVbK5drg2y7PycdnKY0paVsWa/QPw+pqUvx
         y+CKExy99v2cxDrCvoO+IdjXElcDZkAEShcKYMjm6P8sQouiNjSJ/xnnJzSczk59X5vQ
         QvMmpELOhMPiNv6PmcZbys1gtAzlMXRVHA6YX/PXBivLKMoR0w/49P33V5fR2OBkg+Sz
         ACpuao1aCaguqwqD77zKnRE8J38NJSbtOTN0D6g5QhleEigk9WTLqcxvPvGwdG+cuxZB
         CEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wH9AqNVAXAx+G8p70VLB9NLbw+BOxltF83VPYgsU5tU=;
        b=SaQ+haigHlZwe0YeGzWuoLKHyBfrxbZ1i6nj/CLw31X4q+/emnte/ef0LEgd5oW0Ap
         DCVjj9wVVfLn2wl48UCdhX5wHsxGsoEKQksIoOu3vpHQBhCEnBELBEnSykoOAaxcEWuI
         lB+C18J9n45hT0VR3/hL4Vw11WBNkNgGUoAmJY/RH+OYLEZoF3ralpzgbHJmSyRKTDsM
         jhLel/bSutgJ7B9RIRwi5IZJCcZTe/hoAfeeLobhdNQDa9ImJbqnua6at6492k3g7w/v
         VXpbgZabBervyOSK4X8O3k0VQ3rpHGOzJkQL5IuzK5V+oMT0MJimhSMLo+ygzIB7xK4f
         yr3Q==
X-Gm-Message-State: AOAM530mxAtz8+fEozVWL5DGDK0ILrWcjP9evY5+Wdc6OX7ozHgWifV9
        fnAbUtrTYh3pFKqPdJLWYwn2AW9AW5Xxf9UCds1fOg==
X-Google-Smtp-Source: ABdhPJxyfn/UPn8JhbzCElu45EEVIRaxIOY63aN6mUJjop+zXdOGi1to9G+/0FjgUmEdeI2Q9N+4Q/+PJGB3nZtwMMM=
X-Received: by 2002:a5b:dcc:0:b0:628:d6d9:d4bc with SMTP id
 t12-20020a5b0dcc000000b00628d6d9d4bcmr14393804ybr.178.1651600031693; Tue, 03
 May 2022 10:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220503130448.520470-1-robert.foss@linaro.org>
 <20220503130448.520470-6-robert.foss@linaro.org> <YnFlnbPsf6oBf+A1@builder.lan>
In-Reply-To: <YnFlnbPsf6oBf+A1@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 May 2022 19:47:00 +0200
Message-ID: <CAG3jFyuuAxN7OXyN3q8=avvi-5xVBC2Toa2Y_42ssFgHnU3j8A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] clk: qcom: add support for SM8350 DISPCC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, anischal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 3 May 2022 at 19:25, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Tue 03 May 08:04 CDT 2022, Robert Foss wrote:
>
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add support to the SM8350 display clock controller by extending the SM8250
> > display clock controller, which is almost identical but has some minor
> > differences.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> You handled this patch, as such your S-o-b should be here as well.
>

Ack
