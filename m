Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C7C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbjELAkL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjELAkK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:40:10 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A730759D2
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:40:08 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-44fa585ad7aso5851959e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683852008; x=1686444008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH4ppR/YImqXRCtEui/eyufHAaFxL08S2yugceeQpQw=;
        b=aUcCBc3nacUromPCYUcTOUffpMJtnLw224rrn4TS6Bcw/VWfT1LggqJ1FJ16Eefj3R
         Epw0k+jGFP1KZt2HLS8D204u5xiUqSVKTVq+scEZovCd4mdI0XKHTHnJVtEY6/oONSDH
         2qiPekrL4qh6monUKwvmU6uhhq7jN9ycdfBRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683852008; x=1686444008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH4ppR/YImqXRCtEui/eyufHAaFxL08S2yugceeQpQw=;
        b=hmdIhJPppQKVuwlI65RtO1z0S14i0M62u1uDThQxFOz87w22Vg2jSU6AHMv6i5LqF/
         M3U5wkov7Zth2Reh5F411zA+Qliz2YRwMN56JzjU0XeLKkjiivOTR0aFhgrgSn4Xn5rm
         2aIMZFuhGwmcpWMUCBztKUTFVlvmA7wCOc3uWF/S/azmc5zw0QNFkbAzpPKN+fX614kU
         uuwxoapF7a44UQDlWnNVwfXmYstugiBkx0UtJXyCLufzj6r//mgsSFCDOFyYbjgkUtPV
         dyXfxxxqLDr7xzztg82eFu/UtDScHvA3SqYIcvJwrdy3DT/tBIXSykYg3boDCJKeTHe+
         XHEg==
X-Gm-Message-State: AC+VfDytNFTQf7Ofu8WBzBj6yae3+Mte8mmU+DetZNph/9daQNdB/PN6
        cbP35qoH++A7WLiyaPA+FWCXsIBFMUythljrdBOnWg==
X-Google-Smtp-Source: ACHHUZ7CJRLkBoOoXB2ebsy/eMzziU9dqHDjIi6dtiQ/z9qVxlIHckT/so67HALGLdwGNm/ISSZScafI9Zz3gusQTLs=
X-Received: by 2002:a1f:5f46:0:b0:440:8b67:dba6 with SMTP id
 t67-20020a1f5f46000000b004408b67dba6mr9468363vkb.4.1683852007778; Thu, 11 May
 2023 17:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230509021214.17105-1-gehao@kylinos.cn>
In-Reply-To: <20230509021214.17105-1-gehao@kylinos.cn>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 12 May 2023 09:39:56 +0900
Message-ID: <CAGXv+5Gvw0QsOa-7E==61WUiJ-q=9qAqN9E0L9hsmk+t12RJ9A@mail.gmail.com>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to
 avoid resource leak in clk_mt8173_apmixed_probe
To:     Hao Ge <gehao@kylinos.cn>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, gehao618@163.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 9, 2023 at 11:12=E2=80=AFAM Hao Ge <gehao@kylinos.cn> wrote:
>
> Use devm_platform_ioremap_resource to take the place of of_iomap for
> avoid that we don't called iounmap when return some error or remove
> device.
>
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and=
 allow module build")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index 8c2aa8b0f39e..8a2a88c63d15 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -146,8 +146,8 @@ static int clk_mt8173_apmixed_probe(struct platform_d=
evice *pdev)
>         struct clk_hw *hw;
>         int r;
>
> -       base =3D of_iomap(node, 0);
> -       if (!base)
> +       base =3D devm_of_iomap(&pdev->dev, node, 0, NULL);
> +       if (IS_ERR(base))

From lib/devres.c:

 * Please Note: This is not a one-to-one replacement for of_iomap() because=
 the
 * of_iomap() function does not track whether the region is already mapped.=
  If
 * two drivers try to map the same memory, the of_iomap() function will suc=
ceed
 * but the devm_of_iomap() function will return -EBUSY.

The register range for apmixedsys given in mt8173.dtsi overlaps with
the HDMI phy. I'm concerned that would cause issues.

ChenYu

>                 return PTR_ERR(base);
>
>         clk_data =3D mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
