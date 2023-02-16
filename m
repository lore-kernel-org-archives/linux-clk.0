Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0C0C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 08:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjBPI4U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjBPI4N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 03:56:13 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7D13BDAB
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:56:07 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id z15so1184878vsj.12
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SHowq6DBf2cQJTeoPMKiGvKAjNuUb3fl52JbQ7+XiTQ=;
        b=fhvc6hUjWFRQPnJCbs+gDum3iHeWp5QtJVemXtboy3T9nV+apTLF+hpD6+8Q3K2E6i
         yL5qd4ZnxGbaHgUyFVVUCZi9pKI4I5Q6t3tqURU6rWctfCtScC5nsVIAd1XrmNBgbxaq
         jXSSbyO+OpNzI61O85gfJbT1Feed2X+YxFxpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHowq6DBf2cQJTeoPMKiGvKAjNuUb3fl52JbQ7+XiTQ=;
        b=mNswME9r+pFdSWsbhawW6MsH1KqeFOs8o9rJk+c05tCaLpNAB18BQFrv3pzSRWTwTI
         Z7k2vd5PQWKQ+8sB8oCk8kfUm+CmsvsJgSYsxT3RmUtTAFD0/D0WhMsbPGgaYB1Hoxqn
         9a3oS1dANYTqbNMIXbWD0Eid2qOnXQwG4tgbsEE9E2kAsLf7Jznq9Pqm1UQvQqgfqgy6
         wvSlRPZfnfuvpkuWYvhg4opzubrQB/Of8CqvOL8JiLDsaorGNleV5i+ErPI1y0MRqrwH
         eNOXsRoi7o7oR+LHoDC/xTaN4mrDIPNIsrS+Whyp2AjOTD2aLmaYVZMXE5+CJ92p9Lc4
         mGNw==
X-Gm-Message-State: AO0yUKUhIoIYgmoagz4j5CuQe9pN4HApCybESmFW8LoO6DTlMwRzwFZ6
        SlsFnGjOX8TGPM9/g5mk5DQkjCUzwSW3I8L2GRKoOA==
X-Google-Smtp-Source: AK7set+vp6162xHF8teoDckEkkowi9+9lSlBTLWUQzkpE/prNx60QCTqa0FZ8/nPJQXtuohzL5bzLLspqVQH4Bpkn+g=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr965643vso.60.1676537766972; Thu, 16 Feb
 2023 00:56:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-21-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-21-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 16:55:55 +0800
Message-ID: <CAGXv+5EepjwoVSZA=XFgwy_qiL3A2eZ7ZPBy-9Mb=D7OHYCjLQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/47] clk: mediatek: mt8183: Convert all remaining
 clocks to common probe
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
> Switch to mtk_clk_simple_{probe,remove}() for infracfg and topckgen
> clocks on MT8183 to allow full module build for clock drivers.
>
> Differently from other MediaTek clock drivers, it was necessary to
> change the name of the `clk13m` clock, as that is already declared
> in the SoC's devicetree as a "fixed-factor-clock" (with the same
> name) and redeclaring it here would obviously fail to register the
> entire clock controller; this clock wasn't dropped only to retain
> compatibility with older devicetrees
>
> As a note, the `clk13m` clock is not mentioned in any parent names
> array(s) as the correct one (csw_f26m_d2) is already used in place
> of that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
