Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB80CC61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 07:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBPH66 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjBPH66 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 02:58:58 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD1C2D61
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:58:57 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id i4so768068vkn.13
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUAm0dza/a6VVYw+sGcsIq5PuVfxpu3iI76RDCW26E8=;
        b=HDYgFSVUxfgi3rCp8OiA59w7Jsp+KNJ9d7STmmepYo4ATncHuUaxhCcTe7M0eiwJRB
         0PtBt7EozjJRRZYwZ7Gm5UXoatYhX8+alm2niPrCGSIlkCbVNNk9gR7ghW2gyY13zxsI
         HOSr4j/WI8GyxZNU360jMLYBGMR3Ee3toaVNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUAm0dza/a6VVYw+sGcsIq5PuVfxpu3iI76RDCW26E8=;
        b=Ws5wdItZnzLqhAK25WesrAX7hVCYYOBCq2CbsokKHC4goCZZbWBCdY+RIELGz1NiOX
         sEpEIA8nVhz4tV1eddQ1yCbhwuQMRq2Gvs5/NpnW1Jganik7DF0DsIHHbPvzEoV6JbWX
         UoxMcAI7UDpObeFqOmE+4zk5+a3vplsBt44ofXF7tbnZGPDk5PRvCjBuBo0Q+9ekT4Fa
         ueoittIAe4VLpcjwZAhTcXqikONfif+3PWMNxZ7QMGGonuy+LEEbcTcwn2B+4DHisvh/
         oKdfaSi/GIa2uw3jnDa22RK7fKXjdK8O2m4p3DwKXkVaV7S/txXy+2nyMf4ut0wNx6jr
         /rZw==
X-Gm-Message-State: AO0yUKXg7s1oKGNAq3ifxcCjeQasYgUHHqDBmJ1EYWTMQyzQGPS1cNMr
        tmkFGmbQsimihVpCw8FbdWUljLh4+zbhX8Qbtn+h0Q==
X-Google-Smtp-Source: AK7set8em8cNpEtfR7NNLJCYhRN3qLWEg9u+FeF7hd2SjZGepRPou1AUAu3rownJ1iaBcdIps8JIBHnvHr18yaQhr/4=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr781674vke.2.1676534336494; Wed, 15 Feb
 2023 23:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-14-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 15:58:45 +0800
Message-ID: <CAGXv+5EiSVixnW_ukv-=unuP0LOik4LsSiOqi9trWOyU96YYgg@mail.gmail.com>
Subject: Re: [PATCH v2 13/47] clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All clocks in this driver are supported by the common simple probe
> mechanism and it's now possible to migrate to it.
>
> While at it, also switch to using the module_platform_driver() macro.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
