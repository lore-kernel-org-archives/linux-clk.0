Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7414C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjB0Rt1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0Rt0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:49:26 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068026A48;
        Mon, 27 Feb 2023 09:49:26 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so11903982pjn.1;
        Mon, 27 Feb 2023 09:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHQwtwY8riAO3ayzQCwu8rAfISkLwwrXTt/xdMKHgMI=;
        b=NaOnVQKuT16zoK3Th6Ksc36ycqR7QQtr01i6EAszG1tHUQVISpYL0JoYk9xMZ9/TqT
         AXF7ClUI94NPSahuJ4QanT35tRpSmDNMA8pqyuNgng1f4aGj97ej1j6KlRBn4g9yCaNa
         xBvSYqK70xafNthp6F1AbxR764tRTaUzsFlIuA4VbIGY9h/lpbgv/SV03H6Q6NMpH6HZ
         vrc+O/GolnC3TKjVOVsmA8HftNXcPEMmMaC/m+fgSYu/COiY5BODibuIVAkBfho9Vi2E
         K9jsUKdLgzddPWU8XNhQRe1yFyUbJwiFJcwNToHeKy0EN2FwnKv229gFXAH5wHS1DkWS
         n8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHQwtwY8riAO3ayzQCwu8rAfISkLwwrXTt/xdMKHgMI=;
        b=OloTHVLAxW3mE5Yz6bBfnfdAnlK9DFsamKN40dSGzv9Pwxgd10IG7c0NYEpoN4IU6q
         5RCjRmIQmxQZOmjlrnWcUOPLRjDYL7LKRWjp9D/SE1oUs7lv3RzLk8fBjpVswN/3ONhb
         wvap3NiAFbgDxXKQwR/H65RVu1ZTnWxVwP7IJf5/GsdOtgPz7Y9oAwcDjvjEgBkSo1hc
         TlaLm6LS89tpE55PW3wBBFExMK4GHo8STdeZPC2j2i+Q2jcmtZ74b+S3Mue/5WFMuE0Z
         9pdIMTAaJuVQ0c+/P+Brp10wt2zRvn5s1DgajU/ZF+kMvLf8TFABh1GtXGVG0mHi44tM
         6g6A==
X-Gm-Message-State: AO0yUKV0wASDg3m1eCLbjV8cHDy5koxep0XcHlKfijvWRL0ub/I3ZftM
        ka1Ev7Kd/3Ts4HkoSeDFyQYdslFVJ2cCWVpG7Ys=
X-Google-Smtp-Source: AK7set9Vgw7sf5nLaZUeSwo7H2jgxrpqQaaJcpXYX3/oKbStRu6mFJDYUPhhoCBbryRtpk0eXfGAU1N9H11amprto0M=
X-Received: by 2002:a17:90a:d193:b0:234:b23:eade with SMTP id
 fu19-20020a17090ad19300b002340b23eademr15082pjb.9.1677520165509; Mon, 27 Feb
 2023 09:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20230227174535.87657-1-marex@denx.de>
In-Reply-To: <20230227174535.87657-1-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Feb 2023 14:49:13 -0300
Message-ID: <CAOMZO5DLTmxFEByk9N2FmieKMRBZquYGojWKisTaH4WgSb6xCg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
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
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 27, 2023 at 2:45=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Add #sound-dai-cells properties to SAI nodes.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
