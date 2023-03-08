Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50AC6FD1F
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 10:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjCHKii (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 05:38:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjCHKia (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 05:38:30 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA6E907AC
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 02:38:19 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id g3so63926974eda.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 02:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuML39FEMcZtLr2iCHmq6W7C/WxS3Q4N5Og9ZOvpQ9w=;
        b=QTLDyVGR2tUx94St/HYDQZsBAsy5pBfrWfAkT3+8zgOdgpicyAq7pM4lTdjQZZUDJt
         MKlRPnESLk/2iDuvyej3N34QsPoN6PePmFi6lJeoi4jlg5dtVntmLt3LcBdeRyDm7Hvz
         75fMBvhf8v4rUMdomm1jAfGZpokvALm7RZGfadJd6sUa/+UXfZpYY/Ro7JIo+rMIpT1+
         CTo7WATtSOGmX7iiqaRPDHtJVulvEkp/spDMUIsPyjSSJ/C8ACdt23X/3OzgwLcTdFwT
         qY6lrsKnUasZmlwI6rZYsVofwKmQExorRiVnWgdjHUk8vdYjuJ9bZjHjaAHiYKYTwSh0
         7srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuML39FEMcZtLr2iCHmq6W7C/WxS3Q4N5Og9ZOvpQ9w=;
        b=nU85cZWsF7Impn/lb7l0g/pVuPbwuZunDqRwEgPqgJJi1bLoSf36hprytTworcW1W/
         lpYTkrWmhjQetnPT/saxKeWDN4LkDznr8aMy+jx9nITBBkjwN/5l5V2C918vBeikjVnc
         6r049cqNmpi+M0+nR8ANfIAP3N1T0NrbMHI12vNcGNoksw/puBuff7wSH4vLdrzksGTA
         J4KqOLVz00SYIeIcD6WtkoG1x3H42Q22Eip6i/+s1YHP9sIg64rBLKY61gCK4/hASR14
         DVY2x7of+5iRp//uCecxtF+AhMFkY16KGdZvc5muBpk6bVFBx8P7QHapqyuvEqIDnux8
         adyA==
X-Gm-Message-State: AO0yUKWKdABX2f5P0fItXB/cAdZrvuvAhMKfSfJk19K1/Qpgr5qfuH89
        kF4yAdg/sQLxohZWnYFMRCC5Ug==
X-Google-Smtp-Source: AK7set+6cIAV/Nnrqmu6ojlpiwai/PK6n04qpXW+CQbF5M+XmL9sTbzfdTPWQ7s/ZL+/Hyut/TkGPw==
X-Received: by 2002:aa7:d9c2:0:b0:4aa:aaf6:e6be with SMTP id v2-20020aa7d9c2000000b004aaaaf6e6bemr15118755eds.7.1678271897806;
        Wed, 08 Mar 2023 02:38:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906301800b008f883765c9asm7303815ejz.136.2023.03.08.02.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:38:17 -0800 (PST)
Message-ID: <b2f9cd15-b303-882a-d4e0-36d1f6d155a8@linaro.org>
Date:   Wed, 8 Mar 2023 11:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
Content-Language: en-US
To:     zhuyinbo <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-1-zhuyinbo@loongson.cn>
 <692a62da-a9a1-fa23-6e24-723d73c3a423@linaro.org>
 <5e9b3bd5-d885-6237-5e14-2becb3c956cc@loongson.cn>
 <31e2a67a-c046-9501-80de-e754ed450195@linaro.org>
 <ace5159b-ebbd-7805-518c-ed3d39e4793e@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ace5159b-ebbd-7805-518c-ed3d39e4793e@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 10:24, zhuyinbo wrote:
>>>> That's an ABI break and commit msg does not explain it.
>>> you meaning is that need add a explanation in commit msg that why
>> You need good explanation to break the ABI. I don't understand the
>> commit msg, but anyway I could not find there justification for ABI
>> break. If you do not have good justification, don't break the ABI,
> 
> The commit msg is the patch commit  log,  and I maybe not got it about 
> break the ABI.  You said about "break the ABI"
> 
> is whether is location issue about "LOONGSON2_BOOT_CLK"?   if yes,   the 
> LOONGSON2_BOOT_CLK was placed
> 
> after LOONGSON2_PIX1_PLL that is due to their clock parent is same.     
> and I whether need add this explanation
> 
> in patch commit log description?

Unfortunately I do not understand single thing from this.

Best regards,
Krzysztof

