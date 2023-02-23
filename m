Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35049C636D6
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 10:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbjBWKU0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 05:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbjBWKUA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 05:20:00 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83CB4E5E5
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 02:19:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id eg37so36467424edb.12
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6uAB3hMkwfTyu9zpqIRso2gSVlXxxzw5LU2JlkCD4M=;
        b=o2ZB4fuTJwzxCZhQ2tmTs5lrZFWhH5BwdbDpifGGFd9yqO1BdlACS25fsjwCJh9ggA
         62+AeeDh+mdbzFPmtMDMcFMKCFj2j1AQWuendGCiL3QOqnyLG1gDolDyQ2PTrgCpOYpx
         QF4GheSt8S/7O9UaGygXpL1ukn7MuSEMK71YHI439/RdoL0dOJlpIeJb0439+zcbvW7H
         v6TrsuJKvm0YfCGs4QjZAklaJjRtTfUuwANPxmlkpZ6G0ErEVoOrsg7ERWLaJ9c+HWgo
         ZXJB+GdoUAfu73u+PgrODq+YRat599J668AV6aIaBLY70hbh9tO0tE1xTcUHH2bIPbT8
         gwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6uAB3hMkwfTyu9zpqIRso2gSVlXxxzw5LU2JlkCD4M=;
        b=oPw3W82HgTAfA9jYHGwV/ML4vvJVEdMDCdFh6r4DljGbrKguDZgeYiJlJitLAlhkng
         1M6YYQ96IVGONMEhWIGiAPgij71ZxfgVh5UwrhVwR9HH1Xed08hf3UHQ7TeOjV4+Liwy
         vcixMqv/zRqlu2mICKNF5bMohkffJqww0Fn8tf9sxnv1xvG6DVnpCmHadVC5r41IT9dj
         FmfmAc8zj+Ik50KY1rsnHdHzVeJcMgeEN8Azutg1sso3HdOpj6uYeVJk/gYK1ydQYUqH
         LHf1gw11hCSxj/DC7dMoUtEN0mAmazmk9TMy4gHtEW/0/kpDn3UPqvqjN7bzVjaSb6v3
         ES0g==
X-Gm-Message-State: AO0yUKUaDkCb9sbIM77M/YX11D3hRtPeadwMBCbEiMTQOWrLNBLZAgrm
        aUM2hGs7LTiHfDUCdX9LoSkdgA==
X-Google-Smtp-Source: AK7set+TVBt4K4pa6VJM6rEUw7E2E7okg1D0xXMxW3mWDSqRnw4ZJ/Xqg+dzQlhhiz4CVjzp40sZOQ==
X-Received: by 2002:a17:906:dc8e:b0:8e5:c06b:90e9 with SMTP id cs14-20020a170906dc8e00b008e5c06b90e9mr8223497ejc.50.1677147598320;
        Thu, 23 Feb 2023 02:19:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bj4-20020a170906b04400b008c78fb7206dsm6186219ejb.68.2023.02.23.02.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:19:57 -0800 (PST)
Message-ID: <b834bea9-8370-5bc1-8edd-c4b62287e837@linaro.org>
Date:   Thu, 23 Feb 2023 11:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 2/4] dt-bindings: clock: break out mediatek,ethsys
 into its own header
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>
References: <cover.1677089171.git.daniel@makrotopia.org>
 <db58bdb35e68f5e57b79e0d3560618ef86f10459.1677089171.git.daniel@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <db58bdb35e68f5e57b79e0d3560618ef86f10459.1677089171.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2023 19:09, Daniel Golle wrote:
> The ethsys clocks of MT7981 and MT7986 are identical. In order to
> de-duplicate both clock drivers, start with putting ethsys into a
> header files of its own, so it can be used by both SoCs.
> Propagate this change also to mt7986a.dtsi which is the only user.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  1 +
>  drivers/clk/mediatek/clk-mt7986-eth.c         |  2 +-
>  include/dt-bindings/clock/mediatek,ethsys.h   | 32 +++++++++++++++++++

A bit too generic name. Are you sure it will fit all of eth on all
Mediatek SoCs? Current and future?

>  .../dt-bindings/clock/mediatek,mt7981-clk.h   | 18 -----------
>  .../dt-bindings/clock/mediatek,mt7986-clk.h   | 22 -------------

Same problems as previous patch. You cannot mix bindings and DTS and
drivers.

Best regards,
Krzysztof

