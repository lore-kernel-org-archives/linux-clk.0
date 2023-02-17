Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3C8C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBQHZ6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBQHZ5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:25:57 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74CD5529C
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:25:56 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id m1so4667467vst.7
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHRAZTI5o+dIepaH+DVIh3O3w2k6AHu6HuSzNSZZ51M=;
        b=Eko4ttpHVL1yeaHVnXgT9itW5hX67NJh+/jUqhymVCKYf/deffoul4apjR/ukMEVSA
         AglCf2II8MP9RabSLDu9hJhwe8ak/89aqloZv2/aBhrHeqlSxm2BBSxtyFkQKUAydAsy
         Ssh/dE83khtqThZqiq9waclHTVhUt3PSlf22s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHRAZTI5o+dIepaH+DVIh3O3w2k6AHu6HuSzNSZZ51M=;
        b=0GOdfEpr3jzKYLzFrJsYBQhravpXq1iyg8W5fx0D5zoAhDzeejtImn7TcpvTN6G+RV
         2vYqU/Gq0K/9OCiI6irrlpJMfczAoc82Ws15pOMKmVLkUQpxXI3k+CsB2eG/AZGqkhrb
         qsZbcmuHZt06sTVy7n/sT9gLANiiJAt5rIqEaJiDVPN6TDXwaeKu6cniGqa9Ej6v/HhW
         SdwldRQjtX7wWfdJCDUrAuQmfclZJBLeJhmmQAM010/tClZw2sCP3/wT7EJWiLbMC6Fz
         vLWBfDZ5yzTLFqUdliAFRAUZzkOhnxgwCATQh43a4peT2XwUUzlccKsQZLS57LvaoCdX
         e8RQ==
X-Gm-Message-State: AO0yUKW8Evgi0Kfjh8+Asq3mRC13c6Z9uBsWzr7Kjodg6wqIrdUCpzbl
        lAu/nhA0RrVnjGlTCvSYSs/MO9pOq8VKRBCLlVCjzA==
X-Google-Smtp-Source: AK7set+op5NKsZfnuTNwqTZsyjzkykGdrpEkYtkLelEWoJ7H0NvKBaaCN/fWgfRlW4RSk414IyvaAmkJ7R5mnd2mMH4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1598873vso.60.1676618755906; Thu, 16 Feb
 2023 23:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-41-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-41-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:25:44 +0800
Message-ID: <CAGXv+5HJx37Yz-8JQscN2=6+yjhrAdUoQUCG8bHjH1=w=srC1Q@mail.gmail.com>
Subject: Re: [PATCH v2 40/47] clk: mediatek: Allow all MT8167 clocks to be
 built as modules
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
> Almost all MT8167 clocks have been converted to use the common probe
> mechanism, moreover, now all of them are platform drivers: allow
> building as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
