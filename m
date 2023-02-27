Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D66C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjB0RsM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjB0RsJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:48:09 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2E35FCF;
        Mon, 27 Feb 2023 09:47:58 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id u20so4046526pfm.7;
        Mon, 27 Feb 2023 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDBq5XrzhHt5uSFoSZnBnYybOPwFuov9mZ7LFx7C4aw=;
        b=DwUdHFPgb+hn/UsK3BdcdNv7WW2XyDFOD2xpLealPKz7ZhaUkUpzsrCSfTOVQUTePJ
         gdps9oyjnxgn5E0tHHN7SMSy3lB69glsghcH/HkxLGOUiBh+qOh/ce0psODiW3J67ylo
         wHHP+QfzxGtZSRAApY94/L8aM2EVsOdvu41qr3mS5ItxNWfT4y9So6iNved4q4mhpP5Z
         shVm8Kn8vtLHDJvCIx7zOqFVS6sAmQa4hp3xL7cWKO8RyRqCwwLUV+TGFqZNhi+YBnHr
         CzwXiCI0BpvnFThSX9A277WNKp8y+DqDH8wdgRUScZvD8zlZpheCPX1qXeNuDxQmkvlL
         GsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDBq5XrzhHt5uSFoSZnBnYybOPwFuov9mZ7LFx7C4aw=;
        b=eYfRU5n8NzPKnl0IT+ol7DXKQdefyFB03Fr1hsmJ/nkcZ0IoVU1GXuEzu3p/e8ohfO
         uBS1Ro17Q5IkIOUe4mhmUr0Z4BP1RVy5yHuKP8QimficwDLpZugG+tvmrQbIBDOEsF6z
         xfOJqMWLRdI4lLe+3cvEknrN04vNsyKPvFpHagw9lSFSNY/bjX9dTAXm0nqA/7onKD2+
         LUfBtgVHFxVXaiMNnRQJKylam9tLbsIrXNzo78I46SNTOU5klMPwcWrXwlvzllQLECO4
         1JRCbQh3oLxWLmlQfzjHPKwWFEj/DSRD9lJhdavjl9YwbHNZNElXZ4mXBuwfGE+bJmxr
         tgJQ==
X-Gm-Message-State: AO0yUKVsqGF9l4s27CwMs78vQnX9C7nWr+Q1wNG3STmpSiFzbAK8vcZx
        hnihVC/UDEqgTotq2YTJbiKLg2EWflTBuPMcd+Q=
X-Google-Smtp-Source: AK7set9TyHWe8tGsSdRUQrmLsfjN280acPdM/Tj4cE4AvABJdFZC2EzULNwCBJHyUJeec8sIvhOtlxkVtcJRoQsfRis=
X-Received: by 2002:a63:7e17:0:b0:503:bb5:4cec with SMTP id
 z23-20020a637e17000000b005030bb54cecmr4056856pgc.7.1677520077561; Mon, 27 Feb
 2023 09:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20230227174308.87286-1-marex@denx.de> <20230227174308.87286-4-marex@denx.de>
In-Reply-To: <20230227174308.87286-4-marex@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 Feb 2023 14:47:45 -0300
Message-ID: <CAOMZO5A-w79CPdq1Nja4Ox--DxjvqQUqayCx_zXAy=nRVO-5WQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
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
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
