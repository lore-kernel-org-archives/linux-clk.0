Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F0EC77B61
	for <linux-clk@archiver.kernel.org>; Tue, 25 Apr 2023 11:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjDYLfv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Apr 2023 07:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233329AbjDYLfu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2023 07:35:50 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DEB3C04
        for <linux-clk@vger.kernel.org>; Tue, 25 Apr 2023 04:35:48 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-2f58125b957so5084140f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Apr 2023 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682422547; x=1685014547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwmJNsQVa3Vng8gKvvvDPoERcEJfaY5DKNCyYTI03Sc=;
        b=VX3fhbquFA6+uaUkxCbdF8qhQPGlJ3GsF8c9PdpI+h0WOsnjXM1RCXEf4tonNaw+D3
         NsWHe+JKhcv9o6BPzOGB9v/5MbzbG9WdTwpTki6gon8SzMH2vIc+K/zIH00jL3Xs82M1
         CqLj9oIl+wbJtPwnLB8XwDdCR3O7Pk28Cxyt5JdB6/11mqcld+V0rRJyeOScTPy/7i2A
         suB5tHBIi2HqGQP0tY/aG05fpcsfCg3MH3dwayJEhazdhahcPB7lx82j0tu7AOKoxOZ4
         1IXtdVKzR3QaB50SzMWtaEEw/T6/cGGHtOzhrM2f7J429vodm3n1O2W8CNPBLA3FNobU
         fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682422547; x=1685014547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwmJNsQVa3Vng8gKvvvDPoERcEJfaY5DKNCyYTI03Sc=;
        b=fxWC549nmINDhsSxE4PexcqYd0g9WLepmdCgMJw3BNIlPs468HDIpqQVlwX1/FrEZA
         uKPUCA28jZFPGiTMy48065Dncbn8R3P29kLj5Bb+yRm7tcG30bLbOUkWpjw5qg500ROm
         rn8kMRrYH/wZalVvUao/LuVjRYZ5EYb1TZcKbMdhvi8xJtpZx2Y8kEKXGGSxtgTD5/WK
         wIkFMCgZ4tm3D53TYEa49La03XvZtN4GsprQRvi5R5wyF7ByXeSiCiZEiVMeo6CA2AWD
         h1SALrIiME3dO4SjPeKgY2LUnRLUve27+2AhRiY4+aU8sTP3y3RSgPJiuA64ZQsZVPId
         Sn2g==
X-Gm-Message-State: AAQBX9ehL01zvIbMQdyA0mPYWlTKRtUvF43JUD/4LxFn/sxDfhmaThIE
        +xjfi9YdcSFHvNpaxXTMhS2Ibw==
X-Google-Smtp-Source: AKy350YYSFveOR4ot4iXXTyDs7vO3lTymAmSY5PrZlIY90fzb4Alo+fO49znGJgXFo2VctM6yQ5kbg==
X-Received: by 2002:adf:ef51:0:b0:2f8:6c01:3bfc with SMTP id c17-20020adfef51000000b002f86c013bfcmr11572765wrp.30.1682422547195;
        Tue, 25 Apr 2023 04:35:47 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z17-20020adfdf91000000b002d97529b3bbsm12825907wrl.96.2023.04.25.04.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 04:35:46 -0700 (PDT)
Message-ID: <5100ca4e-f3c4-b3a9-2379-aab6177d37cb@baylibre.com>
Date:   Tue, 25 Apr 2023 13:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= 
        <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20230421111125.2397368-1-wenst@chromium.org>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230421111125.2397368-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/04/2023 13:11, Chen-Yu Tsai wrote:
> Currently the base MT8192 clock drivers are enabled by default, but all
> the other clock drivers need to be enabled by hand. This is extremely
> confusing and inconvenient for end users. For the MT8192 platform to be
> useful, most if not all the clock drivers driving the hardware blocks
> need to be enabled.
> 
> Enable them by default whenever MT8192 base clock driver is enabled.
> 
> Signed-off-by: Chen-Yu Tsai<wenst@chromium.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre

