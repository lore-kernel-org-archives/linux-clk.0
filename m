Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D053C04A6A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 19:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjHHTqq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjHHTqR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 15:46:17 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6D5497A8
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:49:21 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4871396a94fso1742535e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691513360; x=1692118160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sXSwhyaI0ZZPhzdoq7cwPc4m+iIsmlIdeajHxsIfwk=;
        b=nW+TLeGWt0Joi0cDQEpyv8XpsMZypizJVpWhTBrTsYgmj/UVR5g/dTbUHPYwiVbMWt
         MPW+GmRsyr9mkDYk+YsMf6wkxTTE0NT02mLsXNw90l/FANK9EMaNm6yUTuc7yOUKcUZk
         XP2oaBoMFqHZOAruZFDIxRI0jc77Oa6LLpVgfGwL1OW8UFD56sgbc+6MrZJruI76Kao/
         SUnLWMtlpzCOjhDcmnNUsET8KIwb1lf4N7WI7laBZUWQEhm2zgOCZiuXbLxTRUleYrHA
         oKGbN8ht+9EVLpHdz+88qXDir8Xa4Fy2SFlcS77ANBYOgF5m6+b/JWPS/HeBttZYYZ4S
         WdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513360; x=1692118160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sXSwhyaI0ZZPhzdoq7cwPc4m+iIsmlIdeajHxsIfwk=;
        b=CZwaDT3ThV8Vz50xKZQ6ut2zed59nCakkGqPOB6dvte2VbY9+G3OrSYBR5fDBbvOAy
         N61J/7dKcaCb4w0v+4JDwRS2OM6B/vp+tC4hrZVuhKPArmKS8ItP+2XEz/nXOfGA6uX1
         b2d/YW5FH9umlFxsYp2u5+TNT4K43F/ujanXQ10EPzceNr1cSON/BF8h78fAc1WvG3o2
         05RkSJ079V1xmcFZC4dc46CfM4Wcw1oEIibGcNy7a2dSJXtl3qzaGTGg64EYLvoyGlAk
         6gdjXEymqwS8Ogn9BS692fv1LCYAgPf5cpVPxBm/nSgqOoNxck050jieLBUjXvg6TrE+
         A6oA==
X-Gm-Message-State: AOJu0YwcBJ7jllDCNReQo1ptvM7Wnk9DtU4XOSVa2pUUWOXMiSZPJm+y
        6k/wdjYWjFX1Wkf8dJMxFn4GxqpjIAa2BBHXzEACdWXc
X-Google-Smtp-Source: AGHT+IE7W+ulJL3lYpeOm7DsC71eu861ltysH1dTV0waDoEv588kswbzOhxtg2c3V0PA0LppolHnwmuJ0v2isqD32RY=
X-Received: by 2002:a05:6808:238f:b0:3a3:eab8:8c40 with SMTP id
 bp15-20020a056808238f00b003a3eab88c40mr16363716oib.54.1691497174996; Tue, 08
 Aug 2023 05:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230807084744.1184791-1-m.felsch@pengutronix.de> <20230807084744.1184791-2-m.felsch@pengutronix.de>
In-Reply-To: <20230807084744.1184791-2-m.felsch@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 8 Aug 2023 07:19:23 -0500
Message-ID: <CAHCN7xLdwNXXeEi82KN7QWgUqUCeFjxJgkdo0+GujJYo8qLXVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        rasmus.villemoes@prevas.dk, adrian.alonso@nxp.com,
        a.fatoum@pengutronix.de, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 7, 2023 at 3:47=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>
> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates"),
> the driver has the ability to dynamically compute PLL parameters to
> approximate the requested rates. This is not always used, because the
> logic is as follows:
>
>   - Check if the target rate is hardcoded in the frequency table
>   - Check if varying only kdiv is possible, so switch over is glitch free
>   - Compute rate dynamically by iterating over pdiv range
>
> If we skip the frequency table for the 1443x PLL, we find that the
> computed values differ to the hardcoded ones. This can be valid if the
> hardcoded values guarantee for example an earlier lock-in or if the
> divisors are chosen, so that other important rates are more likely to
> be reached glitch-free.
>
> For rates (393216000 and 361267200, this doesn't seem to be the case:
> They are only approximated by existing parameters (393215995 and
> 361267196 Hz, respectively) and they aren't reachable glitch-free from
> other hardcoded frequencies. Dropping them from the table allows us
> to lock-in to these frequencies exactly.
>
> This is immediately noticeable because they are the assigned-clock-rates
> for IMX8MN_AUDIO_PLL1 and IMX8MN_AUDIO_PLL2, respectively and a look
> into clk_summary so far showed that they were a few Hz short of the targe=
t:
>
> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
> audio_pll2_out           0        0        0   361267196 0     0  50000  =
 N
> audio_pll1_out           1        1        0   393215995 0     0  50000  =
 Y
>
> and afterwards:
>
> imx8mn-board:~# grep audio_pll[12]_out /sys/kernel/debug/clk/clk_summary
> audio_pll2_out           0        0        0   361267200 0     0  50000  =
 N
> audio_pll1_out           1        1        0   393216000 0     0  50000  =
 Y
>
> This change is equivalent to adding following hardcoded values:
>
>   /*               rate     mdiv  pdiv  sdiv   kdiv */
>   PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
>   PLL_1443X_RATE(361267200, 497,   33,    0, -16882),
>
> Fixes: 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting")
> Cc: stable@vger.kernel.org # v5.18+
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> v2:
> - new patch
>
>  drivers/clk/imx/clk-pll14xx.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.=
c
> index dc6bc21dff41..0d58d85c375e 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -64,8 +64,6 @@ static const struct imx_pll14xx_rate_table imx_pll1443x=
_tbl[] =3D {
>         PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
>         PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
>         PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> -       PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
> -       PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),

Part of me wonders why we need the look-up table at all if the driver
has been fixed to achieve better rates.  I don't know if there is a
significant time in calculating the numbers as compared to the time it
takes to search the table.

adam
>  };
>
>  struct imx_pll14xx_clk imx_1443x_pll =3D {
> --
> 2.39.2
>
