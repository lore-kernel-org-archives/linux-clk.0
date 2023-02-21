Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F97C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbjBUD4p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbjBUD4o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:56:44 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C6D24100
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:56:43 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id f31so2888253vsv.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqDsQXq0wgsqsnlCPzEpWrmYSd40mlSm295kuBDRUBs=;
        b=a576ZMtkJ7Wv2NTnDHOI0gLegs2OTwTRw4jOexe5dLNmAaNjOHVJCF6pwYBJdUh9n1
         9nmKmtWLiYerZd0TvGBHPGhtTZYDfvJ7zxaF3ByekVS2R5KmfaU/VQyD5BCLZy+3bWIl
         VPiSIzzUTNFLEz8Y922qFV56bcbGdxdV5iqCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqDsQXq0wgsqsnlCPzEpWrmYSd40mlSm295kuBDRUBs=;
        b=lzhTPv6OOq9mGXhzxTMjDnDnpRiWqYxkHwVAl0IV782odpi6mA0rFR+JiDniC+T7k5
         yCFdaJxhjeakyEzEFk8x2fHI++oANWz7f3Pd7tzu+xot5QD9cnMxREg370Fs5LW8EDBN
         KJSMOp4ga0GaBP6ioGhFgeOXry5N8JS7QBz63LfWb2iSTa5AuLa6h4Aj13cBDiDHlqWX
         mql68FgLgDH46mmTFFeZpZIcg0e7Rb002MNXiZuw6L+I/E6AjWzD1jiW8zpU4P9DBEKT
         h8PzXT6ao/GI6kyCJaiK1S+2SLpLFQkO1JeqP/nzg/OhN5sdYwPjj5hiOBWieD2tNUsw
         PrQg==
X-Gm-Message-State: AO0yUKU3d1H1id7eoUThPZ36bv6vWWhUwfFWany93vBAqCTn95i3MLp+
        VvM0pCA4dWnNNO69PVpB1o4usAlbyPzNTvCGCF3/cA==
X-Google-Smtp-Source: AK7set+5W/3qgD0aWYJFtRSK5l93LCmMajQHrsK61PYbkZspKKT1iGGlN/4NpN2NHg4rJwn/ADLh9XJz8DmljXjQSmc=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr833727vso.44.1676951802590; Mon, 20 Feb
 2023 19:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-51-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-51-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:56:31 +0800
Message-ID: <CAGXv+5Eh0FQOVM1kgDKCTYQvmEXtwCVov8ZjqMn1n1diuvam7w@mail.gmail.com>
Subject: Re: [PATCH v3 50/55] clk: mediatek: mt8135: Move apmixedsys to its
 own file
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
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt8135 clocks to the common simple
> probe mechanism, move the apmixedsys clocks to a different file.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
