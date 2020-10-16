Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9353C433E7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 16:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E2BD2084C
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602864482;
	bh=5/cQOgqpvBckb5bCPwSSI8ELTD5ebZMWJKSjbasAVmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UxySYtZecxS1Qz2E+y+XNwXR918akHoe1YJbEETzDKUcQhr2e5DBNYqUnzuxci64S
	 pFb86SBZiiaqD572ut+d8jmNJwK308fbBEM4WRdI2c+cXnslGKgZOPAc5ARU5BeKeE
	 Fp55ERBk7PBLeHHIDD6r3w0kbj48QOUIt7VX9gII=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409241AbgJPQIC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 12:08:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46579 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409232AbgJPQIB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 12:08:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id m11so2826147otk.13;
        Fri, 16 Oct 2020 09:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Md0uiqxc7S/GR1/0zeYVIO9A9Ah9esTjE7+W9lYrTTo=;
        b=iAUNaqKfkmndd7EHMnu2n/kppciE9/bNdXzHELqwZFdJdAIj4mTMDKMPigmxhcti1q
         rlqcybQMstN09nbHVo7H1xQrzB0YcgiIdl9X/odKXU4JSzTLoExjeElZQhZNHjsAN2At
         MX6wDXBeHCKp7YakQU9TtP8Xt88vwW/HhaafepUCRCFhZ7T09AMqwuWJ9eQnfsAO9beg
         2RCtC2b2uB/YFNHnTvd7XRZnZJQQINLWfH1e8qoSWbvAgt0UMdp5Nill+Iz34kfQDoLM
         GBzJmzSHh3mFNb5oGmHPrbQeMtFZqIoTEL59RAx0LAsPoa1ffrr4egtgL27RsocFX06t
         nuyg==
X-Gm-Message-State: AOAM530WlUBF94mH1pTM8dDs4mhw0V4Fu6UbR48TvflbhHKiLy55rtpx
        MgdERGIaOlMZ+aDW9u6XFw==
X-Google-Smtp-Source: ABdhPJyEbtkGw+MzkOshm1ffDK0nDfVdxfZygr4NM7M+gId5lL9nvMxlnwm5mAIVWo+jvzdWZlv41A==
X-Received: by 2002:a05:6830:1dc3:: with SMTP id a3mr3244058otj.292.1602864481000;
        Fri, 16 Oct 2020 09:08:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm1127850ote.45.2020.10.16.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:08:00 -0700 (PDT)
Received: (nullmailer pid 1500545 invoked by uid 1000);
        Fri, 16 Oct 2020 16:07:59 -0000
Date:   Fri, 16 Oct 2020 11:07:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, devicetree@vger.kernel.org,
        david.abdurachmanov@gmail.com, padmarao.begari@microchip.com
Subject: Re: [PATCH v1 1/2]     dt-bindings: CLK: microchip: Add Microchip
 PolarFire host binding
Message-ID: <20201016160759.GB1499240@bogus>
References: <20201015114725.23137-1-daire.mcnamara@microchip.com>
 <20201015114725.23137-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015114725.23137-2-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 15 Oct 2020 12:47:24 +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
>     Add device tree bindings for the Microchip PolarFire system
>     clock controller
> 
>     Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/clock/microchip,pfsoc.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/clock/microchip,pfsoc.yaml:58:111: [warning] line too long (306 > 110 characters) (line-length)


See https://patchwork.ozlabs.org/patch/1382572

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

