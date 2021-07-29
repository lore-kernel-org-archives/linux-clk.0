Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EF9C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 20:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1AED60F22
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 20:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhG2UH4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 16:07:56 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:34666 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhG2UHz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jul 2021 16:07:55 -0400
Received: by mail-io1-f49.google.com with SMTP id y200so8689053iof.1;
        Thu, 29 Jul 2021 13:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QO/WfzL+H9JSHCrFRmOhK3luO+OzS6BYWSjnCbIsHOY=;
        b=ogxLqITRbgHrNF3Qj0wf0XpEG/Sj/DA49AHBZ7iHvZlbKUkjlvMxHstS0tbxnDJrpc
         24OOZRRYIPfjru1gNaU1DyYG/ZcgBTgTwYp0b3lc5RsNew0KPOma3LSxi4w0T8T7ZLkr
         n+aE4KkIoBc+jmLeBCsYXoIE0hoYXysIwUPmUZ70MWEgYe3ASLHS/Gc4hwljvdNcd342
         AFaGIm6vtVuNrR3AjgLZUGH5veyxFXOT9jZYm/soNxTeWruVTJLC7+nBQFqFHCKKBkG5
         cmsnqfG05DoXKc4T/aMgkUWfGjhs0CdTeccmvsWplheboZqGd5Oz0OZNz9LNS6OK8yH+
         eGlA==
X-Gm-Message-State: AOAM533pIw//5C/9RH+eonW1kiWgJbDqfxsrw4asu8rKA0OlWCQG9qjU
        8YQ5+d28evWDuRb5BFukzA==
X-Google-Smtp-Source: ABdhPJzwEJKwbd/+V0akzxUCas/tLB1H8pjLcqQH81WKpYRqMVrRL73j0U9ntncGv23AqAgDbmHXEQ==
X-Received: by 2002:a05:6638:2111:: with SMTP id n17mr5850026jaj.76.1627589270257;
        Thu, 29 Jul 2021 13:07:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h15sm2324632ils.46.2021.07.29.13.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:07:49 -0700 (PDT)
Received: (nullmailer pid 797802 invoked by uid 1000);
        Thu, 29 Jul 2021 20:07:46 -0000
Date:   Thu, 29 Jul 2021 14:07:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, maz@kernel.org, mturquette@baylibre.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: Introduce RPMHCC bindings for
 SDX65
Message-ID: <YQMKkjywdNs5WD7I@robh.at.kernel.org>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
 <6fcab884c2238640b53f6aba1e3c7068ba36868f.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fcab884c2238640b53f6aba1e3c7068ba36868f.1626986805.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 22 Jul 2021 14:09:41 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 RPMHCC.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
