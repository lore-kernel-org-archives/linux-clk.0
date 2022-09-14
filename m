Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1D3C6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 21:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiINVXG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 17:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiINVXF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 17:23:05 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C49861E9
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id 138so12412634iou.9
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=LIXlP1rfY2EhQ9T11PO6g9BCCdTts3DBlnC9m4eeMEc=;
        b=g+GFnQF5Dn86BDPhwGcmFY3IalM8SsjmzwYSoXYvsdyg9zzOSVvzT2QEjKfU97xvk5
         3oS4wPql1JZ2VeXkfe563tzYS024U2KbS+wOU2nNNUb0ITj6XGTpTZHNadTFNiTLJkHX
         13ap+3WC2XDSBdjF3MacvOI3yXQxEiOwJBPO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LIXlP1rfY2EhQ9T11PO6g9BCCdTts3DBlnC9m4eeMEc=;
        b=nsG7yKW//5oqmNjwrTslidrKLFpKuXfDYNO9PAFwsnq9zg/80qSlCv1sRJ8j2/aWtp
         OoPVGi4MclKlthM5xf24PyYzzbD/p/pSqPNgnI9Kvg8Nl/qPS7O/C2gdM4mrG6GDFgRI
         AF1kAM9WQx3W4m/p70rXL9Ityd2UWIDnKeVJ9osPuestocdjNik5+eeULZICa9Wsyieq
         sQgc63J/IETX0M6cIHCOv6/6NJVSm6C9y6A7oVq1mxw5T6ijc1gTakUZR/2pJg6/wXOp
         B3Lk1JhvyxfpbLcmCUIgMwOMZBQLbL1tyNCra9sQcYQCthOvXQBgvTgnUMm99VdpuKUN
         KmBQ==
X-Gm-Message-State: ACgBeo2j0AQuYOQJZ7i7hAaXvVl+bSNUufrJHOgLMRdvXHTgPtnzPTNo
        zHaFB/CkvtQcaNrNsKT0K48v9Q==
X-Google-Smtp-Source: AA6agR4l0z8vb27/FApSfdN8Ue3XNHhBUvJHkgplPQNM3zH0WUtp9KQ+YA3BSuJiV/el2bkFGOtNvw==
X-Received: by 2002:a05:6638:2607:b0:35a:4772:be26 with SMTP id m7-20020a056638260700b0035a4772be26mr7094923jat.267.1663190583105;
        Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id k2-20020a02a702000000b0034a5993e1b5sm146786jam.113.2022.09.14.14.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 14:23:02 -0700 (PDT)
Date:   Wed, 14 Sep 2022 21:23:01 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc7280: Update the .pwrsts for usb
 gdsc
Message-ID: <YyJGNR33JbHxWWYD@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
 <20220901101756.28164-3-quic_rjendra@quicinc.com>
 <YxDYJ+ONryLROBhL@google.com>
 <YyF+5CQqcLQlXvzV@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyF+5CQqcLQlXvzV@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 14, 2022 at 09:12:36AM +0200, Johan Hovold wrote:
> On Thu, Sep 01, 2022 at 09:04:55AM -0700, Matthias Kaehlcke wrote:
> > On Thu, Sep 01, 2022 at 03:47:56PM +0530, Rajendra Nayak wrote:
> > > USB on sc7280 cannot support wakeups from low power states
> > > if the GDSC is turned OFF. Update the .pwrsts for usb GDSC so it
> > > only transitions to RET in low power.
> > > 
> > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Did you confirm that you actually hit the retention state?

No, how would I do that?

> IIUC, this series is equivalent to using ALWAYS_ON unless CX is actually
> powered off during suspend.

The count in /sys/kernel/debug/qcom_stats/cxsd increses with each suspend,
however it also does that with the GDSC configured as ALWAYS_ON and with
Rajendra's "arm64: dts: qcom: sc7280: Add required-opps for USB" [1], so
I guess that isn't the correct signal.

https://patchwork.kernel.org/project/linux-arm-msm/patch/20220914053017.23617-1-quic_rjendra@quicinc.com/
