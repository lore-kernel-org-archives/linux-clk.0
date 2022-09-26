Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721A2C07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 04:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbiIZEIn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 00:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiIZEIm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 00:08:42 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5CF2A97D
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 21:08:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id dv25so11375723ejb.12
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sOR1HCqCWdSbaMEzOVaKKzwSu7f5OFySFkSjJn8FZ2A=;
        b=jaTx8wpigkGkl6A5tkPzCkLvUK2IHWtK9xhaqrVZA41hzheFEIRPLj2QcrcPOPefHc
         JSstJMgcFxyWDwexkjIT0qyJuCEdOETqE4iQkc26xhSFcMCmWIYnIpI/zLswMWrNbh3R
         XFETvnNFiuhUF8Mo16DRTZGw3gOXuEEWS4r5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sOR1HCqCWdSbaMEzOVaKKzwSu7f5OFySFkSjJn8FZ2A=;
        b=GevRPCgZDLIqWRBvXNBaWWgXrzoietBtxHAdEO8Ev7LjBQ/RpFyjm+YarIT1oYVtPE
         qIX07fhdMddnxW56HGxlif6bTjaS8fQkcx/6Q/HIKo8LRiMQVI6CtZJ7KV7zEzVUYixh
         Aywl8jGl5aAmJHNm5x2WPPdoWnG7Jztbm4W5Zgwp64qdTp2x9CHMhUxXrq2+mveh7vKj
         iBXbejJLvx8x9k7CRFt+j+fB5xH7tdH1TVWnlnAgEo86z13HPUflS7quRNabRpSIyee2
         8HEzwCPSqMpMDa4/DBpIb90C8RsDxS8idvuARTZaP4iLvsgPugSBi8g9mrKm+8vO9Xw5
         84AA==
X-Gm-Message-State: ACrzQf1jx0rYWPG/QUGtZD4KmvKu8PDcrPA0zNlkKO8I4OdCna0S2Yv6
        cOCpW/cuSO6rT8xePkT5Gvec5p0U/TD2SMNHdc4+Nw==
X-Google-Smtp-Source: AMsMyM6AbSZNeSyPM3bn5XK6eCiXpj0PURzOGegzp8trgtGVJOL93SxM/MGKL4DedKUbISaYwJlDjKgnCzZ8mSWa/xg=
X-Received: by 2002:a17:907:80d:b0:73d:1e3f:3d83 with SMTP id
 wv13-20020a170907080d00b0073d1e3f3d83mr15972482ejb.372.1664165320144; Sun, 25
 Sep 2022 21:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220922091841.4099-1-miles.chen@mediatek.com> <20220922091841.4099-2-miles.chen@mediatek.com>
In-Reply-To: <20220922091841.4099-2-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 12:08:28 +0800
Message-ID: <CAGXv+5GitZopbd2FOC=9QxEG7SDYK7zy6JvsBoCXgeiM_j9E9g@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: mediatek: mt2701: use mtk_clk_simple_probe to
 simplify driver
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 22, 2022 at 5:18 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> mtk_clk_simple_probe was added by Chun-Jie to simply common flow
> of MediaTek clock drivers and ChenYu enhanced the error path of
> mtk_clk_simple_probe and added mtk_clk_simple_remove.
>
> Let's use mtk_clk_simple_probe and mtk_clk_simple_probe in other
> MediaTek clock drivers as well.
>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Just FYI, but you should have your patch subject contain the proper version
tag, and not just on the cover letter. Patchwork gets confused otherwise.

ChenYu
