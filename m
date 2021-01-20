Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3F1C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 16:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D32233F9
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 16:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391409AbhATQWx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 11:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403876AbhATQVO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 11:21:14 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABD8C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 08:20:34 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s15so12766330plr.9
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 08:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cRKedHZD4eQd4YutMVRkvvYFpo5E79xcV0d35RU4DKE=;
        b=tMRsDwdM2AL2jqj+gv2iqJMEhTJRRzQEsTI6NwNp/PsKyl2dFfsVvGWLiak44FAsHR
         rRtjrYE/+DvQ7MLsesV8llOWlxkItubFUXlRrSC9LLP4Wj3Ta5s9wWOydHLrestFCSvP
         L/0N0111LisRF4JX2S7tQsndrJcfYAwDgHyid0/vh+Ux0M4HBi8x4NhnOInb2/lWDeOA
         t9cQHFSRKzvkyvictDOaby54khjlTKHjmv8GhuhgRcDjb58CAnf45DMoRnc5diYij+Xn
         D17ToApYnM/1OHDaGyxtOsgpZ6nyn8vZ6t4WNlQGPsIc+z7c4+BslU1PVnBMQm/03+vT
         UM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cRKedHZD4eQd4YutMVRkvvYFpo5E79xcV0d35RU4DKE=;
        b=GOcAduXLRl91MdbTqC6TT7U8Vz5fNYWXZix0+4nCsSYDUaejVDL9pvCIxqXSK8Ew/w
         94jUB/V1E8djWvmGQXD/PDNU44vdzcsl6VZ73wyHt9RQVM7SlokDln7nDTI4dSBJHlB+
         KJ1spRc0Zf25FoRfeKCMkFxqCUL5V/cReFtNYLaQq8JWcbB00s2CPKZuvy8TQFKH+v3f
         9T36aIDIQYoBGIs6Av/yPS4tWph+EP0E3i4i047YFAp0Z7HMVK6dKQONyY5F/KZ7ydFl
         aKKlgN7IpedyvT6aagZ13rOY4jIkSYE+PJEdzE34FooPSSA1jqmsUJy/ahkkETC34V+F
         B03g==
X-Gm-Message-State: AOAM5314iGA1tM5O7ly0jVcnZ0W2dvAQ8TLrWB6OQ+yXNI6YfvEcALA6
        yhu1BN2uii2odZ8XzNcbdfLb
X-Google-Smtp-Source: ABdhPJzF+19oudVJqy1cqnehphkReFwLuVjvpXl1jxFMDn7okWClCz7xrwAHD3KkDPFCIK7RLkYrjg==
X-Received: by 2002:a17:902:7596:b029:da:b7a3:cdd0 with SMTP id j22-20020a1709027596b02900dab7a3cdd0mr10336255pll.14.1611159633964;
        Wed, 20 Jan 2021 08:20:33 -0800 (PST)
Received: from thinkpad ([2409:4072:409:c713:3d52:1d51:c724:155d])
        by smtp.gmail.com with ESMTPSA id n15sm2972057pgl.31.2021.01.20.08.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 08:20:32 -0800 (PST)
Date:   Wed, 20 Jan 2021 21:50:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org,
        jassisinghbrar@gmail.com, viresh.kumar@linaro.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Message-ID: <20210120162021.GA54606@thinkpad>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
 <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
 <20210120155018.GA213895@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120155018.GA213895@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 20, 2021 at 09:50:18AM -0600, Rob Herring wrote:
> On Mon, 18 Jan 2021 09:41:54 +0530, Manivannan Sadhasivam wrote:
> > Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
> > platforms like SDX55.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Oops! Sorry, I missed your review for this patch:

Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Mani
