Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A280C13
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721299667; cv=none; b=p1LErcMBftUg2fCoT3uXDrZ2AwTMcurzsxIoL+65Hn6yCkfmNKYdWasJZREXEsJXzLeDDmCFI30Ct49JyQzhu0ZOHHzhooHZJ/XgniewaDqCRa+8CmSHAwsOIF9KD+WaL5Ipv8wEoW9PZux0/sSNjwFb8rBpKTFe7XWFhJ0/Oxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721299667; c=relaxed/simple;
	bh=3Y9BAwgP6XIa5xXGWechvJ9kadSZY/VGXziZ+qs5Pxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaXmC8pUMXuV2jljdAiYEPHfgddEK+/JV9J1iWRvtgXH0oVuHiAHYdLEsMS7FFfMMNBG2bMK1QTTn/v98/dVhpiKBgc0ZoPxgiHn1xKR4kDDHmCmYNw0+DtQh91cmnerhKkESCh6Or2ALMPYDP8vTzJ72xR+oSEeInrhKuWKYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZnm6wK8; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZnm6wK8"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfef5980a69so669856276.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721299665; x=1721904465; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOSrVvddOVQwstUiTu6OLUeFA5g05GRy+eeuqUuQXsU=;
        b=eZnm6wK8/pUp2ZQnjHhmUD7MqyBfT8ClOiUXIWuYwS03lBOlIEVLfn/pW1vklEa5HZ
         IkGJ1u1wXUcErw0V+koEGIk9rGUVVG3WaZ0RwN0X5dX1kUE5ec/nfoKcMg1iaUMMVJN7
         X/RmIvBxTlqo/jYLsAQPTdVuAP2I+i2JGfN8IoYYmG/6xnSpmmUVRHVEF9LHfbP+LG+M
         KvXkU6uN8pAKQQva8vuuBsUmFbeoxD+/CwbYDNmTxl3q3pxkWsfY89VQLswKXNTgSyGV
         XTarAB3Br/ABkiF7cr4flfdr1X4O9AjFVSMxPDKRi/V0mDsWVl3nPEOETVzZ/IOmEPSp
         moWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721299665; x=1721904465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOSrVvddOVQwstUiTu6OLUeFA5g05GRy+eeuqUuQXsU=;
        b=GCNYAi4IVqywXb8RRSwNZWv3dIdkJdqcCV+DWc8T4S6NLdcZEblo8IVeQLTwh5vapd
         ybDpAaNx+mUhLzPvdFMh19BykVzYuPo25XeXEpOF+oixc6iyTqw0CfeUpgIPGotzwSp8
         rgVngTA6zN6vVCdQYGI7JsGVnUUIC8ztYGbobvGu9HsAEYXd9ITa7ckPEhG11aQPl6N8
         7LiPBPlNmuhf3VaIigDKnv2Lov5mo+jAAl6cyEzf4OJnxYTpS7j3+HRbizVvw8diOqOj
         yAC8OxWC6+MiyuUHGn0NlBPysxikThZjtszsiBSF8msr220yWvn7GrRWOHFBW0P9euMp
         QM1A==
X-Forwarded-Encrypted: i=1; AJvYcCVADIBqONo/MwIw6+VeTBQwh1D5ZEZAVDnjReIrKlN1on79Al1cGTvxaWxUP08d2AvFt0F3i4yV2kw/e1NBMV1WyhdcMnCa7Es7
X-Gm-Message-State: AOJu0YwSudVcNxFbGAct2x9ft02Dj8gfIa0hAsf7OdV9MBodTrq1xqR8
	w88ZKfKOqQNh5c/RYVaC4keDs8qAABO58ceqXLpsNM9oNjpsLocvsTq44wMgviWwlAtXvHL7BAm
	fzV7qG4yEQ1JWuyFLtq0Xant7ryHAcy3daqg8TQ==
X-Google-Smtp-Source: AGHT+IFbyLrhB20glSUg6tXgypStDYxGdybrHC3+jKDTj9v1v//cKeiq2dPFheABaKMOTeT6gcjOht+w9bcejT3MEwY=
X-Received: by 2002:a05:6902:72b:b0:e03:52c6:b338 with SMTP id
 3f1490d57ef6-e05ed6e6e7fmr4979440276.19.1721299664718; Thu, 18 Jul 2024
 03:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711113239.3063546-1-quic_varada@quicinc.com>
 <20240711113239.3063546-4-quic_varada@quicinc.com> <iwdennlw4njxefulw5e2wofu4pylep65el4hiiso6xqmoaq5fb@i4hrltrn2o6z>
 <ZpjxobF6LZMMN8A9@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZpjxobF6LZMMN8A9@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 13:47:32 +0300
Message-ID: <CAA8EJpqHrgi-AvfxGxwph0MEs0=ALV_7XWoUcSgGTG3vVj62FA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: qcom: ipq5332: Use icc-clk for enabling NoC
 related clocks
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jul 2024 at 13:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Sat, Jul 13, 2024 at 07:21:29PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 11, 2024 at 05:02:38PM GMT, Varadarajan Narayanan wrote:
> > > Use the icc-clk framework to enable few clocks to be able to
> > > create paths and use the peripherals connected on those NoCs.
> > >
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq5332.c | 36 +++++++++++++++++++++++++++++-----
> > >  1 file changed, 31 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> > > index f98591148a97..6d7672cae0f7 100644
> > > --- a/drivers/clk/qcom/gcc-ipq5332.c
> > > +++ b/drivers/clk/qcom/gcc-ipq5332.c
> > > @@ -4,12 +4,14 @@
> > >   */
> > >
> > >  #include <linux/clk-provider.h>
> > > +#include <linux/interconnect-provider.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/regmap.h>
> > >
> > >  #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> > > +#include <dt-bindings/interconnect/qcom,ipq5332.h>
> > >
> > >  #include "clk-alpha-pll.h"
> > >  #include "clk-branch.h"
> > > @@ -131,12 +133,14 @@ static struct clk_alpha_pll gpll4_main = {
> > >                      * (will be added soon), so the clock framework
> > >                      * disables this source. But some of the clocks
> > >                      * initialized by boot loaders uses this source. So we
> > > -                    * need to keep this clock ON. Add the
> > > -                    * CLK_IGNORE_UNUSED flag so the clock will not be
> > > -                    * disabled. Once the consumer in kernel is added, we
> > > -                    * can get rid of this flag.
> > > +                    * need to keep this clock ON.
> > > +                    *
> > > +                    * After initial bootup, when the ICC framework turns
> > > +                    * off unused paths, as part of the icc-clk dependencies
> > > +                    * this clock gets disabled resulting in a hang. Marking
> > > +                    * it as critical to ensure it is not turned off.
> >
> > Previous comment was pretty clear: there are missing consumers, the flag
> > will be removed once they are added. Current comment doesn't make sense.
> > What is the reason for the device hang if we have all the consumers in
> > place?
>
> Earlier, since there were no consumers for this clock, it got
> disabled via clk_disable_unused() and CLK_IGNORE_UNUSED helped
> prevent that.
>
> Now, since this clk is getting used indirectly via icc-clk
> framework, it doesn't qualify for being disabled by
> clk_disable_unused(). However, when icc_sync_state is called, if
> it sees there are no consumers for a path and that path gets
> disabled, the relevant clocks get disabled and eventually this
> clock also gets disabled. To avoid this have changed 'flags' from
> CLK_IGNORE_UNUSED -> CLK_IS_CRITICAL.

You don't seem to be answering my question: "What is the reason for
the device hang if we have all the consumers in place?"
Could you please answer it rather than describing the CCF / icc-clk behaviour?

Are there any actual consumers for GPLL4 at this point? If not, why do
you want to keep it running? Usually all PLLs are shut down when there
are no consumers and then restarted when required. This is the
expected and correct behaviour.

-- 
With best wishes
Dmitry
