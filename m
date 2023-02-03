Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31FFC61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 07:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbjBCHg1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 02:36:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjBCHg0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 02:36:26 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CA78FB5B
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 23:36:25 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id k6so4518735vsk.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 23:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XWd8ap96nAgAL415/EFATTI5RTX0TRS1PzjaGcltWi0=;
        b=LLwkDnkGD9sQPL8wNcGoHf3zoY3ly0UMsk+iFxlonWhNFTYJ0FR2EQHrQnnXqRUncG
         2751wL52GQaCRpODfNwXv3+N5/972sVR1ZaGP9hB4XdiaCmctuvEhuaYXFR+jkK+IaCq
         pyIiss9W94Iwia+BgiSSgWAwgqi2QgQ/XMat8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWd8ap96nAgAL415/EFATTI5RTX0TRS1PzjaGcltWi0=;
        b=iMoIFrgPgbbaoUja7rSs3vAy5JJ0Qu9zpp0g7CeTkbs5IWmotS3xkeE43D3AFkOsQQ
         tiejIQSFSjfMukE6iIDzmGelOkWmZMJZElun+wISFaLly2nbj7/EF61mEffwdOn+GSdd
         0Zs66DilCbqu6dtnQQ4r+mDbTG+33MEN+9gRN7SIuyzIwcH1UjjBsAIw4hBMj5rSxf0b
         0kPYkQMEVsjrEJd7DGpJc5Jd+oQPB/3uR4QnGabYbzbynnleekxNd3gBmSWy/h8uZDqq
         ajfTjQH4CA22Y9N35Cxo8ZS3UDZnJLrQbE6BmrJJAcPM50SM7kPSYduU7EycNSKnISX5
         sx3Q==
X-Gm-Message-State: AO0yUKUFP7zW1ItfL7giMglOicKpxd2UqfRsaUgyF9z/HWNaTzyDx1PI
        OPWcYvzA2HaVe7E9LJxsaBSE8cRhMar9TmOb7IerRw==
X-Google-Smtp-Source: AK7set8M7H+RZ+wc2NkrqpEmbn3SZ1l1MIeIPiYShNT7awfF8mMd3QSxd4Wrz1xZcnMblvzNv11k8fjEOOa/6MUu4lM=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr1498238vsf.65.1675409784709; Thu, 02
 Feb 2023 23:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-19-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-19-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 15:36:13 +0800
Message-ID: <CAGXv+5FJJDqRdiHO2Pfx29NB9uRUz=t7KOHZ=HaREGcuAdph6g@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] clk: mediatek: Add MT8188 imp i2c wrapper clock support
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 19, 2023 at 8:55 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
