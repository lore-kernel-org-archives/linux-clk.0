Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56CEC61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBFLZm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjBFLZl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:25:41 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A92C72A4
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:25:40 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id cf30so8634532ybb.11
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gqoL344ahlUSGKEcPeWSWxdzAFVQeuSWEQ2bFV7PfAw=;
        b=GQC7Vdd0ShtHyuYbws684oddqVBcnUscuuhAQE0nrgOMJxSOmJwSONncXrg2FupUax
         EEblB6a6KqEYuoOH1qvl4bpRvNk7xCHyk8FBpuf/Q6e3QJ0YZCpDOf/PkERhTu4a6YeV
         NsAfL3eGNrVdjNRLSFFoeeMExbwu4TnaI8bS4mkQwX93fE5FzfF8posZD3bavN4zHGBg
         EOlze0vpR1vV4CRg7WemHThjOAVeh8wxRsMk4G/ML9uDpVmPn3orE+5VCxtQLLp9wef2
         HSM+WnPTvOKBiTW0QUH9EIaopo71B9xThIHwsKSDqMBoO+FI0QFJsnG5pMvqaVrytIkI
         8WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqoL344ahlUSGKEcPeWSWxdzAFVQeuSWEQ2bFV7PfAw=;
        b=tQZm3ScoujdxrZyThzLovdQ9Q0zbiibqM3X6yLfzGHoRGhFtT/8d0ga4mJORQ8wryB
         bcB7t49lBQiqT9NyHBg0jlTAUgt2KWEZzNBN8x3q61TQ1B4hSrCmpCpfPDSC9EBEyVVG
         cO0wUBD5PZF9v50p3ufivxmXxlzuSJP1Wm2eM34qo5LmIVqoWsukLylNqcBBIkfu597+
         S1dCmmdYm0RDDF7q6UcOiP9v3fw5YeWJU36GiwNnD9UzQPoUfqYUf2qGeYco/D6H2S25
         9UbGuh+WRfEs1Fa7fXEtxgWiUbmahHSzb5jvVC47VcqjsiU6Vrs5rrDh8hH5+CigLuxL
         aJZA==
X-Gm-Message-State: AO0yUKXyCaDoRPUasHPljE3adQvj90sRruVPl8+0bXc1jQVtimCnTcgt
        HQJ1chSdWJ2sVWi+5V0NpY3AdZF71hg7J1RaETJtqQ==
X-Google-Smtp-Source: AK7set+SFrdnVJOmmGT4T8wNENpdw4jkqUL4JIeIMcevxcJ8Pyit+ExaUYRLjibaZ5z5zrn9F+yeezTbHdktarTKGwM=
X-Received: by 2002:a5b:d4f:0:b0:893:76b2:9200 with SMTP id
 f15-20020a5b0d4f000000b0089376b29200mr315983ybr.584.1675682739722; Mon, 06
 Feb 2023 03:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
In-Reply-To: <20230206071217.29313-1-quic_kathirav@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Feb 2023 12:25:28 +0100
Message-ID: <CACRpkdbtEFCSKX8VcD9bAZLy-PYfwVCRKYwXJmh0hnK2Nroq0A@mail.gmail.com>
Subject: Re: [PATCH V3 0/9] Add minimal boot support for IPQ5332
To:     Kathiravan T <quic_kathirav@quicinc.com>
Cc:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Kathiravan,

thanks for your patches!

On Mon, Feb 6, 2023 at 8:12 AM Kathiravan T <quic_kathirav@quicinc.com> wrote:

> Kathiravan T (9):
>   dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
>   pinctrl: qcom: Introduce IPQ5332 TLMM driver

I have applied these two patches to the pin control tree for v6.3.

I see no reason to wait for more review since Krzysztof acked the
bindings and the driver isn't invasive at all, any problems can certainly
be fixed up in-tree.

Yours,
Linus Walleij
