Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F537C43219
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 13:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJRNcI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiJRNcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 09:32:02 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96D3CA880;
        Tue, 18 Oct 2022 06:32:01 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id g10so15525562oif.10;
        Tue, 18 Oct 2022 06:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/sc5xfjWbep3XdzZfvFceKEVzMS+1eS5iVILCK+RzyA=;
        b=KauH+vHA6xPWz7CJV4XBgw9vuw3colVkfSPap/bikAw9/uJh5n19Tf/5M8avFoa2aF
         AZZl43vEPx3esSjL+3Chr/wz0BtBK9Y12dUQwdsoLASfVZ9i8mDViaxzuQS/APzSu03f
         L1uxdOmwUk/kMPeB+z3aeYAAeu+NL82OXMth7QH23KlSsxrA1ybaCF1kfgIIJ763K1jc
         FOf9OKCu6pATX8+JS+M6BCg/VCFAb3a+Fy9YXDvvFVfpkN8LFI7VQv7fAZpoyTn/aTZK
         +hXauHsMrId1Sq/hQmX/d8trcu6u3L2x4IyzvW6ywsfV/v5gaTOeQUY2ObVBHE0X7E/G
         M91A==
X-Gm-Message-State: ACrzQf0VVws4OnuIb3cUa2CjOPI1fXPA2ya0Uu35ZqeiVNDnPlvzXlYi
        05m/q+HpyigotJBCVEatvA==
X-Google-Smtp-Source: AMsMyM6O96ho0FdVAHMJ0wdtQSaFrVSflxDHBhWXy9n/5CqGY3B7jr/SPsYk5PbQXTTdsZkI31qUAw==
X-Received: by 2002:aca:4b0d:0:b0:354:c1fd:27d with SMTP id y13-20020aca4b0d000000b00354c1fd027dmr1420251oia.108.1666099921003;
        Tue, 18 Oct 2022 06:32:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bd18-20020a056808221200b00354e8bc0236sm5643318oib.34.2022.10.18.06.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:32:00 -0700 (PDT)
Received: (nullmailer pid 180824 invoked by uid 1000);
        Tue, 18 Oct 2022 13:32:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com>
References: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com>
Message-Id: <166609951951.171676.6449728650793742921.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
Date:   Tue, 18 Oct 2022 08:32:01 -0500
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 18 Oct 2022 09:21:06 +0200, Alexander Stein wrote:
> Convert the TI CDCE925 clock binding to DT schema format.
> Including a small fix: Add the missing 'ti' prefix in the example
> compatible.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I have to admit I only have one specific addon platform for this
> hardware, which is actually a CECD813 tbh.
> 
>  .../devicetree/bindings/clock/ti,cdce925.txt  |  53 ---------
>  .../devicetree/bindings/clock/ti,cdce925.yaml | 104 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti,cdce925.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti,cdce925.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti,cdce925.example.dtb: clock-controller@64: $nodename:0: 'clock-controller@64' does not match '^clock-controller$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti,cdce925.example.dtb: clock-controller@64: 'ret' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti,cdce925.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

