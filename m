Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3759DC7EE2F
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 15:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbjFLPOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 11:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237550AbjFLPOQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 11:14:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3030186
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 08:14:14 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30e56fc9fd2so4273651f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686582853; x=1689174853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8WbS+210v8G03MzlGBuYK+XYEf8w/Cdebf/Mx2BbmI=;
        b=m1eCYswoFitwiw/jC74aoHUgHdkLz6mbrnkX5SA82V64dxCm7BmGQd2HhJr/jC7DY0
         7d0vGR1/Cua2Zy7Z5+8tvkNe+SXx8U82lmIluvIL/KkcWHYz0dobk6YChryomcFLFfDT
         is8wf/izE7S2xTRmdMkjzbawkofOH4oBE87MfEk/kE5FLyc2YYOR1rK4Ntaw4rgSflEf
         zhn/4R14+FMCUFvp782EBuh3ADZb/AetyWDOkFymYbvKFXmlhouZHZWeqbxngSWYfR2x
         AIIQCQzXfdH8BO2RDV9ElQskiaIlaLEiZCqV31tVbXKvqpp5jxUTvSQ4/vrj+UTquRPq
         1lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582853; x=1689174853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8WbS+210v8G03MzlGBuYK+XYEf8w/Cdebf/Mx2BbmI=;
        b=M/9WBmtDiP2K6NsFsO6Itg8WfTVPZL5h+6LQSFgFcZQRQx++GvIcdPkbByUbgAsSz+
         XtgyU2Jnhh16Ybovh4Xmw57qorwHqYCKvXVf71tGzePz66gjTK81Es5XlBM6bGfzQRJS
         5qqlVWviisSRH4mE4HNnhcuC8q/kWM3n5liV1b/xPUBdR408puqysSG4toSjVFTAg+5O
         W5+FJsUYBikTjiH0dTuO5MSJmlc98G42ynD3k3Hagor+5ntC5uDKf4s/fiihuYxBRKwW
         Z7pNWdeieBpxOuMhy195K1j4Y0FG4FLqOhXj0nIzkhuXwq1VUFS4Zf5STAPdBTP4Gn4L
         eAhA==
X-Gm-Message-State: AC+VfDz/qKFGSGvSIgCQ7fjCjyqra8jfI7Eh81oBja2Gl4elQwcsOHYX
        UL0cFU05Glrne3wHEKAgEcX3Hw==
X-Google-Smtp-Source: ACHHUZ54oAZ2IUMxfcuwC37kmRwW619wSTurCxwqhDgsKHn5pPBTUewLaBTWzt9RSMKl1t2Euf4QkA==
X-Received: by 2002:a5d:490f:0:b0:307:9194:9a94 with SMTP id x15-20020a5d490f000000b0030791949a94mr4439660wrq.17.1686582853157;
        Mon, 12 Jun 2023 08:14:13 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id t12-20020adfeb8c000000b0030ae6432504sm12787964wrn.38.2023.06.12.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:14:12 -0700 (PDT)
Message-ID: <7bb5a15a-d4a1-21ed-5fed-9f5269c1926b@baylibre.com>
Date:   Mon, 12 Jun 2023 17:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] clk: mediatek: mt8365: Fix index issue
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, khilman@baylibre.com
References: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Steven,

Gentle reminder ping for this patch which fix a regression introduced in 
the v6.4-rc1.

-- 
Regards,
Alexandre

