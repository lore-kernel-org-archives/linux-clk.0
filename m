Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBDEC4332F
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 21:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350143AbiEDVm2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 17:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358163AbiEDVmZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 17:42:25 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D81B49F0A
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 14:38:48 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2f7ca2ce255so30109087b3.7
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 14:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=QFpWrEBIrRnFFsbRzuQnDhJe4BaSIkFjtC3A5cZVG9hy/hcMauWrIqr2be5/KwrfGo
         NCGCurP8cU79+UY+pB9TmqKhq7oXZZ7qPI7uQbAillCKF63H5X/zuGVkc+JsGOKGae5G
         f+iwI+Dj4ePQuDCx/1Fct2nRPtAuc4Hty7oz//xsfve/iIL9k6svN3NMMvhiwINJ4xTM
         9sMncJOw7LjeeB//tUJa4IoTpI6DRjLlfyj3NRTd/sq9i3txOLixbGmLfCTI0VPt6z/K
         HRTwjUNbVnucCOGaOR4QEyXpnInRsolXUV5HOuBia87QkC+0dAuzdKHwcHKfLed2iZ+D
         Bhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VX0Y5lK0oKhUNvSgMz9EtXzVemCwMapBfZK+KjIwWaY=;
        b=rnC6yerojWrjRAW9tYq/eB0fnGGEJOtpJqo/wsL7R+e3K1PuZZQ/BsiiA+9YyswgcC
         DO9EwBmHz2T0jqHga9g+XhsQDn4oxrlFCJHKqq68lw0Bhw0bz31491CKAQkZerB/JjF8
         u4ABrfphKbT+cgJ57yT1NNDNaO61exEkUAYXIAi0L+obdVCIK5/4tOmIh/UmmbbdT+rN
         tsRK0irP6BXLxZqgn5TKoAD1lGMZx/ySI9TXMCORSHHlHxhSP/6Hc9k0ISoyIaCLDIiY
         c4bshNHrDEhUDHOIUjxF/y4WPBkpiQtYbC/5vMOlLpDZpaDjo6sjAYrJSFuypZcILrKy
         cezA==
X-Gm-Message-State: AOAM531dwuCvlSdpzRmoAXwaMpCVZKn4syFm/XDhSMOJKlJGnTafatx2
        zD+elNxqEbI67EHTsxWiHzUCLAFPtB53CMoTMSTdyQ==
X-Google-Smtp-Source: ABdhPJyWaynNr+CEKkTESmGLzWOB0NJ+k01UPdgmFyQnRX5drt8jZsToCyQBLbeZMlkNdUUCDjlKhWmRzv0FXiKAhqI=
X-Received: by 2002:a0d:ddc6:0:b0:2f8:a506:a5c0 with SMTP id
 g189-20020a0dddc6000000b002f8a506a5c0mr22520729ywe.140.1651700327788; Wed, 04
 May 2022 14:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com> <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 May 2022 23:38:36 +0200
Message-ID: <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 28, 2022 at 11:49 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Nothing done

If I get a review from a Freescale maintainer on this driver and the bindings
I can merge it separately, correct?

Yours,
Linus Walleij
