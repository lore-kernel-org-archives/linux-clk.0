Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C49C001DB
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 13:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjHGNpl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbjHGNpa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 09:45:30 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCFB199B
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 06:45:02 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-579de633419so41582177b3.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Aug 2023 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=c2hxnScmXyOJNNEwoKxei8znJecQS2wtI3TXpVfWBeONeEnG4vwx3hpcJpNe2AayPO
         0AMVZyb/lJSbUeTXtOm1Pe21cRqHs/VtGvkHi8MJvRMFFglgz/80jxQAaCUUe/phOgl+
         Qpm4Uk9oDmcOpnq7mI7TqxH1yYgAW7W51OpmZaeTlrdOKGOZyz/gild0J8SldxlJ8Vm+
         tWG35Hf6tHY/F2mjV+O+qDQgjBmuR6DtLD7/o7uSnQ2NONh4YbEdfL1P+dwcdwJJnrKp
         JkELJca+1W2nV5dANEMwy59TbI68sZY5P+DSD2wmKU1l6My7Ng/g6H72CJmoUzsZZFWh
         6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=bFFk6/I2OW1lCwJw+5pnLcFUWWA+AWRt+VtmFkMRwkvrkehLAGQx93jZlI7DWGf2VT
         ul68AtUMhMu8LB4GF7MUtN8AJ3fesKKfKulhhvTPPYdAfXwCQjHrppsATToAqhGuI8Y1
         36YULOcPfg3z3FUy9uT3Ea22WcTQ0FdSsazlIKAAQwLjMzEufyuik3dvNlLRMzO0Usek
         s1vbP3fY9chU6txsq+eV9nL/Q7ZqM+rienWQE/DJiLTlU9GuX3J85dBi9QTA1F+slYvA
         uMAeGpyITMM8wFUvjzzqult2BLhcux69Ndcyt+d2MdwkeJo67icm4xTlI9CQv5GzMN3p
         OL3g==
X-Gm-Message-State: AOJu0Yw6seAanou6lJVP5N/puuB75TcluEzicRuXVxK27ETa+XohFwg1
        aDp6WB9PJlYWyAfRN7TPPcbbcFIAJwuuvq9GryY1Aw==
X-Google-Smtp-Source: AGHT+IHx1ajT83sKAnSY+O0ambUwFc4zjHyYjGAv1pUY5pxl3rdlLFD2APpbEZ6FIFnRNRDlCKdb6Khb5uVyVETW/uM=
X-Received: by 2002:a25:d70a:0:b0:d4c:a288:ef4 with SMTP id
 o10-20020a25d70a000000b00d4ca2880ef4mr4049416ybg.44.1691415901373; Mon, 07
 Aug 2023 06:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org> <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
In-Reply-To: <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 15:44:50 +0200
Message-ID: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
To:     neil.armstrong@linaro.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 31, 2023 at 4:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 30/06/2023 18:58, Neil Armstrong wrote:
> > Due to lack of maintenance and stall of development for a few years now=
,
> > and since no new features will ever be added upstream, remove support
> > for OX810 and OX820 pinctrl & gpio.
>
> Do you plan to take patches 9, 10 & 11 or should I funnel them via a fina=
l SoC PR ?

I tried to apply them to the pinctrl tree but that fails ...
Could you rebase patches 9,10,11 onto my "devel" branch
and send separately? Then I will apply them right away.

Yours,
Linus Walleij
