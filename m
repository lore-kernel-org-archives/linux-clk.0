Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB185C43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9660214FF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9660214FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbeJJQD5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 12:03:57 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39475 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbeJJQD5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 12:03:57 -0400
Received: by mail-vs1-f68.google.com with SMTP id m5so4254453vsk.6;
        Wed, 10 Oct 2018 01:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xGYmO5QSUBxub28gwMWwD+Hc5Y7bOP+lsELfHImt96o=;
        b=Ygrwj2565qw/m2DR0eFgaZSuQg2r/AmimsJelYO4Q/7Hdovs+PUBmTtRLPgFVrN0sD
         CNFzuo4DJAq5EImnTbJ9gD+fEfEXnqI2ypyvoCNJWSBW4DuCblaqwFDxSwbb6JHA4pwl
         WPz7mhrIfDXGPs7wWAuxvcByWEQIuQr2tRSA5kBDcbGqNX7X73w2+6jKuL6W5u8PUllA
         +zI9C6XhWq75Qch0SLrx4/+wu2HS9O5gmknAJY9S6VdtIPPQLQLZg6jefyoX6KBH+Inf
         Clxbg8oZz2Up0TBvq9ubLkDBJ8ZQFLFpcNv1XybDdc27E0tQhjaQszSdtrwI/1TSbFb7
         +tuw==
X-Gm-Message-State: ABuFfojyyLl+if598Y/TVmnX7jbYhVDHE9PEWTxSupPeh+9+aZXyujN1
        0j1h2Hyve3xv5dX3KC8iw2irbNNdnIPgf0MHxi0=
X-Google-Smtp-Source: ACcGV63JcRFMFmiE9TDUxV8womySziUJXkSrt4eZVKpYRL/lWFqd3PwXojcBD6ComzsTaIFbxHsDIx6bZX3fHN9Gbno=
X-Received: by 2002:ab0:6093:: with SMTP id i19mr5918295ual.75.1539160968874;
 Wed, 10 Oct 2018 01:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-4-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-4-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Oct 2018 10:42:37 +0200
Message-ID: <CAMuHMdXRKOggSQo8uX3iKXF+6y+6HgkgoP7m0xKUsTmZ8STVVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris,

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -13,6 +13,7 @@ Required properties:
>  - compatible: should contain one or more of the following:
>                 "renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
>                 "renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
> +               "renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
>                 "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
>                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC

With

          Devices which have more than 1 clock are listed below:
-         2: R7S72100
+         2: R7S72100, R7S9210

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
