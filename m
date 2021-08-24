Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE53C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 16:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C5DC61183
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 16:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhHXQq2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 12:46:28 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34618 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhHXQq2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 12:46:28 -0400
Received: by mail-ot1-f51.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso42686317otp.1;
        Tue, 24 Aug 2021 09:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HTNrEdHfu/JVsa4/oS2zca6zG8eXisDO5m0wWvyc+xQ=;
        b=BZtJWqUYn3OKgPO9bHDHkqCSyLSncQSPu0satsYs51UvOgnN58LHzYFpR8g5UNXmGr
         l19b8u59xUMkLNd5JNf+roEDssNVvwbt3A6n31rNX1yweS8wI3zApHXiJhzlwsb3yxz2
         ympqTZs7BB2Z2gYg66vUOv6cWK5r9ydKsoiys9+mrxQprAW4QbA1l9xa+Xg4WuDO4XL8
         /h9Wsm2m/DObkHE1z+rAsxiBz0ahydBCigwUKNPGdpCoW5L2YrOhDPK8PlVKHbxJypYE
         OdegGq4HCo0w3xK4mt0yv3eY5iaX7iATDcZB64zx/VkiM+VgeH7DKj0qz0co2Psj5hgf
         Jm2w==
X-Gm-Message-State: AOAM533M5hj7Ka5Pwn1OUNzw4xi8Fvt8kR6DQ9INbsm2Gl9Xgq1RYu6M
        MB72mqmJNQM14nMGjjuXoQ==
X-Google-Smtp-Source: ABdhPJwaqdnE9tf4A6lBcKSURs78vjFAi3N58TLUm6sBDMimVaeRILpmxROvjVJc8UHiw3yjS5iOzg==
X-Received: by 2002:aca:afc3:: with SMTP id y186mr3333067oie.65.1629823543508;
        Tue, 24 Aug 2021 09:45:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j17sm4636725ots.10.2021.08.24.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:45:42 -0700 (PDT)
Received: (nullmailer pid 604978 invoked by uid 1000);
        Tue, 24 Aug 2021 16:45:41 -0000
Date:   Tue, 24 Aug 2021 11:45:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        marijn.suijten@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        angelogioacchino.delregno@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add SM6350 GCC clock bindings
Message-ID: <YSUiNaVyPkKFanJp@robh.at.kernel.org>
References: <20210820203624.232268-1-konrad.dybcio@somainline.org>
 <20210820203624.232268-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820203624.232268-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 20 Aug 2021 22:36:23 +0200, Konrad Dybcio wrote:
> Add device tree bindings for global clock controller on SM6350 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-sm6350.yaml       |  76 ++++++++
>  include/dt-bindings/clock/qcom,gcc-sm6350.h   | 178 ++++++++++++++++++
>  2 files changed, 254 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6350.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
