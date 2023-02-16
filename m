Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D73C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjBPKqM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjBPKqI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:46:08 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9C855E5A
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:45:41 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id v16so341909vss.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OikyZqRmoD0C+GYQ1KT5tc2T2n1ELXXRZ8rYdWGUuJk=;
        b=RrQPWJV+c8IYzi438eFajsT0qqU5972irIrlYlC+toscyWM63GRyvTL2iUyy2NnSmv
         8bNPm7/rdH8yqPmCLipD3iwwKr7YDXiLOYe08og59qJqL+hurOB73DB3AJqMqS0CTZX3
         BkwxDqvs7v7rYRkRl51UkdXSinlG7mblKQuLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OikyZqRmoD0C+GYQ1KT5tc2T2n1ELXXRZ8rYdWGUuJk=;
        b=sxQwvzQXLj7O2jjpq5oCHhEIjQ4YYvQdodLsmM9tumBIEp0fK9kILSezHrd8qA8VJw
         ohCOCz6+c/5JlkGP0huqYeCvVAmceyyr4Gkt114MUmfDIn6ILBBM597X/GTgrN9q9uVz
         3lEOSWV95LPruq2PFt9dJ8GsnrhC//8iOJpE2crGwYUKIEDv7HE52yRfWBWUxES6/P+h
         ekdKSmcPzoUg/66FyVl8SON8hcACh1Oo1ZEY437donb1w47c2cUWo17wVvbe8rp4t9/i
         HZqz/etxC0yQrto1BlgGNzok/E8ZKZlvlDqwiy6dYZMQ7m62o/LLNCxrA769cxmAOXiR
         miHw==
X-Gm-Message-State: AO0yUKVzK/MgK+W7YM1FfwhjUbVG29O7vX7Z4cQLKKvQ/tf7/TOPLgOD
        lycIkEbR5k4Y+Ou1o2sHIkBux0s7r0LKIe9fioUpuA==
X-Google-Smtp-Source: AK7set9oX9ednFxOPyR1C2ACJClKhPaeGavzOb7y1NTEL3RKv/WKFcHuJe8veNw15alFWHK4vAigihyINbLkC/m5MLU=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1008836vso.60.1676544338052; Thu, 16 Feb
 2023 02:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-23-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 18:45:27 +0800
Message-ID: <CAGXv+5FcBHur0sS7aS5TQ8jDLbAXKk36BC=GMQ6Y0-NmsQQ5wg@mail.gmail.com>
Subject: Re: [PATCH v2 22/47] clk: mediatek: mt7622: Properly use
 CLK_IS_CRITICAL flag
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
> Instead of calling clk_prepare_enable() for clocks that shall stay
> enabled, use the CLK_IS_CRITICAL flag, which purpose is exactly that.
>
> Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
