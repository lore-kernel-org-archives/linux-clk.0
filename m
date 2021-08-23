Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1400C432BE
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C606261284
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhHWGya (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 02:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhHWGy3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 02:54:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5510AC061575
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:53:47 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f10so21023479lfv.6
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykVwd28+PpS9RdFtwLjN4T/dzr4Pp61Ec9sxPTtcctc=;
        b=J1ffpX3IK1WLgUymbrNtz4fC5SSzlNQoHe9i5k3n9fPJ3OyXL1cEhKhqg7JTfQXsqb
         gxIp9u/kV11VpBiYxcQ7TKGNkG5fheHOcrJHHRE/xv2ZKa13vPtCsMEnMhaT1ZyqP/gq
         PVBK1Gbsn2A6HFPU7XC7ioqAN3pMiNhqFPrPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykVwd28+PpS9RdFtwLjN4T/dzr4Pp61Ec9sxPTtcctc=;
        b=bFpiCeVjeLC9TubyWTaaI0RoGjSrHQEFtFqOKhVwY7p9H1NlcgvKPlq+9GsAWjLBfz
         Fj2FFzpL1MuJdkIlGmSbHmDcNyODbkIItBsEM9bLcliRt3Anij/sixh+2lqu5hc3hdrg
         eo5RxRsa6r+xzslSgW9Z4rf+DXAwPogCm2bj4Otk9K5Yu7uP6qwHuOD4NTf6bg6Lio/F
         rRVRU3BD4g2mMhIhd1zddE3WYj6PttJ2whNJKe5uA3EOzBOZFEnC2zsJspdcrAkTyfVY
         a3QwMQZoG8aiVLw5FaJCpc0Nje6ZXkS2KaqBl6RP6sI9v1e6Xos96vgzD4lCQQBqzNcV
         jb3w==
X-Gm-Message-State: AOAM532YncEqszDt/T7dftC/rZhRfVHvhX4gCYas9UFWneNl3EyBNMQo
        FD8PNBUOlJmwJlo8luwsBqG0UsPHZW+wbZh2BrCc4w==
X-Google-Smtp-Source: ABdhPJxh0ZhiKQDi+P2hyKg41D5UpaAEP74ceBsTgaXwXWkhWXIx8uAAhgWwAorVWvx9v84bqXxUIka1tGuDnu6MVd8=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr8363402lfg.342.1629701625387;
 Sun, 22 Aug 2021 23:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-2-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-2-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 14:53:34 +0800
Message-ID: <CAGXv+5FAEFD+dQsZzyZOzmwDDnwLZO3Z8wv8Z-=wVYdjjc3FYg@mail.gmail.com>
Subject: Re: [v2 01/24] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8195 clock
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Aug 20, 2021 at 7:17 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8195.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 254 ++++++++++++++++++
>  .../mediatek/mediatek,mt8195-sys-clock.yaml   |  73 +++++
>  2 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> new file mode 100644
> index 000000000000..17fcbb45d121
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -0,0 +1,254 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Functional Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediatek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices except apusys_pll provide clock gate control in different IP blocks.
> +  The apusys_pll provides Plls which generated from SoC 26m for AI Processing Unit.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8195-scp_adsp
> +          - mediatek,mt8195-imp_iic_wrap_s
> +          - mediatek,mt8195-imp_iic_wrap_w
> +          - mediatek,mt8195-mfgcfg
> +          - mediatek,mt8195-vppsys0
> +          - mediatek,mt8195-wpesys
> +          - mediatek,mt8195-wpesys_vpp0
> +          - mediatek,mt8195-wpesys_vpp1
> +          - mediatek,mt8195-vppsys1
> +          - mediatek,mt8195-imgsys
> +          - mediatek,mt8195-imgsys1_dip_top
> +          - mediatek,mt8195-imgsys1_dip_nr
> +          - mediatek,mt8195-imgsys1_wpe
> +          - mediatek,mt8195-ipesys
> +          - mediatek,mt8195-camsys
> +          - mediatek,mt8195-camsys_rawa
> +          - mediatek,mt8195-camsys_yuva
> +          - mediatek,mt8195-camsys_rawb
> +          - mediatek,mt8195-camsys_yuvb
> +          - mediatek,mt8195-camsys_mraw
> +          - mediatek,mt8195-ccusys
> +          - mediatek,mt8195-vdecsys_soc
> +          - mediatek,mt8195-vdecsys
> +          - mediatek,mt8195-vdecsys_core1
> +          - mediatek,mt8195-vencsys
> +          - mediatek,mt8195-vencsys_core1
> +          - mediatek,mt8195-apusys_pll

The indentation is slightly off by 2 extra spaces.

[...]

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> new file mode 100644
> index 000000000000..dbf33ea6cb9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The clock architecture in Mediaek like below

Typo.

> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The apmixedsys provides most of PLLs which generated from SoC 26m.
> +  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
> +  The infracfg_ao and pericfg_ao provides clock gate in peripheral and infrastructure IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8195-topckgen
> +          - mediatek,mt8195-infracfg_ao
> +          - mediatek,mt8195-apmixedsys
> +          - mediatek,mt8195-pericfg_ao

Indentation off here as well.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
