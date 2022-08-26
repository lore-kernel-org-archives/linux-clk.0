Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE264ECAAD4
	for <linux-clk@archiver.kernel.org>; Fri, 26 Aug 2022 13:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343514AbiHZNYm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Aug 2022 09:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbiHZNYk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 09:24:40 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AB8D91C4
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id pm13so1631061pjb.5
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8uro9lCtd8NysvGK5k23aKGMiWT4gKBsxfPGfZl+NlA=;
        b=kjxwALsGfWTCbe2l1vkHQBL3j35YlKcw35ucXtgz0QMLFOjuSypqGHqNLINeThA57o
         qO7TP9d6neZQ3cqm9niRZ5bt7VzumI/G/PfFat4wEkdPfLGaSpMioVPpqQuYOCZdA5fH
         ZtCApZqPVjN7gaVRKA/vy0Yez0Psh0S1b0MvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8uro9lCtd8NysvGK5k23aKGMiWT4gKBsxfPGfZl+NlA=;
        b=hnTfpAmjn9O5K4ThCSgma//HX7oL8WC8Y4AFFGVhH8mMYeced7YXFyLcMYfIIt5IrP
         eDTyFyGpXslI7BMovDgGGUVy158X4aqE26ke/Lonq+bf63E9Mvb9rG8zzPRIBWALht7j
         oZltegyip8ch8H1jSU+biqgl+ZdXKWenfwaX+djNyEVw7Lg2gRBdd6iHie8RWX37Zrtl
         WbXpD9FuluKtHskHC2wnwHg5aFQU8+38FzXzBtUWD4mudBjNi6T5iPxFbZY9F1X398eC
         nSLwk3KDdOeMlImEOPUYV7hWyTtTUq6k0tHOG79gdxJs9uYLR5xueVELq7/TzwWylOag
         F+EA==
X-Gm-Message-State: ACgBeo3HRE5u4pxq3jFALACKj3wcg0FJcfFDHhGwf2dt5DDmFtMRNdpj
        AHbhIKhpnBQsy34nnedhYJJ0nA==
X-Google-Smtp-Source: AA6agR4sB1kkKQdyVoGlQybrFcgwDdq7voFZ0KhqW4H2B3UTW/x4fLxfd2zY6RFsZ4KdFacdB8Zwtg==
X-Received: by 2002:a17:903:230d:b0:174:45bb:f576 with SMTP id d13-20020a170903230d00b0017445bbf576mr1205200plh.86.1661520279211;
        Fri, 26 Aug 2022 06:24:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:2a3c:773f:ac25:a127])
        by smtp.gmail.com with UTF8SMTPSA id p22-20020a170902a41600b00172c8b5df10sm1534927plq.208.2022.08.26.06.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 06:24:38 -0700 (PDT)
Date:   Fri, 26 Aug 2022 06:24:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sc7280: Keep USB GDSC power domains
 on when USB wakeup is enabled
Message-ID: <YwjJlRE1qRskZi/y@google.com>
References: <20220822115246.1.I45235b7c40997bc2abf813e4722b4dcdd6aecf6b@changeid>
 <20220822115246.2.If09027f73daa6e1ed95f5eab02326b543c67132e@changeid>
 <YwS3FCOqIeajMEgz@hovoldconsulting.com>
 <YwUDjaG6n95Ddij2@google.com>
 <YwXlsK3pjK/q1xwO@hovoldconsulting.com>
 <Ywf02oIXEL8G/Heo@google.com>
 <YwjFD9uHnSxoZHvT@google.com>
 <YwjGpSXOscDwbvQH@hovoldconsulting.com>
 <YwjIadKu0Wv2+VDk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwjIadKu0Wv2+VDk@google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 26, 2022 at 06:19:37AM -0700, Matthias Kaehlcke wrote:
> On Fri, Aug 26, 2022 at 03:12:05PM +0200, Johan Hovold wrote:
> > On Fri, Aug 26, 2022 at 06:05:19AM -0700, Matthias Kaehlcke wrote:
> > > On Thu, Aug 25, 2022 at 03:16:58PM -0700, Matthias Kaehlcke wrote:
> > > > On Wed, Aug 24, 2022 at 10:47:44AM +0200, Johan Hovold wrote:
> > 
> > > > > The wakeup setting doesn't seem to have anything to do with the genpd
> > > > > issues on sc8280xp and the controller doesn't resume properly regardless
> > > > > of whether the PHYs have been disabled or not during suspend unless the
> > > > > PD is left on.
> > > > 
> > > > I'm essentially seeing the same. USB is hosed after resume unless the PD
> > > > is left on.
> > > > 
> > > > On Chrome OS we currently work around that with a version of commit
> > > > d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller
> > > > status") which was reverted upstream. I'm not sure whether USB worked after
> > > > resume before we enabled wakeup support. I would have sworn it did, but we
> > > > landed an old version of the wakeup patches a long time ago, so my
> > > > memory might be failing me.
> > > 
> > > I need to remind myself that keeping the GDSC on is only needed when the PHYs
> > > are kept on. The PHYs were always off before wakeup support was added, which
> > > is why USB wasn't broken after suspend in the pre-wakeup days.
> > 
> > Ok, so to be clear: if you disable wakeup with my patches applied so
> > that the PD is actually turned off, USB still resumes with only
> > GENPD_FLAG_ACTIVE_WAKEUP set?

Actually without GENPD_FLAG_ACTIVE_WAKEUP

> > That is, you don't need to set ALWAYS_ON as I do with sc8280xp?
> 
> Correct
> 
> The USB controller isn't entirely happy:
> 
> [   23.062936] xhci-hcd xhci-hcd.13.auto: xHC error in resume, USBSTS 0x411, Reinit
> 
> but USB still works.
