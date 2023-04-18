Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648DBC6FD18
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 17:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjDRR3D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 13:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjDRR3C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 13:29:02 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753D15BA5
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 10:29:00 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dm2so75289594ejc.8
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681838939; x=1684430939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1wiR09yWJSIDNVVbIUkBjSe4GYAxrvXyIzrFZ0S/2s=;
        b=DQ8c8RpJDuNpMTcK6oa4OrWmMeZkKjHR4atMVV5AwE7bAddXZlw9Xrr+pD1ff5x6Zw
         9noBnbIwVGONmMIpycQIcLzh0nkkAAlaed4kAKedDqfxiHQz8Bj125hqLXmBGUD8691Z
         kl84fmSZiZIfJ7c54my5nYUeeiR4PLF2ZP9dXbhtGXcODtElTt13ShAQF0SJ5Y97oLgY
         WDT5E8mTxH5k5qC9T/7ijOZKnEK/s69cxNEO00S7wI3YcfwLHULRtN4rJ7L3bXQnq8qS
         djIWjlBV8B9EgKZzNn/vGIuRCkMNMSdvPCuXMtIvT1jx87w7P8HCNNDyY+Kory7rGyMK
         t4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681838939; x=1684430939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1wiR09yWJSIDNVVbIUkBjSe4GYAxrvXyIzrFZ0S/2s=;
        b=QtpaI4EvsdI1bujUnZSxCKUhXXK+1y24P2vwJ2qbKhRQpiT7PzANnxZD/W26SIpwVh
         paH8meAdQoAEmTiSzA71noguyqUq3QfWdjzpztg2L3F0VFbj7fAF2pEhP3TtpoVERrVD
         CgLkucZy35On64PPVopn5Ly8DdX3YaximlQoEHTiZqqoljbjqzdXqvpzkaYCfmvuASYp
         EnzNGK3OM1hEQeoX7OM/IhaA60eAgvYUOajsw+g/Pr/yu8Vf2y7/TsExqqa28KuIaa+H
         DFycATo6BRwyxPialEzpcb5qJyb32e4Rv7PkJMs66T2Bty0ojW0v32Qhd6jsD/ylX2nr
         a4gA==
X-Gm-Message-State: AAQBX9fflsWWcmfTNxUKgeyhmDhFyh3n03rpLCwes2fZM3SecSSKc327
        3kJTcCc05lymnw26rkSPC3gDPw==
X-Google-Smtp-Source: AKy350a7ZMnwKrvXukHpiO5c+poP9gMiHBS3W3x7LLSR6QP3sqvewAE5G4jo3Ti3GtMyBs4wKhPkrg==
X-Received: by 2002:a17:906:2b0c:b0:94f:3980:bf91 with SMTP id a12-20020a1709062b0c00b0094f3980bf91mr10317366ejg.19.1681838938946;
        Tue, 18 Apr 2023 10:28:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id j19-20020a50ed13000000b00504ecc4fa96sm7165712eds.95.2023.04.18.10.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 10:28:58 -0700 (PDT)
Message-ID: <1c629ae3-31e7-7536-435b-378c943ab61a@linaro.org>
Date:   Tue, 18 Apr 2023 19:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] clocking-wizard: Added support for versal clocking
 wizard
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com
References: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/04/2023 12:28, Shubhrajyoti Datta wrote:
> 
> Add Versal clocking wizard IP driver support
> 
> The Versal clocking wizard is clock circuits customized to cater to
> clocking requirements. It provides configurable number of outputs.
> Adds Versal clocking wizard support to the current clocking wizard driver.
> 
> Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard

This is not really v1. Please link previous submissions and keep changelog.

Best regards,
Krzysztof

