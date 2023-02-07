Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CCDC636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 04:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjBGE3h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 23:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjBGE3f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 23:29:35 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF1B34310
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 20:29:33 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id cz15so5387607vsb.6
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 20:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nF9vH3eaAbIKV4DBI82H+S0pnnuGeRGAzsQCfTN3QS4=;
        b=bJ47yYjUQmEPTekZ8RiGasn8rtdrty3yO15BKJASD1NpFZ7vgQMG9gmpBS5KhcXbLF
         SDpj664sWXFR+t65gRALB8vDPBQwKaawXD2r1wmp8FA+JA8lsHRYjmtqigtLkEdYTWlz
         ADyLL6YzWSEZIW2w2QsH9RHN9OQlO0q3dVLUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF9vH3eaAbIKV4DBI82H+S0pnnuGeRGAzsQCfTN3QS4=;
        b=40n7fNQlpypfZ5msnG9/myupdSh6CXaG0MYtHM3Y4+u5jjEzfByKrjzu+qN6JPq24Q
         loISNM3iPLiu9AmzkPtTzZzNORckJDM5PH6Sk+9tsmujyyGDa31sbBiM7h15Ur06Rge5
         6CGUvsB6pJQ8udU89DEl0Fo9lAC+Hdm5HQlmAKYnfOgicpiUca6aJvuUhUy75RfvIzne
         3bcdnSJdUOvGYLrXwOUrS9la2FOPzOML2Gu2TGVeSt719klninoUwRfoMCfEmW6WS3qB
         Hg981NcIAOWRak9uhSEnoOiJn0CGkaR2skvX5FxOBEL1fDDuK5TGEb7NL6CWSIfWW6hv
         mBlQ==
X-Gm-Message-State: AO0yUKVqzN0l1fkE++7iPzK2JuBboDE55k22kCydBJDIhRW8Bd64FwU+
        7RlrPWE89BghQJFvplLRmUkL8+nmlba/UPYG8X4JNQ==
X-Google-Smtp-Source: AK7set8YvobBI3oYuPbBjpEvQTcTwp7H9m+SkAWZ7KEqJ0FihXD8UHvdEcFi4s9T8+P2c7Tlv4z0bjXKUX1R2uRlp2U=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr487539vsi.65.1675744172765; Mon, 06 Feb
 2023 20:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20230207014800.7619-1-moudy.ho@mediatek.com> <20230207014800.7619-2-moudy.ho@mediatek.com>
In-Reply-To: <20230207014800.7619-2-moudy.ho@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 12:29:21 +0800
Message-ID: <CAGXv+5Eo4es6XF6m9LQDhHdrFs=18_S-VGGvn4wQF1KWmzGcEg@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
To:     Moudy Ho <moudy.ho@mediatek.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 7, 2023 at 9:48 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>
> MT8195 VPPSYS0/1 will be probed by the compatible name in
> the mtk-mmsys driver and then probe its own clock driver as
> a platform driver.
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Stephen, could you pick this up for v6.3?  Otherwise we'll end up with
two drivers targeting the same compatible strings.

Thanks
