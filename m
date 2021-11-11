Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C3C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Nov 2021 09:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1741610FC
	for <linux-clk@archiver.kernel.org>; Thu, 11 Nov 2021 09:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhKKJmW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhKKJmV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Nov 2021 04:42:21 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD40C061766
        for <linux-clk@vger.kernel.org>; Thu, 11 Nov 2021 01:39:33 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id x131so5112803pfc.12
        for <linux-clk@vger.kernel.org>; Thu, 11 Nov 2021 01:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=66upB9UJ5ORHzEAep2tUlnqy1cpQgTaUpFgQyeQM7dY=;
        b=Wxr7X2sp8eKvGoz48TQ3IPxhQ4Nu4qygPiKKqgo/aBbYYKpRnesfp4LYCwK/FVA7Yg
         TNZpOd5bktb1ZqkACJg7/ZFcYdX1nUmV3jytP7u3PO1NVb6clMa5glMjZQZMv+zxsOO/
         wzoVAqSgGL6mYeRDOsmoTvAyBF805kCYy/3M+vODNYbYejue/H3siQtugQeerSxyF3f3
         aFY1RWd4cmkpm753WxZYuZnDzCt6O+V0ee7xtjkxWjTyroWGBg7/At6f6+RWOh+OlldX
         IyLzsvXZTQ+fGNLJiqZ1p3U3IOHuUfWeMzklXPXDCgtDv38Gg2TGDBka519DDBuedEt3
         Mztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=66upB9UJ5ORHzEAep2tUlnqy1cpQgTaUpFgQyeQM7dY=;
        b=Xw9jp6xI8bnNx3+GOMnSknrQUJ76u9dsiJFJTDvGNwMq+2r/FPDCmehYPZzt0LZ9/S
         uRx2iml+PhZBPJHTPZRKt5Dl5gLpoL5sn4KZrxT7gLB3+d6gt7jbVYHQSxIEKdHMn3dl
         +YI3m54OQxFl546Mw1F3VmZAAxfGpHJvh7a7+7J1B6sZyaC4Y2ogGHCdDC2wU6H5pbBe
         /OHrkDmMoUGxOgS1XRwrnWWS6N/6TtakVMkmcimjXFBY5FkbS7G/j97ZLsTTpkmed1Zl
         oxHq8wld1VP6PYl00XSHHJIZhNnUAl7gG+ya9goAmDwZegVlDbfVKNpyBWET2D+vH7mW
         NNwA==
X-Gm-Message-State: AOAM531nwb5cEEIZgyrDEm6Kb6hOT+A/5uiwo14zN6b1w+XcjLIjrkF2
        rsNo0dLoiRVJWg930XLfLyS2CA==
X-Google-Smtp-Source: ABdhPJzAwF3ghBkf4IoJKTXb1HRcavwwixJemxah5ku3wC3cgiH64Pc9/2YwwSLt4r0ZQ06AB8sp+A==
X-Received: by 2002:a05:6a00:1a94:b0:49f:f5b4:5d17 with SMTP id e20-20020a056a001a9400b0049ff5b45d17mr5328492pfv.55.1636623572688;
        Thu, 11 Nov 2021 01:39:32 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t4sm2435282pfj.166.2021.11.11.01.39.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Nov 2021 01:39:32 -0800 (PST)
Date:   Thu, 11 Nov 2021 17:39:27 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <20211111093926.GL7231@dragon>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
 <20211110131507.GJ7231@dragon>
 <YYvNmrSeJNCE4BEC@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYvNmrSeJNCE4BEC@ripper>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 10, 2021 at 05:48:10AM -0800, Bjorn Andersson wrote:
> > IMHO, properly reporting enable state to framework is definitely the
> > right thing to do, and should have been done from day one.
> > 
> 
> I always thought is_enabled() should reflect the hardware state - in
> particular for clk_summary. The particular concern being that by
> initializing the is_enabled() state to either true or false, we're
> making an assumption about the hardware state. And if something where to
> do if (enabled) disable (or if (disabled) enable), we might skip a
> critical operation just because we tricked the logic.

That's probably why clk_smd_rpm_handoff() is called.  As there is no way
to query RPM for resource state, we send enable request for all RPM
clocks to get hardware and software state in sync.

> So, do you need it for anything other than clk_disable_unused()?

Not critical, but I need it for debugfs clk_summary as well.

Shawn
