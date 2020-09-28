Return-Path: <SRS0=4QiE=DF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CC5C4741F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Sep 2020 19:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E45E92080A
	for <linux-clk@archiver.kernel.org>; Mon, 28 Sep 2020 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601319671;
	bh=M6Y4fSnDVJNeZYDnOQ6/nXZXMhWe7Ywm/Q7G12HjPno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EZjVS2SFhx1IinmoTHHW11DSIG3g4eknE7Yh0Iw3zyR/cJ1vTJCrYxajRHLWUNnSS
	 jzu5eqt8Xf09D9MWo6NS6KCv42Tw9EL+5LQQkUUoArZbLeFU4F7Zka/vH90p5izIpy
	 O7qITymaZRY2qFv7XEo2EcjwuvqEyMA2iILDjoBE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgI1TBH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Sep 2020 15:01:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40522 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgI1TBH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Sep 2020 15:01:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id c2so2013547otp.7;
        Mon, 28 Sep 2020 12:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WgnCQKTMXx7N/UN6VH5x1OiQeugabXar2vJySfL7Bm8=;
        b=ZOqIhQeZSjn/lnZfbm3cKeUSE6UF8LRwNgelz+knQ28rnGvFuBPjrCZR5PODhzdeTr
         nJjxJBfAL/hRaMwQWRngoI2B71x3yCgIZFeopO1uBNkCtdL0sVQav8YrSD7heV0ku7Tn
         ZfoMJlAbHmy1zCu/i+m/Hrfvdtwo3Q6rxq5JS2d92XjJr4lfbkShrQc09vTvho419p2T
         Odio4cxJEUXL5Bu7smYSddxzUlfQLXcRXw2EOe9SZaXe/O2HVm+DzfU3WpKVaTZK1+uo
         hkhRHSlBmwhXhzXJXijzDchxpJlOzCHwItoY8taBp/es9cCotwfhrrAHX2jDYghch/Vm
         gMKg==
X-Gm-Message-State: AOAM530tvPW3h9MICCRN6UYo4kyzUQf4GUfh/vDAKGLJ19EgbeLs41t5
        lnzJOWChTandSWuFT8iPyg==
X-Google-Smtp-Source: ABdhPJzZ/EaAcIsv4NBpGeCoeK3Os0/QZX6oIoH1ZPejwWHDSFI2XdZkY8EraHXV2uULn7xgsTxkIQ==
X-Received: by 2002:a9d:77d3:: with SMTP id w19mr313113otl.44.1601319666093;
        Mon, 28 Sep 2020 12:01:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o9sm2269765oop.1.2020.09.28.12.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 12:01:05 -0700 (PDT)
Received: (nullmailer pid 3082393 invoked by uid 1000);
        Mon, 28 Sep 2020 19:01:04 -0000
Date:   Mon, 28 Sep 2020 14:01:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add QCOM SM8150 and SM8250
 display clock bindings
Message-ID: <20200928190104.GA3082359@bogus>
References: <20200927190653.13876-1-jonathan@marek.ca>
 <20200927190653.13876-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927190653.13876-2-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 27 Sep 2020 15:06:50 -0400, Jonathan Marek wrote:
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM8150 and SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
> ---
>  .../bindings/clock/qcom,dispcc-sm8x50.yaml    | 93 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm8150.h    |  1 +
>  .../dt-bindings/clock/qcom,dispcc-sm8250.h    | 66 +++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
>  create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8150.h
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
