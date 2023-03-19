Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24870C7618A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 21:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjCSVDJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 17:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjCSVDI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 17:03:08 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AF71E5FC
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 14:02:47 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id e65so10829049ybh.10
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbV6Bh/cNsY2Io1y10SkZjIuZK4TmLVqW2b5h9GtPaE=;
        b=VXyRZOPszvrTh2/++fTwBNasGeYcc1YN2g1XQGu+wGihL5XAh1HWL6miXKYetReFlt
         e+mgaizYtW5gS157vS8n93LRFEj2Ah3ZbZoohAjU3TNPEaCLDcYiFuN05UhBOzXV30mJ
         XRHuBT4ATsajKjivNpLh5PNHcBKcChZ2qjDjwijKtZpHIKVSMiQFjwD7zqt8phrj6qgu
         gcv6ijOUMWWHFH+Mh93Ozd0dBP2TLL25g2uZuPkfck9I5o9Cdwg5JbKZ2SJx0zzV9QUY
         qjnebF/7bIKXS3COEBYQSb2JOaexBEQb1wVDPDNNUoZ1Y5vtm5wVUKNai6hCRWcruo1I
         uxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbV6Bh/cNsY2Io1y10SkZjIuZK4TmLVqW2b5h9GtPaE=;
        b=8F3wKsTGtc3iAIjkUtz0fiHOPQacfqiQMse7h+ULAcIkIcsqYEiZPz7kPHS1cU1nFY
         1xkv6k2xzYN43jTOMcnPVG8c4MgvU7N8X224c/l6P4JSOzGWZirHT7K8Z74iUrjv0j0H
         iCdC8QGv/qPfBdaYD+8ZF8doMkHIty0z0ScBHOXtJ67PQwGg9oL5MjjCE7pzAU8iO7QR
         zHtcrSdrig1b7Hc1FwYL6mnMwLylyuZP8YyOWlBYoVIVAh+c2APphvNJ6KukyNDd+qb1
         QqZg6P2QGpInRGVX9ePlH4h/oRvPbDZO8dX0DRK9zYo/j2bIHqwFIc4l/9xa+Vag6+LD
         nYkg==
X-Gm-Message-State: AO0yUKUhOUtwFM5fCYRS9KIeEOFVPhsyvVeVdmZPCc6sUBIP2H14DDsK
        e9+Oiy128Pr/1aSNL4RUqj24wr8PoJY/TbdaDgSzFA==
X-Google-Smtp-Source: AK7set9mxeFO57SGruCJH6C1TZj973V2SQLNunHNOaC44Y5XLUJPP+RqdyW12BliuWYUYiE6coMhTxlkWHzd16pXggk=
X-Received: by 2002:a05:6902:110e:b0:b26:47f3:6cb with SMTP id
 o14-20020a056902110e00b00b2647f306cbmr3231733ybu.4.1679259762548; Sun, 19 Mar
 2023 14:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230316072940.29137-1-quic_devipriy@quicinc.com> <20230316072940.29137-5-quic_devipriy@quicinc.com>
In-Reply-To: <20230316072940.29137-5-quic_devipriy@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:02:31 +0100
Message-ID: <CACRpkdZYOQ6JvQvg5gcUb1x+FOeTn-H5rOnK=8EgDBmZh9DYig@mail.gmail.com>
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

On Thu, Mar 16, 2023 at 8:31=E2=80=AFAM Devi Priya <quic_devipriy@quicinc.c=
om> wrote:

> Add pinctrl definitions for the TLMM of IPQ9574
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V9:
>         - Added COMPILE_TEST for non-OF configurations in config PINCTRL_=
IPQ9574
>         - Unwrapped the lines for PINGROUP 34 & 62 in ipq9574_groups
>         - Removed the comma from terminator line in ipq9574_pinctrl_of_ma=
tch[] array
>         - Moved the MODULE_DEVICE_TABLE entry just below the array
>           ipq9574_pinctrl_of_match[]

Looks good to me but I would like Bjorns ACK on this patch before I merge i=
t
if possible.

Yours,
Linus Walleij
