Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D05BC07E96
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 16:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED0DB61167
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 16:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhGOQUK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jul 2021 12:20:10 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:43674 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGOQUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jul 2021 12:20:10 -0400
Received: by mail-io1-f43.google.com with SMTP id k16so7094638ios.10;
        Thu, 15 Jul 2021 09:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z7CcHFJd8Dc8Q7gt3TULHvaNrygYyu/qfjQKbTK/pGo=;
        b=VBsUQnznksUYINkB/MTneRqhBjbooukIrciswHSU/oQPh+qCTyZyMxZDdcY8t4Y2ZS
         QnCyyghiR4rgeFk46pmpWB4tq/pRKfG+c9upt0ytRlap9hUpvGjS+R+UOBY3mfzHOlzd
         /KJga8Tf3uIlP03YMRoLx2NynyjXHtZGOXWTt64/tyJII9zqwUWbo7lyYtn/9Wk7OtOX
         jyTS40Igs1PkJYq7+oOuypNQtrP3y7RlYtleAvZM8RsTu75M1H2LCaW1MVJvkOI0+g5o
         E8cDdvKtdGvCALMRjswKW0G/jNQi53VMNiydgiA+pf34/9sZwxnvytZXDPdt7eWCON9T
         NFvw==
X-Gm-Message-State: AOAM533IOPmROtV+eFqce6YOaZk9/r4IxqLJXFWszfvtOUBFkEea2Cwv
        ylrGBF/rUnjrm9A1Pc3oQg==
X-Google-Smtp-Source: ABdhPJy0rnrYe/NjoB4WM5TZLWDo7IvG7jdTW7Q0l+CeKCTRHytn0b1bjJokTz4Dmic7pwbybNEpyA==
X-Received: by 2002:a02:3845:: with SMTP id v5mr4714003jae.119.1626365835980;
        Thu, 15 Jul 2021 09:17:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l18sm2399998ioc.13.2021.07.15.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:17:14 -0700 (PDT)
Received: (nullmailer pid 1178198 invoked by uid 1000);
        Thu, 15 Jul 2021 16:17:12 -0000
Date:   Thu, 15 Jul 2021 10:17:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx
 power domain
Message-ID: <20210715161712.GA1178143@robh.at.kernel.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
 <20210710013253.1134341-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710013253.1134341-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 10 Jul 2021 04:32:48 +0300, Dmitry Baryshkov wrote:
> On sm8250 dispcc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
