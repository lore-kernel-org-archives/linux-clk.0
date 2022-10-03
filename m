Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732FBC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 16:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiJCQlX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiJCQka (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 12:40:30 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632336262;
        Mon,  3 Oct 2022 09:40:28 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id u68so1628883oie.10;
        Mon, 03 Oct 2022 09:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=dUvuIzgJodfgVf97IPfqmVH8ASWJfC3UD+ue7z319gg=;
        b=T6PYc13cBBnZUIbSzLI+w3o1m0efDQ2pmNJ9Li2UuZoeBtzFwpWFVRSaLgTehzhcXZ
         nhxSFkwc921JStb0KV6yDwGgrscIiLrSshGDK8iJIYaCHOis9aaBXp3qmEfDDxi77yuG
         2bgbfG31Pyv1jtuMTP7RQ2bKpjVQlrB4RCpFWU09vsik85mLXTZwGnzvE74cQQCFNZbo
         WU05VZ4IGxSiwrNAe7y3P0jbw9Z3uXDmzqpSwNKeHGSBWqZq0JZJXvED9spoD/DSrQGQ
         uEeQ3AnMPj5mHlH46HbMNDg79RkejIZcKMjOMjitPWe79EgvjUcAMf26e2w4pGWctfe8
         qHYg==
X-Gm-Message-State: ACrzQf13+FFT2KsfF//TMs1Jyo4amJmfiZBSmo41s4VHHDnRsw//dc5W
        VhtC2Pf1J+/t033eXha7PA==
X-Google-Smtp-Source: AMsMyM46S7T8zkoU0K1q/9agKWVKk+bJQ1xjfYj4RnsLzzVteuo+aC5kPlgYOYcwAVCXpuJVkBFjyw==
X-Received: by 2002:a05:6808:1597:b0:350:4f39:d7d2 with SMTP id t23-20020a056808159700b003504f39d7d2mr4147549oiw.125.1664815227733;
        Mon, 03 Oct 2022 09:40:27 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s17-20020a0568301e1100b00659ba9f2872sm2485983otr.77.2022.10.03.09.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:40:27 -0700 (PDT)
Received: (nullmailer pid 2424625 invoked by uid 1000);
        Mon, 03 Oct 2022 16:40:26 -0000
Date:   Mon, 3 Oct 2022 11:40:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCHv2 3/9] dt-bindings: clock: add rk3588 cru bindings
Message-ID: <166481522561.2424566.15018819392287662556.robh@kernel.org>
References: <20220930153857.299396-1-sebastian.reichel@collabora.com>
 <20220930153857.299396-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930153857.299396-4-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 30 Sep 2022 17:38:51 +0200, Sebastian Reichel wrote:
> From: Elaine Zhang <zhangqing@rock-chips.com>
> 
> Document the device tree bindings of the rockchip rk3588 SoC
> clock and reset unit.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/clock/rockchip,rk3588-cru.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
