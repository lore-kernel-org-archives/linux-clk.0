Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD4CC636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbjBUDuE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233597AbjBUDtz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:49:55 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F7E1A649
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:49:33 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id c23so1039038vkn.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GPoBAzOY7l81ilf6DvBo+V6oHlkpvntjBu0BjLr0NvA=;
        b=VtoDb0qi3qcRjGlBzBBUqnhe6uQSr398gnTnlzc2iewCSdq22ndDi3pbSxFV/2Y1x6
         yRYsqCfqawFjqoQYIEZxLBRxA/IOSuUZUDKBrnoCpioCqlHVCgx0E07C8y+cMKhmNwGV
         sXzYnlvp06VmHgdJJ7eLnzyLst0kMhc3o29gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPoBAzOY7l81ilf6DvBo+V6oHlkpvntjBu0BjLr0NvA=;
        b=xiF3BzccP6jqIHuAiac3slYiL+v7kRQJrHT+UCB3sIGQFI1nWfCeNEdyey8DcGtLdO
         nRlKbZQnZVKSn9uh7m90OwSyh28H8CCVdd0SvjFHwMAFui2JsI4/mpzoXd6nddlLd4Bm
         SeH6rGKIKMjCxgAbAnsFLJCa2gJxsG/6STL59stBnt2w3NP0T8cJ/4S3kI/vCwakEKOd
         a6FkpLZ+XtragT5W+ORVyg4n1jeZyWK8KW/9zHP2jM5SmliR4AI78E73DXUrDAoP0s9N
         ULPz2azLKuO05ctzNfUy6E1rtkTHtpB4MY8pK2wcppOPYMj2nO89raQdubPj8GvxYxMs
         +5Pw==
X-Gm-Message-State: AO0yUKWttNRH+16VVUPbo+5paw9mwtRUly15W2fJ7BSet8NYwED51mtn
        /VR058DyjKWMFqqy7dlH5FkftuQxBmHrcQMtn2KKng==
X-Google-Smtp-Source: AK7set8Q7PtNTb6fxNMZPD61CAaqHdBZcNpoeaXFEaFzbmDAp9vIZ0gfeB0Nrm2cLOtunr0KW/yTajef/wfpYfrwpM4=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr811653vke.18.1676951373136;
 Mon, 20 Feb 2023 19:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-29-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:49:21 +0800
Message-ID: <CAGXv+5EzYrGzXR+YtQdQnp-nP722XtMYFu4fo1KNoqpY3hpAPw@mail.gmail.com>
Subject: Re: [PATCH v3 28/55] clk: mediatek: mt8516: Move apmixedsys clock
 driver to its own file
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt8516 clocks to the common simple
> probe mechanism, convert the apmixedsys to be a separated
> platform driver and move it to clk-mt8516-apmixedsys.c.
> While at it, also fix some indentation issues.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
