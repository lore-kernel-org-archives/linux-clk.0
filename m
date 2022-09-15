Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7E5ECAAD3
	for <linux-clk@archiver.kernel.org>; Thu, 15 Sep 2022 09:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiIOJgz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Sep 2022 05:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIOJgy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Sep 2022 05:36:54 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9486753AF
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 02:36:52 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e18so7308981wmq.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Q5oC9faImt9D0zslczuwTCnYe/Fu0rELKtEkE9Enw9k=;
        b=f4LkzKRBrsqWOrsiFynIlNRNEQmtjOegH1rGBO+J54GGi14tmZ4vkp5YWia1ONm9XQ
         gglhzp0BPaXj7TKFENEnKH+gdfBYtpJfsVAIYYq12crzhi5Ze4CfcNVH+W27xf4XbM2u
         RAtYzlKtplUiso71VruUWkBsbAWqFRHtXe7VpandjNf9xGkQ2yV3kOKxVcFpOXxYTZIz
         wPgyVT1xaaVqBD60PGeh+V9a1FT16BGuZHnXdAmohTN7Bt3HzB/VrxwCF17u79iDIEL5
         WOx9T/JumWYeL3z6RzxZ2IrJsiu3GAwASrAA73e1YIZX5JBWmNqUcaGL8qXwBOWLb8os
         rW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Q5oC9faImt9D0zslczuwTCnYe/Fu0rELKtEkE9Enw9k=;
        b=ay+WwNEguOcUk7wP1TuEdUmX9KQ3SPzx8ebZoP64zr1GShW7ACypl5Iw6ytYYz269c
         ar0hodOJ6GLbEksi5A90UYQsCe3Ip34Y2RbliGadfIZgZuL0Xp5mAqZnqxQQkx5x1CXy
         YIYJkpKyDwFVgTVnK+xrjSZUz4rzCdOCvqagQc3bSNCIqmT+gniAcVMP1q+UBw/CIokc
         FwsKZxy3Glx8PADSlU6U7fyomX7rWWClcrJ15nRk0VNME94ykoXLcI16q70zrGunTSJu
         4IckUbbAypLnPaxRcP8HtRJUTEeSkdH8/tGDlihLVdsu8rHJt5L/CaCxZchF53u6ptAv
         j05A==
X-Gm-Message-State: ACgBeo38Gfmy4lkmU5jmmAG7xOtr2qtycOMJMtcOzGJ2LZuaGRG/7UFM
        0RyX59Ut27X27/eqe+YKbXk0AA==
X-Google-Smtp-Source: AA6agR65hP5LHu32uKJVvqgNLMb2zEp4ZAqaMy8dZpFTmm+m6vtEIK3zg73WcW0k9xNVMlLa6+0nVA==
X-Received: by 2002:a7b:c844:0:b0:3a9:70d2:bf23 with SMTP id c4-20020a7bc844000000b003a970d2bf23mr5929370wml.165.1663234611305;
        Thu, 15 Sep 2022 02:36:51 -0700 (PDT)
Received: from krzk-bin ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b003a60bc8ae8fsm2544406wmq.21.2022.09.15.02.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:36:50 -0700 (PDT)
Date:   Thu, 15 Sep 2022 10:36:49 +0100
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, geert+renesas@glider.be,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add bindings for Renesas ProXO
Message-ID: <20220915093649.djdipsrq4homkmaz@krzk-bin>
References: <20220914211809.22500-1-alexander.helms.jy@renesas.com>
 <20220914211809.22500-2-alexander.helms.jy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220914211809.22500-2-alexander.helms.jy@renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 14 Sep 2022 14:18:08 -0700, Alex Helms wrote:
> Add dt bindings for the Renesas ProXO oscillator.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  .../bindings/clock/renesas,proxo.yaml         | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,proxo.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/clock/renesas,proxo.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/clock/renesas,proxo.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
