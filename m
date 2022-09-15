Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E2ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 15 Sep 2022 16:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiIOQnl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Sep 2022 12:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiIOQnk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Sep 2022 12:43:40 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE395E574
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 09:43:38 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n81so14946819iod.6
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ihRDwkA3/+uCxAKrHSmLGee9NmkEXol5SUJ6O91CNsQ=;
        b=ImI6oxn09GT5UW+MnR4ggV+ED5gD+svfD2kQMzQ4voej/W+eUfC3HFi6VBZwQXwecu
         voIEManlVi43NC/9tYTL0uTdZ1wEgFcoBx4a8ub3zfgvGaS5xc83X/EvtA6XpvC4raQg
         Z60mLYu8ZV4ww10k+iDFlynWBwENFebBhSxfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ihRDwkA3/+uCxAKrHSmLGee9NmkEXol5SUJ6O91CNsQ=;
        b=rGbEHr0J1Y5PM4uxbvG1lXs3t4Vd9mrm5Ec3gS+rX4SGNuI0f0QeOJ4rhRp6J5Jsvg
         f1rPW3dSLtjQ/tt4yA7eTrY8FQGFpZGdBwlCQco1rnod8g5NrLvZ4fyEvLsHMIgrKt+v
         ji7ickdBmrIVd1W0vRuEwoNxTNrr/RNAEgsn+xEWleC55kSp/CuWlGlmmo7sCikF4hsQ
         Za6Ly28zgCx2zs7mIyHgePZob7wQC428qJVX3McHHCvEVV9n/fG4G9SVmb3ZLqY6Rg/e
         UfKTnA0J62wa/a1irpXzqz9zE5oHW+QEWTvgw25uUBY4WDlONFfgWFMv3ZsgQLT6jKMb
         cC3A==
X-Gm-Message-State: ACrzQf13DrqwIwMTudM1RaY37bgx0/4jDhgJWXC76UK60leSnCXPP2vR
        BmIj5xX8XBsTYS68fFsf01wRWQ==
X-Google-Smtp-Source: AMsMyM4BvQTKE/r4PZSeJj2dgAk4gub8S4eTFG15BDPyb9u9/mTbJ8nnopamaoZaf8gPyzuWM8LMEQ==
X-Received: by 2002:a05:6638:19cf:b0:358:3dd3:2162 with SMTP id bi15-20020a05663819cf00b003583dd32162mr441054jab.185.1663260218045;
        Thu, 15 Sep 2022 09:43:38 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id cb6-20020a0566381b0600b00349cee4ef4asm1327397jab.62.2022.09.15.09.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 09:43:37 -0700 (PDT)
Date:   Thu, 15 Sep 2022 16:43:36 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     Johan Hovold <johan@kernel.org>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc7280: Update the .pwrsts for usb
 gdsc
Message-ID: <YyNWOJerkZcqgx5h@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
 <20220901101756.28164-3-quic_rjendra@quicinc.com>
 <YxDYJ+ONryLROBhL@google.com>
 <YyF+5CQqcLQlXvzV@hovoldconsulting.com>
 <YyJGNR33JbHxWWYD@google.com>
 <4490d181-7bf2-791c-1778-1102e9adbc25@quicinc.com>
 <f58077fd-3d12-4094-7d46-e49f25e16033@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f58077fd-3d12-4094-7d46-e49f25e16033@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 15, 2022 at 06:59:36PM +0530, Rajendra Nayak wrote:
> 
> On 9/15/2022 12:55 PM, Rajendra Nayak wrote:
> > 
> > 
> > On 9/15/2022 2:53 AM, Matthias Kaehlcke wrote:
> > > On Wed, Sep 14, 2022 at 09:12:36AM +0200, Johan Hovold wrote:
> > > > On Thu, Sep 01, 2022 at 09:04:55AM -0700, Matthias Kaehlcke wrote:
> > > > > On Thu, Sep 01, 2022 at 03:47:56PM +0530, Rajendra Nayak wrote:
> > > > > > USB on sc7280 cannot support wakeups from low power states
> > > > > > if the GDSC is turned OFF. Update the .pwrsts for usb GDSC so it
> > > > > > only transitions to RET in low power.
> > > > > > 
> > > > > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > > > 
> > > > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> > > > 
> > > > Did you confirm that you actually hit the retention state?
> > > 
> > > No, how would I do that?
> > > 
> > > > IIUC, this series is equivalent to using ALWAYS_ON unless CX is actually
> > > > powered off during suspend.
> > > 
> > > The count in /sys/kernel/debug/qcom_stats/cxsd increses with each suspend,
> > > however it also does that with the GDSC configured as ALWAYS_ON and with
> > > Rajendra's "arm64: dts: qcom: sc7280: Add required-opps for USB" [1], so
> > 
> > hmm, that's really not expected. With my above patch and with the GDSC as
> > ALWAYS_ON there is a cx vote in suspend preventing cxsd so the counter
> > should not go up.
> 
> Perhaps you are missing '1b771839: clk: qcom: gdsc: enable optional power domain support'
> in your tree?

Indeed, that patch was missing in our tree, thanks for the pointer!

With it the CXSD count does not increase when the GDSC is configured as
ALWAYS_ON.
