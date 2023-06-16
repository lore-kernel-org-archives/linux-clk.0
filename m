Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64406EB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 03:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241933AbjFPDKn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 23:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241773AbjFPDKa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 23:10:30 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3512D4C
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:10:23 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-46e28685090so79954e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686885023; x=1689477023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6kUQJ2oaECsBSDSAayXfsHXsy3gCQva2UbjpQg9ET4=;
        b=VdN+gFfGuR0v7U1J1avatXEFmDHfZHhOEPFcWuLwzL6e6adjM1gQQHvPclBAMCk/no
         aUiYWiB03T+1hr1VHDKhuV9/nRRPWccnJA+Rfc9a/2FSuy0P2tfsNMEKN59pdmFV1B38
         E9mYq70J8vHpnVxM8kB4Vd39XkG4SjDCVR5YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686885023; x=1689477023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6kUQJ2oaECsBSDSAayXfsHXsy3gCQva2UbjpQg9ET4=;
        b=RRvnrG7eESkZD+DX8T+GBTFgd3NnDCXaFHO3APlueq7PbJemwW1q145Cp9qnqpYbwt
         VDn4HjNFtMswObUtm2a5+mw7gqj1DARaWEopC68dYi3LHFiB9ghJBChWwrWaiOej7ubf
         bHMIob/8ePm6Dq7Pa6aXxyEATNwVLppeS7OxWFWBCCFuZHzEqQnKHbu8NSqkd68dK2uS
         UE+sI+HDEQYcL47BeKvsKGtwQY2lUdfbUHz3cLOczqzc6XvkPPmUYDl5aOAs4bxoaUBw
         FEro3zf08a1Vt/OBXasyzWSYM8Q40EtTErZ1EPKdNbc/YY0g9G0QR9PEmREL2ODTgNtd
         y6gA==
X-Gm-Message-State: AC+VfDyT3spA7fHWfejBrEQFODHQ4XYI+N0KjQPM6i6wWheb/gKyjSlz
        CVmSZ03QFRv6K3bUJ39Wm5fBDqlFv2WvR7zJneamag==
X-Google-Smtp-Source: ACHHUZ42bq99goI2vYAn8G1x741PYuq1KwDgq8h3oTYnQQH0OCj46O1bAJilLIhOQfyAObO3VAs0i/h38h8LBeAvpcI=
X-Received: by 2002:a1f:45c1:0:b0:471:17be:ba8d with SMTP id
 s184-20020a1f45c1000000b0047117beba8dmr1120129vka.3.1686885022864; Thu, 15
 Jun 2023 20:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230615122051.546985-1-angelogioacchino.delregno@collabora.com> <20230615122051.546985-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230615122051.546985-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 16 Jun 2023 11:10:11 +0800
Message-ID: <CAGXv+5GTcHYe3K98Hy7wos6m3271Y6PYyADcbt91SUKv25UFvw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: mediatek: clk-mtk: Grab iomem pointer for
 divider clocks
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        u.kleine-koenig@pengutronix.de, msp@baylibre.com,
        miles.chen@mediatek.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 15, 2023 at 8:21=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In the rare case in which one of the clock drivers has divider clocks
> but not composite clocks, mtk_clk_simple_probe() would not io(re)map,
> hence passing a NULL pointer to mtk_clk_register_dividers().
>
> To fix this issue, extend the `if` conditional to also check if any
> divider clocks are present. While at it, also make sure the iomem
> pointer is NULL if no composite/divider clocks are declared, as we
> are checking for that when iounmapping it in the error path.
>
> This hasn't been seen on any MediaTek clock driver as the current ones
> always declare composite clocks along with divider clocks, but this is
> still an important fix for a future potential KP.
>
> Fixes: 1fe074b1f112 ("clk: mediatek: Add divider clocks to mtk_clk_simple=
_{probe,remove}()")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
