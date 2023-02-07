Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5176AC636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 05:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjBGFCH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 00:02:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjBGFBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 00:01:53 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA96746A0
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 21:01:47 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id e9so15088382vsj.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 21:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JzZxhqIK8VhysJ5sWFrp6HBP0d2gguK8lzGF96oeeJY=;
        b=k9hUTA70o7Pv03Fw+mhKWYoNw4WzoTEgJU4opObsu/oieKz2vo8+0EzrZdclvkFM2l
         34zZdwyIUTed5eK+R6GWFBJhpEEHuBGkRvbui8S+7SDPNd5UnjVpL7aV5gN3N7DzoBx8
         H03d53epQkYi81+4qHff9il0/LWAUGelm3NRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzZxhqIK8VhysJ5sWFrp6HBP0d2gguK8lzGF96oeeJY=;
        b=VuA4piVVz7I8cjpEJEQXanBJnuZF9hlnTLA0yXbGFo9O3DFzW0BguPYNQACdTQK7qv
         5RaO6x+hhKoZjIw1Z2USjijLzu8qBH7Q2kuGiffQZhWOTeR43bv3zKos18pcLCFS09zZ
         eWcp+HSAT5Sug0kMAxRl/YnwwFQE72Jcfe3+9era86cURa91vjklfAYjYrhXLpTN1P7K
         tBgJ8qTXeR8MKjnk2wURMTR5qg1AVVkmK94J8Ar2dTJHrXiQguvImAU9KCHeD7HmQtwh
         hgEKuWi6ridtg8JDLcfXJ2MJDRyTEwmx+QSJ+HBV92RUhE+/GWqiVq5hcg+ESNnNVypZ
         J5pw==
X-Gm-Message-State: AO0yUKWCisj3xYQXqFOstU4vBysCqTY1w0b58PLn/cPBORFJE8XykFux
        gb+lCaRkFSZRzHYQQd5Vk9XjB9VfsmZkZliUg18xhg==
X-Google-Smtp-Source: AK7set9Z70LfNVS6WrBF5dXe2VuLYtlYTHr8qqFya8+8Mty35+VW4+2UeSbTXwSsqJOqw6PJvuPi/t/tzMePg+eAeOg=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr501277vsi.65.1675746106739; Mon, 06 Feb
 2023 21:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 13:01:35 +0800
Message-ID: <CAGXv+5H+dFdrXB1dWRwzU+CsBe6rE+ge1T7St08kueSgepA-kg@mail.gmail.com>
Subject: Re: [PATCH v1 01/45] clk: mediatek: clk-mtk: Switch to device_get_match_data()
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of using of_device_get_match_data(), switch to the generic
> device_get_match_data().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

though I don't think this does anything for the MediaTek platform lol
