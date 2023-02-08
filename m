Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2332C636CC
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 06:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjBHGA3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBHGA3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 01:00:29 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0141334013
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 22:00:27 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j1so11501627pjd.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 22:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ztoiwGD6RJS6Txdk3XGI+dyccn5nnjrRCwGLAobyU6g=;
        b=DURHjXktjxin8YsroWoKDMUZkiUP+scaYcgX5CL5hgDdsbuCjwjv9ZgAESOHiQPkk5
         tJ66CP9ArzMUd9qvWhiGuUIf+bBdCBHmZCeku1Jh6gU7/Rh5abxAVvd7YzqXg/dPvqtk
         6PzrDODh0rHlm+cO+S7sCXYF1CpmRt1UlOwgiO7JM8n+MgEdL71O+K19rkv/u37TebPK
         /JWk69ZmEb074mOoGxY9nU2TWLVmHvMmqk78gLnUFrOoa6THczZwvHEjuv2juWbVRqaL
         b3akRAChJ26PC8B5i0wlSfguhyFzNJ9sagBnH+zhuabFiahkgfZGcH15hUawWc9hCjVS
         m+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztoiwGD6RJS6Txdk3XGI+dyccn5nnjrRCwGLAobyU6g=;
        b=celyF/rQFDe0u2rK0mCia3ZK8zBoEOzchv4G5LTcz0cF5fhnJNUIDOfjdM+9zGuXrh
         hq3GUn8Dg0aSskAnQ85148LingPvhqVuItYSCH5tkKPfei4Munyz9iowDGfXFQ3m/jC1
         8u6zPgOEFZE2t2DufDVBsERYh8sZCiNRakRUCO6nWlBmqg4QzMcDavOI7K6ESfUMOP0A
         GwmD7jyrrO4Xyezd8IBeWniBmnoVYH8xzgnMIKZNzgOJgCEpCPIx0aqnlCPhn8zmqJbo
         9nsGdPLHnENnK0BcYCsMEpl3AGjT79j0KHlgef+c5CsUcz83cPa+G38ounG2G8YM0pyV
         ++7A==
X-Gm-Message-State: AO0yUKXFH7yeM5nuHQKjwFP27r6XNPzifAxKaNjveX89i9nBMlNHAk/J
        8tCuU0wMmC/7/eqbRlOYJrkPHssYdfdOWdUyNCVyiw==
X-Google-Smtp-Source: AK7set/VRrgd4QCHyJolP6QjarOKPn0A5NKTSdaShXD/9PzEWWeMK6jDrOwzFwcpznRp3yrq4O6um7vjGUQaw4G/58M=
X-Received: by 2002:a17:90a:5a0e:b0:22c:2f61:72b9 with SMTP id
 b14-20020a17090a5a0e00b0022c2f6172b9mr400241pjd.105.1675836027417; Tue, 07
 Feb 2023 22:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
 <20230203060924.8257-6-semen.protsenko@linaro.org> <03eeacfb-22ff-8224-30d7-6c187b179fd7@linaro.org>
In-Reply-To: <03eeacfb-22ff-8224-30d7-6c187b179fd7@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 8 Feb 2023 00:00:36 -0600
Message-ID: <CAPLW+4kqJP9LK3_i30QEzz9y2PiutbYDrwbOaRJ5wQnPRjDvNg@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: samsung: Extract parent clock enabling to common function
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 3 Feb 2023 at 03:14, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/02/2023 07:09, Sam Protsenko wrote:
> > Extract parent clock enabling from exynos_arm64_register_cmu() to
> > dedicated function. No functional change.
> >
> > No functional change.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-exynos-arm64.c | 53 +++++++++++++++++---------
> >  1 file changed, 36 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> > index b921b9a1134a..361663223a24 100644
> > --- a/drivers/clk/samsung/clk-exynos-arm64.c
> > +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> > @@ -56,6 +56,41 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
> >       iounmap(reg_base);
> >  }
> >
> > +/**
> > + * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
> > + *
> > + * @dev:     Device object; may be NULL if this function is not being
> > + *           called from platform driver probe function
> > + * @np:              CMU device tree node
> > + * @cmu:     CMU data
> > + *
> > + * Keep CMU parent clock running (needed for CMU registers access).
> > + *
> > + * Return: 0 on success or negative error code on failure.
> > + */
> > +static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> > +             struct device_node *np, const struct samsung_cmu_info *cmu)
>
> Align the arguments.
>

In this particular case, if I align arguments to match the open
parentheses, the last argument declaration won't fit the 80 characters
limit. I know it's not a strict requirement anymore, but the whole
point of breaking the line is to kind of keep it short. So I suggest
keeping this one as is, if you don't have a strong opinion about it.

> > +{
> > +     struct clk *parent_clk;
> > +
> > +     if (!cmu->clk_name)
> > +             return 0;
> > +
> > +     if (dev)
> > +             parent_clk = clk_get(dev, cmu->clk_name);
> > +     else
> > +             parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> > +
> > +     if (IS_ERR(parent_clk)) {
> > +             pr_err("%s: could not find bus clock %s; err = %ld\n",
> > +                    __func__, cmu->clk_name, PTR_ERR(parent_clk));
> > +             return PTR_ERR(parent_clk);
> > +     }
> > +
> > +     clk_prepare_enable(parent_clk);
> > +     return 0;
>
> You do not check the return value in exynos_arm64_register_cmu() below,
> so either make it a void or add the check.
>

Thanks, will add the check in v2.

>
> Best regards,
> Krzysztof
>
