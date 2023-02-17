Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57732C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjBQEMP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:12:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBQEMN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:12:13 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C311367D9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:12:12 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id p14so4373479vsn.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=khYUeXPrSaACLyO7uuI0hTSia/FS90YP+QaX0EK1f8E=;
        b=KQjAOl0W735TB7cqm8bxPQGwfcUz3MsFGOO0QYejWnPkHM0jmCPg0vW9O+h7tkIpDF
         1cCT7ATb1VEm5BqNohdxSaaTSxCOurOvUwPQq/RwaRLt4niM7/ifA+BZwlvzTPeQ4tdO
         GTtYLPHlTkHKoWLvvx+358XlBEAkDdsPD0KNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khYUeXPrSaACLyO7uuI0hTSia/FS90YP+QaX0EK1f8E=;
        b=7ix2j2hMfs0/8yXkUeAJXu36g3o09PoW7kK0SwpOBCc/ykzgk7vzi5cXUyc7GA+K2v
         +efC8viBWBxqLouA3XklkxkXulbKKs0hDn3ouLbxJjwsDLssCn0pVvoLgmD0ntwckT1O
         kxCjoXEWqOb7yveU3nEHpX4udDJlHnPVY6pYYawJAITl5Jr8KOFF4DcID23rMdoQ/4P6
         ypJNIdxXPCnHp4LI18p2i7EorMDRpQeXzJM5U62NqM7wf/Ml9TSBr6YU3XTWk6KNveOx
         ejkvfJPVKU5qql5gpJWUuxQ5GhYeuGnyV1lmdWwUdOflNHF0JY9CSIV27H382u51pROk
         retg==
X-Gm-Message-State: AO0yUKWeNa1MaVvFOlB+4kza6BE7XjDyl5Kzzp39ZFu4esoGbUNcXikh
        MZcQZmv2nQ33NUXbutEfuZeUrIj3MJ65BlDRTmgApw==
X-Google-Smtp-Source: AK7set/sHqw0F0KAlUssNSjqDO4mAX2C1vW3h2bJP5i6XlLsaFKqnO80PlYSXGZZLDvz4XXG6wfbSGjLay4IOoiera8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1525298vso.60.1676607131719; Thu, 16 Feb
 2023 20:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-33-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-33-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:12:00 +0800
Message-ID: <CAGXv+5F5KxA_3jtbgXfat1xSL79_k+W7kzpiOZmGHyEM3fnSkQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/47] clk: mediatek: mt7986-eth: Migrate to common
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
> Convert this driver to use the common mtk_clk_simple_probe() mechanism.
> While at it, also remove __initconst annotations (as these structures
> are used also at runtime).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Git really doesn't produce good diffs on these large rewrites *sigh*.
