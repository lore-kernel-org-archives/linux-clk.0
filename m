Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B40C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 11:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjBPLBe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBPLBc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 06:01:32 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CD422A29
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 03:01:30 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id p14so1565767vsn.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdECL0nWuOhxxQUzq/mcwRUPnRSLFDs596FGLIMR9pc=;
        b=Y2oOU8cyEJwEh700yB/7z2QJu2Bcxy3bkWsnI1OtkkcuKXE0+3Uil6KfV+8akOLw8y
         to9XpIffITAWrGVJ0oUrBWYHYBUFRD37sLkmgWZFGT56TJjoSmMYDTrAvaFvPeh1o22S
         BUny0HCn9pdX8tD1l1xOcUydoBcifTNPBDp8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdECL0nWuOhxxQUzq/mcwRUPnRSLFDs596FGLIMR9pc=;
        b=jafCHlvXIXGS0LKFCM5gIupw0dmxAH1O/Kw5oIG0jy5hkR8ww+jJLjZPrsSR0ToTfn
         fAaQlk4yKXZ4rxUG/JyfN3wmGmr+EY8k5tKXErFi+P6mRFbvb2iCEr8og9HkaDtb6n8p
         ibev46CPlNcZQWykgzP1WS2SRIxpMmL8OtJu8+lJE1f5oUQePy4iSUXUeJxSfoSLbhee
         pxPrPEfHyEF9s2yknq700FtO04n8dGOjwAJPVP/mV0l5cXKq9YeQ8Vl+7ClUAHJnOHlu
         Pidbzuxg4w7zTTMST+j8y1d46D1gUOAgZjiRc6ISmvpT+Fh4VVY/HrCaMhX3pZanZGxM
         Cm7A==
X-Gm-Message-State: AO0yUKUKsNuxNLerw4eUc/vdqBisY+ks+ytstxE1fa/3Zh6BzGfPR9Rm
        exaI4hQpoRMfmshoiNqQNw7aMPNNLu8j6JFIMsXpsg==
X-Google-Smtp-Source: AK7set/IA9hmi0kwDAgoklZpazoBjsCfVSxcouOI1lZeu5WRYfZai2E2MPhF1VyHs6yD9YxZM6pQqZxHx1mPiUZlaKw=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1015471vso.60.1676545289161; Thu, 16 Feb
 2023 03:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-29-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-29-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 19:01:18 +0800
Message-ID: <CAGXv+5EhnDu-=hnyDZoYMBgQhLPpyP+TYgt+hsXVHz49P61KFg@mail.gmail.com>
Subject: Re: [PATCH v2 28/47] clk: mediatek: mt8516: Allow building clock
 drivers as modules
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
> Now that all MT8516 drivers have been converted to platform driver,
> change the configuration options to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
