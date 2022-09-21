Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1F0C6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 06:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiIUG51 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Sep 2022 02:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiIUG5Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 02:57:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059987C187
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 23:57:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j24so5310786lja.4
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NK2N/b/QQywGXjYSUF1DR4DFgFeCcv8ay3tmMR7yQe4=;
        b=zd9VKku7G1ak2cVyYOpEVge/UKl5/MrmOGUtOuV36rnH2moft2SkAC/9tMMOJjqevW
         iij9gy5AkWzLqLBhcQtg1LjWDm4G7jMk8WimQOrNfN9u3qVCSv4AvFMcBkGlB/Z+DkrM
         44pP9yln+ruBWW3bjLElOcV+dH5W1qdMRKI9bGT5lqT/8i3qKkxJAdDmOLkLgCbIHLdQ
         yXDMxXv2Kyp4S00TH8ryrjxRPvWLMtROado73s+RWJl4EyKQFnQDrVSrFJ1qNp7NWebr
         brEd1UtiG4Qv3mueTQn9TpQaUJVc7FuasEN6YvoZj72MynPHRGdqSqPndsNjRBMnNICy
         zACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NK2N/b/QQywGXjYSUF1DR4DFgFeCcv8ay3tmMR7yQe4=;
        b=K0fXpsjyfmSNkFlFwy/X9jQ+O15irGagFUW25FPF6uKnMFYWHgbMDfrY3dXdo9HEye
         mOBo2Jd5HUFYxUjxw0LS6eCzYGhXNZ37QuRp6oWjwhjgQGtCRCBL0QCMgyh4ij721Wrs
         AW5c4DA0AGzoxaOdVN+uH/Lz5oofe5qfnkJ/wgyzhDYi7vN13hn9qt2pqkD04ET5oMdG
         T5yVKX6DGGBGM+sGc07pK7mAFFg6SKwr22Y1e3myR4sHSbX2V8YGRMwsStpkCJFo7rzZ
         jx3At0oElY43CO7JfUFfkoaN/FYObToDkdY/s5rWt9gFvQlnq298XL3SZKuaWYTVV9Ax
         96qg==
X-Gm-Message-State: ACrzQf1NaLSfhX5lDkKuxgHd9RCikevwzi0INEyDu/WWcGWmqhrZDOXa
        P/69mVa4RHxlxsynS7iR1itcsA==
X-Google-Smtp-Source: AMsMyM4EcQa7KqdhM3o6+dyVA7n/gHX0GrxOqzZR52bpaVcu/jIZW6WrDc7SJVRTnVlFdh3dYeQywA==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id o10-20020a2e944a000000b0024f10bdb7e8mr8835541ljh.238.1663743441318;
        Tue, 20 Sep 2022 23:57:21 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p15-20020ac24ecf000000b00499cf3e3ebesm307999lfr.121.2022.09.20.23.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:57:20 -0700 (PDT)
Date:   Wed, 21 Sep 2022 08:57:18 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linuxppc-dev@lists.ozlabs.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Message-ID: <20220921065718.lafutkkgiium5ycu@krzk-bin>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920202356.1451033-3-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Sep 2022 16:23:50 -0400, Sean Anderson wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
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
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
