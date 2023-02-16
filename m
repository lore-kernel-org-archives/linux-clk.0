Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A73C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 08:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjBPIBk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjBPIBj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 03:01:39 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437B940F8
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:01:38 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id m65so781543vkh.10
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeus9HGhMFXg91Mu8k0KRBkqLS/oz0WZH65lxIAAuJ4=;
        b=fTLKg5kLU68Zmml8hKrfx4b3q25rkw8FQ3LD2kEO+bvOdm5i9zCH+LVNaofNI86K/b
         44ssSWiBlkNTF0SFpRSG0JfsJXnR8OWbE0Dsp+JZ5IAa4kN5/OoxHKZFg4DNSwMvFkxd
         W2NPydnU3jvW614Q+PZI0H+NpYLfDLZ/L0TeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yeus9HGhMFXg91Mu8k0KRBkqLS/oz0WZH65lxIAAuJ4=;
        b=DcjOb/rjWwmGMg8250Sfb6NLyhGRtgoBkrXXP4LRcUfWwp32s9RObhAtkc7vojrlo7
         vZU1xGHRA8vlC6a33gVILGJQQV9wHcTlLzQ2KIwzBHtTZ/tjSjm7FwaQic5VxREPHes0
         PksBBUrLiVCyLUqTLv3vC+9djYJOeJosS7y53i0qjbkXuplB8JajJXPjCyxvPAYxccWO
         H5CqVQv9bfkXox5VwV1pmMQhpD90IT7TM3A37bKh534rYDb5XnODVovgFFeaN1uRAKyD
         W6E7tRLaVWQ5AuAKc4ci5KBv3WZFDtJMHpP10XQ8uQyRBbmtV9FTueQs+++YVV+sbQF5
         CRXA==
X-Gm-Message-State: AO0yUKV7bmXGKN5qFf77l2R4pj+ddZOhMNgPxDe1h9mb3c4hhC/OrisD
        /NztdSbUHlEg6kG30AiMERcXBM8N6KnfnCUqt9ug8Q==
X-Google-Smtp-Source: AK7set8MjxO55yFgtHWdPlTTau1K5AmbjLybjRWoEF/cRynJ0TSRLk4s+xuSxJmb3mqmZlt+EtAJ2do0nFQHLfogWFE=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr782890vke.2.1676534497366; Thu, 16 Feb
 2023 00:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-18-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 16:01:26 +0800
Message-ID: <CAGXv+5H1Nz6Z4h4qbiuxxZEQJwDjMw4JykbDoNRGEkN3LS69Cg@mail.gmail.com>
Subject: Re: [PATCH v2 17/47] clk: mediatek: mt8167: Convert to mtk_clk_simple_{probe,remove}()
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
> Convert topckgen and infracfg clock drivers to use the common
> mtk_clk_simple_probe() mechanism and change this from the old
> "static" CLK_OF_DECLARE to be a platform driver, allowing it
> to eventually be built as a module.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
