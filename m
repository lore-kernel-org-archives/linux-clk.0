Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F96C4363A
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 13:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CD9C2083B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604065877;
	bh=pAg8AIof0c2L5VGhWVFpliOUDWvp4+wVAg0tjRsjv9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aoJtVJPrrimJV5LINuIepdFUMXUHk+L8hzhA5wu1QKwLu6A/SLeByexfifwKDvPtK
	 BEOcm2oSF3OpvxeUYQJLYxtVAv/dvsXI3WgvNNdrmKGvrdWLFXIsCRToU5CXguvAbJ
	 vNj5PpJf1glVP98xgLxDQpKt9oa3r4X8cnemka/A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgJ3NvN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Oct 2020 09:51:13 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44643 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3NvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Oct 2020 09:51:13 -0400
Received: by mail-oi1-f196.google.com with SMTP id k27so6672633oij.11;
        Fri, 30 Oct 2020 06:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IKoXPmqtaAImThesNwOaK1C1tw/idd1e5rdFd24LJaA=;
        b=Rfcccc4nND3bKHCSYEnnnM8b/OucOeMtrxq6t7bxUCmZ0lVhIX/7kyO+6WQoso7ZW7
         /Wg6qKQO+pD3KeLUpxLfsRmmb9yEej1Fv5ckAlVouf0RndFH+rJEIujwea/5hEuUFPxr
         0IYYwg4s02vik3QygebAh2RYs0SpUWQklPeDNK1BZwPmPnKh8OcH2CJiwCDQ9DU3Be1I
         R5BntOkSCmPVOpNH4fz+AVExIPMhSoNzkCen58MdAmb5Yin3KvT+gQj7awyTw1yWwPmG
         lY6aorIXtXaTIUHTSyV/w63KLNI2eRbR8244t4bPCPuEX+rAQDv0TL/vhhfkwzzgZ8yk
         Z9Og==
X-Gm-Message-State: AOAM530qVvZeLBwl1ZRUn0hMMMa0OZWnZUdtc9DNdRbOMIimNpKehf0b
        WgRTp5fDuxdW4aV1BDT23w==
X-Google-Smtp-Source: ABdhPJwfuk9Te+Y8LR32NkJaSpDQihn2xqBfJADXBVnlPglRn5WjudJUt8CjRiv/nln2LBX0/uiBIg==
X-Received: by 2002:aca:cd58:: with SMTP id d85mr454196oig.64.1604065872505;
        Fri, 30 Oct 2020 06:51:12 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g203sm1432683oib.22.2020.10.30.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 06:51:11 -0700 (PDT)
Received: (nullmailer pid 3744973 invoked by uid 1000);
        Fri, 30 Oct 2020 13:51:11 -0000
Date:   Fri, 30 Oct 2020 08:51:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH v3 1/4] dt-bindings: clock: Add support for LPASS
 Audio Clock Controller
Message-ID: <20201030135111.GA3743950@bogus>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
 <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026120221.18984-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 26, 2020 at 12:02:18PM +0000, Srinivas Kandagatla wrote:
> Audio Clock controller is a block inside LPASS which controls
> 2 Glitch free muxes to LPASS codec Macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   | 58 +++++++++++++++++++
>  .../clock/qcom,sm8250-lpass-audiocc.h         | 13 +++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

Reviewed-by: Rob Herring <robh@kernel.org>
