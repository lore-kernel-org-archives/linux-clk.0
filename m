Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF906C77B7F
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 08:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbjEKIPR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 04:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjEKIPM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 04:15:12 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDAF4273B
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 01:15:11 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6434e263962so6187418b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683792911; x=1686384911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rp7EFkkNki21M4em3B9Ihum6krhAGnms8qgXubiREro=;
        b=h+gqCuqCQRyHCxRU42CejzLIkultByUIbaaJbX5nR16x1aUqb4CQcyVDOecd+f1J8T
         3pW4jhqaoj42U60titZypVh3WNes4khWkBnI/OeeF/uuq/6pVr4/I2c4pYzM5irwfOEg
         xZgdATeavs5cocMD47jNWgC42bRzlEwB3M7FbCprbmhosndUhG2tcMSgmyv3jQG9nG8o
         g1wg1fkRLb23eE4rU9gX9vIsQTgVS+DgIwvYEiX4fhSc6gC2vZD4ho5d23K1zd+1fThK
         l5cklbXRte97vTSOEv7iI80FDnsLkucoQPKlUILSfCfWATagraXOizc2XoA2Do8n0816
         zDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683792911; x=1686384911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp7EFkkNki21M4em3B9Ihum6krhAGnms8qgXubiREro=;
        b=P+BottLm5w4IVm58tymScMnbbSzgQmkWfBJNE8Fc7Oe9Oqf5HFcwSvYTbaCqVhjAab
         YIffQeaEMAZlJUkYbJa4nD3lHcqyeETtn6CWVl6y0bCN7+yVhpnjSzP+x0Wg++Dqrmb/
         4R7mLL1Mffb/9IE4hr41XZrQ/qqzpY8dPl/BLEgh5cDTT+SkZ5AzLjlcLqfBUcc5DI8a
         VZXRP5PPsn/7Bv6M4lotVw3D9owUEY3gEzuk+xRpQUwglJzQHlIMZ/PAhKYEwovgkFq1
         0ONyguNF7Xu7TEBvjkC6yLoez4J+hRO0WQecLeWng0Gr1/C+x8c4nrzMb3ofsvsYH96h
         P+Qw==
X-Gm-Message-State: AC+VfDzDQhILB1umaBtibSqYsqf+kkfxYiOQa/upZfYmUy/8FsTd8QxH
        xkCXscJSkoUAerWxHBwHjKoC
X-Google-Smtp-Source: ACHHUZ6qP3kLWYF4y14EaOnQO9E9gvy90WM1bnsHzvO/XUZE+cJBJYRFg1DnII390waczWIR8TmyUw==
X-Received: by 2002:a05:6a20:4326:b0:100:b1b:2e6c with SMTP id h38-20020a056a20432600b001000b1b2e6cmr20418177pzk.52.1683792911189;
        Thu, 11 May 2023 01:15:11 -0700 (PDT)
Received: from thinkpad ([59.92.103.3])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a1c0100b0024e11f31012sm15493573pjs.5.2023.05.11.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 01:15:10 -0700 (PDT)
Date:   Thu, 11 May 2023 13:45:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Message-ID: <20230511081504.GA12021@thinkpad>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
 <20230509055044.GA4823@thinkpad>
 <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpoJr6gK=7fmwmF4+Xi5Ch_-+8L1q1WHkfVOOg+6qj=P3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 09, 2023 at 02:20:07PM +0300, Dmitry Baryshkov wrote:
> On Tue, 9 May 2023 at 08:50, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
> > > Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> > > The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> > > flags to PWRSTS_OFF_ON.
> > >
> >
> > What does "stop working" implies? Does it work during boot and randomly stopped
> > working or it stopped working after resume from suspend?
> 
> It stops working during the boot. I observed the MDP not starting up
> properly. Mea culpa, I did not look deep enough into the details, just
> stomped upon this change which fixes the problem for me.
> 

IIUC, GDSC will be transitioned to retention mode only if the parent domain goes
to low power mode. So if the MDSS GDSC goes to retention mode during boot, then
it suggests that the parent domain is not voted properly. Unless I misunderstood
something...

Or is the GDSC behavior changes between RPM and RPMh?

- Mani

> >
> > Even though reverting to non-retention mode works, I think the issue might be
> > somewhere else. Like the vote might be missing to get the GDSC out of retention
> > mode.
> 
> I don't think there is a vote missing. The driver votes on MDSS_GDSC
> before enabling access to any of the registers from the MDSS region.
> 
> >
> > - Mani
> >
> > > Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> > > index aa29c79fcd55..277ef0065aae 100644
> > > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > > @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
> > >       .pd = {
> > >               .name = "mdss",
> > >       },
> > > -     .pwrsts = PWRSTS_RET_ON,
> > > +     .pwrsts = PWRSTS_OFF_ON,
> > >  };
> > >
> > >  static struct gdsc camss_jpeg_gdsc = {
> > > --
> > > 2.39.2
> > >
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்
