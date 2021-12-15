Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE7BC41535
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244149AbhLOPvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 10:51:33 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38679 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239535AbhLOPvd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 10:51:33 -0500
Received: by mail-oi1-f180.google.com with SMTP id r26so32210373oiw.5;
        Wed, 15 Dec 2021 07:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0rtz85Jyq9MgaFtmlaxUe2NnGfFjYdGSaO09tkfYYE=;
        b=0FGnEZ8c7D8mS9MLTX6hNQBJjvVvM4aKrdcVhRk+c3QaPXcF6ezCc6F6EfRo0zm3dM
         63WRjDwFAXn/RGM4RDWKfgC4D9l6twaUPYg/DsJcwTD9PGsp0MlRKSB0KObLvfJ8V8u2
         Lgf84OtmxmSZvz3g9T3ESGNOm1GMd6HKa+E9/9l3CFXoZGRGYdbK7ntLSwcKrcM4lAvz
         XwFJrXOeQ+gzGvk1LoAl31gkP2K2thr3G/8wh5GNdg8K3xWHd0S3ozyuXNFaTyetnukJ
         3n6MvSELQ+R92GjckkTxgML7CgnL5v7z7VEnhRg+5yC0B0b8Xy1xkir77ZOQqjhPqtuo
         iJ8A==
X-Gm-Message-State: AOAM533+mQXAr+AEMO16uhKmaHoqt43FQ2jinvDmkq57W0NA6GvMVcYX
        NL/udv1KZx9DDnjgg25aNA==
X-Google-Smtp-Source: ABdhPJyT8MM4VWo5djPVVC7PJS/aRHbaodZBQ6f2mpjfmDUs5c8N9fTVxzDIG7Yrxh0oUjHkLtcT+Q==
X-Received: by 2002:a05:6808:1c5:: with SMTP id x5mr358735oic.144.1639583492378;
        Wed, 15 Dec 2021 07:51:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y17sm507820ote.48.2021.12.15.07.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 07:51:31 -0800 (PST)
Received: (nullmailer pid 1378981 invoked by uid 1000);
        Wed, 15 Dec 2021 15:51:30 -0000
Date:   Wed, 15 Dec 2021 09:51:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org, palmer@dabbelt.com,
        mturquette@baylibre.com, geert@linux-m68k.org,
        cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
        krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        daire.mcnamara@microchip.com, robh+dt@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
Message-ID: <YboPAmeRMNKCUpCf@robh.at.kernel.org>
References: <20211215083002.1353-1-conor.dooley@microchip.com>
 <20211215083002.1353-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215083002.1353-2-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 15 Dec 2021 08:30:01 +0000, conor.dooley@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire system
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml        | 61 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 ++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>  create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
