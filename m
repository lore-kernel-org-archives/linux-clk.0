Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620C6C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjB0RrL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjB0RrI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:47:08 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8B659E6;
        Mon, 27 Feb 2023 09:47:07 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so10885420pjb.3;
        Mon, 27 Feb 2023 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qoXRQPf8p0UF4HQ36qg1fkxkIdJOrrLSHTe8MtZADs=;
        b=ljSqa5syO0kMJDVQYUIcBQK/d7rF3ui4m3oh+sSOVEzHpHOOQfA7GiaQfUOvhAZAph
         RL3OILXCQ9lGuNoFJ+njCKCLndmsT02GbYEwb+9w+IUuyue7RhA+OhqJDjZ+W2adYA9H
         DSmvkcj+czZDvKBiNiew0NOXGNegxR+23xYoHzCoxCsqmBSj/KANUdRMA/IqBbzw6/83
         f7dElsP/rjJ5c9QYmoUoJq/tREtJwF51oYjnqxc3oey56xdGK4F6cpAA4Bv0cPJM8Aep
         xMpJs1GzXdX3j+qOjaQmiRBQ7BYrXcUFySXTbOpEZzGX9AEzOmM5N0eIxqJAeFRBOTs+
         gRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qoXRQPf8p0UF4HQ36qg1fkxkIdJOrrLSHTe8MtZADs=;
        b=ummxPknAZogMq409n3n/HdSL0okUqlo8bAY5EAj4Unjo7WYqyPrAsAFU9OMlOYb6WJ
         mV2DdoDQ3HJDjRlHfrpAwhtMB+rwVLHYbUtqqIIH6aTVXSxhAE7LqiHKTbl4AsJXbNik
         TcmqI9+MKaE3ljlNSvvcvOykIEH8GJu5WXqhbn89yfk0fV9OXe4pjjQSvodT+KriWBk3
         k1QC7aWGsVe+8DYyM1ZpexRFmu5NM/jimLpK8uhVe26C6KhnfBOtHqycoUNmwkKzYARm
         Mb2+Ga441zlv5C+VqfkgA3MvvSuW39Jgo0evxnwG/c4CwsX/OU2jWqAzrTogjIZglljf
         3CUg==
X-Gm-Message-State: AO0yUKWbuVJijVQbrSGvZCViFOwUxPPQfisdZqB/N2Obh4J4xWj4V/vu
        kEzWLkEKe1pg4OJV7Qm7jdOzZCPfZiMyQkx+ljE=
X-Google-Smtp-Source: AK7set9vT5CiyVe+X5TeegEJgm5p92BL5lYUAKX0zS5yL3hNg0x/Eg9/HFEe8R9n7UohCs3BeKtQXZSV/K3bcaoZOTs=
X-Received: by 2002:a17:90a:d344:b0:233:bc72:1c69 with SMTP id
 i4-20020a17090ad34400b00233bc721c69mr17365pjx.9.1677520027463; Mon, 27 Feb
 2023 09:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de> <20230227174308.87286-2-marex@denx.de>
In-Reply-To: <20230227174308.87286-2-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Feb 2023 14:46:55 -0300
Message-ID: <CAOMZO5DOtWEcg+on4tH-0_BHTd02kFe5L0tUkv9hqnh+DCM4jA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clk: imx: imx8mp: Add audiomix block control
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 2:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Model it as a large static table of
> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> SAI PLL has to be registered separately.
>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
