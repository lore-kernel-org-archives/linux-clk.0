Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593A5C43219
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 08:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiKIIyT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiKIIyS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 03:54:18 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291C5DFB8
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 00:54:17 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id k2so44901386ejr.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Nov 2022 00:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VyQHSn8deMiEOwsj51SgZgqSSVUV+0wlM/SBBhvxXc=;
        b=GGNJehiWYL3Gp9ason0FhcmYFESsPZpn5AFN7kOkMr08+QsRUS2FYSSA2163xbbAy9
         sCm29EjadnyYCJ4qo8t89xcOSC2HM12RyoQ5svx82KfhKXzZ9wRk3eRUyGBS5EcWdG8h
         aqfOggWQ/Gd6ZUZqof0BJE7Z54seYus3yAs3AV9K9daY+opQn6X+1lMCc0h83OXtOCvY
         hFX6xhxESF3PK/cL5PyaD+KFCF1BSPnHXfOtA3SAk8B4pcNyG48j6ZCEyegRKKZG9S2N
         G7u6uDtfPEOtLaTMcTrFhecWinnHQ0xN+2czhYEKXJFc4xe+whvIhxqi6rGtCyyUiCH3
         WhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VyQHSn8deMiEOwsj51SgZgqSSVUV+0wlM/SBBhvxXc=;
        b=J7E6GTcnNfUThVVR7u7JHNhBprkGlGMg9LhblQdmqO7rQstXFFpgGF0letrNvREjC0
         M3axhUR4PYGaGRl89KnAs1xMHqGfrnA1b/V02ie/zLC7AkFVV1gMp9u+skG0WmBFf4oI
         22I5h9wMnYJYcs4WlkybX1jfbjLxSG4cWypbZ+ClwwTUIwypKZT9+NkymGrc2P/2HIFN
         Byw8ZdFGYb8FEFvadtoc0e+ODiB15dwUeb8m5hi/p/KanYi+0jBt9suqqSwBrpo2DuR7
         9mtHCLzTbCwCWWTyx9BSbpmaO5cKjaIHizmC5tHc9lbDf2viKBIgEHVTPO2SnDbfNDga
         x2Fw==
X-Gm-Message-State: ACrzQf0YIy0FelLuV6oNc1R2eBclxE79+PMykcG75Sf1lN1lgeAUmDR2
        XOpqnnxIIlFc3nLxghyEiF0Ml5E+sT3TJuPwAidpbA==
X-Google-Smtp-Source: AMsMyM56WEU7+qzjtVJGqMNooERxqHsIu3s18Kbye5GziPmoTH7Ul/AX4W2U11ncDwVCDDoKRS1Y+Yth0GDg5i6F7JU=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24211009ejc.690.1667984055694; Wed, 09
 Nov 2022 00:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20221107071511.2764628-1-Mr.Bossman075@gmail.com> <20221107071511.2764628-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20221107071511.2764628-8-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:54:04 +0100
Message-ID: <CACRpkdZ5do2Y6UESif+Cu_teCvfCH8gtg8DiE1H-aR3gNK3pfw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] ARM: dts: imx: Update i.MXRT1050.dtsi compatibles
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, sboyd@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, stefan@agner.ch, gregkh@linuxfoundation.org,
        arnd@arndb.de, linux@armlinux.org.uk, abel.vesa@nxp.com,
        dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, fugang.duan@nxp.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 7, 2022 at 8:15 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Remove unused compatibles from i.MXRT1050.dtsi.
> Change GPT clock-names to match documentation.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

I applied patches 1-6 to the pinctrl tree, this one seems independent
and possibly should not even be applied as I understand it.

Yours,
Linus Walleij
