Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DF5C47094
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 16:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F73461362
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 16:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhFJQh5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 12:37:57 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34551 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJQh4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 12:37:56 -0400
Received: by mail-oi1-f178.google.com with SMTP id u11so2763396oiv.1;
        Thu, 10 Jun 2021 09:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9ax835iY3Fv7YvJJqM1vnVxu3UyKUpAzW1nQQIubecU=;
        b=krlPxM0ZBTrjKI9CKlo5Ocqtw0q37VE9NSjI3h+Mdp48t4EehvHUhDI1tdZA845eW8
         ZPql2pJO5Tf1yWTp5YhzBmyF4z+8KkipV/gqB05+/5xA0attC+y9m50u4bWRjcAJJ0Di
         vY68Qt0Soh+nSGf2bLbiWLctkKf7sgxC5zjhfipvpGGtSLVS2Uh0YbZHK3+WKkl6VuAC
         Quv6uFm3ctssPlv1eMmlML246ctKZy3Ut9jiE0MbtrM+Fv7CUSSkB9tfOWf1LP1ihPj5
         axAyKu11irh/nchxUAiNw4kYfAgcv7BQ5geA5u5+PNXILCT0ZmfMdhCCFDwIWHJu90vK
         hpyA==
X-Gm-Message-State: AOAM532h9a9h07fST3sRGRBx3juBsKb5PoLST0hwio+jjRt7t3yV8LIV
        SpWm2cYtjNTiiWjiCgRPOA==
X-Google-Smtp-Source: ABdhPJxD9ZYlWHHYVoXO+zmfjEvIuWUpPH31JCI51UEw/VY0yNHhP/uSpMlyB18vV42ntslbMUrc1g==
X-Received: by 2002:aca:ac47:: with SMTP id v68mr4060272oie.160.1623342943207;
        Thu, 10 Jun 2021 09:35:43 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id x7sm631221ooc.23.2021.06.10.09.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:35:41 -0700 (PDT)
Received: (nullmailer pid 1932709 invoked by uid 1000);
        Thu, 10 Jun 2021 16:35:38 -0000
Date:   Thu, 10 Jun 2021 11:35:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, jamipkettunen@somainline.org,
        angelogioacchino.delregno@somainline.org,
        konrad.dybcio@somainline.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        marijn.suijten@somainline.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document
 SM6125 GCC driver
Message-ID: <20210610163538.GA1932655@robh.at.kernel.org>
References: <20210605121040.282053-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605121040.282053-1-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 05 Jun 2021 14:10:37 +0200, Martin Botka wrote:
> Document the newly added SM6125 GCC driver.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description.
> Changes in V3:
> Use rpmcc.h instead of rpmh.h
> Changes in V4:
> Fix indentation
> License
>  .../bindings/clock/qcom,gcc-sm6125.yaml       |  72 ++++++
>  include/dt-bindings/clock/qcom,gcc-sm6125.h   | 240 ++++++++++++++++++
>  2 files changed, 312 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6125.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
