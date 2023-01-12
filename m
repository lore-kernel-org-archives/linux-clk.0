Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC20C678D8
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 20:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbjALU46 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 15:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240634AbjALUxn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 15:53:43 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D058A1EECD;
        Thu, 12 Jan 2023 12:37:55 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id p133so926379oig.8;
        Thu, 12 Jan 2023 12:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te3B7QXiN9a5dOliEetl+fEAA7YyitjOHHWZmEchd3w=;
        b=glIVCEb5+TcQQaQjOut7R+KGoYBvNI791BluYJ/OYHr0bDF+/Z1heVXQSFhYra6Dvz
         As7awkhwMXMhQseRZqcNdF48EIgGsjupYNgVzNrG111dAZVCre745GdpHpijuVdA6Ni6
         f90hyGzBj9GLzw93DTRFOZIemp0c4ifEeJ+qNHfmLQX28nXu1EoRTEcws6ZEhKHGKRne
         +6kP4eHG6VI+B1l+OXpk3gk2GPbAjjaYAQKhj6TBDqCEWa6KaiuxfAkVQZNJfDSADjJw
         EiaTABQCKLf7K7LahSFHBVZzBz+eAQY2E75ALYQpVnL2RkpNffXNELjnlJumwON4rSTn
         ABWw==
X-Gm-Message-State: AFqh2krx0dvK0W74x5XK58C50EzA0KKTxPyk/UAaXEm9k54CLaXAmPLM
        VnZ6a+hGhNRgmG4I5XjPgA==
X-Google-Smtp-Source: AMrXdXtC9JDQSCNr2mBpmyaH+oX/tQisTbLPdzKuWPbRgBBSAol/1Q54L3bzvRFV7wQZ4EvPIFzPhA==
X-Received: by 2002:a05:6808:f8f:b0:364:9fd7:4fc with SMTP id o15-20020a0568080f8f00b003649fd704fcmr1212036oiw.50.1673555874866;
        Thu, 12 Jan 2023 12:37:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x8-20020a9d6288000000b00661a3f4113bsm9393754otk.64.2023.01.12.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 12:37:54 -0800 (PST)
Received: (nullmailer pid 126537 invoked by uid 1000);
        Thu, 12 Jan 2023 20:37:53 -0000
Date:   Thu, 12 Jan 2023 14:37:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Madalin Bucur <madalin.bucur@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-clk@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-phy@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v9 02/10] dt-bindings: phy: Add Lynx 10G phy binding
Message-ID: <167355587246.126242.1070313368786035671.robh@kernel.org>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230000139.2846763-3-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu, 29 Dec 2022 19:01:31 -0500, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v9:
> - Add fsl,unused-lanes-reserved to allow for a gradual transition
>   between firmware and Linux control of the SerDes
> - Change phy-type back to fsl,type, as I was getting the error
>     '#phy-cells' is a dependency of 'phy-type'
> 
> Changes in v7:
> - Use double quotes everywhere in yaml
> 
> Changes in v6:
> - fsl,type -> phy-type
> 
> Changes in v4:
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 248 ++++++++++++++++++
>  1 file changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
