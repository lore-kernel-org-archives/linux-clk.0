Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F07C77B7A
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 09:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjEZJrc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 05:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243236AbjEZJrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 05:47:07 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC40E5E
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 02:46:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so11168655e9.0
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685094411; x=1687686411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nat2dXg+UOzIavY+WSMDfeXKleU0IIvcUkgX31+SwQ0=;
        b=QClPu3uwppIpWhb4E3uBUouUHuGMdCDCap+TS3E6hGmLnA4VjA4bKSBHIHelGx0ccW
         FEr0tengi50fv5JkQcvgU1KTRffYujLtgVjvOOvZFIGz7/sclzkeUoKurDBYRU7U4O+E
         SqZapO1awa/OnzqqYNJX4m6EBvNJHwiV0MmIk2Fg6KECJgzQiaRlFOAckqdKWBEhO/rr
         Zw2s3DnpcD0f9Xqt48cK4kdPbfgP6+ls3uZmqN3D0SfZahD/EwRw0v+HDDU6oOj8wjYV
         Acdo8a+1fB2+ZoPrSuE8Lf6gCE7iWPqS8QXsj3t50cBRwpqKw4Lme7PRmLQwPNJLszhT
         KLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685094411; x=1687686411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nat2dXg+UOzIavY+WSMDfeXKleU0IIvcUkgX31+SwQ0=;
        b=K1wFx4ljGcMZOTOAkr8l1T58TfyaAjHd04WbfWcPYzu+uo33twwuTXyRA1WkCUrtRz
         njkgQfkrtulNoRUpJhn8wJOzPPXpyDzawKEsFV1phwURE2XuM4viu3XpivTxlRhZKt7m
         x7DLCQ1fq3TTnkfHMeIqkyAqcpYZUUdNsnq/D5v6azUbLQpsreMaWEkVgyWUtLiEsFlK
         cJ6AOubnAFFy6jduZhwnDpbZU8qlWF4hfoyo51SfVkaHJbzDa54qP2Bst++e32D0edVk
         +bTB5EyknhnmoiBNVJseNdPUJkIiLEM8rpSgIOf0VZVNSIqATdJ32JSUgZIbpXkNpn79
         2t6A==
X-Gm-Message-State: AC+VfDyup4Cbhv6ySthm7GInJmohF2HYgFUeOOpndYYNsOrMkwL9cF4Y
        JCWwRf2fhxvG/qDkQaPMM997+A==
X-Google-Smtp-Source: ACHHUZ7zzzPEEncZvQtOFznUC+/7QoK+Qxxmiu8AfkXUIs6gj8Ym6jXeyUI0v0C9XmNiOfMiKm+5OQ==
X-Received: by 2002:a5d:5506:0:b0:309:491b:39ca with SMTP id b6-20020a5d5506000000b00309491b39camr1037698wrv.33.1685094410926;
        Fri, 26 May 2023 02:46:50 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d514a000000b00307b5376b2csm4463662wrt.90.2023.05.26.02.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:46:50 -0700 (PDT)
Message-ID: <160d8ea5-81bd-ece6-a4a6-b93a62b4d749@baylibre.com>
Date:   Fri, 26 May 2023 11:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
 <f3f7df94-74f1-dd41-00d7-0ab4fa2e4d61@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f3f7df94-74f1-dd41-00d7-0ab4fa2e4d61@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/05/2023 10:30, AngeloGioacchino Del Regno wrote:
> Il 25/05/23 16:50, Alexandre Mergnat ha scritto:
>> The “mcu_pm_bclk_ck_cg” clock is used by co-processors and should not be
>> added to the kernel driver, otherwise the CPU just halt and the board is
>> rebooted by the wathdog.
>>
>> Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
>> re-shuffling index and then preserve the ABI.
> 
> It's still a breakage. Besides, have you tried to add it as 
> CLK_IS_CRITICAL? :-)

As I said to Conor, I can fix the driver index issue (patch 2/2) without 
fixing the binding (using CLK_IGNORE_UNUSED but CLK_IS_CRITICAL works too).

-- 
Regards,
Alexandre

