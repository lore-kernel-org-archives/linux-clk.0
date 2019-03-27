Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6E7C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 23:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52EF22082F
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 23:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553729698;
	bh=2nBjSEeqE4siycKznJUw4g50SJkJBgy6qbSy5UYLFX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=R+r0ovUUaOu1soRPwoZyiva9OKZcycenNs2K/1gpHBI5Yo/LrsveKwZoQ5lrE/0GY
	 ql0I6MbacP/WU79sNvsz8iEUUSNKdBrE9jvVrOeuH6v91YiHig62C9UCtaIf/D65hv
	 uRXG9J0uBMX0l9EL3KDdxuR+RIq/vb6PPIDJZ3Z8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfC0Xe6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 19:34:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46198 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfC0Xe5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 19:34:57 -0400
Received: by mail-ot1-f65.google.com with SMTP id s24so7127465otk.13;
        Wed, 27 Mar 2019 16:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O3//WzIPb0jXboVcMDweAvoWpozDdQYm8e3TLDJdYWA=;
        b=XWU8rnw6pQdU4p8DEH942vtIQenqG0MTmqfLtxalH6I0z1j57TObDXmn2y2pPvGJu1
         D1rN0NrR6SXq6oPxSg8Wf+lr1fvC5NDZT5oQjszC4zmtBAFWPLorXtzKMuzH7lwyyoRq
         cXOKYZjfm3P4aJ5tL4MXbs5nmAStQjSD6enrMJFcsSV7X2mUFVu8FBugsWm3OEN8KO/8
         R6EPWpFYDfvdgOAeSTiVB3Qmxmt1BfdCUtkPMmD2f/cZirurSSyvPMA+UIIxQI1Da38J
         /LyQVO/fMjJTKuBmpIbtuxzMxOL+SAkgodkuNp/Bka+AMZmXy7sGct1ZG/mVpS2eZoaf
         fSGg==
X-Gm-Message-State: APjAAAUqDGQL+k3pd9RyXvtZaY7WBPZdT8TpFO98cC9io9UnEe/D0XFP
        H/788EGfmAj5aDhcnT47mw==
X-Google-Smtp-Source: APXvYqwRdhzKXuF9gbbfP91OvU5tJx3/HQt+WEWIBpl8yKUKAMGZ7JIagkZP0UVDCL7tDIsBTbnNDA==
X-Received: by 2002:a9d:1ee2:: with SMTP id n89mr14927482otn.241.1553729696970;
        Wed, 27 Mar 2019 16:34:56 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y1sm4458404ota.38.2019.03.27.16.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 16:34:55 -0700 (PDT)
Date:   Wed, 27 Mar 2019 18:34:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: Introduce Qualcomm Turing Clock
 controller
Message-ID: <20190327233455.GA8216@bogus>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
 <20190306174758.22462-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190306174758.22462-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed,  6 Mar 2019 09:47:56 -0800, Bjorn Andersson wrote:
> Add devicetree binding for the turing clock controller found in QCS404.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/clock/qcom,turingcc.txt          | 19 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,turingcc-qcs404.h  | 15 +++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,turingcc-qcs404.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
