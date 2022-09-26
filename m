Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5274C04A95
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 03:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbiIZDCB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233099AbiIZDB7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Sep 2022 23:01:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125032BE21
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:01:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id hy2so11233643ejc.8
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=fMDjGMFeZ+MEZfjBLeXyZXO+5QURbDxXo1FUsSS2j688UXbghiFGIb5sDWVtiLfaTu
         HifASisiYD84FYcN4xahhmp+HSp/Fjyzm68aXl8cTDtA67mLClwfSSukEs6aYvvKicqJ
         DUEZqyaPDMlZkZcP8+NrKcf+0HixlqbnoQch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=cmi/b2G9QfYqL6LrX1qCE86eTJKE8mQE8fj9XnEzLMSTzTZihR/5wdyxmFJv1txBxf
         /DCHUmmCDetWxCDzFxG0A9ADrZBhvdVoTsxm9sCYkq6JkZzTXyhPYig5qETIPY8QESke
         k98caAg7sjxMci/8w1RG5rG7ZTDdthqfmxo+791BgO/CNwtDbf1PpT9s50W58QsyOzY7
         ektMhfIC2xq6afqtqv7E7tc7S4njDLX4+GYbL4iYj4PIx3qL9LBHjN48hXxZV4zSLXnp
         Bf37PL8TA2GS4T4d41c4pEXjPxd21G1Z4kShetyXRmcxIRGfsxLUVfA3PY/mxc3+KKEy
         2XTg==
X-Gm-Message-State: ACrzQf1hGPOYxt7sxrBvSy/JIrY72fp0MMPll6tAsmdIbTyvyi4VJ9CU
        c+4G3GyQG9z7q2LnOeWgYxEyI9qpF0ANCHNkopeQ9A==
X-Google-Smtp-Source: AMsMyM7o8MwQQBDwguXkozM6n/umhwviFw/Nfd+rhMxsOtT2UejSuJCqg8qOL0/MW/9zxPZApsONr4Gwd23XXRSuZkU=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr16459188ejc.323.1664161315561; Sun, 25
 Sep 2022 20:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com> <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:01:44 +0800
Message-ID: <CAGXv+5Hr6LYEZ8_3Z07XAVPbbSHZiwjR2QTrv9LdhwpYn35TFw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 7/8] clk: mediatek: clk-apmixed: Add helper
 function to unregister ref2usb_tx
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, y.oudjana@protonmail.com,
        jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
        fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, ikjn@chromium.org,
        miles.chen@mediatek.com, sam.shih@mediatek.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 21, 2022 at 5:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The ref2usb_tx clock was introduced a long time ago and, at that time,
> the MediaTek clock drivers were using CLK_OF_DECLARE, so they would
> never unregister.
>
> Nowadays, unregistering clock drivers is a thing, as we're registering
> them as platform_driver and allowing them to be kernel modules: add a
> helper function to cleanup the ref2usb_tx clock during error handling
> and upon module removal.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
