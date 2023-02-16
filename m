Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261B0C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 08:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjBPIAV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBPIAV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 03:00:21 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44595B81
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:00:17 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id z18so252490uav.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwDQyziQcnL3/qYobk2rERtbLb6UKPgXAiYWHCJ3ci0=;
        b=nIRE8j59PqoJX7PnFaxwLXJvnpib/xw1mMdiCqZXNqoyJ4kCmBlKo72Y8fDay0MHP6
         /dPlbBTBI7i9OTV+q26ngG0OlG2vv0nTzUQJ5c55Xob85LG9DRKP/pgLdeZPYzrP34LJ
         1GT1+Tuy6HtrXbhUi5nN3KhOapekzucC/V988=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwDQyziQcnL3/qYobk2rERtbLb6UKPgXAiYWHCJ3ci0=;
        b=PDDMq2L6naoLmZLAoIVzLHa5L21lWPTLLs4Hc4ayGCrtIJhXjvoJM5cGFJRAeIC0Yx
         ZSkdsKtHR7+9GwDYpzxdon4fO6tPj6zpCV1EPDOSyVWVrCPTAVIFPF2V2yokF1hI9ssA
         vN7Ky+aBFv5ZE4S2ilEjgPbRSshUbZBtUHFS7BPA4yd/ClLydV+sPp/Q5JnWCqhyBBD4
         Ylzqkd9CUeBSMnmsKVJyWkw5hVIy/zxJVWT8VvElkW/aEroasz/ogVJcbh+sc4+tO2gX
         amw0wIzEX5wfSE0c5vwjTE1MaAtsTefJJ3j8S6UAL1YTzdhu3UySaUH1sKcjHheB1BbO
         n/lg==
X-Gm-Message-State: AO0yUKVEmli+ksVMzFIohcv0DqbL+c1FQrTnh7T92ZhA4WWCtpTD0466
        m3n0PtU6MeW3TTUwDYWWA8NDR6LUwVhO0sg2mYuPbQ==
X-Google-Smtp-Source: AK7set/WvM64Q5fol97RcKyUBZadppjKf6uZsIOu4uAc5MszrxY6orAb3miq/PyxHEIgF7hbx7+7gJfDgZu4bM62Fio=
X-Received: by 2002:ab0:1045:0:b0:68b:728c:cf35 with SMTP id
 g5-20020ab01045000000b0068b728ccf35mr144924uab.1.1676534416768; Thu, 16 Feb
 2023 00:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-17-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 16:00:05 +0800
Message-ID: <CAGXv+5F+v=Sh+NaqKKcrzABS96fRqc97gq2YVWabjH7Amo0AVA@mail.gmail.com>
Subject: Re: [PATCH v2 16/47] clk: mediatek: mt8167: Remove __initconst
 annotation from arrays
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for converting the MT8167 clock drivers to be proper
> platform_driver(s), drop the __initconst annotation from all of the
> clock arrays since they will be used not only during init but also
> during runtime.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
