Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89FCC19425
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 23:56:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9498222224
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 23:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731393AbgLCX4z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 18:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbgLCX4z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2020 18:56:55 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B550EC061A4F
        for <linux-clk@vger.kernel.org>; Thu,  3 Dec 2020 15:56:14 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id s75so1141226oih.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Dec 2020 15:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tj/eqYhhAQcKhYafB9RPIyuN5cfJ1B/TPw46tE9Fbis=;
        b=Cv0f1XYlFWVeIv0CnpbmITuX9a/QfNIUokjvwnG1Y0tpB/b4WTNLEgsx2GqHYbwmbX
         bvhqEZ/ouLGsCDneKK0NjCs+MOlgw4gyuxVtxu5QAnpiqTh+ijsMRzYylX4ynJBTDsrU
         OzSOWrY03hNVSMfLHOQO9/r2RtcCwUrGj+SsK0GoABwDOaddcMNCUBqvhCuQIv+YlQxp
         hGlZhtQX2ph3prAyNeYbNocnwO1T2aIHyqwwAyZBYsn1RYBDDfQJ4TcRZgL9yLuPo8mF
         jO9f19aonKqQ35gSQu21U8SdFeMqcnNavI6kmjc1DwFFbg0PIJDPW5SZZMfbVA+2mOJq
         KnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tj/eqYhhAQcKhYafB9RPIyuN5cfJ1B/TPw46tE9Fbis=;
        b=LzT+Ds9VrXfmWuTo9PlrATQV4lWlZnf5Au1zm7KSpctH9iubG7qag+BDxGPWJfAy7g
         +Hum6L4vgnTLJ0BVaTjUT5f2iPy6zEDjvlINmW0PgxQxKuDpCjd8EXgeOFWp3ZlaHCnc
         iHrmuPiDDxJ6xKgnmsJNLwv5mThfZRBnSBkDODCA4PYljkTIqtAwA+vu5uVZYkjxx5br
         Vlgzp9V2Kpx/M5lLxVKZCriqhkJ+jW0PahLFJejakyx9eHw0hONXs3mev1pbFYB8aY+H
         0IEtYdhVZ2gSFpoCwxNsg1UILmIdqVcD37bNGPmfRDiY2l3eASAq6X7id87CO382xz9c
         GjlA==
X-Gm-Message-State: AOAM530vvK8WFQgd0R0eLGqaf4m3HJ9Pg6WigCH+2gjTm0sPDY87/yv/
        bwS6HXkIKB6qnyofXiPecSGxWg==
X-Google-Smtp-Source: ABdhPJzQPweT/buGuh+MWJkK+6cjezKR9RTV5x/u3ct6Fn8EYBV5akr7cubnndZ8rc/R3woJjd/r1w==
X-Received: by 2002:aca:728b:: with SMTP id p133mr1227521oic.125.1607039774149;
        Thu, 03 Dec 2020 15:56:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j16sm268488oot.24.2020.12.03.15.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:56:13 -0800 (PST)
Date:   Thu, 3 Dec 2020 17:56:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add RPMHCC bindings for SM8350
Message-ID: <X8l7Gwekn2UHO/2z@builder.lan>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203070241.2648874-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:

> Add bindings and update documentation for clock rpmh driver on SM8350.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index a46a3a799a70..3037eb98c810 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - qcom,sdm845-rpmh-clk
>        - qcom,sm8150-rpmh-clk
>        - qcom,sm8250-rpmh-clk
> +      - qcom,sm8350-rpmh-clk
>  
>    clocks:
>      maxItems: 1
> -- 
> 2.26.2
> 
