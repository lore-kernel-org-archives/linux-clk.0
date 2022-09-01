Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30649ECAAD3
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 16:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbiIAQES (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbiIAQER (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 12:04:17 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF268002C
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 09:04:16 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id bh13so16800541pgb.4
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=RDQJd9j02PpeO+3EPY7C48IcXhi9uoKh6VvJ2TfCav8=;
        b=g9DjNy8TNMKe/ABwxBesrDJThY9V75D1n7Bbs/8tKWBXoKanaaQ1m6zzBtNRAV2DHr
         hDiLVvSi2JcFW6ySrgprvUHHqdxmcXRISbooh8SYIZcctpFSbR3E+XsJ5GbO8iKll/lq
         UEs8vXbvIFhbkii85XgluJqzRCg3Z+EETuBCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RDQJd9j02PpeO+3EPY7C48IcXhi9uoKh6VvJ2TfCav8=;
        b=SmvikDlqrKzFh3RatUnIZnKu400mFMc6B6lXMWXuqRr8XZhX8NHl3PnQQ5pdvtTbhP
         1rJhGhGho41mt9SsFnc64QGZlTkfzT29wypmuiFpEWDTc+v3vQCIKIRjAo8MtEDzFIXK
         3C5TgH+Q4eFSFLO0Xr+oP5rViPqf2/IPxEVBZtA8col/xzN0xVHlpITqQp5bU1B7B1B9
         eQayQjBps2WsnpXMVhPeTPXagaUKqQuE3oeRmmrak2b/pO6y3REHNEZ4JIcH4KCl0Jf8
         A6HVEFJhG23HQee1/zYeflRSR9+pfIzLX0xpCx2YI8pR8ttpgFoGPpS3V84hgn4a0sm6
         vSfA==
X-Gm-Message-State: ACgBeo3UbhpUZY0zqvsRrGnwsYNLFh2T7lIcbn9bT2yL4rJc+Nm4VmFO
        gP07WNmKqjscTTBtbIDJO+GEuw==
X-Google-Smtp-Source: AA6agR68eEfnYD04bZhFsoCtosKppWER481lrGds4DIRviTTJ9jvG4lZzwEduwGrvPvunR+WCVteng==
X-Received: by 2002:aa7:8712:0:b0:537:db6d:af66 with SMTP id b18-20020aa78712000000b00537db6daf66mr28963796pfo.55.1662048256465;
        Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:34cd:3659:c11f:5d05])
        by smtp.gmail.com with UTF8SMTPSA id g1-20020a17090a708100b001fbb0f0b00fsm3520455pjk.35.2022.09.01.09.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:04:16 -0700 (PDT)
Date:   Thu, 1 Sep 2022 09:04:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sc7180: Update the .pwrsts for usb
 gdsc
Message-ID: <YxDX/idqLo/3FD9s@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
 <20220901101756.28164-2-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220901101756.28164-2-quic_rjendra@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 01, 2022 at 03:47:55PM +0530, Rajendra Nayak wrote:
> USB on sc7180 cannot support wakeups from low power states
> if the GDSC is turned OFF. Update the .pwrsts for usb GDSC so it
> only transitions to RET in low power.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
