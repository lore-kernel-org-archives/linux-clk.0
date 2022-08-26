Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDF6ECAAD5
	for <linux-clk@archiver.kernel.org>; Fri, 26 Aug 2022 15:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344461AbiHZPSt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Aug 2022 11:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344519AbiHZPSd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 11:18:33 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CDCE1A82
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 08:12:22 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f4so1636533pgc.12
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=H5aKhL0H5aovfWEQe3Yl5wVuG9Fmcah6YUsPGQ5/tTo=;
        b=ObkFWLkU/W6NS0S5cvTChiL+vaXssKRwVhvY3/BYrQfY1cdJLyW0tnc0OQwYCn1F69
         YiUJh5Q+5PGyeraq4IXMbPladtjkb4SaQHupeleX75BfSFJoPwgfvGs5Q05+MwmMrbZY
         lmcsLF2kpusabWR1QDZcwTMGPazOwTFykhkns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=H5aKhL0H5aovfWEQe3Yl5wVuG9Fmcah6YUsPGQ5/tTo=;
        b=7DevOmBIdMyqRXS1JRS4jqZAtZMqg7ZDLpGJgH54KfVL5X6Fz6colB0bE5cf0A9lTF
         3DI+o64Kl7Da58Ncd21hjSoj16lyJlDdGgNZBXqFlByTYlQFUgbOc+PIIgIh3QGEfFoq
         oEr24kEb4ReNJXmKIPYIFtBk+uESfGGJ5jRrtXVXeypzQJAdIoHDeWfz2PH1RixkHI2k
         N13aeobar2PG9HWfO6TVrzB9vcYVs5wi4cSVEgs78YPNAZPuwYT3eBGWerlx5ek+5PmO
         2D9bP8pwK+6K0VuRpq3t7tx0SHqW0htTcYfpcqCv95oV9/GjQuSc8N9mICVfzXffQVux
         mvSA==
X-Gm-Message-State: ACgBeo34bTtTIQ/vn9lnwopxZaGpKbU2RcBuNzT62Hu3CSesMFdGRk0S
        RrpWnKfzM6jWtZdZgoiChx1Xiw==
X-Google-Smtp-Source: AA6agR7+xrt0m5384+Ccc3VHL1pRSo4cUOcjmLxWOcQNAaTWUYuHpPMJVTEy9kJsVx50j1aSAMZBjA==
X-Received: by 2002:a05:6a00:1a89:b0:536:5dca:a673 with SMTP id e9-20020a056a001a8900b005365dcaa673mr4311507pfv.71.1661526732189;
        Fri, 26 Aug 2022 08:12:12 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:87ff:bd4c:214b:f283])
        by smtp.gmail.com with UTF8SMTPSA id z1-20020a17090a014100b001f1694dafb1sm1789508pje.44.2022.08.26.08.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 08:12:11 -0700 (PDT)
Date:   Fri, 26 Aug 2022 08:12:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-clk@vger.kernel.org,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sc7280: Keep the USB GDSCs always
 on
Message-ID: <YwjiyV3yeL7D1mQK@google.com>
References: <20220825182152.v2.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220825182152.v2.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwhzVlTZLMCAbZi7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwhzVlTZLMCAbZi7@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 26, 2022 at 09:16:38AM +0200, Johan Hovold wrote:
> On Thu, Aug 25, 2022 at 06:21:59PM -0700, Matthias Kaehlcke wrote:
> > When the GDSC is disabled during system suspend USB is broken on
> > sc7280 when the system resumes. Mark the GDSC as always on to
> > make sure USB still works after system suspend.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > 
> > Changes in v2:
> > - set the flags of the GDSC not of the GDSC power domain
> > - updated commit message
> > 
> >  drivers/clk/qcom/gcc-sc7280.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> > index 7ff64d4d5920..adef68d2cb0b 100644
> > --- a/drivers/clk/qcom/gcc-sc7280.c
> > +++ b/drivers/clk/qcom/gcc-sc7280.c
> 
> Perhaps you can add a comment here about why this is needed similar to
> what I did for sc8280xp:
> 
> 	https://lore.kernel.org/all/20220805121250.10347-3-johan+linaro@kernel.org/

From Bjorn's comment on the sc7180 patch it seems it's not an dwc3
implementation issue. IIUC the GDSCs should have a retention state
that would be used during suspend.

> > @@ -3127,7 +3127,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
> >  		.name = "gcc_usb30_prim_gdsc",
> >  	},
> >  	.pwrsts = PWRSTS_OFF_ON,
> > -	.flags = VOTABLE,
> > +	.flags = VOTABLE | ALWAYS_ON,
> >  };
> >  
> >  static struct gdsc gcc_usb30_sec_gdsc = {
> 
> Look good otherwise. For both patches:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Thanks!
