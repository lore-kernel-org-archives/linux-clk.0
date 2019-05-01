Return-Path: <SRS0=T3R6=TB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC21C43219
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 03:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0CAE20866
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 03:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHTzSkwH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbfEADeb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 23:34:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38303 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfEADeb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Apr 2019 23:34:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id 10so8068398pfo.5
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2019 20:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z7Y0W+yPy+sMONnWtsUi4WhB3PoZq5jkTkqQGVhK+8A=;
        b=dHTzSkwHlR9fahblade0lNP6k7mVt/ADXDFZVVqbtDltoBXW81X72+tS1gBYZ2VtrE
         WMGJ3FQWExQq0oqgVX8EAYNiv+loYJ5szL3nQa5ElEI4sCsiVO37x902Df9nPT9swLE4
         N+hr7RxXb9RTDBhdg04Z5VQxqc8L07yEGz4du0GLgZjNN6TPLwbdjH81ceujl73xxmpg
         SyGgHe2utDfvEjKsnqYa0rV8SNBCBdk4gibM9ZLsZldiq68C6yM5EpVJTmn1+4bbpN3O
         cQRzDgL4ErOXPwRjdEmPaImP9qOtKHMCg7g7u/mdOEaAtYcWvvqdbOas3X35jTc32HxO
         ytfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z7Y0W+yPy+sMONnWtsUi4WhB3PoZq5jkTkqQGVhK+8A=;
        b=GstCmL/0bJhxge+0ZmAtuypZMikK0IQg+cFu9kUWae5jLL19pyBaTIKbOG8Bk91UY0
         LU+BNuZXaw5RTIyxdhQHG1dHwSXEZuIVGKeKA4XodZwuCAipKKp0Geg9+bTfRGmEBGuu
         umr+eB/JOHBC1kzwHd6AZDinoQJ4nIxwIHs4ZpjX4Anhjfn2hhnlaiGDr4WFq/pZkovy
         F35Qz1GLREDgFBUeZ5Jmd1ThCdmrP3uIcHO63dYlpRc/V6fZsniwTh+bqBbE47MB/qCR
         yCr0fBKDXrPXdlxdbv8oZRri8x3mfJ4cQg9K8pofn7IgEBXibslzhEomMiuoYsItItZW
         h/gg==
X-Gm-Message-State: APjAAAXRa5yrcPv9SJVOaim9/P6/ZfuaZSg316DnWy8TUE7qMhp765LM
        b254vdSltVgeu7PVmDMTKV+o3w==
X-Google-Smtp-Source: APXvYqzF2hor9KKNh1Dhy3y/uIkcVZC9gP8XWkFg1gbF9WejzbumEdBaeqZHO0pQSkMiGc8OvhWTFw==
X-Received: by 2002:a65:6554:: with SMTP id a20mr72479803pgw.284.1556681670335;
        Tue, 30 Apr 2019 20:34:30 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n65sm63104738pga.92.2019.04.30.20.34.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 20:34:29 -0700 (PDT)
Date:   Tue, 30 Apr 2019 20:34:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, marc.w.gonzalez@free.fr,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Message-ID: <20190501033430.GB2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 30 Apr 19:24 PDT 2019, Jeffrey Hugo wrote:

> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3c..7d45323 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -28,6 +28,16 @@ Required properties :
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
>  
> +For MSM8998 only:
> +	- clocks: a list of phandles and clock-specifier pairs,
> +		  one for each entry in clock-names.
> +	- clock-names: "xo" (required)
> +		       "usb3_pipe" (optional)
> +		       "ufs_rx_symbol0" (optional)
> +		       "ufs_rx_symbol1" (optional)
> +		       "ufs_tx_symbol0" (optional)
> +		       "pcie0_pipe" (optional)

The optional clocks here comes from hardware blocks that in turn depends
on the gcc, so we would need to resolve them lazily (in contrast to xo).

We typically don't list these in DT, but if this is close to the
complete list of incoming clocks then I like the explicitness of it.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +
>  Optional properties :
>  - #power-domain-cells : shall contain 1
>  - Qualcomm TSENS (thermal sensor device) on some devices can
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
