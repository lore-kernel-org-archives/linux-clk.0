Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECD2EB64DB
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 03:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241775AbjFPDIz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 23:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241693AbjFPDIw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 23:08:52 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C4D2D5A
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:08:50 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-46e87ddd0f1so70886e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686884929; x=1689476929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssboqFuJsuzuCpdbRQ+L+w3xrtVqrpdJ2PznGonY4y4=;
        b=d2AvKjRRoiVHcqXfjX+XcACUNe5ZTaFoeBkqwyRBv+zr4ioeULu8utJj12aZsFcCEL
         Cb9D3qb0Q4RI4jqJ14EKgvYwpb0KjzXcAOx3ljqUU464Xvmica0Eak6cu9KXAeEWqC/m
         gLmvtREDwQAfwajnK4PuGDPJ600BuT40OnBy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686884929; x=1689476929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssboqFuJsuzuCpdbRQ+L+w3xrtVqrpdJ2PznGonY4y4=;
        b=cv79NJQwUC1TFB6KP09pgCpsRSAzFIYpgd7ge/RfZ/NNp4+9vNsU2NEKGHwEtVg+5X
         cnzJaqyN54MShDpY7rxRnN9lup6qAbb6E28MtktjNbr6J5bpoHY7aDqGmOZXAUnL1KO8
         DJVXPLzV1MbeKfX4RonXSrZJoSQAQ1fMQOsAdGjR/qUedbb8nwU2xiAwfcnGB239opHC
         pZRMZfgPK3xx7csCdBCrgwqYq30QRAbR5P3CVJsEsG1HnmbqnGfPfzToCBOkck0PXkUd
         p9f07+yDC2C4eAB7Y3677Iy/cEN4aOLSRz6ox0E981SX+kpMW3XDL3MvqCSinMjSzXTk
         mZKA==
X-Gm-Message-State: AC+VfDyxNE3NoIJkh/5au45Qqwb0RaWN7VdC3XJkqDEQCkFjzPIgPSkI
        cCfwIj2zE/Qi5J5ss02m8/lEdBfEhVdtv3ItEZygQQ==
X-Google-Smtp-Source: ACHHUZ7jff06HWZ1eakTPLpb+hwvGHtO2juAwSdDJVfKa0iM8R/TGrdtDP76FqlJtPr0NQcCcS/yLA4TFAbZ8vS6S8E=
X-Received: by 2002:a1f:4308:0:b0:44f:e6ff:f30e with SMTP id
 q8-20020a1f4308000000b0044fe6fff30emr1067981vka.10.1686884929582; Thu, 15 Jun
 2023 20:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230615122051.546985-1-angelogioacchino.delregno@collabora.com> <20230615122051.546985-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230615122051.546985-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 16 Jun 2023 11:08:38 +0800
Message-ID: <CAGXv+5GOum2QKhEPn+Oj+QZ1+Ts2OhRyjmJPOfQHifUjW3NXYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: mediatek: clk-mt8173-apmixedsys: Fix iomap not
 released issue
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
> In case of error after of_ioremap() the resource must be released:
> call iounmap() where appropriate to fix that.
>
> Fixes: 41138fbf876c ("clk: mediatek: mt8173: Migrate to platform driver a=
nd common probe")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
