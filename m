Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE34C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 06:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbiLZG4z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 01:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiLZG4u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 01:56:50 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2F41176
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 22:56:49 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id d14so757446uak.12
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M1SnFH/lPjK8DkSzjFnZaeTI7PMR4Peim0SSBCAeoNI=;
        b=gpVfONHwSnhvI+o4Oswm1KdRr3vFgOt5mgU6LHjiuvn3rzTBYjJzr0Gz85lS4d9YPd
         Kxbz999P5+w/OV2qnWUaenSzULCc+id7R/d8frAkCqbUxnsaPLKZqWUkxhlnQIqSsrkz
         W5JAOZXn7/EThGJgUqWOiZ5S2SW8YH0PXBNb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1SnFH/lPjK8DkSzjFnZaeTI7PMR4Peim0SSBCAeoNI=;
        b=OHJwc+reLccMySH6Svin5aqH1h8fP+mydJKUOQcv1ABU1FMvO3/ssnNi56l2wRBj21
         5XOEVF8Hn9nqSleEjEC8r7IEuRdAkndjGz+C0JAvVFczlJevl7fdpCLjYDmJcSuMFBZa
         hzblgp0Dqg0ZiojmDE7FjJRQfv6FpDsam5H/SGB4n/Q8cKb9xbfokb7JaV1MuwsDwGDI
         u0oUIxmXceS42iYdDjwPrv7RX9RbhwxCG6ay3pKkvSqoG61BdV1GZWW1qHUDhbjCKBaf
         MIN/9S+iMzaSWRQ6Lx+PNQAEwXrXNXDOmgoNgPZdRyWl1nFFp1c7FImgPp30PEokUG2W
         r/Sg==
X-Gm-Message-State: AFqh2koZiGDbbEr7+WU2BFaMTRXolsU+EloxBnRAKTnlVBdPYyCyO+tT
        bNrgJoDDQmw3WWoYNu4x3yMui5/92VPrS3wr7Lzkyw==
X-Google-Smtp-Source: AMrXdXumnCdbt8Id7nVQr72ncvxGvcSqSPRDFYpUVKhiIspGshPFm1Id8SI1nyZQ+l8BnASdx7sBOZ9SXIDiFAYGgvU=
X-Received: by 2002:ab0:738b:0:b0:469:f0ea:c1f7 with SMTP id
 l11-20020ab0738b000000b00469f0eac1f7mr780278uap.0.1672037808572; Sun, 25 Dec
 2022 22:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 14:56:37 +0800
Message-ID: <CAGXv+5HTi14-AV38DAFKao+PBeMf3CpSgvD6OuNnzRygL2bvgw@mail.gmail.com>
Subject: Re: [PATCH v2 02/23] clk: mediatek: mt8192: Propagate struct device
 for gate clocks
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert instances of mtk_clk_register_gates() to use the newer
> mtk_clk_register_gates_with_dev() to propagate struct device to
> the clk framework.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
