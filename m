Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A3DC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jan 2022 08:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiADIG5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jan 2022 03:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiADIGw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jan 2022 03:06:52 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE8AC061761
        for <linux-clk@vger.kernel.org>; Tue,  4 Jan 2022 00:06:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u22so59345216lju.7
        for <linux-clk@vger.kernel.org>; Tue, 04 Jan 2022 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFt24hZdmLGBoCAYYI7T4sXVcct/Z/1btjjZtC3SaEk=;
        b=JHCZ1jlAjkhd6dHGLCwhkYZP51ipfK7egRYiv0m/LWibZyiBUZWF2UrS+L0ciOOD84
         DcHwR2c/sCT+nBsKci37WgxNafQ7YdifqUOvxRWw5UdE/dmVL+23yBXabTSTCLkV4CjO
         71Bukk9tt/qPLBfSYyc/W9cczGfHyfD6MzdHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFt24hZdmLGBoCAYYI7T4sXVcct/Z/1btjjZtC3SaEk=;
        b=DSfipt2AUSqE8K/ip/NdldaM4se3XbvxzA1s09v0bTG6ynpUz7GMzJvcv9mMUqrxi3
         jgPLu65I8+kwwPcbShQn3UR8UozdRMjO8Hdpa/zsNnQn6HP7khS6FA4gEi17haMMbEAU
         vL6A8fb+4RvFO3TAcvq0cLa0OqlU4uMrS8SRRB5ECYUfiSfKLHHKKxDkt7mY0OUbRLdW
         TdvrZLDBzrOSXocK6NqqaKuRV3TxnelWaoasQntLNWXEZkZ9FK+/UEXb3dOqT60Xf8Yn
         6e2tjyt0vMuWoMq20hHEsTqp3DfxQMkvvRzLGCkxlGESUmr6PcILU0+qPaxZ72QKx8EA
         DjzQ==
X-Gm-Message-State: AOAM533bolGhWDdskB9m0gDH2zC0zYihjWjcyuaaq59Cc51W8Yjkp3Xt
        g/H5hvE/JA+UMyQDB6kWfkX7/YFaYRSxDFc6f2oGaQ==
X-Google-Smtp-Source: ABdhPJyDWPb1tmSlbkoDWfLqNb8n+G5kXWkiZum/N3TQDjsU7yZm39wuLSP0bo2TErL1wUNKZBQWNuR7Metm6xYrieg=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr36158428ljq.457.1641283610448;
 Tue, 04 Jan 2022 00:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com> <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 4 Jan 2022 16:06:39 +0800
Message-ID: <CAGXv+5FPG=cRmDzo5P7axHuV22RA0UNBJr3KtjZ5ThYw8XVB0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: mediatek: clk-gate: Use regmap_{set/clear}_bits helpers
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 3, 2022 at 10:38 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Appropriately change calls to regmap_update_bits() with regmap_set_bits()
> and regmap_clear_bits() for improved readability.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
