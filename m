Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B139C05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjBQENl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjBQENY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:13:24 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874D74DE13
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:13:07 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id h10so4282390vsu.11
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G77BTcHhRQ4+lEDvCbYMyefKE9aJZN3Px+TFcwY1b+Q=;
        b=GmE7DywGVi2M05n5axYkyIEpPCl1yojCDqSZmlOqptPf+FIFQ9rwtUdwxWVNS6H77u
         dzfEzQL86KPfQAtyLi/gV4sE56JKW+aO2yoEXsGyFC4VUrzAGcNoyEcYPTAmtBaVHk/X
         UvraMVqeQKqeM42juOuw7oD2urjx3xzrmHMFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G77BTcHhRQ4+lEDvCbYMyefKE9aJZN3Px+TFcwY1b+Q=;
        b=LlIPArWJUcTJxlfZDYWN4tJXugk3mmPSlkhn25jqJhVuAHqOGcD2xN9M+synN9NvZ8
         fQZny1DTVNp4ooPHFQhPdHKR63TMJZOhr8S4+uLAf2UL9rmk6uZoNxDTUpBeBsBg/paK
         2+oUPFUFsN6UFiRSLvgm2lsqnGpkijfDC7XXxGYOYDfdnaGz6tjPc0yIxMdCE7Iq3BlH
         7Uc5xLJhWmK8k6T+mBwbxh+b3HyAcewteG5FdH5h4GDrkw4C3NiPiz8eIFZ6b6IlKobf
         LOpqRBwmxRQ+DkeOdCwPqipw90L6vs4rmHX13yLryzWqbp0gbqDJrU+dbhFw/8DN6BrV
         yY3g==
X-Gm-Message-State: AO0yUKUG8sBKFxWaiL8W9EmlaqZiL9r9ZQAxaj8ws2CwNDdR562/BhDX
        5SjldvpopCoJhxELBuRZRwJ0z8VV36YkstUd/b0nWA==
X-Google-Smtp-Source: AK7set8uu4LzlZOAeWltZx2kP6ZaURwx0xlX/YzXa4JbBvWynMHCgpza3Ox/yPiXCrWVfH0XBgVzD7yS+XwLI5tG3Os=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1525580vso.60.1676607182607; Thu, 16 Feb
 2023 20:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-34-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:12:51 +0800
Message-ID: <CAGXv+5GYnxxT+Z7mCYD6eJYvFT-J-uKEa8MOiZT5VRCDw-GsjQ@mail.gmail.com>
Subject: Re: [PATCH v2 33/47] clk: mediatek: mt8186-mcu: Migrate to common
 probe mechanism
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
> Convert MT8186 MCUSYS clocks to the common mtk_clk_simple_probe().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
