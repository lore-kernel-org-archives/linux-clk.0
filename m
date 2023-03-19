Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A09C76196
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 21:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjCSVEJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 17:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCSVEI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 17:04:08 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3BAA5F0
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 14:04:04 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536af432ee5so193348697b3.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHlOtmRhbXRseoAMuvDfv2S+ldzj7KSVKxvkV6Isssc=;
        b=bruA6+gbtnYJyIR7+WxFwZh5y5zLSPKx/augfql2C6/nmpu7P6VXCh8UcAfqFv/bfn
         85Zt6k1m7oTqnT9BnoJnir3on8cb0wciQMS7CU4IXYFMypjpwIDuQIn7krMKKiw6eeH7
         0b6u4UbBuOhu0LKA+OpI1AyqhWAhJbgTGnzMykdV5A1WE/k7/BfxoQjlpqSJ5oKCZ2le
         nxTXbVG6pcKXzqghfgGhgJCkPpSis9kLJxr0x+O22dwmMP/7+y8i1UFdh1LRmuLkBiK4
         y10+CdjVj9/R9uetTf2biaAUsmsOSwcE+i8iIsymvaikFVt0oT2qayPe66Da+lSgiCe8
         w6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHlOtmRhbXRseoAMuvDfv2S+ldzj7KSVKxvkV6Isssc=;
        b=ahJulqrP8MaHtkn4LUYnPcTBWdehWBp02IWgDd4/KoxbebftDBZVu0YgNv+zu47P6o
         fiOQOMSPxC0pp6GYLVjKz0YGY6N8uV2uBcdGjg6TGRqa86Qe/kJLn55c5knBdvAvJGfz
         8J84/YBZGOp88jPkXFi0r1ridPIqGQc8a+jdv2tCn7ovGzYYYMOXlr2A36iVGNrIYxsv
         XgY+hYRK29BciPENGwxWEefLet04IwucnRVPbcAjK2skcISxcyaq/H4EVaytcCE7Cqli
         w822SGjiJa2xZlivYZ7vS7EEDiDrq8EMckGM+82TWzywa58HCG0Qdy1aoD3G1VZxPS3F
         o2tA==
X-Gm-Message-State: AO0yUKX254S3x0X0JLHlf5aVHBBEhyanHBQrYGgRkWVqGu7uDYaS5i1/
        ZVtX3HOncolFySa0wILiuNi+9HI0wWUQYX0UD59W/Q==
X-Google-Smtp-Source: AK7set/04BNL1IZQ2ZoTv/hKzO515Y7fhbtJesHPiD/G6odhiwBO82T6HTUjnRKfAgbfZp4XgBZ6kJZDWB83+4HIHcg=
X-Received: by 2002:a81:e205:0:b0:52a:9f66:80c6 with SMTP id
 p5-20020a81e205000000b0052a9f6680c6mr8233006ywl.9.1679259843810; Sun, 19 Mar
 2023 14:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230316072940.29137-1-quic_devipriy@quicinc.com>
 <20230316072940.29137-5-quic_devipriy@quicinc.com> <CACRpkdZYOQ6JvQvg5gcUb1x+FOeTn-H5rOnK=8EgDBmZh9DYig@mail.gmail.com>
In-Reply-To: <CACRpkdZYOQ6JvQvg5gcUb1x+FOeTn-H5rOnK=8EgDBmZh9DYig@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:03:52 +0100
Message-ID: <CACRpkdZUhkZ0FcdAMGBfu6SX7EMpMjeikx4soU5SWi1UJRBHBQ@mail.gmail.com>
Subject: Re: [PATCH V9 4/6] pinctrl: qcom: Add IPQ9574 pinctrl driver
To:     Devi Priya <quic_devipriy@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Mar 19, 2023 at 10:02=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Thu, Mar 16, 2023 at 8:31=E2=80=AFAM Devi Priya <quic_devipriy@quicinc=
.com> wrote:
>
> > Add pinctrl definitions for the TLMM of IPQ9574
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> > Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> > Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> > ---
> >  Changes in V9:
> >         - Added COMPILE_TEST for non-OF configurations in config PINCTR=
L_IPQ9574
> >         - Unwrapped the lines for PINGROUP 34 & 62 in ipq9574_groups
> >         - Removed the comma from terminator line in ipq9574_pinctrl_of_=
match[] array
> >         - Moved the MODULE_DEVICE_TABLE entry just below the array
> >           ipq9574_pinctrl_of_match[]
>
> Looks good to me but I would like Bjorns ACK on this patch before I merge=
 it
> if possible.

Ah wait I see that bjorn already merged the DTS file so I guess he's fine
with the set. Patch applied!

Yours,
Linus Walleij
