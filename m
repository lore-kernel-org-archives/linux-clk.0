Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459EAC6FD1F
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 12:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjCSMI1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjCSMIX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 08:08:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E044E22C87
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:08:05 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cy23so36700924edb.12
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztN0SlyYyv5h+bTr+KEp1+MVZxbNezPNA5K1eKjYPmw=;
        b=Mkj3aWw7ipS3ypo1h70Eq7sgzFfTWY3Gg691bbHScGEq4oLH31lan+wqryOv6mjUS5
         f7DVczlVfPaLAe1c1FB0NOH6YxwhTbj/oMITeSbrY01x7HnmqKHqIBIQ5Vh+lxNvdgl1
         tVlriSMz1oT1qUXP/LBm3lLk7blKm0lNz9Ftf3TVM+Na45ablLX9FbVQ8MZQ8J0Bdcxk
         ChPW+lkvO39NB/TVDndngfLZXX5yo16pM557BzsUVk38I7nogLcir3aO4oe6GX6uu34M
         w2Vpyr8y5k5k105+AHGHDeMrnVitgGQoBos8D4Badfa756KLpjPTGoDtyVVTrGa3XfJm
         KIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztN0SlyYyv5h+bTr+KEp1+MVZxbNezPNA5K1eKjYPmw=;
        b=V8WzzUisUViXM9+tCcnD18H9yFwmwYucmVhJfVjEjW5I8mJgGIu2WnzgP0DsaX/bU9
         041xK7DtG0nksamUBZcRV1uYcq9vtZv+uppIlEPFJgiczLfi1dXoTmzcgCRd5SsABY5h
         LcHyXCOviyJXstbmeie4ToO+xsNez1aHZK8KvlLUVN3FbMFqWLXxQwTn+pilJnGNBIku
         U/7wZaLm3ibr4qC4/F2rV1babu3G8jkUN62UGMMKRTuNyn+Fa5Hv+vLQ+HDOR3c2G6WU
         Se/pZ55jU70RP3BDrmvrGPsBK9nt13GD7D1xswguWbPWb7P99gGxubefL962N/2upsjk
         ouPg==
X-Gm-Message-State: AO0yUKWbsAduyrl9onBElbgDQq8teG4WshmvpMARV1NQkGNNTC5f7EBG
        8eWsgvdlNz5FcoFw7ldc5U5dTw==
X-Google-Smtp-Source: AK7set8i+OK9jVxQpjaG9w6kQ5cP4/IcZQBO9SxYAjJNDODfP0a0d/621iRwGuZYfnjxwV2dc9t6gA==
X-Received: by 2002:a17:906:481a:b0:930:310:abf4 with SMTP id w26-20020a170906481a00b009300310abf4mr6115541ejq.50.1679227685457;
        Sun, 19 Mar 2023 05:08:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906454900b008f89953b761sm3174460ejq.3.2023.03.19.05.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:08:05 -0700 (PDT)
Message-ID: <f5b69bcb-5959-ab1a-88f9-314255249ac5@linaro.org>
Date:   Sun, 19 Mar 2023 13:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v14 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
        Liu Peibao <liupeibao@loongson.cn>,
        loongson-kernel@lists.loongnix.cn
References: <20230318075340.22770-1-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318075340.22770-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/03/2023 08:53, Yinbo Zhu wrote:
> The Loongson-2 boot clock was used to spi and lio peripheral and
> this patch was to add boot clock index number.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

