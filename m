Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CB1C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbjBUD63 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbjBUD6Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:58:24 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14D82596C
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:57:52 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id u14so2506236vsp.8
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbe8qXQKMrVpJkOf3jrVoLuxZbFldgdnsONLwx23aA4=;
        b=GJRd2vTgRLB7Meg2mjAcO0LWEXqrYp0jZW+JDujL7OoOJvzjyHipO8tJHeVDniyNu8
         q//VIfiCaBP7w/NcQRau97s9Xak0lggHo57uzLgQeTxFpepxUeycmE66CATQ7As0zHRi
         5XIMt8ljZEVVWtyL7lr0E24bNkmc9eLcO8OUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbe8qXQKMrVpJkOf3jrVoLuxZbFldgdnsONLwx23aA4=;
        b=LKs7JmS4HqNe2MqfiF+ctPIvyAjwTME/G7vvb/fINEwCdk78LQUVKQ1txoYGhKwinF
         BsjenikstZcgWA7OdW0AVDYm4jZ8IWLd8v9AcdestCMdPpUB1bjxLbU8pE6WQzWMuheO
         svmDbNqcku8OFH8oQ6aNIlttFGwjvwIWyfOO4lo5rUokvU4wF2qOHE4k2eu9Va+0zHAT
         cHy5MSYwb2kLC8kr8vpZx/d2etNhtChazV6c7O8Gh48EvYcd+IUAv3aOS0Pt4Y65ha+c
         5EHG/8hrOv2/G0MlQoSgxWxqra2LLji2im0RUmRhTsFSUdgv4fYR9N9BokRiSZbWCs+y
         6xdw==
X-Gm-Message-State: AO0yUKUUC2GscoOpFJAR5L8qyQSJeTcwm4MX/P0Hjnzh7/fAz6WDv0CT
        2wBpFZAGJpPVg7t3ehAw2JpNSwhsW6BidTV8Z56Pww==
X-Google-Smtp-Source: AK7set/Oytljy1v3YJXFROUZlTwsYws5TsLkkfjMaDGrWjewbhAS+n2E1Ju5JPAijfSBy4C0MZ9A8Y5Gh6nAi6EZlfo=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr834379vso.44.1676951871830; Mon, 20 Feb
 2023 19:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-53-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-53-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:57:40 +0800
Message-ID: <CAGXv+5FnZMZFt31zhKx=wja5F9Bm9YjEOh8K_wDf6QaoSW1dwA@mail.gmail.com>
Subject: Re: [PATCH v3 52/55] clk: mediatek: mt8135-apmixedsys: Convert to
 platform_driver and module
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert apmixedsys clocks to be a platform driver; while at it, also
> add necessary error handling to the probe function, add a remove
> callback and provide a MODULE_DESCRIPTION().
>
> This driver is now compatible with an eventual module build.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
