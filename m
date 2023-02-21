Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86C6C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjBUDoQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbjBUDoN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:44:13 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD92BEB77
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:44:04 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id x14so2860647vso.9
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Xlugm3pXAui3DilCpKF18YnSL5Zk3BvOl+coQBmpVo=;
        b=kcl1T8GcpUTdYh29tvrYlgWXtNo8FgluIlnTF49/6hRsUxJFXwTTlD7wcbrqnSs4Y6
         fT3SZ9RH/rzmeSVYkBn1V/Cyngr9Ci06ZdeiQtnFca+U1+D7bt0rdOF8vvlQFn2tF7pQ
         XWhk/d//Dm6K+b0ryelYpCe6PDay2rOuf94lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xlugm3pXAui3DilCpKF18YnSL5Zk3BvOl+coQBmpVo=;
        b=cL/nRB0/hB2D5jpeSYbZN1TVdiULyABQFkcLqaEEDqHQHUWoulvd6fjH5HktOmOtY2
         RoaGHVo9rvxV64uqd8PYKoZY33v1xyYL0jus1ddCboZp38e0cHq7FjXX0zxqhklKKQOz
         PVzFDudZT0KIuDQ6ZzniR/35mJ8ZqA2JmGssnQOPW8s7rq9mZs2d06ha8HdA8o54CBdN
         kioU5xB+WHha8vaIkFuCu1X9kORSPlrwq1k+gDoNyxGCXlqyzHroPp2z0W+1i5hFmb9z
         Ka+jS2Num9Tlh4aelZ66WTgclOpmfiIcopZftEUmSwYfrvNm0mU+E+yzBI1isD42xuLl
         gy1A==
X-Gm-Message-State: AO0yUKV0737ku5NQSUpzrmWdmbZzdyZUeFzDjpwGCM8B8Fpd3k4qvdBp
        CiOBa+F8nBM+/00dKq/IY/nbffEgIMtpcCFiB+EGoA==
X-Google-Smtp-Source: AK7set99PgQG/skcb8vDBY1z3nQ+BRz+fEyyfxl+F96z8xZG8IfiTHWVCnPD+wJav+iNFejJ1+D8eL+9Ev5yb6xerm0=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829792vso.44.1676951043909; Mon, 20 Feb
 2023 19:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-27-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:43:52 +0800
Message-ID: <CAGXv+5GpkOvOkEg5cnFguHaMCtBH-2v44gO7O8Hd__6Ffg1Zgg@mail.gmail.com>
Subject: Re: [PATCH v3 26/55] clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c
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
> The infracfg driver cannot be converted to clk_mtk_simple_probe() as
> it registers cpumuxes, which is not supported on the common probing
> mechanism: for this reason, move it to its own file.
> While at it, also convert it to be a platform driver instead; to do
> so, also add a .remove() callback for this driver.
>
> During the conversion, error handling was added to the infracfg
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
