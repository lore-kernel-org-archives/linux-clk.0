Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7FBC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD53721873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545146377;
	bh=U6lr0dYOms/HySVDRIKbUzzZC86nseUy/sMUzjBh06Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=K9l4NSUlIQOVITudvy1w/B/LJ0B/rzDFVfemP0Uf32pkwMZbEz5gbSXgbPUAOMvz7
	 IYt9pZ1C1wVcdxwYsIc+yRBIz0ZX+bhw+EFZMjewSlsb6OerVi7s6g1I8HIuJANX+Y
	 3gF5JRlWzTCYOc5MdTxzS7H2738lUM1htNPpF8t8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbeLRPTh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:19:37 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33712 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbeLRPTh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 10:19:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id c206so2253236oib.0;
        Tue, 18 Dec 2018 07:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4nR+AQPWDCyrRR2Ic4oer8D4svT+1sZ+efUdDFz/hB8=;
        b=hXkNcNTldkzBUz6GtWSWbv1+F81u+dahdcaiowCm+f0mwMZBY4QNzpSoweRLKLiAlf
         LXebjy7UK+gpBopNgwzCeS9Y39o7QY/dljBBIwppuNjoNEraA+AWnUMhFa+sdf5efUnp
         zbzDva7VU+axejK5wbHV6E6gvrGgTWr7/Et/y6QtL51e8T90Q5lLMMyV1qAqlVEuh6Q9
         bsVVVz2rLVkXqpJYIV3ISMRHPb7q15c3v4stunpzbkfKOMVgdlRheWyJdOxggCP2+Bj+
         dqoS8jSe6Ge/laSfq+WHE8B25uDR5bd6AMOTlJ0znZRjpkQEIMMHw2rVme3KcdHyKynW
         lVHA==
X-Gm-Message-State: AA+aEWbsiarhlUlk/Q3P2Ga9myqaIC6nXRCAfoJ+2NlQW+rsvz/e0H3s
        PywAaR9PfQQ8U9xED6S9Vw==
X-Google-Smtp-Source: AFSGD/XEMO9vWKl5EPgYBPqXBf03M2UXD4LW1xZTHoVSgytuivHMU/ShMy3jcVq1kMPbI+fT2gZnkw==
X-Received: by 2002:aca:4155:: with SMTP id o82mr8380515oia.172.1545146375762;
        Tue, 18 Dec 2018 07:19:35 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n67sm7476284oif.14.2018.12.18.07.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 07:19:34 -0800 (PST)
Date:   Tue, 18 Dec 2018 09:19:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V3 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Message-ID: <20181218151934.GA10127@bogus>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-2-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218091232.23532-2-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 18, 2018 at 05:12:13PM +0800, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Add new properties to configure the DFLL PWM regulator support.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V3:
>  - no change
> *V2:
>  - update the binding strings and descriptions for
>  nvidia,pwm-tristate-microvolts
>  nvidia,pwm-min-microvolts
>  nvidia,pwm-voltage-step-microvolts
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index dff236f524a7..38e8cc8c70a8 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>  oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>  control module that will automatically adjust the VDD_CPU voltage by
>  communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
> -Currently only the I2C mode is supported by these bindings.
>  
>  Required properties:
>  - compatible : should be "nvidia,tegra124-dfll"
> @@ -45,10 +44,31 @@ Required properties for the control loop parameters:
>  Optional properties for the control loop parameters:
>  - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>  
> +Optional properties for mode selection:
> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> +
>  Required properties for I2C mode:
>  - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>  
> -Example:
> +Required properties for PWM mode:
> +- nvidia,pwm-period: period of PWM square wave in microseconds.

Needs unit suffix.
