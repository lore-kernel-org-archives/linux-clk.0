Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E425C0015E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 13:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235298AbjGMNYG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235522AbjGMNXc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 09:23:32 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2F73A97
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 06:22:35 -0700 (PDT)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC7EB3F724
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689254513;
        bh=enRX6hWC2iaemXY8CE1QlIdDJtfFUqCURuPciqCUAP8=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=OEdLtaipPM/O8RTKSA6hczGsYGn2uGcOlBbTh3YnTMz1K6ST9o8osbhp2RK34DWVh
         B2dO8ugmnymelt35VxGqhF1oDAH6I8B6CBxMQ+gJocSpWzjlZ3yqD0H1K9qHHFa9JN
         EcLURzQqnTuCrUGQkGKc+eZngOfOtKOEu2vRv0con1J0uwQyetwVkua/RbfDJgmhvs
         GnIRfIJN9h2STUK6PxKtCGCi5NwJP5NQb1SxbAa1GJPNupBODlj/ZUFxnOYaMguK+J
         yik698ySad+GwL0+UiOsYXoJHS4j980Wf+iz86/im5VizLFCDFH84ceBa9RGXMhh2p
         3Tq8rsnQSKsrA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-403a5b83c9aso9497861cf.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 06:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254512; x=1691846512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enRX6hWC2iaemXY8CE1QlIdDJtfFUqCURuPciqCUAP8=;
        b=B5n9Go+5z4klz3VOoob+gAfWTmoeAByhi/YRNi9yjrm3gMoQoOECk/r41k6QtY5IZo
         6FBf3VevxjZF/aysX/gYhY0S0p3IEcrEFQBZqQtfuK7uvfDWJyM+69u2MHy9Mtc7pXwy
         wdabXezoVHpVO2GdegB6QYFjjAMUqqRLRUSwPcStbB5cwC9yHqZEltyEpuvN8Laj9D8v
         25vryXaNEXxyYaoUkARBTlmaJspV4ZWjo7e6uhb47geK4gX19YM23yDcKAuV7i3yJtWf
         Pt3kH1KIKslZRAi+1JyAiEBhg/WEl3/w5mYflMHW+yYL1l3FOoWtOQ2abFKM/n5FuL8I
         SFJA==
X-Gm-Message-State: ABy/qLZgnu4LNVwJryHie8QjEauWxGkNkLETpMVT+A62dJlSvXIABnVp
        LeKzudBs9IkfIWl4wiIPZU5asQuj81H29ZL4rRMpjHP9Pnq7fzCnt8tgGalmrNIJ8u9RaFEP1y4
        xnr7N5iDZObG9lrD+ryLJd3fSygE+z38sxSLqeOPHZ7Rta0hI9QVrofloU5UCtA==
X-Received: by 2002:a05:622a:104a:b0:3ec:490b:ce6e with SMTP id f10-20020a05622a104a00b003ec490bce6emr2001174qte.48.1689254511999;
        Thu, 13 Jul 2023 06:21:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFJMIRJnzg3ozLNbx0GZublHY6dW4PSuFNYeS/2iDDTUQp4OX+srNMRFZPrJS2XCDeDowhX2Cfv7yQDvY2KNO0=
X-Received: by 2002:a05:622a:104a:b0:3ec:490b:ce6e with SMTP id
 f10-20020a05622a104a00b003ec490bce6emr2001156qte.48.1689254511797; Thu, 13
 Jul 2023 06:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-7-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-7-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 15:21:35 +0200
Message-ID: <CAJM55Z8VequKy59P5zKrVOr7WPRbUqq4CUHrk8aDO+3qpkzm2Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 6/7] riscv: dts: starfive: jh7110: Add syscon nodes
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
> From: William Qiu <william.qiu@starfivetech.com>
>
> Add stg_syscon/sys_syscon/aon_syscon/PLL nodes for JH7110 SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4c5fdb905da8..11dd4c9d64b0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -353,6 +353,11 @@ i2c2: i2c@10050000 {
>                         status = "disabled";
>                 };
>
> +               stg_syscon: syscon@10240000 {
> +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
> +                       reg = <0x0 0x10240000 0x0 0x1000>;
> +               };
> +
>                 uart3: serial@12000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -457,6 +462,17 @@ syscrg: clock-controller@13020000 {
>                         #reset-cells = <1>;
>                 };
>
> +               sys_syscon: syscon@13030000 {
> +                       compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> +
> +                       pllclk: clock-controller {

Maybe call the handle "pll", so the references can be just <&pll 0>,
<&pll 1> and <&pll 2> if you choose to drop the JH7110_PLLCLK_PLL?_OUT
defines.

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> +                               compatible = "starfive,jh7110-pll";
> +                               clocks = <&osc>;
> +                               #clock-cells = <1>;
> +                       };
> +               };
> +
>                 sysgpio: pinctrl@13040000 {
>                         compatible = "starfive,jh7110-sys-pinctrl";
>                         reg = <0x0 0x13040000 0x0 0x10000>;
> @@ -486,6 +502,12 @@ aoncrg: clock-controller@17000000 {
>                         #reset-cells = <1>;
>                 };
>
> +               aon_syscon: syscon@17010000 {
> +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
> +                       reg = <0x0 0x17010000 0x0 0x1000>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 aongpio: pinctrl@17020000 {
>                         compatible = "starfive,jh7110-aon-pinctrl";
>                         reg = <0x0 0x17020000 0x0 0x10000>;
> --
> 2.25.1
>
