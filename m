Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6968DC28D13
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 17:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbiHVRbS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 13:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbiHVRbQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 13:31:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D523ED6B
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:31:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l21so11292903ljj.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UIBQLdznziJppE7OJpXEV1+Wn96b8SDqR1x+484CyS0=;
        b=UslXPosZJEVEMBCrm+Bq270dy0ernwsV/tH5hBf9F+jDyKMTpzjX3vU/ntechaMWyC
         f2V3lmnsowQFtbJYqlZmhLSahLY7uz2a0pPFVDC2HmynRQ2B7G+ATb+r4N3n88ZP7G2R
         EeHBM+SvXIFsu1/YOUyWD5KpYo4Rlcpj4PAZ4d5x2eM4zfJL7NglVUKbHZCJFzwcRNMc
         F3O6sb/JJlHq1MPi3jxXDKS76D9EeT1dg3mp6StAa4jljGjpf03dN2k3bA1CmpOa+ZXl
         U9FhuBipFIKX/9HTcg491Edkwuujswxqn6C6ZREzh8u5+4ISq8Np0HuqW7p635Z6ptw/
         Lceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UIBQLdznziJppE7OJpXEV1+Wn96b8SDqR1x+484CyS0=;
        b=ptHs/0gA/9jeAjPzXjopwAvYBaRq5ixqDW4PWJPwlNvGQIXDOGdwmNRdQ2rxmdIY1F
         0PBVkp5sBwYV0iuAlwmHvEgzGp3+SefV0BZLTipfZwA/EOewZZXKDYMf/Cf2x2RxuJZC
         KwTEfm/2MmrlRUZq2A/1vN53YRK4cK4yDjxbnnnUInTIVbV+lvREqdsY2LeLlm2Oct0r
         /fv2eJVMxx0/sd/qYgo3qabqxH5MW9waJHwXcJK2wa2DKpxJhoby4WLm2EdUKBIi+yko
         qEmkwyCeF4P2qjX3OYXoLcetUVtYdKeN93uHnBtVc7JqU/5aGNdN4PHAAk4kii3PN2I0
         YhNQ==
X-Gm-Message-State: ACgBeo12wwCgfXuaQ6JqQf6XTMknikNuRTz4uLNxPmWzmhl0DjmrJj4v
        rb98gWcmks15a0lHfFNsJg8rDA==
X-Google-Smtp-Source: AA6agR6VFNpgt+MgZFrbKH8HTyfO7Yf/rgWPBwBmR3CL0NGx4uLKRhwHLYhAMoTx3/06p4INGZihLw==
X-Received: by 2002:a2e:9604:0:b0:25e:4ed7:ef45 with SMTP id v4-20020a2e9604000000b0025e4ed7ef45mr5835729ljh.389.1661189473507;
        Mon, 22 Aug 2022 10:31:13 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b0048aeff37812sm2010642lfr.308.2022.08.22.10.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:31:12 -0700 (PDT)
Message-ID: <3815ce73-b021-4643-6bbb-ad0d35178b94@linaro.org>
Date:   Mon, 22 Aug 2022 20:31:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for
 MT8365 SoC
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <parent.f@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
 <20220822152652.3499972-2-msp@baylibre.com>
 <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
In-Reply-To: <0de7f878-1471-4916-9384-9d966e840d74@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/08/2022 20:29, Krzysztof Kozlowski wrote:
> On 22/08/2022 18:26, Markus Schneider-Pargmann wrote:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> Add the clock bindings for the MediaTek MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hm, when did I review it?

Ah, I reviewed v2 and still had comments in v3.

I see these fixed, so everything looks fine!

Best regards,
Krzysztof
