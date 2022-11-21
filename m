Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46E0C43217
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 11:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiKULj7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 06:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiKULjl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 06:39:41 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C7997091
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:38:36 -0800 (PST)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 250A63F2FF
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1669030715;
        bh=k1LFdNn2YthCqXfDo2Al9HOEWWRFBoST7OMZo/loF+4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=qQ8GF2PFJQe0ondbPn9KpePolZeE1DCKWnPRm56IMDk88w2zK9Zpy9idVkUprUBt3
         jkzpC9PlwKjo6el/z7T5MlZVEzsLu24aa1TW1l7YjsETi/B1liUtAzPM1zlGdCtgs4
         qtE19++7cSBqoisFsV2WTIYxL6Ww383Se8cbWhqCy+Xt4d48vxfc0f0WOTIvK6HFu8
         vhyCcXhZo4bXlHeHdFEiPoGx1E6PmUfrYXPMrrZNu37v36HlimV04T5aD5YC+4sBIy
         ojRUuI21RWdd9bPGAHmoEuAwC7P8a6wc3U8Hnp0nRIl9DRUz3uTq6UR2CnNwU7Barn
         3eZrQY0GjyLGw==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-399c3d7b039so54933957b3.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1LFdNn2YthCqXfDo2Al9HOEWWRFBoST7OMZo/loF+4=;
        b=bQYvFIpo+Wow7O88gZId3Q+g/zmJWkoMUZ/VnDUCccbmTJ7PhEHD89kmeDjlLZ2nHV
         7oauGiQtDWMLXrTfiJre0/FmP2HXjLTPMqzcmzsC9HqSo7ZU51MG53rcRZAjtL66/Sew
         dBLQ/T9Nae0yH1gjmuD8dBPIlfv0vCGriFigZBNkGcsonSEubm5ZpWsxVtkc5KnZJD1d
         Z9Zme0Vq4b6hYxbP1QQuvrmPXQ9bZurLSwQWv2iTr0kjDt0RvY5g6yMBXxBzGTCHIa34
         e5YVYolUUhqY7zrdgvv9fPQtyB6stbbB/Q3obIpzNMfL3Rk3eMykabCOgrnV9a8b2/3w
         5K8g==
X-Gm-Message-State: ANoB5pm7RTYbNnPLE3DqrhiE4SyHY4IA4PRHNRrESrXqoCENNddnJk4s
        SDw3rdh9aN+B1GxfZ0R2F8jEWSfGhPrGnMWV8uJCAfthxX4Bv0erPG6N0NQnU2aYo2WC46RnzQf
        pomzqwPl082J5FYFJ4xgII047JRoZcSocq+TdBHSBuVBz5nc81j3Tkw==
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id k15-20020a25e80f000000b006df927f38c9mr16158709ybd.92.1669030713972;
        Mon, 21 Nov 2022 03:38:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WqnZPCDXzAGWO5+CsGrfvY5dZ99oEse/5+ZdgxQLRmeJNBWFQZouQa8Zd7b6wtc3vX0BNaCAIpFXWIf5Gs/k=
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id
 k15-20020a25e80f000000b006df927f38c9mr16158698ybd.92.1669030713733; Mon, 21
 Nov 2022 03:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com> <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
In-Reply-To: <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 21 Nov 2022 12:38:17 +0100
Message-ID: <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Nov 2022 at 09:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/11/2022 02:06, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add bindings for the always-on clock and reset generator (AONCRG) on the
> > JH7110 RISC-V SoC by StarFive Ltd.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> > new file mode 100644
> > index 000000000000..afbb205e294f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 Always-On Clock and Reset Generator
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <kernel@esmil.dk>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh7110-aoncrg
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main Oscillator
> > +      - description: RTC clock
>
> Real Time Clock clock? :) I don't think the input to clock controller is
> the output of RTC...

The description is bad, but even the documentation calls it "clk_rtc"
even though it's really an optional input from a 32k oscillator.

> Best regards,
> Krzysztof
>
