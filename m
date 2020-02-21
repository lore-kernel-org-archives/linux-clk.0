Return-Path: <SRS0=+prK=4J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB00C35657
	for <linux-clk@archiver.kernel.org>; Fri, 21 Feb 2020 15:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 737DB2073A
	for <linux-clk@archiver.kernel.org>; Fri, 21 Feb 2020 15:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v90zLbE5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgBUPeO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Feb 2020 10:34:14 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33469 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgBUPeO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Feb 2020 10:34:14 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so1817086lfl.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2020 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=v90zLbE5oSFF85/nmKa9caaE43xtNO2sg0peoa6K/LaorENVEkOf35lATcCgMyTbPW
         O69VCm2Xttmp1nfwqSxxxy9Z1qj2m0SM9sgeOCvFYl6ECFGp8Z49HGtUdDD7nDXZV52M
         7mVPCdX9y3erbnBlOsk9iMOXmAKwPffElO75JsVMyUHRTzF0K94XzifctntrM7BCB0Ih
         fQWoyZ9Vw8c/u6cRD6ECP8tO3GWZezpVnii5ZYj2mp/KTrGI7hxBaziucNlZ/+MH44i7
         oNQMfu6cTpDPUepThAKF9qA3+I22/r3p1UKcvLrsvEjQ5WzRxqInd4YIw+8dM1T1IxQa
         crrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUVfMiXxCwbSjtH9BPcnP06NcLeQvKTFfCk+TkAB1ZQ=;
        b=jMzaceASKx4Akt7K5W2w7OHuc9VWQdQgRUkIvT8zfAZV3BoOEf+iE0EiupuUO3O5Ej
         fS/yISPQz/hRaOgkXq4+qgAfzDO3N6Sjm1zRBp5DDEJxzafrCBXAUai3XuKmDO1vMwsy
         rYrPoMXhkhsMGdqkzegNLrRKU2bjSdOUzWNcwEvv1aFA3gpO1D1lZ/NpfcIVTZnkS9ZF
         IaGGxIpNIuKmlxNiZ8XJoSdzMU3LmpIfOQKniChmzPbDUtuVkmky+w39SeYXeV/p6CLT
         wkb44TdMOeqsIM1tdlu3LJ5+qMOTrZuqJBYYod7L2NG5rrob3ikl3pN+Kns8YGwQanq7
         9qsg==
X-Gm-Message-State: APjAAAUxU9MOvKswJkuRuceUgf12VNVXBTERAHmwGlhzytdAKFekYbgu
        X53oZClMb3boW9aO6j/9YzI/mc75sZVPFYfXR4ivSg==
X-Google-Smtp-Source: APXvYqxFOhbB45zhwJACKnRWGrffnbDn/50wsrqM8zfRboGUcRtR/fIOZXVdUDsZuFjz9JDddI6CuEa9zN+Z1wPCOKA=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr19779301lfk.194.1582299251375;
 Fri, 21 Feb 2020 07:34:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582216144.git.leonard.crestez@nxp.com> <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
In-Reply-To: <bd7ad5fd755739a6d8d5f4f65e03b3ca4f457bd2.1582216144.git.leonard.crestez@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:34:00 +0100
Message-ID: <CACRpkdbB0xUF14aG5kVtmQ-AuwZVNKYq8_mW41jdQ_OfcNq8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] pinctrl: imx: scu: Align imx sc msg structs to 4
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 20, 2020 at 5:29 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have odd sizeofs.
>
> This produces many oopses with CONFIG_KASAN=y.
>
> Fix by marking with __aligned(4).
>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Patch applied for fixes. KASan needs to work.
Thanks for fixing this!

Yours,
Linus Walleij
