Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4308C49EA7
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 21:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB3A9613B7
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 21:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhFXVfn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jun 2021 17:35:43 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:44690 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXVfm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jun 2021 17:35:42 -0400
Received: by mail-io1-f53.google.com with SMTP id h2so10077149iob.11;
        Thu, 24 Jun 2021 14:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aUMktLzlH1uDOEr4VGul69ht5hoCKKzcIRu7vZcb0Vk=;
        b=ls/NLnZI2txVLwXtsZrhCxE9T+mNnQ6931IyutxgRbIYVzKLshcLOWiAPjNcKOFteG
         ZP6LWVQzmWOquAeFnu5Ra+otvYK4VM/NKTmoIDgiLCqODmtXwzfT3C1G/ZfFcNktyvOE
         Fcevh7sU1Y0ZB5oXCmEinNIQfQ8gD35fjOaasrD9uBdCetEt3tw/MhSBbICMoQcDX706
         gJF+SqY+C0jBVQ3U5kPUX9OZOTLrMIK0wLtVH8jCXHULG5mgKnKvr98HXgOIT0MGOYfS
         47QFQLXFOjDXPoJAnyWoYPm2ROV1Mq3zxIzH3uibsZ6SwcQpBI3ls07v2/HB+UYiw+fk
         lkGA==
X-Gm-Message-State: AOAM532zQb5zy4BWIgLvI/4IKXO1TqPjMiZ+ALxuF4qus8/0p8DaYiw6
        yqvOn4Y6+OqsqU2+QqI0vw==
X-Google-Smtp-Source: ABdhPJxAvK1DQondry9FYczqT4TNLniQ2NyFDN5OZFCA+MzBImNBTfYIqLgAEbHoWDsrF4a8zVqnlg==
X-Received: by 2002:a6b:ef07:: with SMTP id k7mr5959210ioh.16.1624570402867;
        Thu, 24 Jun 2021 14:33:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q6sm2382146ilt.73.2021.06.24.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:33:21 -0700 (PDT)
Received: (nullmailer pid 2023161 invoked by uid 1000);
        Thu, 24 Jun 2021 21:33:17 -0000
Date:   Thu, 24 Jun 2021 15:33:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, mturquette@baylibre.com,
        sboyd@kernel.org
Subject: Re: [PATCH v3 3/9] dt-bindings: clock: cs2000-cp: make clk_in
 optional
Message-ID: <20210624213317.GA2020700@robh.at.kernel.org>
References: <20210617190912.262809-1-daniel@zonque.org>
 <20210617190912.262809-4-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617190912.262809-4-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 09:09:06PM +0200, Daniel Mack wrote:
> CLK_IN is only used in dynamic mode and is hence optional.
> 
> Re-order the clocks so REF_CLK is specified first.

It's not a compatible change. You can't do that unless you can explain 
why it doesn't matter.

> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> index 79b90500f6ac..68efed8e5033 100644
> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -22,14 +22,15 @@ properties:
>  
>    clocks:
>      description:
> -      Common clock binding for CLK_IN, XTI/REF_CLK
> -    minItems: 2
> +      Common clock binding for XTI/REF_CLK, CLK_IN.
> +      CLK_IN is optional and only used in dynamic mode.
> +    minItems: 1
>      maxItems: 2
>  
>    clock-names:
>      items:
> -      - const: clk_in
>        - const: ref_clk
> +      - const: clk_in
>  
>    '#clock-cells':
>      const: 0
> @@ -70,8 +71,8 @@ examples:
>          #clock-cells = <0>;
>          compatible = "cirrus,cs2000-cp";
>          reg = <0x4f>;
> -        clocks = <&rcar_sound 0>, <&x12_clk>;
> -        clock-names = "clk_in", "ref_clk";
> +        clocks = <&x12_clk>, <&rcar_sound 0>;
> +        clock-names = "ref_clk", "clk_in";
>          cirrus,aux-output-source = <CS2000CP_AUX_OUTPUT_CLK_OUT>;
>        };
>      };
> -- 
> 2.31.1
> 
> 
