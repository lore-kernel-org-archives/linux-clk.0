Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CECC77B7C
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 13:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238237AbjEKNjW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 09:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237736AbjEKNi7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 09:38:59 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E036B10E73
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 06:37:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f41d087b24so41735705e9.1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683812222; x=1686404222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5QAZdjVLVbI0V0MOBRrdkRCmTAX1lGamqSGOVwZZl0=;
        b=zubWSEySVwG6S1WwoZLBWgivEDgrrzpKil0UxQQUDmONjZVJJ66SUzH6iqu/UZ92C4
         +hlbxJ96105mAyduA6JTwgws44lxdd852RvVr315fRGKjNohoW5SLTP6/EM9bHVPlOiI
         kIJ919cEGf4RC2+gtmTHhwpmGx287fjpu4Sc7zfrIgZiJvlww7cFIJLI9MSpa+coIu0o
         xfg5fh/NpUI7GoP8cc7fcV2vVvvICrLjFnzs/djvhtdYJIjepx8zBZZCiJgioqiGTr5Y
         z9QVyTRHxW4+K1XSv+jXLo4a5bxfOCbneTdQzgQ5KAe+W18VKNr/4HiJLVjcVLy0IGmT
         yhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812222; x=1686404222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5QAZdjVLVbI0V0MOBRrdkRCmTAX1lGamqSGOVwZZl0=;
        b=JCLDN11D/tbsS2f80RhIdoR527WJwaGSB5BVcS36h6QUXB9SeO9/3sXT36YDaE1Qqr
         2U/qqw62SpKPfnMpX8NXcvDbZiPGlNhs8NrhBwDqf5nZ04fCNEVmRmhAHuiWHlEUmWWs
         szMGWWxm3tGN9VNM8Xn46yW/sUIddtoZz0ARX8A8TWyxpp1VtvF6t4Mx4REbDbaioPlw
         qr/HT96fLvF9OAfWHPjkyQHQCD4WJ7S0xvZXp+HlIOPQsGUgZx4C90ENslXnIG0f+kSO
         Qfo+p6/OG3ugwwKlO6YyQbErqCOihIP2RKZPJxwbC9GjETtM8fHvTmdgG04J6bGIb3YX
         gUkg==
X-Gm-Message-State: AC+VfDyyezdFE7CxsNbyAzDbB6D6UuJJ17zkn2AKbf2tQpbYxI0+9zpJ
        wPdRKu6kmqi9M0TVwsU9ZYRckevDFoDqFVMxMgI=
X-Google-Smtp-Source: ACHHUZ6durEogDyWOruj0uja6YyUtEd+bw8P/5czqWQsSh8N78YTOQerfYFo4L6J5TKmEd7dsLzRXw==
X-Received: by 2002:a05:600c:383:b0:3f1:93c2:4df6 with SMTP id w3-20020a05600c038300b003f193c24df6mr14526564wmd.12.1683812222586;
        Thu, 11 May 2023 06:37:02 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f4b6bcbd8bsm4469844wmi.31.2023.05.11.06.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 06:37:02 -0700 (PDT)
Message-ID: <6abfd685-e2cc-ef0e-188a-4fb6c243ab81@baylibre.com>
Date:   Thu, 11 May 2023 15:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Content-Language: en-US
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230511133226.913600-1-msp@baylibre.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
> 
> Fixed by swapping the operations with the inverted ones.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

