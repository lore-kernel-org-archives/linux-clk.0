Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E50C74A4B
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 08:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjCMI5b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 04:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjCMI4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 04:56:54 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A892224127
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 01:53:39 -0700 (PDT)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E2A7941303
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678697599;
        bh=rdDSrE0VIq+XmHMRyMrdPIQatR30pRaMUhYB/xPPqz8=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=dRUkVaI76q9CPTpgxlSgLIfN4e3vgNOB02uAdgPMCpwRnqavAYzp25GQl+WpX1rS0
         Sw1bRRtLl5SXKuVE27+UYAG8Cw1+tbsNWy49t29TwQvYGVeAcXEoAZtMHaAN0mrNhx
         yhGNLbyc5+w2Q83MfACT8R3zb0ymOk9olWtDQv2qde79eRTjn1sqWl5BQahmvjD3L8
         OnK+9NlqOBIRqGVYVoYgQjBrrcn2elM4Ol4x8QgOBsXMujTC5k3zgAiLjOKhUp7TQ/
         To5mgY6XVkqUg/Uom4YGKXYHACx8L0z6NaIonii6dQEopthGcXLkU+lct6q0nR5W6p
         0EgQ/1CYptxsw==
Received: by mail-qv1-f69.google.com with SMTP id w2-20020a0cc242000000b00583d8e55181so6651320qvh.23
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdDSrE0VIq+XmHMRyMrdPIQatR30pRaMUhYB/xPPqz8=;
        b=6g3RTlNoKfgjPhY+vG6mkTuBd9I2DhJeJG7Pzad8PtvmGRD5nSg6WCzUXi3jJcm9rU
         teP2Bkvs7bi8H4MMWV7CEKCTVNuOqfSJhnhROwT0h3AerJOLUZzyDeDRcJSdzvpNiRJt
         LxkCcpW1jgzAJGzW3pNp40VGLC+9k7SrqcVqE4SBp4YP9NuNs9yK3mewPykFMdJrpsiO
         U1vUf6EUiJhGQOxlTzb7beQmabV6Ius6NeZNv0oEz/uz5Y82GJgcrAtGWAS1a32WxkM3
         KdjNLYUn2vhm4C4+E1a3SvmMcEwXQM+h2BT1+j5R3aBB73EYNXOzfK2Rj7YmkRmxSPQc
         lZuw==
X-Gm-Message-State: AO0yUKXBf459yYHAIvTunIcED2tK1zj9nUJtLQcXbLmDSuPy5/u4ZMZj
        YVd/aWJcHZPml7a3kgV1RAjOBj5MXNbKAzZW08yiXa9jaouyv23BEb7wtMBWDUe6cB8XGGJr1hD
        8zHAtCgU1cZjDr2W7lIA63iZR6Xga1t7sN+R7ZtwwLCGE4ZiDZY8o9A==
X-Received: by 2002:ac8:56f7:0:b0:3bf:b9a4:6d41 with SMTP id 23-20020ac856f7000000b003bfb9a46d41mr9407535qtu.5.1678697598301;
        Mon, 13 Mar 2023 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set8AA0sa2nCnrV8w1Osh5NxDD45ICECbteHeANn3sQWk04rh+36JVMJfWLEQ4krvOlUN6FZfm4pVyPz1TdTFshg=
X-Received: by 2002:ac8:56f7:0:b0:3bf:b9a4:6d41 with SMTP id
 23-20020ac856f7000000b003bfb9a46d41mr9407529qtu.5.1678697597999; Mon, 13 Mar
 2023 01:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com> <34b0473a-91bd-453b-91dd-01defde92d68@spud>
 <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
In-Reply-To: <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 13 Mar 2023 09:53:01 +0100
Message-ID: <CAJM55Z-zps4gEohCGyia0nESWYWqQmoChnJZXkw2Zmi5TPV2Wg@mail.gmail.com>
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 13 Mar 2023 at 04:22, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Sat, 11 Mar 2023 13:11:38 +0000, Conor Dooley wrote:
> > On Sat, Mar 11, 2023 at 05:07:23PM +0800, Hal Feng wrote:
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>
> >> Add bindings for the system clock and reset generator (SYSCRG) on the
> >> JH7110 RISC-V SoC by StarFive Ltd.
> >>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
> >>  MAINTAINERS                                   |   8 +-
> >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
> >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
> >>  4 files changed, 454 insertions(+), 3 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
> >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >> new file mode 100644
> >> index 000000000000..84373ae31644
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >
> >> +  clock-names:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: osc
> >> +          - enum:
> >> +              - gmac1_rmii_refin
> >> +              - gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >> +
> >> +      - items:
> >> +          - const: osc
> >> +          - const: gmac1_rmii_refin
> >> +          - const: gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >
> > Assuming nothing else here is optional,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Yeah, nothing else here is optional. Thanks for your review.

Wait, what kind of optional are we talking about here? Surely all the
i2s and tdm external clocks are optional in the sense that you don't
need them on a board that never does any audio processing.

/Emil

>
> Best regards,
> Hal
