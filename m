Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556FEC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 01:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 327046135C
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 01:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbhEUCBR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 May 2021 22:01:17 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42660 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237368AbhEUCBR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 May 2021 22:01:17 -0400
Received: by mail-ot1-f45.google.com with SMTP id g7-20020a9d12870000b0290328b1342b73so8836168otg.9;
        Thu, 20 May 2021 18:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eqK8c/oEUeOyU0aEXf7v8U4QtFxi0t8bo1m9NwBjQo0=;
        b=ahir52BCPsVko4KugxkY0SWnR2kiJmT7oCfMSQEDQWY9Rv4u5hRF4fkFDeNqyjW/Ai
         oVr+4LncH6W3we+adbNKn6Eg2TTJfo30N0KDvRGEwXzSgigRjnDBsipf8ACNHlJwvWTJ
         6YVouGisRnQFgE+CT0IFEWevqZzK2+nPU+oN6kC7/o554m0RI4rLcOi0NnTFPcSL6rof
         EYO6LkxLEgjktlK5jG8uwVSAQgKGQ/uojvYuVcuQ/jkpHNEAK73odkpnJ144mi7YHI8W
         2lGfMJYX0u7jm95P283c+r4u5tnplKqDIW6ocK+VhwFlamqHYBugz8DqaQAW8TMjOh4L
         C/NA==
X-Gm-Message-State: AOAM533jhPkFKiJjK6HTXloEhiEg1/slC7LA4VkJmo5ZKv/HqF5qBsnL
        xFnOqJ6kGUkRq5ePcyTbEQ==
X-Google-Smtp-Source: ABdhPJzJ2wYHc1sx4DiWJUKYH4vfz36nebuSzNoHjb6qaCX1TlZwAlT1N0ixZr+ABf+VF/1QUBw29w==
X-Received: by 2002:a9d:69c5:: with SMTP id v5mr6154296oto.108.1621562394803;
        Thu, 20 May 2021 18:59:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a18sm1026886otp.48.2021.05.20.18.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:59:54 -0700 (PDT)
Received: (nullmailer pid 2498876 invoked by uid 1000);
        Fri, 21 May 2021 01:59:53 -0000
Date:   Thu, 20 May 2021 20:59:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, kuninori.morimoto.gx@renesas.com,
        robh+dt@kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: convert cs2000-cp bindings to
 yaml
Message-ID: <20210521015953.GA2498846@robh.at.kernel.org>
References: <20210519201551.690654-1-daniel@zonque.org>
 <20210519201551.690654-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519201551.690654-2-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 19 May 2021 22:15:49 +0200, Daniel Mack wrote:
> The original author of the file was added as maintainer.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml      | 63 +++++++++++++++++++
>  .../devicetree/bindings/clock/cs2000-cp.txt   | 22 -------
>  2 files changed, 63 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
