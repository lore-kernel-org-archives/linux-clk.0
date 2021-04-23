Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442ADC433ED
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 17:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3DD261404
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 17:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhDWRnY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 13:43:24 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33525 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWRnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Apr 2021 13:43:24 -0400
Received: by mail-ot1-f41.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso23494147otl.0;
        Fri, 23 Apr 2021 10:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRdnwDjQMRMO0UqN7+1YzzfPwFgjXHPJS+9F8SLu950=;
        b=mQqmGrLY15PoM0eg5uIpdvUvzKy7x3MuYJTsW/Be5UnYwwaBLCTOl93JXK4MvGS7ZL
         NLgX5o6qQPYak9h5Z1V8CWBlCQ9VVG80kvDPTBAd0DO5rxIoF4G8WCzPb3DxO5iDc/lJ
         qLw1LEWhqo/oQxCWsHndrXVNgDBkcpfn/XksoSuNvW8FLKoBp6KQAAJ3YDvmcn5xRndM
         q588ilZZDhVCs2/UE7/77eOVuraP6hivtNsO0BDkmb1iqvDBsKrKA5ynYxEFBDP9p0iZ
         CwafI/Xu9h9qfSHG34iCx++22BgOpjD7AAGVAXFLkpexjA8FRG4i4HaeYCqkYveKX55v
         v44g==
X-Gm-Message-State: AOAM532hP3NmAwDvcCCp1qrIsg9HWEj2QVMKfQUDY6p0gKdiPRGL9bUP
        pnTGRlP8nk9nuTC0tH07lw==
X-Google-Smtp-Source: ABdhPJzLEjI07iwHUCGRfyOJQOgqUJHhqprXp2Cv1C6UlS/oc6NShfcmaU+7AwydfaeOdPkEv40Aqg==
X-Received: by 2002:a05:6830:1094:: with SMTP id y20mr4329988oto.135.1619199767008;
        Fri, 23 Apr 2021 10:42:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 39sm1538549otv.21.2021.04.23.10.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:42:46 -0700 (PDT)
Received: (nullmailer pid 1314100 invoked by uid 1000);
        Fri, 23 Apr 2021 17:42:45 -0000
Date:   Fri, 23 Apr 2021 12:42:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     julia.lawall@inria.fr, mturquette@baylibre.com,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: clock: add ti,lmk04832 bindings
Message-ID: <20210423174245.GA1314048@robh.at.kernel.org>
References: <20210423004057.283926-1-liambeguin@gmail.com>
 <20210423004057.283926-4-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423004057.283926-4-liambeguin@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 22 Apr 2021 20:40:57 -0400, Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> Document devicetree bindings for Texas Instruments' LMK04832.
> The LMK04208 is a high performance clock conditioner with superior clock
> jitter cleaning, generation, and distribution with JEDEC JESD204B
> support.
> 
> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  .../bindings/clock/ti,lmk04832.yaml           | 209 ++++++++++++++++++
>  1 file changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
