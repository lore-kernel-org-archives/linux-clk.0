Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7F6C05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjBFLMo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjBFLMm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:12:42 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D9D1EBE8
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:12:40 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id e9so12257448vsj.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx0rL/jZPMLeHFNkdGq3B0lHEAtTAwxRwYVBdLrzGf4=;
        b=RpSQ3qkKIePil2cxOGelPztIhxlANWmbbwU9RhBul5avvUPj+q0M4uLMEDT1sHKyEz
         mjG/rfEWMAlTbf8tcDgE3qtg1IZh5leZoM6yiEzP+c3SziJCoQzPCVrZT7H7+zBMiFqf
         B7aDf+yrPUXxtDA7GvjM0Qk87Haq0JB4MmbXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx0rL/jZPMLeHFNkdGq3B0lHEAtTAwxRwYVBdLrzGf4=;
        b=cGih1PSgivlSVsIezv7LujX4WwqKHRhpSYRgai+9KYCJy3zFuzdH854E0koY7RT3q0
         bog2Bq1LIfHtUv3juSe7ssAHHiqTMts7dmttyHSuiroWI/Wf57uomHTF4Ee6CBpRSCtx
         FV9P+f7Ca/D+e7bRIiYQ4NRKpb3ptXwiZ4Puog6i0HlqdfgH/Opva2ulyK7qDe/qep4H
         mdYECmg+Vhv0iKd8VdhFZv09Ll0s9j+oti14zSruqM6gp11Snfqm78PpIo/FsArMVORA
         2Ysg1PbM+6G+wHDAoNAjvzVNG3LPiGrJ8iv/GYMXjPO/sKyX3Cqfxe/knprfP3xtpXbI
         FzSg==
X-Gm-Message-State: AO0yUKVz9Bu8e9WtxUh1mGL3GiK8Hhygz8GthLWraEDkNRGEIN5gL8pT
        yb05Pj/as50c+Hfu2BNm59FvJZIT9LklZSC/h7Wqdg==
X-Google-Smtp-Source: AK7set9deAUpwZvkISTP2kzU9X7LTaqj94p/drhOTgA6z/VsK90cwJfx1qsalSnu41+dWRZbIWESyD/aiCDW4pwFflw=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr2920661vsf.65.1675681959294; Mon, 06
 Feb 2023 03:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20230206091109.1324-1-moudy.ho@mediatek.com> <20230206091109.1324-3-moudy.ho@mediatek.com>
In-Reply-To: <20230206091109.1324-3-moudy.ho@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 6 Feb 2023 19:12:28 +0800
Message-ID: <CAGXv+5G+VSV=NLF9-+Z88JR+Cr6t=RGweZ88DA6VJN7-aoAqVg@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] arm64: dts: mediatek: mt8195: add MMSYS
 configuration for VPPSYS
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 5:11 PM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>
> With the change of the MMSYS binding file for MT8195, the compatible
> name of VPPSYS in dts need to be fixed to match the definition.
>
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
