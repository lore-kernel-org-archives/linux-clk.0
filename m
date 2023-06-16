Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC88EB64D9
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 03:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbjFPDIl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 23:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240422AbjFPDIk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 23:08:40 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F30B2D4C
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:08:39 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4713765e72cso464453e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 20:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686884918; x=1689476918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJrTLod3qq+bnrpFVtyiXrm6GhPtv1R+1GYPqh4OiIk=;
        b=Vz3fYT8uYGp/hNgMCPra7gF03IJMxHTvjK2anSwVV5xo7W56I77Zz0RIkn1NddfV0G
         3mv8TTYuJCVZa55q2jN57gg5h5jziec4LrwiQTqLh0AHUVo2JpvjP1etY/DZ7jMz/dea
         cONJI7sVwyS7OjiSVJhQvEbQlxpUZYdx8z7qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686884918; x=1689476918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJrTLod3qq+bnrpFVtyiXrm6GhPtv1R+1GYPqh4OiIk=;
        b=dqkj0F6coJ0BlMet3PdW7HK1oQJcTTkvVIQZOXnch/usDaVpwrHCI/p1eyUk60Jgis
         G8JaeIFCJsKM8ZLsiTkT14DCI7D19NhTUaxAsDZIBhjjLPwFjegwfeth0lQVdNDNeT3i
         E1V5frU/V4ixhHKVtSV3qIgkk8BjSlOX248FMMqgkstG2Qtphu+oowVaXuHyhycC4zzU
         fi2ViHsICL6U3XyQPjhshWLBpfaYso1PUSmpAkTRCdc8sy0tjyTf8vBamIlXSfG1KnQp
         wGGdTzFD/QoljIX6PrdSS1BHOpqFTPt1hpmMtFejuvcwaRf/8jA97L6c9wOF3SLqjKXJ
         g73Q==
X-Gm-Message-State: AC+VfDyvBGd/CxxjBTKugDgmNJSwUF5ltOGM7vZPXCasQ5kE/pUsnPpD
        UEc1uE2pvsuiCm1/2l4C+YJl0E2IFyq+JxlWETq7qA==
X-Google-Smtp-Source: ACHHUZ4TgeTe/0Pyvf4eaD0+Nxq/kvS8KgwFWXt1dBOkYhgFCqsCJoOwRLozdRCin/hWZ94S95bTZacH0ku+oOFt+iI=
X-Received: by 2002:a1f:c110:0:b0:464:7d75:fa58 with SMTP id
 r16-20020a1fc110000000b004647d75fa58mr302529vkf.0.1686884918653; Thu, 15 Jun
 2023 20:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230615122051.546985-1-angelogioacchino.delregno@collabora.com> <20230615122051.546985-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230615122051.546985-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 16 Jun 2023 11:08:27 +0800
Message-ID: <CAGXv+5Hh8=LGNfOUakfYwxw=pv4MxRBXgz=mJjPXte+WtvnGGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: mediatek: clk-mt8173-apmixedsys: Fix return
 value for of_iomap() error
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        u.kleine-koenig@pengutronix.de, msp@baylibre.com,
        miles.chen@mediatek.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 15, 2023 at 8:21=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The of_iomap() function returns NULL in case of error so usage of
> PTR_ERR() is wrong!
> Change that to return -ENOMEM in case of failure.
>
> Fixes: 41138fbf876c ("clk: mediatek: mt8173: Migrate to platform driver a=
nd common probe")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
