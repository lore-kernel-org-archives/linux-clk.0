Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09876C05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 08:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjBQIDK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 03:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjBQIDI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 03:03:08 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4A2303EC
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 00:02:55 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id j40so2744527vsv.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 00:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7YPoLv0Mb3/P1pcQA1xTESl2Pe5exe78Q7w7mJljJM=;
        b=hgJNmWlVbmB3rBcCxz0t4TFcMPdLncKPxUCjG3Ocmx0L5xNI2mLxrbeK5+MK7Kgf4W
         g9guiiB5baKztUyzX1jH4+GFsl49g1XaotdqvNRvGDukIxdrgM/g5dUl3oYiQIL/5WX8
         t8WT2cUKIhvtz8AcDDw1oJH9sp5peg++x5au8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7YPoLv0Mb3/P1pcQA1xTESl2Pe5exe78Q7w7mJljJM=;
        b=BjBzfuGWqRfO3NCMuz8lG1LAkgoiSwCRald5HXpz+Xmpm5U2ZsqaBZ3MJx8U/UlqWv
         /7TS7QAROCnoayilJU5W/IecZxvUG6jAf3Sqbs6yOOLDBnSVN5M26T/0l4oEpV4OdgAe
         XEog+AWRGoKkstqTmDNs/1k+f4mnYNf/92fMctjakV8noQ9lwyS2F1FtZLuXzTelb4eB
         e9BNLnBwTYKRlRm5CzZP+dpPyfzKe5MnInd0bZkB3IPl1gGB2ucnPXnia1apFj64QqDQ
         MPdvVEmKnF9xy+2WgCf56oA0sbDDHSCKloh1X1GRFV4FNRrAKfx3XXp4b6g5Xq07+8Jk
         fDgg==
X-Gm-Message-State: AO0yUKWYFXd8V/mhdfPQrQmLhoo4SVPMh9VmylarVtIx1mIKyzRl9hbr
        a9/b54n0AwhQOvUHeaAVbbLHSN5fk6O0TmANFTUsjg==
X-Google-Smtp-Source: AK7set+guMlNO8y7qmiUXCH5/6LMKqnHADxixWgkynAREbqMIljK8xAseyTKFErWOaE0P4+CiupdVaRpkTOTx/3kut8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1614352vso.60.1676620974178; Fri, 17 Feb
 2023 00:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-47-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 16:02:43 +0800
Message-ID: <CAGXv+5EJLijrq2Mb=+HyOJmOvTPzJA_RQswOhE8DuLXUO5BeHA@mail.gmail.com>
Subject: Re: [PATCH v2 46/47] clk: mediatek: Kconfig: Allow module build for
 core mt8192 clocks
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
> Bootloaders must in a way setup the SoC to boot Linux: this means
> that it will be possible to decompress a ramdisk and eventually
> insert the core clock driver module from there.
> Allow module build for all MT8192 clocks by switching to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
