Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D17CC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 15:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhLNPVc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 10:21:32 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39870 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbhLNPV3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 10:21:29 -0500
Received: by mail-oi1-f169.google.com with SMTP id bf8so27583585oib.6;
        Tue, 14 Dec 2021 07:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ryrTBuCXi8cKMhnhItLTtO/zaJoNSMYFKhjpdA0JEds=;
        b=1ZC8eqc+GQSR9aFbSw71KkGAdJ92+Y+kf7RPuv68FxktS0lIJp7xzQqWjd3PLvYtO3
         How/YdLyzNBUv4jUPHphXTWnPBE3GWXo9E7oBTQjZ9LwhggeSjbOqKBxk9DGEqGwz5ax
         GK3FB0knqMJ7uSnbYvwSzgkkL5dmDzFYfbmgPmDsHcUG7jz4TejA+dHb/7VpJWfIWJFf
         /xrYRFh/tgIOT1wY2wPUTjJ4JBoCwXpmryH8TIXqqJEo/2nlw3eY5TQg3hv9wl2mlCAO
         fzKy9KKoKz0apZNn8PDEhfiHuR3sCZUk6+d4G9Pns+ssrm1hQSxvTBqqq5lUni3lm5dp
         LMVg==
X-Gm-Message-State: AOAM531SAtiAkTrTXizfDmysN2ZdewHCl9Qi65tgeTsLAzcMkt7wllzy
        HehnB0MZI1TyuJ4yWyE69A==
X-Google-Smtp-Source: ABdhPJwVXcQrvGMiH9DXxTYdRdpO/IF92MDRkgp+E0Qks7ORoj8F9+7Bqie8Qq/wvA8O4fWjvvyrlw==
X-Received: by 2002:a05:6808:1814:: with SMTP id bh20mr32879764oib.31.1639495288821;
        Tue, 14 Dec 2021 07:21:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g24sm17522oti.19.2021.12.14.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 07:21:27 -0800 (PST)
Received: (nullmailer pid 3397593 invoked by uid 1000);
        Tue, 14 Dec 2021 15:21:25 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     marcan@marcan.st, kettenis@openbsd.org, mturquette@baylibre.com,
        robh+dt@kernel.org, sboyd@kernel.org, sven@svenpeter.dev,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20211214120213.15649-2-povik@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-2-povik@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Date:   Tue, 14 Dec 2021 09:21:25 -0600
Message-Id: <1639495285.047147.3397592.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 14 Dec 2021 12:02:48 +0000, Martin Povišer wrote:
> The NCO block found on Apple SoCs is a programmable clock generator
> performing fractional division of a high frequency input clock.
> 
> Signed-off-by: Martin Povišer <povik@protonmail.com>
> ---
>  .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/apple,nco.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1567695

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

