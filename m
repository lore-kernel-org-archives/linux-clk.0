Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD96C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238993AbiAYRbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:31:43 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55638
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1379473AbiAYR0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:26:18 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D84F3F1B4
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643131575;
        bh=tBPSBXWD6lNXgd+PIKKZrS4JET2MiEwqJjtzX3WR0BA=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=G8c3ia/BSN1RU+ikJX2kFULNHiO0oSsqqcVWbtbLsADS9XUUB/gMGGqpiuSWi7Jwg
         Ul0H8jlvR/54pvZPfptZhz5hPC7Rcv71zxl51MdXZkp7qct6cLVfR0mR+4mYMetxcN
         cOQndFKvtGmAgoHqLjH9V4qb3ym/BHYLLkNDmiiu/gGzI0TIQ0087qLrvlO7KFzfFy
         Z2eU6jy6Q7TsQ3KQVjKB/Tr5/zAq+S/4khimYn7QJUeTIQERk8O/bdWc0I2mohNG80
         zI6CoAHx4nPQcnIgntniDoDiDzK22wLrDHQGIU+SoaHBuvvKGB9IbrhfwCXK/4apVp
         qdzjW066/6Wqg==
Received: by mail-wm1-f71.google.com with SMTP id l20-20020a05600c1d1400b0034c29cad547so1459956wms.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=tBPSBXWD6lNXgd+PIKKZrS4JET2MiEwqJjtzX3WR0BA=;
        b=al35dtDXGMCs0+5vATQtWq7qQTPK4Zqkzxqpnt/Wrzp17g2PngCaYKEHoDMBeJPsLK
         LZQxYmmMZUqoJSOvZ29bhRV/wfX5c/VICW/dkWpvdIgQEZR4ZY67b28AI6wwrMlFPJ8p
         5+se9SXY/QytICOWhWAWFxUMNdW8R8llx1mOTFRSJtlmO9CozeDicbBBQXkdlhfnaTSM
         X5NgXonSnqLP+JCkrIBU/yQBrNIMCoHa+B7G1TCqfUQxGBQIRoOvEZtNJWSM0vIk0PPo
         jTLoCdGHXUtArqhI4I5AqYnV2DjtI7ajuXQHC9ANqSwJxYb1tQUT8PqWjDhWDx97Vsr2
         WMCQ==
X-Gm-Message-State: AOAM532G1I8tYS2fcUcE3Kuy1ya+hz7iASBhKERm/knV3SdwzpxDEHPk
        E9e1NOBV4xE/+AbGkdJcdlvFTUiLS4YBZCjdsABCw5RpAtB3U1k0+vpIOzsHndjh78+rUpXrhAW
        lt0ZWu/o8rpyU9k8asZcnLQ8Hu0FSkYHj6cLjWw==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19223370wrb.268.1643131575155;
        Tue, 25 Jan 2022 09:26:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYI/XrOuQ3vsEuxgAlunH/u1OuAuphMer+VPxKWkoU6kMBjIKLaf4SHUyoWcg3qCZ2MyGAZg==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr19223349wrb.268.1643131574970;
        Tue, 25 Jan 2022 09:26:14 -0800 (PST)
Received: from [192.168.0.59] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k12sm11197616wrd.110.2022.01.25.09.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 09:26:14 -0800 (PST)
Message-ID: <4cfcde38-50cb-646a-0d17-c2cb2977a2e4@canonical.com>
Date:   Tue, 25 Jan 2022 18:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD)
 SoC
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        sboyd@kernel.org
References: <CGME20220124142850epcas5p2f82243b87386b3d49a9302c87e015d6b@epcas5p2.samsung.com>
 <20220124141644.71052-1-alim.akhtar@samsung.com>
 <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
In-Reply-To: <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/01/2022 18:12, Krzysztof Kozlowski wrote:
> On 24/01/2022 15:16, Alim Akhtar wrote:
>> Adds basic support for the Tesla Full Self-Driving (FSD)
>> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
>> as well as several IPs.
>>
>> Patches 1 to 9 provide support for the clock controller
>> (which is designed similarly to Exynos SoCs).
>>
>> The remaining changes provide pinmux support, initial device tree support.
>>
>> - Changes since v4
>> * fixed 'make dtbs_check' warnings on patch 14/16
>>
>> - Changes since v3
>> * Addressed Stefen's review comments on patch 14/16
>> * Fixed kernel test robot warning on patch 04/16
>> * rebsaed this series on Krzysztof's pinmux new binding schema work [1]
>>
>> - Changes since v2
>> * Addressed Krzysztof's and Stephen's review comments
>> * Added Reviewed-by and Acked-by tags
>> * Rebased on next-20220120
>>
>> - Changes since v1
>> * fixed make dt_binding_check error as pointed by Rob
>> * Addressed Krzysztof's and Rob's review comments
>> * Added Reviewed-by and Acked-by tags
>> * Dropped SPI, MCT and ADC from this series (to be posted in small sets)
>>
>> NOTE: These patches are based on Krzysztof's pinmux for-next branch
>> commit 832ae134ccc1 ("pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups") 
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/log/?h=for-next
>>
>>
> 
> Thanks, applied DTS/soc and pinctrl patches.
> 
> I expect Sylwester will pick up the clock ones. Otherwise please let me
> know to pick it up as well.

I forgot that clock macros are used in DTS. This does not compile and I
cannot take drivers into DTS branch.

Alim,
DTS changes dropped. Please resend with the same trick we did for
Exynos850 board - hard-coded clock IDs as defines. See:

https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/diff/arch/arm64/boot/dts/exynos/exynos850.dtsi?h=samsung-dt64-5.17-2&id=e3493220fd3e474abcdcefbe14fb60485097ce06


Best regards,
Krzysztof
