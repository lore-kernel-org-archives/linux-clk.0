Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9757C6FA83
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 19:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiILTur (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 15:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiILTun (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 15:50:43 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E48537191;
        Mon, 12 Sep 2022 12:50:42 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1278624b7c4so26294987fac.5;
        Mon, 12 Sep 2022 12:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jjFDAUThbN7vtt9vwux7lJlDSmQyMgvdlrM38fRSRUY=;
        b=34+6eIrFNVX6jdNYlE/YwC1szXdJDnaf9WypujQp7iX7dLx4gq1/beCxOkO6WUkVdV
         8pB6X6yz++b+t7UeTvn3D7FOIm8opBx+MCm4OzRuoUfu5Y0gcSOyjpVYL6wCm3E9oPnY
         xLvDyCtjb9ZYrvtyQr93xW2f/OYpUrwPwCeb/kqkZYJPEiVA7/6ig3BVLaAEk/v7u9mc
         LPNEIRt2ruoB2Xn4QixzbZLhk3p7hBFuUUdCFu4lat6F2TagxTR23V+zEd+ELS68JL8K
         p4O+ZAuk3OxUA1e9sdmepRtWOvO9U47jmpctLmt96sE5cIY0FHfYfoXILY1zh0D8DtrI
         TknQ==
X-Gm-Message-State: ACgBeo3b897EU7U5GEY/Dy8gHpUu9HhXRMtpFkDgMgYHnkYuhDJ6KJRc
        N5G+2GU226EKDaW2jyr9eg==
X-Google-Smtp-Source: AA6agR4nvSs6/oyD1FOnWfMit5/ozmUIVsykwr6OJnIJD+tWOiEEiRnvXwBzhpAsAjFY8W5k4NMK6g==
X-Received: by 2002:a54:4e97:0:b0:345:4cd0:20fd with SMTP id c23-20020a544e97000000b003454cd020fdmr3037oiy.206.1663012241170;
        Mon, 12 Sep 2022 12:50:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y11-20020a056830208b00b0061c9f9c54e4sm5058643otq.80.2022.09.12.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:50:40 -0700 (PDT)
Received: (nullmailer pid 1724704 invoked by uid 1000);
        Mon, 12 Sep 2022 19:50:38 -0000
Date:   Mon, 12 Sep 2022 14:50:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-clk@vger.kernel.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Message-ID: <20220912195038.GA1724641-robh@kernel.org>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <20220902213721.946138-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-4-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 02 Sep 2022 17:37:16 -0400, Sean Anderson wrote:
> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
> with assigned-clock* to specify a particular frequency to use. For
> example, to set the second PLL (at offset 0x20)'s frequency, use
> LYNX10G_PLLa(1). These are for use only in the device tree, and are not
> otherwise used by the driver.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 

Acked-by: Rob Herring <robh@kernel.org>
