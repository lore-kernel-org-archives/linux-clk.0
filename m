Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BA1C4708F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 16:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DE4261C49
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 16:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhFBQwr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:52:47 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:34329 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhFBQwq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 12:52:46 -0400
Received: by mail-oi1-f175.google.com with SMTP id u11so3311461oiv.1;
        Wed, 02 Jun 2021 09:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ng66G4jO/C51laojzG44dfW8z+IXfT9iwY5rC23LxMo=;
        b=DBN7kDOqa0EOtstZ5A+ON+bDCeOyeqne+P+6iIkC8BamlEwIiEOz8xFZzPiF/RTyzI
         eBp1w9O/urCOHGDVQ/0PxZ38i9O7O6lsM7cJh6E8GxDIjDDx3cAmR9wb5zB7G1SjWmta
         Ex5DuNhfFIbbCfh3cD3IfLR8a6Ib0U64CqmWEfw41vJOUDu13a683lzRKusZ7Fi9INc6
         N6TCRABz1EMp8J87d7YChKz9euVrMBaWg3jqbsGDalkqxCfWDT4O8dFWsil0yzOj119F
         lfoyCZWYBsCmpAG7FUOH6iHASuUSnnLDrgceuupHNYE/wocavoTGqKaqehqGCat5IUB+
         aWKA==
X-Gm-Message-State: AOAM5336a6KLeUNIAptLU1KulThZG6TrPu+HCpbQfjLb93mya9MT/6jc
        wf+Tqh5dE6mJUBXZSyEzye9P3pdOTg==
X-Google-Smtp-Source: ABdhPJwroyXsMLOJAuiEN3lNLQsCsSjqI5eH+O8I1srDWPgJ16DIBnriDFaaStE2RWXa7LElaEC/3w==
X-Received: by 2002:aca:2107:: with SMTP id 7mr4482878oiz.110.1622652662503;
        Wed, 02 Jun 2021 09:51:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c32sm88395otu.13.2021.06.02.09.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:51:01 -0700 (PDT)
Received: (nullmailer pid 3551888 invoked by uid 1000);
        Wed, 02 Jun 2021 16:51:00 -0000
Date:   Wed, 2 Jun 2021 11:51:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     devicetree@vger.kernel.org, lewis.hanly@microchip.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com,
        mturquette@baylibre.com, palmer@dabbelt.com,
        linux-clk@vger.kernel.org, padmarao.begari@microchip.com,
        robh+dt@kernel.org, cyril.jean@microchip.com, sboyd@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
Message-ID: <20210602165100.GA3551676@robh.at.kernel.org>
References: <20210528134308.649769-1-daire.mcnamara@microchip.com>
 <20210528134308.649769-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528134308.649769-2-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 28 May 2021 14:43:07 +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire system
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml        | 67 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 +++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>  create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
