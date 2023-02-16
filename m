Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EF2C636D6
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjBPK4b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjBPK4b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:56:31 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1806857746
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:55:47 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id z7so195050vsq.6
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwzrytKcGK6J02tRdTcyqtWr69LMQ1V040meAEqQm/k=;
        b=FqZCf6BIpw8mQzSkpFjZJU+ChtW8JK4Q4m1K9wKTgdR6oqnvR084AUnCAual8LqGmt
         ojESksxzlOI7nXXoWAUvxR0mNEGpYu52c9hzYIFv5TLu6DN4PlAa0gs9OQMWGgj2XdEu
         8EPu1VNHlZ4tjLfAkdPbbId6oz2M9aYW/lGIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwzrytKcGK6J02tRdTcyqtWr69LMQ1V040meAEqQm/k=;
        b=c8x8wK+TDMGrNIawUWLaoZpCcmLicJRD5ITOJCh/c7vCsiEHPxiIVrR4mF0K7hYm/h
         rlLf4Z5zmJ5FbOnk+3qww8Dyk95cbCS4VmIu8ZJIaNAUsSqSb2JK4XBc5TFs+zjD+bYE
         XYtFHVkorR1wVksnpYH0LEd7B5TgZHwzUSgokHpmWkkOgBx3v5aklx509rTLcQX24PcR
         QXnyyYa2IYWuT/1aY+d9wTBQqKPVyBzeoi8sk0FPzi0vc9edmklXGoBRDH1vBrMpp5uk
         I9ydAqz8tv2C5YnpDsyUfeTXs5kRhL17lf/HSsi4FzqW1xmTRu6Oxj03bhsy3UIugPQg
         ZtqQ==
X-Gm-Message-State: AO0yUKVofzsX6Zk66OvJBdkxZJEdl29PJPKsEVgg0uB8lHsYHzHOflei
        d2IpYKKnod5/LRoA2JuHJgdNFgPAvNdVstYXXTiR4A==
X-Google-Smtp-Source: AK7set+wt7rp+1cILEpIFwYvVl4saH+TpOxvH8a7hVqFk6+SLeAtwsmJrkP7H1j1ZOkGe5o5irDI97UoijSEBGRRa70=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1013119vso.60.1676544946210; Thu, 16 Feb
 2023 02:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-26-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 18:55:34 +0800
Message-ID: <CAGXv+5GSTD+9_VwL+PniBGZ1gjt4TrNK3EOpjxeSFiMMmTjzbA@mail.gmail.com>
Subject: Re: [PATCH v2 25/47] clk: mediatek: mt7622: Convert to platform
 driver and simple probe
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
> Convert the MT7622 topckgen and pericfg clock drivers to platform
> drivers and use the simple probe mechanism. This also allows to
> build these clocks as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
