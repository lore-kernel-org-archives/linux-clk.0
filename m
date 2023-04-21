Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0CAC77B78
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 17:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjDURuX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 13:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjDURuW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 13:50:22 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD1D4C3D;
        Fri, 21 Apr 2023 10:50:02 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5422726207fso707653eaf.0;
        Fri, 21 Apr 2023 10:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099373; x=1684691373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AconcrSs1A3l/jlwS91qS5wDltwZxm/z65wO9RnSRQ=;
        b=dtyDfn8JFse/jE7t+JIpnVf3WIHe5UkTuFj3rh+tSjbPjNB1SpDTu/Q8aXArjiIiby
         NzRJJflG1jYbApMstfhvFoxnhN8wd5glaSf17Qp4Iow7VIPTn6W/uiylP4e23V0B0GE0
         8qcEcCzKzyHZsomIK9t9D8bckm0+NECOwkusB1tYaVwBgi4fqKIQlEHu0coOWBVT5eId
         Zq++s5VpBoNnQq7UCTUQ/xUkmsG8zSmevnHQPBaUfOqirszofXQ3nq0hXn/E9Uwe+6/P
         EL8JEd2W0qg32WrRa7JUx1LC9izOjv1gmyYC1Ns1ckyDAf6y/bBSpAFDiqXeqzFOqYmr
         5HyA==
X-Gm-Message-State: AAQBX9cy5qDmlnQuEIrZu+KwAZxr2oEakgbOxJXy3OVjWWmnoL5ClOUh
        KjTW7+VIJ5OvGal9ShrGqw==
X-Google-Smtp-Source: AKy350bLSefBVZzcnDvOCnXMNWEbvXD+LDCusHtI30LN0JGoqo9ygMS4gOKGGEZ4PwCTZpEoDqyZ5g==
X-Received: by 2002:a4a:e558:0:b0:542:4ad7:14d with SMTP id s24-20020a4ae558000000b005424ad7014dmr1392404oot.1.1682099373339;
        Fri, 21 Apr 2023 10:49:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q5-20020acac005000000b0038756901d1esm1846599oif.35.2023.04.21.10.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 10:49:32 -0700 (PDT)
Received: (nullmailer pid 1536953 invoked by uid 1000);
        Fri, 21 Apr 2023 17:49:32 -0000
Date:   Fri, 21 Apr 2023 12:49:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yu Tu <yu.tu@amlogic.com>
Cc:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>, qi.duan@amlogic.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kelvin.zhang@amlogic.com,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH V7 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Message-ID: <168209937163.1536899.13850536868055091863.robh@kernel.org>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
 <20230417065005.24967-2-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417065005.24967-2-yu.tu@amlogic.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon, 17 Apr 2023 14:50:02 +0800, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 30 +++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

