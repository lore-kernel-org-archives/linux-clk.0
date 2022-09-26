Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FA2C32771
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 07:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbiIZHJS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 03:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbiIZHIw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 03:08:52 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DC330F7F
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 00:07:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id z13so12030345ejp.6
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 00:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=11G5wZe93PJcN4JPjI5GurXGIszeTe2Izd0qLhIMjI4=;
        b=VQjC7cLYYYcFa55Oh12+okpceJgr3GoMc/hc+3LlMkfQNrwFafuuNcGoQOcncBpS4M
         fVz/hBy92bmiRXB/J5/+8rXsz3DQrePRddqGPLr7uIdhJFccYgikCVNkdZntfEPjOMNe
         jBGUu6fBx2RA1dy/xubugdWFxtHt5Pe36MNrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=11G5wZe93PJcN4JPjI5GurXGIszeTe2Izd0qLhIMjI4=;
        b=fr1AbLfanRGew126rjnLMj6Kx8GEIDwapp9Md+gN/wFhmTIeXONkhy35h1P5RgMDRS
         3KVQx9UT7NRgwPZkEpy+2PW3FjMTW+gu5Q5/gGpB9daPwDwNHfj44gCbWVKByGwqHdid
         /zrZscPkd7rQ328fh3dIIWz0VtlAjDFn5WBZ7WFWEStx/ddct1e+7R4EkB/N7ONjwjU8
         noV4kB28q68/kOxWqySSdsvKfFjQX534UH7XBT6Dmj1tVSWXefg/eJtimSyuxc7X6252
         uV+1qBTCTf3tNCKUpJRncbYOm6vU43DKKOt7nvO1Nrx9sQ11VmwwX867g7rVTD5cqxPH
         AyFg==
X-Gm-Message-State: ACrzQf2k3Uy2JtamP9BkYUS26VtDJRDgtwQbxcw3+bo7h9Foz1nIWjuZ
        Z40y2/dkZUGrAXIYXIpdVaAkXtbKWN5tBF/kaJ8UAw==
X-Google-Smtp-Source: AMsMyM747L8SdOtTBm0A1vuOwUIlVvdgf67xu2aLQMPPNr7+JeF3ZNc2Rh6l6SziBDn5+0MBtn+Sp0uZ+FtdD1hcNHE=
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr17590088ejm.182.1664176059865; Mon, 26
 Sep 2022 00:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083249.45427-1-y.oudjana@protonmail.com> <20220815121957.hmdjsznp4zj2ijmh@blmsp>
In-Reply-To: <20220815121957.hmdjsznp4zj2ijmh@blmsp>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 15:07:28 +0800
Message-ID: <CAGXv+5Gzd7qA8_4-kZLw=iyhvVVWK1CEKaG5tLYUtDzaQ7-1DA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
To:     Markus Schneider-Pargmann <msp@baylibre.com>
Cc:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
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

On Mon, Aug 15, 2022 at 8:19 PM Markus Schneider-Pargmann
<msp@baylibre.com> wrote:
>
> Hi Yassine,
>
> On Sat, Aug 13, 2022 at 09:32:49AM +0100, Yassine Oudjana wrote:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > This allows it to be used in drivers built as modules.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> This change overlaps with my patch [1], I added export symbol for more
> functions as it was necessary to build the mt8365 clock driver as a
> module. I will rebase after this one was applied.
>
> You already have two reviewed-bys, but if you need one more, here you go
> ;)
>
> Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

I've queued this patch up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
