Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2569DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 17:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbiFURDr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiFURDq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 13:03:46 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32B22C66C
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:03:43 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id q4so9188836qvq.8
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=otHAQMGBki30O8G3WQ2qD0HC1niObfFAQ/YC4kJuOxM=;
        b=Ri86gshcJeKctBZlI05AbwORrhtBo/PXn8xiXVmdcE4c19v/tljvYnSqYqxmuz11rA
         GczySvWKSJTZ97Neva9xi4RX4b7UmYWYadlzQ5hcfyPfUtMBZkwQzwRVSeNUpTxmksQL
         XtUsDNB74r66Hm2rWvz+6/2Ccjt0WabnKaDET1whkfhSO7EFJMbdCCx7LGFm+Nd+AzI7
         T2N/A6Go1OPRzmxfdT2p5wix1FT3wBSDlVU0mhv1R77H+dyH3uIoutqGypVtDqNygTb8
         wn3z93IvtKdp6+NHn3Laz9DgVuKUionF+gsPYAJFPtwzWKhMtiHgoe83JqmNVMWGQ7Be
         ypDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otHAQMGBki30O8G3WQ2qD0HC1niObfFAQ/YC4kJuOxM=;
        b=Pm+CZ+XE+MpbTu2QYh5Fb+EO+n83cRCo0I/Mafe/1zdMXPBsyF/MepRZFlPT2Ypz9/
         pxyB5AYcieTS/rv9yKtM3SX/mOH0qUzbW6TsPeHnf7ktyrmHyqbxGtwgmWEv79Yz7GhC
         3vsMD6MEhRuMeMK0wEB1Cuf4ZCTBx24niufVn9MCKU3NTteTVyQqc6EeJNucWmLAsYYw
         fGHiHIBbo7qStohnKdj4ia3sWfB8+U60RfRzHdE1vfy95m3sd+B0fzSow0X3otdBERqr
         a18djz5A+KDyC4/wwK27wHlsk4LKuVf8RdEdbThxb3P7P5CQVuNgmlCTLaLh4FcVc60x
         Ef+A==
X-Gm-Message-State: AJIora83Whm1pfZU1F1oSrldrhp9Dry2fckgJl1iiYIhw0P5JXpmBD8A
        DvJLRwzsnWwtQEF8WLyYXnz5R73xelEKzy5bPpRNig==
X-Google-Smtp-Source: AGRyM1u6Sanhm8QCp8G4R0SmNtvWaO+gorH1OCF+HnrqyQOiBhlDLaiFQQGApf2HAFSXTErWbYPEoZA6tCMYCKLIbDQ=
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id
 r10-20020a05622a034a00b00304f25aecf0mr24825990qtw.62.1655831022984; Tue, 21
 Jun 2022 10:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220621160621.24415-1-y.oudjana@protonmail.com> <20220621160621.24415-4-y.oudjana@protonmail.com>
In-Reply-To: <20220621160621.24415-4-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:03:31 +0300
Message-ID: <CAA8EJpogcM6nRVwUysTOuDJJPpNi5z3n_GySsEdJkaew=nJZEw@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: qcom: msm8996-cpu: Unify cluster order
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Jun 2022 at 19:07, Yassine Oudjana <yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> The power cluster comes before the performance cluster. Make
> everything in the driver follow this order.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 36 ++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

-- 
With best wishes
Dmitry
