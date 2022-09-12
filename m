Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2F1C6FA83
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 13:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiILNcY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 09:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiILNcX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 09:32:23 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C609422B38
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 06:32:18 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id f131so12765443ybf.7
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WvP/x+fCZxYCMiNOMMw6Im5i56naXzsqIQAk9GCt+2c=;
        b=N5Yc8JvZu0ZC1+InYD0uhXoRkbBXkfd9RS4qb8IqrlfR146XTCBR9WjqAXpXsfnBUX
         etqPpV6vNrXg1tjEayXCP/Ks/qdgFiFS3LQ/UHlY2Pz/UMuDbZ6C4WMHKPJCUhdwtXY3
         ogk6oBVpUP4bsK9XOcGrgF/gbeIcCq6fk2dYC0OEE3g0pg1xpjOJCjjBxFkDNxrfcjJ0
         k22J30ZwZIWttJo6XPbQKb2/Vo/PXUs/9X7dxST0rI4NS0CI3lXoNXREXs4Pv8LdusQq
         cRtcNzZBqdG5b7uCKRNVDI3tEbO7VWXDW79iCOT9MGGl3LH7nB6lHOp1PqH6V++K9nsz
         jd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WvP/x+fCZxYCMiNOMMw6Im5i56naXzsqIQAk9GCt+2c=;
        b=jkRTuJT43ELvpB10jko32mySqxku/KCYknoQylBzNfzyD7fRurgd2aaR2OUOOoJ/5B
         DDHv3hiqejPuyRZscOfZ3UtvOZac4LoBSGYbuQo8Kja2tBsh4qxMmeS1cARYRH24hgQJ
         JU8t9JrpRjdkv0BvqUMCHIqL00qHwYXHJE1X0oFF148mI/RZdoAUZ0T95SEqMnRHHQLd
         SFnFGfZnXS9BP57800PEJvezQmMdx2VKpCv7l6be/T3fRrgrrXUE+SnbBlrW4q+SZFut
         JJqF++GtObEt1pqaCbtnyqd5CW3WDY+xG8eo3gCrHO60rL+puQbgfToLBf2bEUgCWnnX
         iUIg==
X-Gm-Message-State: ACgBeo2eeDJqzmRMEiKjlGCVplXFTLVagqPEdsMrxifiZSRA2QJWJwq7
        ndOeDnQcMlOV4cGgMmVKuuQ7f0iUQW2wufFoLg6aSQ==
X-Google-Smtp-Source: AA6agR6R+jK3kreNZKXAI1lHh3Mfck+8y0IA1Ml+8+hw5jJge/fH6yBe8CDqGJ8wEob4KZqomXaiJ+WGELAhXUgwYm0=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr23756170ybj.194.1662989537861; Mon, 12
 Sep 2022 06:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220910170207.1592220-1-danct12@riseup.net> <0a2bb48f-c67d-0544-5037-d02f658a3351@connolly.tech>
In-Reply-To: <0a2bb48f-c67d-0544-5037-d02f658a3351@connolly.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 12 Sep 2022 16:32:06 +0300
Message-ID: <CAA8EJpr4_G_uK5oj9Y0j_tE_LsnqDHKaU1D_nhXOiL0sA=aMnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: sm6115: Select QCOM_GDSC
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Dang Huynh <danct12@riseup.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 12 Sept 2022 at 16:17, Caleb Connolly <caleb@connolly.tech> wrote:
>
>
>
> On 10/09/2022 18:02, Dang Huynh wrote:
> > While working on the Fxtec Pro1X device, this error shows up with
> > my own minimal configuration:
> >
> > gcc-sm6115: probe of 1400000.clock-controller failed with error -38
> >
> > The clock driver depends on CONFIG_QCOM_GDSC and after enabling
> > that, the driver probes successfully.
> >
> > Signed-off-by: Dang Huynh <danct12@riseup.net>
> > ---
> >   drivers/clk/qcom/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 1cf1ef70e347..d566fbdebdf9 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -645,6 +645,7 @@ config SM_DISPCC_6350
> >
> >   config SM_GCC_6115
> >       tristate "SM6115 and SM4250 Global Clock Controller"
> > +     select QCOM_GDSC
>
>         depends on QCOM_GDSC

All other Qualcomm clock drivers select the GDSC if required, so I'd
tend to disagree.


-- 
With best wishes
Dmitry
