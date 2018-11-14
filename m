Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8B3C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B3AF22419
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 11:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3AF22419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732208AbeKNVFd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 16:05:33 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46388 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbeKNVFd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Nov 2018 16:05:33 -0500
Received: by mail-vs1-f66.google.com with SMTP id r14so9211691vsc.13;
        Wed, 14 Nov 2018 03:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCkmfUn5+BkX+06H7Xd5ZVKjso6LriLu2pmZt1CPfyk=;
        b=AUAYl7F7vfPABj4rljonTFeFYmMjnbZaW1rui9yP+HobjM/5aFLw1LQtNDYmCqM1nT
         RBCFfEf+NHxJ81RSAIkM1q0bhJxApoptXUzo+4KQ9AZ+lSG8DP/IndlCMxZcQrkYS63i
         MMnQffc/5EaxLBTBGodPSnC7TTatQPWYgrSnuMAj39/ZSVXpMfz+daNSjHhEPq4zaWgK
         /eJIeKZ9+wbCxbBeXYehsW8/XoWxDIYvWo5SuQ/usyjBcpZqy8RKK/m5HwhM5Ck2hZ6j
         2U/+8VPLGJSIyeXwq6iLkFi5u5aAlsUJ/BvVJ722DVa81Bhz65ZaitYC6c8dwC558dTi
         Dwdw==
X-Gm-Message-State: AGRZ1gKMnl4kgFMeaOYPS7sW0dEk5Rc4NuaQ4zgEMxyMwSNFu3dciatt
        3p0morvfCM0ZCB4uiXjg/gsNMh6dE53B6qS2u+g=
X-Google-Smtp-Source: AJdET5ei9liEK0k1RC00lm1Fl25G3yfwBAE/+Q3ZvgvY6FRSIqZHFu6a6y9J572iCfBxB995KawtPCL1kCvd9QoNwgM=
X-Received: by 2002:a67:d119:: with SMTP id u25mr542926vsi.63.1542193365256;
 Wed, 14 Nov 2018 03:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20181107173558.54481-1-chris.brandt@renesas.com> <20181107173558.54481-4-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-4-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Nov 2018 12:02:32 +0100
Message-ID: <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris,

On Wed, Nov 7, 2018 at 6:36 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document RZ/A2 (R7S9210) SoC bindings.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index de7b5393c163..b545daf8ccb3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -1,10 +1,12 @@
>  * Renesas R-Car generation 3 USB 2.0 PHY
>
>  This file provides information on what the device node for the R-Car generation
> -3 and RZ/G2 USB 2.0 PHY contain.
> +3, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
>
>  Required properties:
> -- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
> +- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
> +             SoC.
> +             "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
>               SoC.
>               "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>               SoC.
> @@ -16,8 +18,8 @@ Required properties:
>               R8A77990 SoC.
>               "renesas,usb2-phy-r8a77995" if the device is a part of an
>               R8A77995 SoC.
> -             "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
> -             compatible device.
> +             "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
> +             RZ/A2 compatible device.

Is it a good idea to declare RZ/A2 compatible to R-Car Gen3?
Usually we don't do that for Renesas IP cores used in different families[*].
Of course, I know you do have a good relationship with the actual RZ/A2
hardware designers ;-)

In light of Shimoda-san's comment w.r.t. R-Car H3 USB port1 in the driver
code, perhaps "renesas,rcar-gen3-usb2-phy" should not be used?

[*] Sole exceptions I'm aware of are:
      - "renesas,rmobile-iic", in addition to "renesas,rcar-gen2-iic" or
        "renesas,rcar-gen3-iic" on R-Car Gen2/3,
      - "renesas,rcar-gen2-cmt1" and "renesas,rcar-thermal" on R-Mobile APE6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
