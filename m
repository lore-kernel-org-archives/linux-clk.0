Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0837C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 17:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351651AbiFURBm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351259AbiFURBl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 13:01:41 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63DA28E07
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:01:39 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id c83so10590971qke.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndYFg9yJFFsm+MchCSau+vce/mgo6x0ybmLOESsjBAU=;
        b=FGvOHsGGUGmDXbxdMzvu/CDu6NuiY5QvnTnk1/HR+gu1fNI5L26/9Wo9ifp221Wh3p
         wfKeopgo8ivR4mjQrM6YDmsy1kMjzCfUFIwYUgKPQjrdrOPWt9bn7KPMvrD2eyl5s8hJ
         CpVAFnNGoovLlcunn8PvM7fh49U2rQjSWLgpBzQGubxFdDFwUxuXzHM7R3eWIDrFAXte
         gliH8epLnJYwan5t2e4UUIuk68H9+WuoTE/X2nkFAS37sKR2kismFsaFDQ8rhVkXJpwe
         SHd0pNYbEBN3++NazBy5etqW1jy9y427VaLEReT1YH4C1QcTwkolxF4z00aJV2EVQfkr
         au+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndYFg9yJFFsm+MchCSau+vce/mgo6x0ybmLOESsjBAU=;
        b=ItRNhYPeiiRLxsRlTQWcjGP720MjY9A4ltsoLIgjLF42xZIQh32F+v95u2X52qgcb5
         5E18bggxGU8ur3PdGJPwAnxea0XudlyfXli941xzb1ax9mAc+mMdqDJ8qeHZb5n+qvna
         ZFb4HKduwHD4LWrqy9QIp+A0wIuEeieOrNUl3e/HE94qzIx/aI26FKC0DluzVQGlExb7
         RVJOqqMSApUuL5GsmNwVHS0JZi73vG/EksTBe6c0tGq1wMRrimtPM9lw/atTu2sXh1Xp
         zfKb36mXoK3uj5XfZjlR/QB2X0tWYOE+GNJVvi43+wJmNMrX+LWZrK43Vj0XC+8SZ56Y
         0DWA==
X-Gm-Message-State: AJIora8YOY0RueDuU1bBnr4eA0T4cHzHxyeO60yufWNk5z6HNw8Rl6kY
        jbgbpQTm/sBqdrlLi1Scq5vSvE1OwR5AxvYjagbcBg==
X-Google-Smtp-Source: AGRyM1uXAP09+bwhOkQRsesIc4uC3aUOpDDew+bAcVuvJA0BtGFIEUAl8yeVqSD68KuR3Bs6PmzCsdahWfCGU4Cb8tM=
X-Received: by 2002:a37:a83:0:b0:6a6:7e4d:41dc with SMTP id
 125-20020a370a83000000b006a67e4d41dcmr20646327qkk.59.1655830897913; Tue, 21
 Jun 2022 10:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220621160621.24415-1-y.oudjana@protonmail.com> <20220621160621.24415-2-y.oudjana@protonmail.com>
In-Reply-To: <20220621160621.24415-2-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:01:27 +0300
Message-ID: <CAA8EJpqHBRHw4+0-P-KAT4JnAHkXUwTdXM9j2d-n66B3Yr+A+w@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: qcom: msm8996-cpu: Rename DIV_2_INDEX to SMUX_INDEX
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
> The parent at this index is the secondary mux, which can connect
> not only to primary PLL/2 but also to XO. Rename the index to SMUX_INDEX
> to better reflect the parent.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


-- 
With best wishes
Dmitry
