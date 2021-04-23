Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9295FC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 18:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 628446121D
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 18:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243583AbhDWSOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:14:53 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36631 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243503AbhDWSOo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Apr 2021 14:14:44 -0400
Received: by mail-ot1-f51.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso35435805oto.3;
        Fri, 23 Apr 2021 11:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wtMa0ofHsvULRBbfBv4LBMvbBadAF6ckmy4fcrRnOYw=;
        b=jsZ5VotrVYWSgcPL8clpPQaa2zgQjEVsvdb5EJkBT2RxVguH5/6bpDNxi2CxqIel8a
         /G11nFfGINtMbX8WLt7kTmkoRHLkc9KSuLYB35dv9zccOtmbTIz82K85vu6j4X3qC5yA
         Edv6f7mbs++D3Q0dF/ualtKLxE4dtnVFNP/CZ8HYvijbZTBhuhfweqfatexLRlVvucJW
         9kIvi4VOIilqUaPdt090IA4Tkg3+Jk1Y6fc2+Ww4Oy2ws4gbp247VSocB07lOLudhxqY
         WpKbPFGB03FlBO7Tz8OqbpiUGsagO9wdhVw1uaiJEbjvaO2x5fJwbeiiMGHaO/ZGrzr1
         Kr5A==
X-Gm-Message-State: AOAM531/q6N8pRtzfXzDFgccVj0ykbTlGb7v1X5WAkHmqzNRI4YzgZlt
        6sVf9e6zvvJbuECCA4xwOQ==
X-Google-Smtp-Source: ABdhPJzEQ7FOs3zkv/BmeyQzNc1iYSzWSn+0Ia3g8izPCAkQyvYd4VpAPPtq1wkttfDk80uM6b/zFA==
X-Received: by 2002:a9d:6055:: with SMTP id v21mr4425589otj.49.1619201645615;
        Fri, 23 Apr 2021 11:14:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w24sm1569880otj.33.2021.04.23.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:14:04 -0700 (PDT)
Received: (nullmailer pid 1363626 invoked by uid 1000);
        Fri, 23 Apr 2021 18:14:03 -0000
Date:   Fri, 23 Apr 2021 13:14:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: clock: brcm,iproc-clocks: convert to the
 json-schema
Message-ID: <20210423181403.GA1344607@robh.at.kernel.org>
References: <20210421163948.11229-1-zajec5@gmail.com>
 <20210421165633.13299-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421165633.13299-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 21, 2021 at 06:56:33PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix typo s/clocks/clock-output-names/
> ---
>  .../bindings/clock/brcm,iproc-clocks.txt      | 313 --------------
>  .../bindings/clock/brcm,iproc-clocks.yaml     | 398 ++++++++++++++++++
>  2 files changed, 398 insertions(+), 313 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml


> diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
> new file mode 100644
> index 000000000000..a1b9613f7c68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
> @@ -0,0 +1,398 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom iProc Family Clocks
> +
> +maintainers:
> +  - Ray Jui <rjui@broadcom.com>
> +  - Scott Branden <sbranden@broadcom.com>
> +
> +description: |
> +  This binding uses the common clock binding:
> +      Documentation/devicetree/bindings/clock/clock-bindings.txt

I think we can drop this statement.

> +
> +  The iProc clock controller manages clocks that are common to the iProc family.
> +  An SoC from the iProc family may have several PPLs, e.g., ARMPLL, GENPLL,

s/PPLs/PLLs/

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
