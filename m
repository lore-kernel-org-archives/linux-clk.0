Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D606DC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jul 2022 23:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237656AbiGYXZW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jul 2022 19:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbiGYXZV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jul 2022 19:25:21 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAD11181E;
        Mon, 25 Jul 2022 16:25:20 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so16683751fac.13;
        Mon, 25 Jul 2022 16:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dCsn9dzCh6KqkTVcJHWRZAMN2f7ONnySyxeXvQofuFk=;
        b=iDx2oLOcG4hqnOrxZm5PMVzi/88GFkCxseHhHi2FQw0pkNUh/Vct9Fsd8AlWR9ivK+
         C1QxAQMqYH1vaj8QenxtqfogAIP4yNtL5VTpSXX6cmxdntooa4Td1h2uHqow//gt0fnX
         54Y6wBeQ1378a1ZfNVzZ4Pb5ZKMKPE+d3RGiL0L/ZKQQtuH0qz8Z25HqD+BA1ycEdqaC
         6lL6rKsu9RgAEWc/2/vdG92w0SwU3vXgGjmM8VryZAWqTrBoD1HrsvIybjGStEgh88O9
         2imfQ/8Gd0Iub2X24TigDqotvgEP3wup9j83apuH4Dq5K+U5j0wmy9ceI6DSNULGNKCC
         1VTA==
X-Gm-Message-State: AJIora9a/cqQyr78vjsx+Q9wCsb+oy5U5qWjmzbVgB4wuASuH9j8vFPz
        stifckOBxO8FHxcUVR1R7vgQJLlPMg==
X-Google-Smtp-Source: AGRyM1u6PwB1RBpooueI1Ajoq8Nis2ce7rhmBLUoV8FkFFrEgRqWytwkZpjeDnVeAFnBKbEe6ONYsw==
X-Received: by 2002:a05:6870:79d:b0:10d:8416:e59d with SMTP id en29-20020a056870079d00b0010d8416e59dmr7265810oab.85.1658791520057;
        Mon, 25 Jul 2022 16:25:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n8-20020a056870240800b0010d7242b623sm6652099oap.21.2022.07.25.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:25:19 -0700 (PDT)
Received: (nullmailer pid 2950657 invoked by uid 1000);
        Mon, 25 Jul 2022 23:25:17 -0000
Date:   Mon, 25 Jul 2022 17:25:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jagan Teki <jagan@edgeble.ai>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 10/22] clk: rockchip: Add RV1126 clock controller
Message-ID: <20220725232517.GA2949355-robh@kernel.org>
References: <20220723204335.750095-1-jagan@edgeble.ai>
 <20220723204335.750095-11-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723204335.750095-11-jagan@edgeble.ai>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jul 24, 2022 at 02:13:23AM +0530, Jagan Teki wrote:
> Add clock controller support for RV1126 SoC.
> 
> Clock & Reset Unit (CRU) in RV1126 support clocks for CRU
> and CRU_PMU blocks.
> 
> This patch is trying to add minimal Clock-Architecture Diagram's
> inferred from [1] authored by Finley Xiao.
> 
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/clk/rockchip/clk-rv1126.c
> 
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  drivers/clk/rockchip/Kconfig           |    7 +
>  drivers/clk/rockchip/Makefile          |    1 +
>  drivers/clk/rockchip/clk-rv1126.c      | 1107 ++++++++++++++++++++++++
>  drivers/clk/rockchip/clk.h             |   19 +

>  include/dt-bindings/clock/rv1126-cru.h |  632 ++++++++++++++

This goes with the binding patch.

>  5 files changed, 1766 insertions(+)
>  create mode 100644 drivers/clk/rockchip/clk-rv1126.c
>  create mode 100644 include/dt-bindings/clock/rv1126-cru.h
