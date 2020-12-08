Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBCEC4361B
	for <linux-clk@archiver.kernel.org>; Tue,  8 Dec 2020 18:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9443723B4B
	for <linux-clk@archiver.kernel.org>; Tue,  8 Dec 2020 18:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbgLHSCO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Dec 2020 13:02:14 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33713 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgLHSCN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Dec 2020 13:02:13 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so16651175ots.0;
        Tue, 08 Dec 2020 10:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EStUUTvh3gp4V8APChCzjiNJU0x+/orbSyMqoClOXF8=;
        b=mK9jmaFVVvNtk7dsLl8ZvrsQT23G7ooBoZ+2zrjts9h7qovPddJJisGSsSxbu/Kn+D
         nIJyeX5l0BWl7fNIBpcdPcBaQPqX35r7ESZgUcx5nAYrkLhLxqKSq2zqmHBfb6Y+TV4d
         1mdSSL4VxXfyxZI0AUX2O5noe+kJZDoMxwnOpN+dl7D0qH17ChMdLWiuYC0iK4J/jIBh
         TUqu0AEHfUbRjdmpUlWnCmWNJNJ1ugAToZR7LLKlg8FnhSCOn57Ppntwho8lQXLUXvVT
         08I0TJvAwzVVeSV/FGznHlFL+5rkoF8zLCSohgeWCpPjqz2zk8s1alY1ddGRuA4Ukh1u
         6JTw==
X-Gm-Message-State: AOAM530Rce+NaSD0f4jXMTzQnus1Ut4uClVXojYMvA7VfqKcPSgP51+M
        no88qP1Chps1ekWKZVXB0w==
X-Google-Smtp-Source: ABdhPJyRrY60woe6VcB5XH36i8axPXXvsfRJfoGCwZ8ZImYLpvSP7fmnKa7i5UZ88Gtu9oOPJpzcKQ==
X-Received: by 2002:a05:6830:2371:: with SMTP id r17mr9623632oth.236.1607450493097;
        Tue, 08 Dec 2020 10:01:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n22sm346849oig.32.2020.12.08.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 10:01:30 -0800 (PST)
Received: (nullmailer pid 2795569 invoked by uid 1000);
        Tue, 08 Dec 2020 18:01:29 -0000
Date:   Tue, 8 Dec 2020 12:01:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        jbrunet@baylibre.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock
 bindings
Message-ID: <20201208180129.GA2795539@robh.at.kernel.org>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
 <20201126141600.2084586-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126141600.2084586-2-narmstrong@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 26 Nov 2020 15:15:59 +0100, Neil Armstrong wrote:
> This adds the MIPI DSI Host Pixel Clock bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
