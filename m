Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DF0C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjBQELI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjBQELH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:11:07 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5B63BD9D
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:11:06 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id bx25so681555uab.9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv51RN8ZPOSL8FQMrMpj33QZt/iLBJxo7WnaABcymgk=;
        b=DYxHCc7b94d68sW0RoGk9gagBMyxtdDN6ZZy48NmvLaaHnt38gta0+CDNPAbYc3so4
         /SgF9PF2nYjmkmh2zYbcPTz4Br7W9vvhQYszgRZqFtzcBwgio7+SC1kFTI/lLJAykPBk
         OBk+xsO16aSE1VkdBd103+usgkctZt32pu9o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv51RN8ZPOSL8FQMrMpj33QZt/iLBJxo7WnaABcymgk=;
        b=N/txNG00CWy05/lrMukVEXiNWhLWmMtLAe1cUgZ0lAas/+HKl0B3KcUeD9OQai+vyy
         S8bKKpktmgszLa6gty0ys75feo4INnxU/aj4/m5coFR/k5fqxJpm14wTBLF4AbeOpMbi
         yLnNqsRlE6vS+ZgfCbPIBHVG3hd8K+QKnLKxsLyLB8vLL1plhhGjZTcxoWGp0DRdNv6k
         4EcvRBbZ0E+GQJUY49GAQUyANN/Dqu7rB5wisT05HfOxPdquruh2ZiY3KHcMoBkhuuVM
         NJqX2+YKIr0Nf/b2ub4GQYImf8QLQZN4EKbCWz10LmT7rfrVqKw7zVdPnxc2Ei93fiGS
         4TCw==
X-Gm-Message-State: AO0yUKUaLSqRqC5Du7YkrmGXPzsPdRmRcs+mHRV/mD46Ot3pX0Q4rJtr
        8xlMvQwT0EW0JgwD+9JH63wBIH2L8mBMP8SnKRIpwA==
X-Google-Smtp-Source: AK7set9g5rkkJR+rAneFO6YGqzw7ZUvJlNsFBBbIlTyh1g8j02B0R2Ks5BYAGdkMReLp8trUMQdhXOpABSd7Re3e7rg=
X-Received: by 2002:ab0:6f07:0:b0:67a:2833:5ceb with SMTP id
 r7-20020ab06f07000000b0067a28335cebmr1346837uah.0.1676607065792; Thu, 16 Feb
 2023 20:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-32-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:10:54 +0800
Message-ID: <CAGXv+5HUBj4v04zhqVgQApc+uq_7U7B7wrydACLHBBOmy2CVeQ@mail.gmail.com>
Subject: Re: [PATCH v2 31/47] clk: mediatek: mt7986-infracfg: Migrate to
 common probe mechanism
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
> While at it, also use module_platform_driver() instead, as this driver
> just gained a .remove() callback during the conversion.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
