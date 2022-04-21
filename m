Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751D7C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382546AbiDUJo2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 05:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346293AbiDUJo1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 05:44:27 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8C91DA44
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 02:41:37 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2ebf4b91212so45950907b3.8
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lNExmSjlaYtm/wBO2/VQ+pMd8GmkEdKrkvYHc/Wjj4Y=;
        b=ZTayUALaY5kyKRozk55vRKsPIf4+z2700Gqa/7hhKzCqFAWs3UsbO9Aba/9NjKXURW
         dr3iE3+e9nAyrim9V8f/ldsLFTs67iMkt6NC8BE7tBKetLn4/tuAXUqOta8pd/cYtAxV
         /91cpH4ZeL1nxvLtiyqPnxx8okn/XAq289jp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNExmSjlaYtm/wBO2/VQ+pMd8GmkEdKrkvYHc/Wjj4Y=;
        b=tXlmuaQelHfggj4vP1vcfD0e2zhMnffQqYk+rjHe/dyfnS6rHiBz8rDbDgIfSQAhEO
         etRQmJtVLLgWNV+/QcvctYWEa9jGYxBnNXBpjbnXh+PRfUgU+g3WxtJDnv4h+/qijr8i
         qnh9nQs3PkA6P7abZWaHIQ6lrT9aT4JZYStq+4QRlwKSJxy+pPJI/MzWym56YVkqcYH8
         bBYFEFoEs5H0jjShLvJDDREhArOiDfXmJwqIiQHnca2tKZPPpqYF15h1xSbQtzbuJHgG
         zKnhhzcPqFLbJ4gcY7lARw+MsXfbKry+nfmyg+/Z5/2v4tM90Pgq27j/+Gx5xvhxf3df
         P7qg==
X-Gm-Message-State: AOAM533H8/VFwvQJQX21eaitRVboStkXPa5ql/yGMEudigvqmRaUI/Kh
        ijK1oiH+HMbiZeReGVqwRRPxmPRZFsbr/X2tjzOcRQ==
X-Google-Smtp-Source: ABdhPJxEzCRntzAGeWIxrjGr/qnshzvCXz8EgyFfSbtLFpl+eCBT8hZWVlr/oyyY0OyXpG2DMrqCNnDkpGPQu5St42o=
X-Received: by 2002:a0d:eb46:0:b0:2ef:4946:544 with SMTP id
 u67-20020a0deb46000000b002ef49460544mr25077698ywe.286.1650534097187; Thu, 21
 Apr 2022 02:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com> <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
 <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
In-Reply-To: <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 21 Apr 2022 17:41:26 +0800
Message-ID: <CAGXv+5E_1iAhBe3Avjrb4DWpanKYOMJHkopTqk9t2V34OYhx9Q@mail.gmail.com>
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
        chun-jie.chen@mediatek.com, runyang.chen@mediatek.com,
        linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 21, 2022 at 5:14 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Apr 21, 2022 at 5:07 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > > Add a new file "reset.h" to place some definitions for clock reset.
> > >
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> >
> > Right now, you're adding the enum mtk_reset_version and *then* you're
> > moving it to the new reset.h header, but does that really make sense?
> >
> > I think that this series would be cleaner if you add this header from
> > the start, so that you place the aforementioned enumeration directly
> > in here...
> >
> > ...so we would have a commit that moves the mtk_clk_register_rst_ctrl()
> > function from clk-mtk.h to a newly created reset.h, mentioning in the
> > commit description that it's all about preparing for a coming cleanup,
> > then the addition of enum mtk_reset_version would be in
> > `clk: mediatek: reset: Merge and revise reset register function` directly
> > into reset.h.
>
> And probably name it mtk-reset.h ? 'reset.h' is a bit too generic, and
> I'm sure there are multiple files with the same name throughout the
> kernel source tree.

On second thought, please ignore my comment.

ChenYu
