Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC06C43334
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jun 2022 09:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbiFFJz1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbiFFJz0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Jun 2022 05:55:26 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C277F113A1E
        for <linux-clk@vger.kernel.org>; Mon,  6 Jun 2022 02:55:22 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x17so19123099wrg.6
        for <linux-clk@vger.kernel.org>; Mon, 06 Jun 2022 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/HGBwVcm94G6hJzxxoyTgU9jvYkuG8KyARLPoR4g984=;
        b=sSIY/sq3tJH+ruvIsuQApXH81UhkfbHOfABcA9lRdOXBMbUsWyeFwDFrglxz8GfoFY
         QmStVG7kQyI/Q+/6pzQ1jyZY82gcQ94oe3qAb4fzAxkirKGmyAUaoqUUXub2FoGcDeKV
         S/Wm7MMIB0Gh1CQX3FHGnak7oG6MzRuQNup0KHkoXlknAeFpQTqPF8kWakz2k1lHJoxZ
         dthp0Z3elQaJG1D3TE/Vs4VI3xS7Hn4Pu8rhIoTTWWgEf0GTiaogaHkE4OCPgIBPe8BV
         1InWXF/vn+LEpsxPD/Vb9arMdS+o9J/eS52eFzf2SzeGhMRIomxC+4FZ1I5qKCu7/UsL
         xuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/HGBwVcm94G6hJzxxoyTgU9jvYkuG8KyARLPoR4g984=;
        b=mYHOLoH9/jpXUi14l+mb83ofH52KVL0b8B+lLr6/nHtkBBPYR8DMG/Ce6XZJST9A7I
         xwpq3XQY9BXYUnVrffxfu/b4thtxaTlYIUxMo9GPvP6X3e1v1sTHkK60eniuHawPrvwx
         yhw9xco/mB+6J+hzYsM6MU+U3MD/q7isGMEb6xToweUOw4mni2m1SPcagQ6YbrmRMNVE
         m7rvqE4bRed49EqBpR9ZFHYql943HMw48lhQYqCKy1Gpta9a/bWPmvP8s0JymPMppbnw
         ffB1Ky333wkcsNahiNzYPj2YHy4Nmq3irdk/n0X7F+rKB7/HcKvsyIvizIb9Gx0WyUOS
         M9iw==
X-Gm-Message-State: AOAM530bO8DWVf7N1goJ3TIgKtcNRu8bRND9Ys5J9hjKFz6dcOlQNluC
        V0TxXTa06/1RrfREwAQ8Oc9esQ==
X-Google-Smtp-Source: ABdhPJxFMRPPs4LSY3Kcwnsvn2fgmQxO/3GAT/dfFczxe2I21JguLlXbCT27NpSSDOKSGZaQZm8pJA==
X-Received: by 2002:a05:6000:2a9:b0:210:2530:be32 with SMTP id l9-20020a05600002a900b002102530be32mr21432918wry.153.1654509321248;
        Mon, 06 Jun 2022 02:55:21 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o10-20020adfeaca000000b0020c5253d8c2sm14659609wrn.14.2022.06.06.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:55:20 -0700 (PDT)
Date:   Mon, 6 Jun 2022 10:55:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/6] mfd: max77714: update Luca Ceresoli's e-mail address
Message-ID: <Yp3O92gg9LiIzQTX@google.com>
References: <20220603155727.1232061-1-luca@lucaceresoli.net>
 <20220603155727.1232061-4-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603155727.1232061-4-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 03 Jun 2022, Luca Ceresoli wrote:

> My Bootlin address is preferred from now on.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/mfd/max77714.c       | 4 ++--
>  include/linux/mfd/max77714.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
