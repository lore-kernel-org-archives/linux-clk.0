Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77CFC07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 07:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbiIZHJb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 03:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbiIZHJE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 03:09:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC5832AB4
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 00:07:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u24so7677499edb.9
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JSGq+UJdZHZI7m7+R4s5lT3YI7bcQs6FVi/cIp+srik=;
        b=hC8eV+FOx3YJcNNqaY+XiFeY+2Nqsm9G4oDCO/a+cex2r8/iNo8V94MyR+IcMynnfX
         Kl5WUO8utF3U3B4raqaM6u/9W9STCcBj2oGetI6QL7LwGTNwDYIpSf+/KaT/aCrtkFSN
         B29U+6SmA/saBUhyv552ASfMNEBcAX2n/OOz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JSGq+UJdZHZI7m7+R4s5lT3YI7bcQs6FVi/cIp+srik=;
        b=uguQY16NpH0NzkkwcmHMpdTQTxlBHBCI5zAzqtbNFNKYeDz+mdWw+1DgQuslBLJ/BS
         jYxL7bZX+ANR2AyUzb1l0dSvmUB7N6ouTeSajV7efeXxTuB0+snA+FMWXt0CAAGL7rEH
         0gbR+w1GIB2UqCCD3qenZY6Q+ZOVh2S6eJhTiz5rb8p8iKQaLnCxseug4IzjeFQqMTJE
         cb7e3RDJrnivt7H4JEZGCTnrpnajfhVmFvr03srdoa4xFB3HNdjlZIxtCf6+PKYIybW9
         0nw0uqmwU2vnBVtdcB4d9pTBEGRZpvZ99q8LPuehC6f7ydbVlEZc+bgXtFMVg3tzzR+Y
         mT6A==
X-Gm-Message-State: ACrzQf1CEOHRsAePA8wFmAV67PeT/KO5o3/3/srKmv5wh9utD3PcjhIh
        qOEPyEqlsck8b6o1KhtAzDt9gZ+hbvQg95U7ub8zxw==
X-Google-Smtp-Source: AMsMyM6jkTKiLKSqDZxJdnx4sI0Vk0Ohi0/4NFzL4mGK7QELlD/W4obOucDIKNq/Qv9RKu/hH0qBuRIpgRfNcgKh1sA=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr20572019edz.71.1664176073670; Mon, 26
 Sep 2022 00:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083319.45455-1-y.oudjana@protonmail.com>
In-Reply-To: <20220813083319.45455-1-y.oudjana@protonmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 15:07:42 +0800
Message-ID: <CAGXv+5FZ2YKccJQQmALvu53y+z1X7REwY0MHm-WZ=A=gTCQ8CQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Aug 13, 2022 at 4:34 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Register gates with dev in mtk_clk_simple_probe.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I've queued this patch up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
