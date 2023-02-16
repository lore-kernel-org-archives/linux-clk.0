Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE56C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 11:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjBPLBO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjBPLBM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 06:01:12 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A7D13500
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 03:01:07 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id d66so1491089vsd.9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 03:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1UJuDxc/dW2NAAvPvyR0ggXJqGR2HNPP1/APrqV7r0=;
        b=nLnemLAnXuuMt0ZWOuk2BSImf2AMv0Hl6mdw/A2xfsn3fwTmtKH4Tz28yMOCkbBNjD
         CWhmtnqkOd2l4M3Rsc6M+xJaTujSJXYREN7Eo7R3lrld4ZWkUOAJa77crSkVoF4qVVrZ
         2bsfet+4pY9pzAohpk7SC6Kzny+PCOKpwIL1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1UJuDxc/dW2NAAvPvyR0ggXJqGR2HNPP1/APrqV7r0=;
        b=3eP/HXf/fauRJZAFSPMXYYDM4E+yvu/S3Vt2Sb6/luHMwq1U69Or82TKaMufpJe44q
         svvm9xsKEFbAIpg/FIMeVPdenzsWWMxo7OuJZBQyzAM9YjBcI1riBOk1FDPDmlaH36W/
         iPGIkC8lf4NfFyR1/lcQvI8oV7trWwK0/lwor30sti+atOmJGgPMpndQHEk7ZlhtOdrF
         ilLmx3vLkbIqiW5wGpeFWAQ09L4lcctVXzYCEUJuFrBTVi3rooHNdInRuSxGVR1zSPuy
         8QqFggioNBmX/gHhYu6coZgYt3mUTSaP8FMZ+ttbg27w8JbuZAC9dMO3Z7BdVFt35EaK
         Aiag==
X-Gm-Message-State: AO0yUKVw4Kg4D+yxLOj9EVAKnd3U/6xg1zSvHg02ZyZh3QPKStgf5zfT
        r2Rtewico96DaDMU0PlPm+sSSsss4w42CcSTQwes1w==
X-Google-Smtp-Source: AK7set/OCcT2HX+FgGe/T2X4Ge6Yj21L72BELhl7RL8tasIGkQlgdaMzHof52fg1wx/ikQdVVp6Lm/jGEQn7wHo+e+4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1015296vso.60.1676545266969; Thu, 16 Feb
 2023 03:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-28-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-28-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 19:00:55 +0800
Message-ID: <CAGXv+5EzvWtEPyeGZJHtg0D9CvDd-j=N+C5cLoSuTUWxKL3-Hg@mail.gmail.com>
Subject: Re: [PATCH v2 27/47] clk: mediatek: mt8516: Convert to platform
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
> Convert the MT8516 clock drivers to be platform drivers and use the
> common probe mechanism.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But wow this diff is hard to read.
