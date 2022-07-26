Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D589C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jul 2022 08:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbiGZIFC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jul 2022 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237913AbiGZIFB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 04:05:01 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51AA2D1FC
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 01:04:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id mf4so24786944ejc.3
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=ux3qmfJJzCRpmOIlz05amYZpcKjRQdQpSoXtp0phrhdyP/vH1mgjUHF3Cn6q1rAio9
         sTifpvJhZaL/w1o15nmY3samMbq8yjVXooInCubRXzNUnweXBqGb7HBfR8Gj+zpCCOBp
         oQ7iNJBYQZseKBKeQ5mv5+SZV5gcJDb6ePE8xWQSg9oGJIpFn/LFsmiSHs/FfYPc29x5
         0ZrOfpuhyk+7WLYfptEqkETbazvrhXKGkhwVqtYEVIMrQRMiIeEN4MQ0GgqHsD+BL2ue
         tHXVaL4vP+mJovTLoaaKe2LMP1LY8R2jrMJvrRSVa0fyYpGWxCHVYNgCm4cQAKXxNi/u
         75LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBehNnJT8GsO8upB51VneNbMYqsRg1ZW62nLqXxRwjs=;
        b=NhjaAya40hX3ESYf/yuxsNkezPZx9vM9azbNRHHvxF86U9wijpg7w4N1NGSIsVnwQ/
         lbhh4+3VryYtCAlah0DaH5F3uykIVrz9fcmAPvXyYmULLib0AisBgEXu4iOgOAIX/s/2
         gZ1cSwsdbZZqg+PvGo2ToNdgJgQq0BmK9uCHy0K/SWANFXX5MaXPANMiObD2ivQNUfuf
         A/JXi2e5ZrkE30d/bFxADKIOTvzSKIY11P0Z7l+yUkVHW1NTjcV/RaG+Iao7FVhCXYjV
         4fcwJlYgYacJPISi6BiGM2ctv82fnnyrJyg/o/KMBJGsMT8frZ+wM4mV3bSX2dY1lWu0
         obSw==
X-Gm-Message-State: AJIora86x8kUYfSKk++Je3EZygTVV9ZT9sY9LINUyHa5a0oy1ea65zrU
        M28k2zRoB/scsMkJruMx1nffugnjoo6qKoyVhoNOXg==
X-Google-Smtp-Source: AGRyM1vHhcGel5juigG9IuL9lnmZZvwbKcwgfiDrUj2uiwtNoJw8NVE9bwIMb2MaITVezVvKoTnq3AyC7k1VJmVf5x0=
X-Received: by 2002:a17:906:5a61:b0:72b:1468:7fac with SMTP id
 my33-20020a1709065a6100b0072b14687facmr13030328ejc.440.1658822698053; Tue, 26
 Jul 2022 01:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com> <20220723160513.271692-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20220723160513.271692-4-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:04:46 +0200
Message-ID: <CACRpkdZMFdYDssk9B7R-MH7xG8Ukp+ZQpXCRVtPRCS=SFh34mA@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
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
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Both the i.MXRT1170 and 1050 have the same gpio controller as
> "fsl,imx35-gpio". Add i.MXRT to the compatible list.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Bartosz needs to apply this to the GPIO tree, I think it can just be applied
directly without regard for the rest of the patches.

Yours,
Linus Waleij
