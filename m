Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF87C2D0A3
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 19:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3125206D8
	for <linux-clk@archiver.kernel.org>; Mon,  9 Nov 2020 19:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730072AbgKITyK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Nov 2020 14:54:10 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34694 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729838AbgKITyK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Nov 2020 14:54:10 -0500
Received: by mail-ot1-f68.google.com with SMTP id j14so10183911ots.1;
        Mon, 09 Nov 2020 11:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8O9QZwnoTH1sHNp0t6dbzN2STxMDbg5AU9z886DPekA=;
        b=f+dn+2WT/2LoyO+ITkHip3Kd8erDC/wTqkLnt8I8L55XTgXqAapHpRSf+/nLxUgUo4
         PfLWVSsUrl49WfnLOiY4NaCdhezuwjRjsfVMOUPEBvU8ZLUUy/83JMI43oge7m/h6d8Z
         /BFJkiZr2DuSb7rxde3ygQ5uq8NwVMJcbVBOHjHY3uonaE7xqc8aIa4zi6OUvcaoPaJT
         ols9yyqiuoQiY6cxthBM1kRif4G/HXeUuWLXxggZGMotd64O18Y0XyzqCPTYF76l3WSY
         r9dPRM8NADff6d9tzDV1k6GcddwfIV9I+54kFgj5f2qXAOAhrCT7ldm2sU8I48/OqO3i
         Pr1A==
X-Gm-Message-State: AOAM531RuiC7SiYEhyQEV1ifr0lJaCCKxoiInMJqj8/y9q+DDQI4unem
        15CZPhoGllt0fjTIKixW0g==
X-Google-Smtp-Source: ABdhPJwW4Xx7EN235MfSKtSGujYm6B6CIFBr0U/I/ouhrI2oghktv6JoROsC4heVOjQ0+1X04iL8lw==
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr11626741otq.208.1604951649586;
        Mon, 09 Nov 2020 11:54:09 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v8sm1310582ooh.6.2020.11.09.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:54:08 -0800 (PST)
Received: (nullmailer pid 1661754 invoked by uid 1000);
        Mon, 09 Nov 2020 19:54:07 -0000
Date:   Mon, 9 Nov 2020 13:54:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        bjorn.andersson@linaro.org, sboyd@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
Message-ID: <20201109195407.GA1661703@bogus>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105104817.15715-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 05 Nov 2020 16:18:14 +0530, Manivannan Sadhasivam wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add device tree bindings for global clock controller on SDX55 SoCs.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-sdx55.yaml        |  71 +++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdx55.h    | 112 ++++++++++++++++++
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
