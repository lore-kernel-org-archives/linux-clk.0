Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020F2C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 12:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjGMMe6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 08:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbjGMMe5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 08:34:57 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFB0211C
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:34:53 -0700 (PDT)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EC7763F738
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689251691;
        bh=0x7/BB02h/Vjaz89nOjegAfaWNL3HV1UN7FsNnRRs5Y=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=UamJr2oIDSh80bjbvkKWVPqMnxRbAUBbZFqQbTq3QQrq6odNl+a4du7qvO0eOpNZX
         a+SBwqrPKxHPhm523ajYNBkVheY81U461U43E8rJu5TBq2lmoYOBCHHdt3NMXmqR67
         eBH7I3CK4KMwVscGadIF6v8U5MP8JUwXFpCCEGPn4+geeup2W1HRDZzJlqcP115oar
         pC3XHnKD0xi2HaIsXD107dEGIilIbQuZOaUumgd5J9boNqGZRtGYXLXh58K8p3/eOy
         jVBddF2zwNfK0146LwoBuS4Imv51UHR073B6U2+6BStDM0peytezqIRIgL1JLKFD4t
         vYEV0BnZ/SroA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403aa344d39so8361171cf.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251684; x=1691843684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x7/BB02h/Vjaz89nOjegAfaWNL3HV1UN7FsNnRRs5Y=;
        b=TbH5cJyCKYfcRJNnQRQugi8zt7x0Sl7t1dnDpNZr0K7AlyuBzDJzhv+PanB4pHprBP
         3RLpsr+e0gqxKHwRWmYNdbfwmbfLXUGsO/Ookwz0+9R2bGJZMbqVYME51X/SvYzkBscE
         PYQoPMczNIYbzRdmkM90cOQlGOnFUddUZ1BKYN4BQslnnTfMrFUFRcdmKRJcVL7Gq0Qs
         Mgrff4GoAWnULOcyEEfaqK8RuONwz4NArGe5RQ6V81kNkrvri7vTB35PurEJA25M9tnO
         9BXId33ogixj1TbGHvwOL0kHAx4onmMs/VgnxyDQlqaxLtXhJDSTaOzKRlfWO4JmzNX+
         MICg==
X-Gm-Message-State: ABy/qLbjLq9AhLYdQjf8hm3HtosjYsKUOxu08lnTPcVJzblyMikbvEwZ
        4nvGGzgZmC80HQuxzC97f2BC7eiB5I55VUR3IyX4c9UCa9jzyVJgpYzGFeB9dsnOg4+w64xryxM
        fyq/lACXtXF5YlqtjiJtLvqRxlJ3v2YLY9G4ltRhA3wSCZdukXhuKFp3AaiFjvA==
X-Received: by 2002:ac8:58cb:0:b0:403:a9ba:d595 with SMTP id u11-20020ac858cb000000b00403a9bad595mr2189546qta.32.1689251684211;
        Thu, 13 Jul 2023 05:34:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG3uRO1DJxIMzsFBp7ZXZT9kVzajztPoJnaw8GSN7V/IFWeOTElpBFxOiBbpxw9/yVM5LzSpzhxS7VtF7gIEK4=
X-Received: by 2002:ac8:58cb:0:b0:403:a9ba:d595 with SMTP id
 u11-20020ac858cb000000b00403a9bad595mr2189533qta.32.1689251683990; Thu, 13
 Jul 2023 05:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-4-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-4-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 14:34:27 +0200
Message-ID: <CAJM55Z-3YPgFOTVbz=hdL-wbWCvYTb=KMiqFbU812zF06Lqx9w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL
 clock inputs
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add PLL clock inputs from PLL clock generator.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../bindings/clock/starfive,jh7110-syscrg.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> index 84373ae31644..5ba0a885aa80 100644
> --- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -27,6 +27,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
>
>        - items:
>            - description: Main Oscillator (24 MHz)
> @@ -38,6 +41,9 @@ properties:
>            - description: External I2S RX left/right channel clock
>            - description: External TDM clock
>            - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2
>
>    clock-names:
>      oneOf:
> @@ -52,6 +58,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
>
>        - items:
>            - const: osc
> @@ -63,6 +72,9 @@ properties:
>            - const: i2srx_lrck_ext
>            - const: tdm_ext
>            - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out
>
>    '#clock-cells':
>      const: 1
> @@ -93,12 +105,14 @@ examples:
>                   <&gmac1_rgmii_rxin>,
>                   <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                   <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -                 <&tdm_ext>, <&mclk_ext>;
> +                 <&tdm_ext>, <&mclk_ext>,
> +                 <&pllclk 0>, <&pllclk 1>, <&pllclk 2>;
>          clock-names = "osc", "gmac1_rmii_refin",
>                        "gmac1_rgmii_rxin",
>                        "i2stx_bclk_ext", "i2stx_lrck_ext",
>                        "i2srx_bclk_ext", "i2srx_lrck_ext",
> -                      "tdm_ext", "mclk_ext";
> +                      "tdm_ext", "mclk_ext",
> +                      "pll0_out", "pll1_out", "pll2_out";
>          #clock-cells = <1>;
>          #reset-cells = <1>;
>      };
> --
> 2.25.1
>
