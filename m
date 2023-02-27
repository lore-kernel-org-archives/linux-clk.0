Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936CBC64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjB0Rq0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjB0RqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:46:25 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD65818F;
        Mon, 27 Feb 2023 09:46:24 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id k21-20020a17090aaa1500b002376652e160so6986909pjq.0;
        Mon, 27 Feb 2023 09:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxugz1WTnLMuKQ2XgN4kX/pPRLp8Rm5A/FH2O+qxfuw=;
        b=P8KpVZKUxR+e28Z/Zzo8PzZ7AUNL3PbpAgaqNjsmLFvV2WafMNkO6QNO8fQ0R58Pbj
         tmCZRN3j8V+UYKKqswFiEe0HjwXeVBoiJMhl9ekyYw6SW3ARlRbzUm1HNWXEJT+CfV6U
         p/vO+DPj54XgntU4hLNBXFKcSGzeLAxD6PS2aVLX23c2t57BpOTCTYd3wjWJwiLqPGYn
         m/Pw/1rrHsnGLDN+r2NS876AJd7AXwtGWGXA14428EndED3HAT/YHIhUGs3Mly6Gk+Ab
         CcqH/UlM+FVS2yDyKhsLGG6pRygBEfAG+wvo6k3EwF2sW7cxQPEFZ3IzW3O4f6+uKCG0
         c31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxugz1WTnLMuKQ2XgN4kX/pPRLp8Rm5A/FH2O+qxfuw=;
        b=rIlleevEzPd496+wlTIAiN+E1Yb6yMljWO7e00u28gPP2h60RojRCRmmoelX3u0cW1
         NsQumnX+4OqRGUBLn65plx/FYCLNzJfHDzVFh1IRkMU7+Y8E6Hc7bcts8aGnfRoSBH2H
         fzpke5CwuW2I7CXSyKmrSUIVzTJUw5gJzjM9wqIPCfVKWZUA2/OgQieMgFZE1NHFHZ18
         5w+7yyWfxwMKvy6b7DBHnvJx1RP5C5yRqJjplkWQwV1tHcvFft+SWFpkqdyAJz8qllCx
         rOje/1igqJq9HkTY443RlNhgBMyVlRl0/fNxh5DACsGeuPQtAxQygj3QOm2hiyBWabJw
         WchA==
X-Gm-Message-State: AO0yUKVT/q216LQhMJyV7qj9MESL4Q7EUY1cW1IZh+pIIiggtXpgIWJr
        5pbrJyRv9E6NjjBD6r5br9NBA1DyIf1Z/6DnwaM=
X-Google-Smtp-Source: AK7set/D9edLaHXPQ//NiGvVBwENUzO79+1i/12bRsF5xlaeRYGIoy8KbFPsoFS+Ys72dhn4CB08we4Wp5zH9SAQ2ck=
X-Received: by 2002:a17:902:ab08:b0:19a:706c:6ba with SMTP id
 ik8-20020a170902ab0800b0019a706c06bamr6393460plb.4.1677519984215; Mon, 27 Feb
 2023 09:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de>
In-Reply-To: <20230227174308.87286-1-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Feb 2023 14:46:11 -0300
Message-ID: <CAOMZO5A+O466rtNgvt2w37QDfuWwx8Y5sWc_EpwE=o9tBND9Tg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] clk: Introduce devm_clk_hw_register_gate_parent_data()
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
