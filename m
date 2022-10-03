Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF1EC433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 16:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiJCQkS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiJCQkA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 12:40:00 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19E6140EA;
        Mon,  3 Oct 2022 09:39:57 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1326637be6eso3879445fac.13;
        Mon, 03 Oct 2022 09:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7+4YmPdd4Yd9qyYlmkjl9DXqLdEG2yOjN48nnp9UvcM=;
        b=2vtK/f5j+6kW2vHMisTotnlpokmk5RnCKX51QYRcs/VGzL1hdLlSI4Od4fb5SuabyB
         uAx8POWX0fgejlllyFozXSB0J7azg4qq9ZSoBodIcVLApR027aRhvk2wdRp/ZPOoq7Zl
         al0EMaOCijg9TKs8z/aDDQl2SO/hM1GQjvyg+YdfzgHgGOMjW/581eFTTc1TUk9MymgP
         RCwUAjTBEm67YfXGVz5Y6n3JTgp2vrXObNVi9ozSPquafIg1x/Imr6G5iD2GH8WGHcCR
         mAk7wQA2CrTAyA46NtqJevoHaIN9QCHaIDmeivJas+iuZ9v0BoyVaaxQaAnZRgmpj+m2
         XVTg==
X-Gm-Message-State: ACrzQf02yzSmZa8Qjb5kUe0Isg40AtaSaIx4j3AaG8jaGRkQKc7dansl
        fVIgLf1AGhfnnT5p0maUpg==
X-Google-Smtp-Source: AMsMyM73Ezu7mapOpxY5SWfvUkYjbgEhho+/TRFR/5PGUHxN2fF+88Mqk5GP3abf4M7saf+ctUoXPQ==
X-Received: by 2002:a05:6870:d626:b0:132:9149:dc8a with SMTP id a38-20020a056870d62600b001329149dc8amr1205595oaq.141.1664815196861;
        Mon, 03 Oct 2022 09:39:56 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c16-20020a056870c09000b0012c21a64a76sm3031062oad.24.2022.10.03.09.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:39:56 -0700 (PDT)
Received: (nullmailer pid 2423947 invoked by uid 1000);
        Mon, 03 Oct 2022 16:39:55 -0000
Date:   Mon, 3 Oct 2022 11:39:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCHv2 2/9] dt-bindings: reset: add rk3588 reset definitions
Message-ID: <166481519478.2423891.644032213788270415.robh@kernel.org>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
 <20220930153857.299396-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930153857.299396-3-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 30 Sep 2022 17:38:50 +0200, Sebastian Reichel wrote:
> Add reset ID defines for rk3588.
> 
> Compared to the downstream bindings and previous rockchip
> generations this uses continous gapless reset IDs starting
> at 0 instead of register offsets as IDs. Thus all numbers
> are different between upstream and downstream, but I kept
> the names exactly the same.
> 
> Co-Developed-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../dt-bindings/reset/rockchip,rk3588-cru.h   | 754 ++++++++++++++++++
>  1 file changed, 754 insertions(+)
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3588-cru.h
> 

Acked-by: Rob Herring <robh@kernel.org>
