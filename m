Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D91C7EE45
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 07:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjFHHn7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 03:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbjFHHnx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 03:43:53 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88E11FD6
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 00:43:48 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-43dc17feb22so60483137.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686210227; x=1688802227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJAXrDTd/Nz/J5muH2M5Mg9/zWBy269fM8uuL6rXc60=;
        b=DNPvf1GpogmxzgQvbWz98Sw8cq32qUMrFI5mTw675XCXzXY808txVThkEsqsrADeel
         F9nHLSSzDUyCasRGlwJSX1tNIXVd+1YibbRWCEnNHcT1edFxru9LzT0SLrcjT0XqJhgq
         2uuPMP/rkP/DseGIkYrv0+Ucp9yJhSlN8zNb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210227; x=1688802227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJAXrDTd/Nz/J5muH2M5Mg9/zWBy269fM8uuL6rXc60=;
        b=ejnTmKOWwmlHMccSb11aCtacjFSO/Sh41zb50yOrxCH+kxjd7H8IjBjd9rmmmV5JA9
         FzT6Avx9kxOjqfs/9xjH2RnhMOOqS11D/BTXr/PN3E3T5SELrr4+6EO3++345fboyJ3/
         HUXp5efeJhfXO9yErD6Vxkv1NEoeEtnlioSuljpucYkB98MNx6ckQAWa1PHrPExi9DK3
         jcOI8i/hL/lH8Pz4VWBbM7iaB6C2ejDieELzRwrD1QMcXaVuwfljzJcbbX7c652Bj3wS
         DXWWNCjBIG8iWdJmd39hvcivZ/YOTZB1wbSXR3ybdVOmpLH/7pbvSq2JSRkgcd56sJjm
         ZkeA==
X-Gm-Message-State: AC+VfDwm3HDqaKDY4ZTmh1W1ZI284qf+I59+p+ugGMXlFm/Pfo4GA23E
        pvOV1bYfk6xCVOXkKj7xQIO+91WzDMX7qMjncrcI0g==
X-Google-Smtp-Source: ACHHUZ79ixQwfkYC9Zf7mdwRzABuK9h59tn/Zx8kcIDizpuVdiBvKBT6XWtWmV7VyQiZhvuYHK304MUdsNJzyBFAobA=
X-Received: by 2002:a05:6102:104:b0:43b:2a58:8eb5 with SMTP id
 z4-20020a056102010400b0043b2a588eb5mr1781203vsq.20.1686210227541; Thu, 08 Jun
 2023 00:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205714.510012-1-nfraprado@collabora.com> <20230607205714.510012-5-nfraprado@collabora.com>
In-Reply-To: <20230607205714.510012-5-nfraprado@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 8 Jun 2023 15:43:36 +0800
Message-ID: <CAGXv+5EgP+0fTDhdpnYDCVQAWtWqwKp=Xxh-pHc1137wHoywRQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 8, 2023 at 4:57=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
> enabled by the VPU once it starts decoding.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added CLK_IGNORE_UNUSED flag
>
>  drivers/clk/mediatek/clk-mt8183-vdec.c | 5 +++++
>  include/dt-bindings/clock/mt8183-clk.h | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediate=
k/clk-mt8183-vdec.c
> index 513b7956cbea..03c4f1acfdb8 100644
> --- a/drivers/clk/mediatek/clk-mt8183-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
> @@ -27,6 +27,10 @@ static const struct mtk_gate_regs vdec1_cg_regs =3D {
>         GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,   \
>                 &mtk_clk_gate_ops_setclr_inv)
>
> +#define GATE_VDEC0(_id, _name, _parent, _shift)                \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &vdec0_cg_regs, _shift,     \
> +               &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)

I think what you want is a read-only gate clock only used for reading back
the status. The ops would only have .is_enabled.

ChenYu
