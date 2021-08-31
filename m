Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84C2C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:35:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C97D16103A
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 20:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhHaUgW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Aug 2021 16:36:22 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:37835 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhHaUgW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Aug 2021 16:36:22 -0400
Received: by mail-oi1-f173.google.com with SMTP id y128so857132oie.4;
        Tue, 31 Aug 2021 13:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kCOr24bb9bnXKJSbxB84S1a5JGeC0se1LoCljNw8740=;
        b=NkUELwky1295gaDB3Y3r5z0j0FJIYqMms+0sxOZHLqpwL+jB6JB68BxLmUAylObWx7
         j5y5PPGMZ4oeBQ0LV4Tl8IS+u3CWP3wOie4YAwPoEWnd3nfHNtOA8c/npABqBi4oPJLo
         NiY+5LF10ahARYGSl/MQux+6XmbTkReOpx3reOnXOrHS/snBqLXXxIXifV/0wVrF7jJJ
         L+Ax75X+HZ8G7ztIe1IippHlufbfWdM6H7TI4weYPiGKf3JBbwMPBuYl7OMKJ83l32vW
         SD1ylHWlLAJtnoIJC+Uq2rG6pEBj5G9E8r/a9bRDQCAu8o7AbOqDfCl2hzMrt9EvK85K
         6h+w==
X-Gm-Message-State: AOAM533eCleTQXgHIihf21u0HTy+wqYJvLGQyhLslR8wJdM3GOmlXlZR
        U4I105JFharnSET4X+RFsuU0MZ7SBQ==
X-Google-Smtp-Source: ABdhPJw3zuGj+kvjeOsh6Ea8zVPl6Db2qhjCXkgBlkQcMXKe2QzwEBSOxnZ/ddTTTEqHxtO71HZV+w==
X-Received: by 2002:aca:3885:: with SMTP id f127mr4637542oia.77.1630442115378;
        Tue, 31 Aug 2021 13:35:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b9sm4253951otp.46.2021.08.31.13.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:35:14 -0700 (PDT)
Received: (nullmailer pid 606062 invoked by uid 1000);
        Tue, 31 Aug 2021 20:35:13 -0000
Date:   Tue, 31 Aug 2021 15:35:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: clock: cs2000-cp: document
 aux-output-source
Message-ID: <YS6SgbZ/s5tTArTe@robh.at.kernel.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
 <20210827115420.3052019-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827115420.3052019-3-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Aug 2021 13:54:13 +0200, Daniel Mack wrote:
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml           | 14 ++++++++++++++
>  include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
> 

Acked-by: Rob Herring <robh@kernel.org>
