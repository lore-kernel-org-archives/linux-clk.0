Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FD0C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 08:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbiCAIXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 03:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiCAIXR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 03:23:17 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154DB26F2
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 00:22:37 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id p12-20020a05683019cc00b005af1442c9e9so11578934otp.13
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 00:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tosKASypLvVXrNr25i9iVdhZeYDT2gXwfp+eHTQoEEc=;
        b=q7IePSd4ZDSr0rC4WaQs2Hck81KsTkOAuEkmg5frbLPNtN1TTPLDw/H8Soa5pgoLaE
         v/JgEr6qOQlPpKQi+w+ayfXsksZm1suQ83beh/Kl0E5clZouPyyi+pLNcD8uWfFfc7lF
         mxb8FDo5WuKX5JfGVkgqcS+smWNAS/fraJZ47zfgjfH2nA5sjpVQpW14+xvOkynO5fHe
         epIWggk+xHt/AKTVqrVuKAQ2ihuaqYt6H8W1/bZQsmhM9nU0TvTqKlhE6X6RxfOKBX8C
         qmtVBoeh+1NfS9uGnBIzwrW87uBmO94rs5s24d7ny0n+h7eqT8udkU9eV7AIyIqYVWOz
         4KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tosKASypLvVXrNr25i9iVdhZeYDT2gXwfp+eHTQoEEc=;
        b=tnuS+Ly0viet/P92M6n7u1ZLWiLP0TizBctpHrhlROr1dXVUY6hCBicFPzNbi2Pseb
         3ShctvIcX6dgjYlRqQbGpPCcGmeB+9APHUFcrM9bffsnITyn8f9353qc9FIeBsYCI2QE
         XEWx1H7lp/yRx/52BhYHggeJNkYtEnexHJgMECt/CObPtP6pp6XC72XbOpMjGI5vHsbE
         OVP7iOgmi0t/P5SyIQFb1gROqSYvOLpXMI24lpyV4l6HQESounRvUDNnJ5/jps16Ytro
         etRRuaV55DLjNxlR7Vl5NTsbHpuF16h9JanX9LX66g+bj64s/j6613YGj2cG9eJDyVgW
         tFRw==
X-Gm-Message-State: AOAM531uEOrCosjvtQat/6JNOChwkQ3EpHUsH542lQEnkHoUhs0i3f46
        WPjeIs50CYP9LC7apCmNTJKQ2aP9fQ+P469aPaLt1g==
X-Google-Smtp-Source: ABdhPJySTn/ilMv7viVUZTUp94aI8GCiZqiF//jp/oGXCWlvdQoeAbndmnnwQeAkYwB9DYHC69sSdgfPNU5WpkzDfmQ=
X-Received: by 2002:a05:6830:314c:b0:5af:dc8a:d066 with SMTP id
 c12-20020a056830314c00b005afdc8ad066mr9037959ots.28.1646122956336; Tue, 01
 Mar 2022 00:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
 <20220126221725.710167-8-bhupesh.sharma@linaro.org> <CAA8EJpqVP=E8GkO_BYBdPD6k84SDDD7cWduSf4yhG3M9VmbBLw@mail.gmail.com>
In-Reply-To: <CAA8EJpqVP=E8GkO_BYBdPD6k84SDDD7cWduSf4yhG3M9VmbBLw@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 1 Mar 2022 13:52:25 +0530
Message-ID: <CAH=2Ntw5m9zfb4xfySYx71QgdmJwkAgtQ8B1=jXu19GQ84b+rg@mail.gmail.com>
Subject: Re: [PATCH 7/8] clk: qcom: gcc-sm8150: use runtime PM for the clock controller
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

Sorry for the late reply.

On Thu, 27 Jan 2022 at 04:04, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 27 Jan 2022 at 01:19, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > On sm8150 emac clk registers are powered up by the GDSC power
> > domain. Use runtime PM calls to make sure that required power domain is
> > powered on while we access clock controller's registers.
> >
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-sm8150.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > index ada755ad55f7..2e71afed81fd 100644
> > --- a/drivers/clk/qcom/gcc-sm8150.c
> > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/bitops.h>
> >  #include <linux/err.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> > @@ -3792,19 +3793,41 @@ static const struct of_device_id gcc_sm8150_match_table[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, gcc_sm8150_match_table);
> >
> > +static void gcc_sm8150_pm_runtime_disable(void *data)
> > +{
> > +       pm_runtime_disable(data);
> > +}
> > +
> >  static int gcc_sm8150_probe(struct platform_device *pdev)
> >  {
> >         struct regmap *regmap;
> > +       int ret;
> > +
> > +       pm_runtime_enable(&pdev->dev);
> > +
> > +       ret = devm_add_action_or_reset(&pdev->dev, gcc_sm8150_pm_runtime_disable, &pdev->dev);
> > +       if (ret)
> > +               return ret;
>
> Please use devm_pm_runtime_enable() instead.

Sure, I will fix it in v2.

Thanks,
Bhupesh

> > +
> > +       ret = pm_runtime_resume_and_get(&pdev->dev);
> > +       if (ret)
> > +               return ret;
> >
> >         regmap = qcom_cc_map(pdev, &gcc_sm8150_desc);
> > -       if (IS_ERR(regmap))
> > +       if (IS_ERR(regmap)) {
> > +               pm_runtime_put(&pdev->dev);
> >                 return PTR_ERR(regmap);
> > +       }
> >
> >         /* Disable the GPLL0 active input to NPU and GPU via MISC registers */
> >         regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> >         regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
> >
> > -       return qcom_cc_really_probe(pdev, &gcc_sm8150_desc, regmap);
> > +       ret = qcom_cc_really_probe(pdev, &gcc_sm8150_desc, regmap);
> > +
> > +       pm_runtime_put(&pdev->dev);
> > +
> > +       return ret;
> >  }
> >
> >  static struct platform_driver gcc_sm8150_driver = {
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
