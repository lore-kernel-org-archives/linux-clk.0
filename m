Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A19FC001B0
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 13:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjHINSq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 09:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjHINSp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 09:18:45 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066ABC1
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 06:18:45 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a6f3ef3155so5300312b6e.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 06:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691587124; x=1692191924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD8XGdabza6mK723DfyP8ef17J72O7i1TSnECs8Jmyw=;
        b=U1KMFVOOAWLmen/6E6yuxRhBb3I58ml/qEciSSeISMoHVJHjtliVybB6QyTyXYxtQW
         v7wu14vi87iqzpNwBVjjbkx+NB7Hg6dJTTuZ5uiZAfvjbf2EGytpuAhm73Uv7RdmNKy5
         8ud0bCEeumzRhNFYmsq8AD9KvUoF9kTdT9zDat2Sk6QmjX0pBt3QaLJPKfkgJ2PxgslZ
         5ZwdE5rSH8tiguBPCYBoxd2qw780MTN7jICa+81SO+gqN+2stwI7iPUcAVjY0FFx2Aj9
         myZN+OSJuoX/gPkShExyGxKMjGjDdYPjXPvVfLA4vUb68kcYCrUHn+WOgHm2YpkYcuUh
         +03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691587124; x=1692191924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD8XGdabza6mK723DfyP8ef17J72O7i1TSnECs8Jmyw=;
        b=Tl/eqMbkkEZnFcsVC0R3HgcfHBBY84DBOYMjfZrHW65fSXTg60dNvj4TOSmsWqpgaC
         L7OrJjY8Ka7RrGm7SchOzLD7fvxFIDadfBJxFAYWYSHnInNwFsSNXYDQnxENpVRxTxdM
         kH4YLB9iQEhVbwwpxrto/QtIioex5d4QSvaBvv/2k5zu3CxEJfJSrRFK2uPS6pslblp1
         0eb+uNF4iKS7tSZdkFvvqe909VwHeJ1tfvS9sjEyHto+QoDiWH+Z1yRl+aXPF/0rKFoQ
         z7qRJUxca5lDYh8IZI6w64bP0mcwsnJ8/5bnfTEjVZ/2giYyNXL+vepbc50vuO1Dj1IM
         JmFQ==
X-Gm-Message-State: AOJu0Yw8a6ol19MwXmVcZYHjls30yCpSrdyiGyvouf2fHBMJgS88oNgD
        ieMWYc+HGDr8HCNjN5JEq7iJEjHzQn2UfTUV1cM=
X-Google-Smtp-Source: AGHT+IGFMQakPd3uap+JHmzXfqPry4+YHAq+XZs6VT3HvzvwypCyILPfyRpOZUAjdHVUuuHdYBvWzu+8CE+AWwwEaOQ=
X-Received: by 2002:aca:1308:0:b0:3a7:4ac4:d4fc with SMTP id
 e8-20020aca1308000000b003a74ac4d4fcmr2709643oii.33.1691587124082; Wed, 09 Aug
 2023 06:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
 <20230807084744.1184791-2-m.felsch@pengutronix.de> <CAHCN7xLdwNXXeEi82KN7QWgUqUCeFjxJgkdo0+GujJYo8qLXVQ@mail.gmail.com>
 <ce1303c3-79b2-7a50-6fab-6235d9930d53@pengutronix.de> <DU0PR04MB9417442CEA0086A6DE6D890C8812A@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417442CEA0086A6DE6D890C8812A@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 9 Aug 2023 08:18:32 -0500
Message-ID: <CAHCN7xKLXDeZSZsJ2q1n5Q9ttXPT2yMdK=5++-UU_HsP+rP9xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 8, 2023 at 8:22=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PL=
L for
> > 393216000/361267200Hz
> >
> > On 08.08.23 14:19, Adam Ford wrote:
> > > On Mon, Aug 7, 2023 at 3:47=E2=80=AFAM Marco Felsch <m.felsch@pengutr=
onix.de>
> > wrote:
> > >>
> > >> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > >>
> > >> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic
> > >> rates"), the driver has the ability to dynamically compute PLL
> > >> parameters to approximate the requested rates. This is not always
> > >> used, because the logic is as follows:
> > >>
> > >>   - Check if the target rate is hardcoded in the frequency table
> > >>   - Check if varying only kdiv is possible, so switch over is glitch=
 free
> > >>   - Compute rate dynamically by iterating over pdiv range
> > >>
> > >> If we skip the frequency table for the 1443x PLL, we find that the
> > >> computed values differ to the hardcoded ones. This can be valid if
> > >> the hardcoded values guarantee for example an earlier lock-in or if
> > >> the divisors are chosen, so that other important rates are more
> > >> likely to be reached glitch-free.
> > >>
> > >> For rates (393216000 and 361267200, this doesn't seem to be the case=
:
> > >> They are only approximated by existing parameters (393215995 and
> > >> 361267196 Hz, respectively) and they aren't reachable glitch-free
> > >> from other hardcoded frequencies. Dropping them from the table allow=
s
> > >> us to lock-in to these frequencies exactly.
> > >>
> > >> This is immediately noticeable because they are the
> > >> assigned-clock-rates for IMX8MN_AUDIO_PLL1 and
> > IMX8MN_AUDIO_PLL2,
> > >> respectively and a look into clk_summary so far showed that they wer=
e a
> > few Hz short of the target:
> > >>
> > >> imx8mn-board:~# grep audio_pll[12]_out
> > /sys/kernel/debug/clk/clk_summary
> > >> audio_pll2_out           0        0        0   361267196 0     0  50=
000   N
> > >> audio_pll1_out           1        1        0   393215995 0     0  50=
000   Y
> > >>
> > >> and afterwards:
> > >>
> > >> imx8mn-board:~# grep audio_pll[12]_out
> > /sys/kernel/debug/clk/clk_summary
> > >> audio_pll2_out           0        0        0   361267200 0     0  50=
000   N
> > >> audio_pll1_out           1        1        0   393216000 0     0  50=
000   Y
> > >>
> > >> This change is equivalent to adding following hardcoded values:
> > >>
> > >>   /*               rate     mdiv  pdiv  sdiv   kdiv */
> > >>   PLL_1443X_RATE(393216000, 655,    5,    3,  23593),
> > >>   PLL_1443X_RATE(361267200, 497,   33,    0, -16882),
> > >>
> > >> Fixes: 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting")
> > >> Cc: stable@vger.kernel.org # v5.18+
> > >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > >> ---
> > >> v2:
> > >> - new patch
> > >>
> > >>  drivers/clk/imx/clk-pll14xx.c | 2 --
> > >>  1 file changed, 2 deletions(-)
> > >>
> > >> diff --git a/drivers/clk/imx/clk-pll14xx.c
> > >> b/drivers/clk/imx/clk-pll14xx.c index dc6bc21dff41..0d58d85c375e
> > >> 100644
> > >> --- a/drivers/clk/imx/clk-pll14xx.c
> > >> +++ b/drivers/clk/imx/clk-pll14xx.c
> > >> @@ -64,8 +64,6 @@ static const struct imx_pll14xx_rate_table
> > imx_pll1443x_tbl[] =3D {
> > >>         PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
> > >>         PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
> > >>         PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> > >> -       PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
> > >> -       PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),
> > >
> > > Part of me wonders why we need the look-up table at all if the driver
> > > has been fixed to achieve better rates.
> >
> > The look-up table achieves a different (worse) rate only for the two
> > setpoints that are dropped in this patch.
> >
> > > I don't know if there is a
> > > significant time in calculating the numbers as compared to the time i=
t
> > > takes to search the table.
> >
> > The speed of calculation is negligible. Differently chosen parameters m=
ay
> > affect the speed of lock-in or allow faster switch to other interesting
> > frequencies. I also think we might be able to drop the table, but that =
should
> > be a different patch with a different justification as both ways would
> > achieve the same rate, but with different parameters.
> >
> > If anybody from NXP could shed some light on how the existing parameter=
s
> > were initially chosen that would be most useful.
>
> No specific reason, just bit lazy to write the calculation algorithm,
> LUT table would be easier to understand and check.
>
> If the runtime calculation algorithm works well and not violate VCO
> or spec, it should be fine to drop LUT.

Hopefully the algorithm doesn't violate the VCO, but I'll run some
checks to verify it doesn't, and I'll verify  what values are
generated for those other frequencies remaining in the LUT when I have
time (unless someone beats me to it).  If nothing else, it will help
shrink the code a bit.

adam
>
> Regards,
> Peng.
>
> >
> > Cheers,
> > Ahmad
> >
> >
> > >
> > > adam
> > >>  };
> > >>
> > >>  struct imx_pll14xx_clk imx_1443x_pll =3D {
> > >> --
> > >> 2.39.2
> > >>
> > >
> >
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Steuerwalder Str. 21                       |
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> > pengutronix.de%2F&data=3D05%7C01%7Cpeng.fan%40nxp.com%7C5c46a083
> > 87714c77639608db980fe775%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> > %7C0%7C638270966291144836%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> > C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> > %7C%7C%7C&sdata=3DlOGHpEcwJCTMOHHRacVqyBic3tvXiz7FmDX9l3oh2yM
> > %3D&reserved=3D0  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
>
