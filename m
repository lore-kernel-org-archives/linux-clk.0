Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF26BC64ED6
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 02:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjB1CpF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 21:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjB1CpE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 21:45:04 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9871CACB;
        Mon, 27 Feb 2023 18:45:03 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p20so7730221plw.13;
        Mon, 27 Feb 2023 18:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp+cx5BFVXE61foSW4F34Ogh74kOmNMTmxNJN2cfT5Q=;
        b=BQz+FnfWKpBNmYZICc7SMMec1z0Ldj2tkC9abE8eTiaTU2FVW5NLrdm4hXsE1Vq0Hy
         vZ1Zz/Rr3d63/9dr6lexxY6ieM5UBwCUhiX2xNf/lmJ7ij6fGzHs95kj9lxa/jvziNUR
         3fUjE7Wvqrn1Jhp8BkNyMRvSnmh9IwVagDdvjgH1isX7MY2CKbnXom6s7POeZTyaKVRS
         YzT5hH/2DIGdpB1z6xlvZhBCSVC4MHaRbbHWQGSa/Bs6xtCS0i2RB4JV/EIUKWnkVB2y
         qDnnOSbioNkdxjaTMXHGTiSnnRB4pN1xMaQV6tUOkoYl7skJMTx7dDpP0BKY+6MP3nuW
         VnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yp+cx5BFVXE61foSW4F34Ogh74kOmNMTmxNJN2cfT5Q=;
        b=dV9thzQczA11jAtam2gsBNYLm21ut2jk5zsMbT/DwYHAHubEtMmWUdG6Bfa3NZc8qB
         iUkSr1BdtJU0ORfE6ph1YdcF93nLn7vkfenngmXl3FJg+txeDzTubsZmZuzBV7jVibb0
         7dwL2Ud57P3gVGFtbdTtkBcb2U9sHzC+OGoztoFiKQ3bpq4QOp8k7X2bkvCp9mbilLf1
         jc8u7TpRJf8DbSolzrClNtPLGZRbnoSjKS90KQFCEPRmVJZde6K1HKRTmEnaNkj4I4t8
         6APukvu/fyQbWlYVUWTY+P3KgpIqkqFKX1qv2FKZk4mH0s27piSR5qVyUysrRTH0KEap
         l+vA==
X-Gm-Message-State: AO0yUKUttPeMb2gdahv69ydByvp+8ZU9SJY+AcBXaw49OEqVeZHNibjn
        3qeguBskuL7ehYCnqYt6J9XcF9gC+vle1kJEw28=
X-Google-Smtp-Source: AK7set/BXq9vpXNq1siAy5drrmiLTAQ574AKQS4/hXo9eMqASe+IMp4kQbtzlHHaTJXRDStPpn8tnZ099rjWvqlkaD4=
X-Received: by 2002:a17:90a:8a04:b0:237:9ca5:4d5d with SMTP id
 w4-20020a17090a8a0400b002379ca54d5dmr534185pjn.6.1677552302654; Mon, 27 Feb
 2023 18:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de> <20230227174308.87286-5-marex@denx.de>
 <20230227185949.xaxltai4ksgrczmc@pengutronix.de> <c3b3c08c-989b-3868-c74f-426b8f1733a5@denx.de>
In-Reply-To: <c3b3c08c-989b-3868-c74f-426b8f1733a5@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 27 Feb 2023 20:44:51 -0600
Message-ID: <CAHCN7x+Jd+C2B+-igv=Pk0Ab4Tj7ecxRrdV85u5CSZ5DjFs5kA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
To:     Marek Vasut <marex@denx.de>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 1:37 PM Marek Vasut <marex@denx.de> wrote:
>
> On 2/27/23 19:59, Marco Felsch wrote:
> [...]
>
> >> @@ -344,6 +384,18 @@ &i2c3 {
> >>      pinctrl-0 = <&pinctrl_i2c3>;
> >>      status = "okay";
> >>
> >> +    wm8960: codec@1a {
> >> +            #sound-dai-cells = <0>;
> >> +            compatible = "wlf,wm8960";
> >> +            reg = <0x1a>;
> >
> > The compatible should be the first property followed by the reg
> > property.
>
> See my reply to the mx8mn sound-sai-cells patch , I am not sure here.
> The rest is fixed in V6.
>
> >> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
> >> +            clock-names = "mclk";
> >> +            wlf,shared-lrclk;
> >> +            wlf,hp-cfg = <3 2 3>;
> >> +            wlf,gpio-cfg = <1 3>;
> >> +            SPKVDD1-supply = <&reg_audio_pwr>;
> >> +    };
> >> +
> >>      pca6416: gpio@20 {
> >>              compatible = "ti,tca6416";
> >>              reg = <0x20>;
>
> [...]
>
> >> @@ -668,6 +730,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS   0x140
> >>              >;
> >>      };
> >>
> >> +    pinctrl_sai3: sai3grp {
> >> +            fsl,pins = <
> >> +                    MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC   0xd6
> >> +                    MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK    0xd6
> >> +                    MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00  0xd6
> >> +                    MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00  0xd6
> >> +                    MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK      0xd6
> >> +                    MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28              0xd6
> >
> > What is gpio04-io28 used for?
>
> Apparently unused, dropped.

Isn't that the headphone detect GPIO?

I think simple-audio-card,hp-det-gpio can reference it.

adam
