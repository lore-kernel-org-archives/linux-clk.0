Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65CEC636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 08:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjBQIEu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 03:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjBQIEe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 03:04:34 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D288B5EC84
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 00:04:19 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id j5so4738240vsc.8
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 00:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CpxtOTmVR2iXHq4ntS7OV0jJ3byBq2V6cwWSHKeYass=;
        b=E/vIuU9ySLKJMhuGEau90zQBSG8SlHXkZF8yV3yS2kyxvZ4J6navODNrBOLVYMXgRs
         Ox62VC5OKcy1I/E3Uxu67J+4p3RLdNmXa4/5RjPnQtGjv8Ji7+fkzUpbvaec1bXgGk41
         t81KFoQ4wjoT8c4wmiBMfHEvM4VzhaNMRxm2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpxtOTmVR2iXHq4ntS7OV0jJ3byBq2V6cwWSHKeYass=;
        b=ELwXg7cNfEzXBGr658nX6GxHZspPgFQaluPSoPkoa5EwUJ9+igTA0pape+aAy5WEcW
         c4luJaK9vDK2bpTsY/3a7XLn9K/iURUlw22X40pWmdJ+BFM7bs49ESTuVuYw7LaTOOdB
         uWFS2UE12blZVl+cRoviSbmkz0F1TT3VWlX8em9JnC0F2847cFUTSrOinHZC1PmQqECu
         tijXF96T1w0t4LGqTBtlf5T20j3UzwZhLtUMdRKNZIH6a+rzutEC1TKIzniSiKHBieUR
         4UKT8h/UQYcJ/pH7LgWhbBIiv1vnikUWI2pBR/YpnD9HeMnboSjOIh+rsiclgXll2jqu
         1Ywg==
X-Gm-Message-State: AO0yUKU4Bfz8Pc7l6A1S1N7Mv3jfvJN866WX1qCoOKie3vMA6Dz4dvQt
        s/KZ2gdM6EpVYNcwNwUcMUQAkpSx8vGsPUndIqljRg==
X-Google-Smtp-Source: AK7set+3G1On2xvJPdWW5BJlN2FbGevzUL/1abRBSCTHO4z51cXzRqmejg/kYU+jflz2dX+3jtTcJOE5uEtw71QLDKg=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1615105vso.60.1676621059003; Fri, 17 Feb
 2023 00:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-48-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-48-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 16:04:08 +0800
Message-ID: <CAGXv+5Ffsf8bO2HemdOhmEwHtYwm9B+pRKMr0URc6bkY9Btr5Q@mail.gmail.com>
Subject: Re: [PATCH v2 47/47] clk: mediatek: Add MODULE_DEVICE_TABLE() where appropriate
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
> Add a MODULE_DEVICE_TABLE() on all clocks that can be built as modules
> to allow auto-load at boot.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks like every file applicable is covered.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
