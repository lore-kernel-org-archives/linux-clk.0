Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0083C0729B
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbjHNKMD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbjHNKLi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:11:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC8F10F2
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so37245045e9.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007850; x=1692612650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESVhtHoMLjpXOh7/9of5EXSKLVqOfUmeEpUAt6YEbDk=;
        b=ugbzJGCHzCqnyNCVJ9AEJgSO4wFcS2K/tJY0TUtVVrrYd1YFLE3qXOv0MlLIgXTZVB
         QSyJ7RSa+r8S4kW3SkekG9EWAPUz/FTqQkJXJ32FVR5hTHmA5m4iXN/4HeZf3B67JJGU
         j5RKW/uLqbsVY0JTxKCQIUsbSZXqvjHymXYU0ApOjlN09CTtTM7o1EsAq9df40ayR/gL
         NyoWEuibfG0/nbthmkvaWcZLSQrvGVWfMbTn+1E0TTfEyXgjflRUpIUx/CipCOskR7rm
         UZGWZJLHuzQf1sfwS5uxY93zjQt5km0HBE0WuxgosCyk6cdaXvIGV9cFxI0Ko83Xpkbr
         M9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007850; x=1692612650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESVhtHoMLjpXOh7/9of5EXSKLVqOfUmeEpUAt6YEbDk=;
        b=VQaQTh/6n34i+WFirGUp2C1qQ9m8qYMlEXHLAQ9wXt3t3NcAFVaiMRjOMsKjqdEmcD
         9jjSFYjfNURCdaZzbMKoeLNdtYOVgdM/Q4FCALAzfBk7b0kCu0AsFgrezBBo34ZDcqcM
         vDkD2VQ1PMDxpjOVUTblFOUtlzyUK3BHf/z2P3Z8NntWKci8alXGO2JHArWwZ0AzA/79
         ZLapZd+AegP3EIWDS/PZAJElWNH9W2dKJhtDzBcRVsrnbViZSNVa4xv8zl0IHjoAMslO
         G3YmNuRezMsjGnKqQxEItBjVA2cUF80VtL6RMaBdH0Wgg9t9lbFfLpKRLhRUjmCB2LFc
         W0bw==
X-Gm-Message-State: AOJu0YzXSmO5eUK0EUN0uE+11NM+zXMs8knyzkK9krN/+tqQRmcsxCwd
        yAf2zOnPG0r/YZn6/Etu61cCJA==
X-Google-Smtp-Source: AGHT+IHr7ubyVfhrrz0Cla5qo9gl0Y6s4v7dNlJWWF2mrQmHybIpVpMUq2sIq64MgDp9YflZck6Fzw==
X-Received: by 2002:a1c:7717:0:b0:3fb:dbd0:a7ea with SMTP id t23-20020a1c7717000000b003fbdbd0a7eamr7212142wmi.37.1692007849752;
        Mon, 14 Aug 2023 03:10:49 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003fbaade0735sm16750396wmd.19.2023.08.14.03.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:10:49 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Yangtao Li <frank.li@vivo.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] clk: sunxi: sun9i-mmc: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 14 Aug 2023 13:09:58 +0300
Message-Id: <169200755842.527063.8434968913073327760.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705065313.67043-1-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 05 Jul 2023 14:53:01 +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 

Applied, thanks!

[08/13] clk: imx: clk-imx8qxp-lpcg: Convert to devm_platform_ioremap_resource()
        commit: 94945b23133db0b698ffe764d8a82593906d1e74

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
