Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F13CC38A02
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 22:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiJ1WIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 18:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiJ1WIC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 18:08:02 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C95D24CC8B
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 15:08:02 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id cr19so4390774qtb.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 15:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFVbywhvRiGMFeEYzajNEmWxk/ylmxPmeI1imeal834=;
        b=NCtulz3u44DXr2b4aWBfJU3cCkxs7CvRLxE42DFVrD3FvL+6ssoKxe6QDoNCeYApeL
         DzfT7IlZRcHNwv8FrmV5kJHEAMxrOp//0j4Pt5P3VAcn/5ZL9df7qO7dPiZIfswIcJSe
         DqCy1ypcgdVjvqXfhuenrZMZ/RxS+koE5DpZuQfU8d6G4nh8Jzn/lykF+pcBV7/9q1Y9
         OULJyx3n2Y4ctlOD69iLu493/YwiNaE9imuqhrOP9GNflbJ3Z73OVIWCLykVMqgeEL0S
         SYGQ6ySEX9bYBAh9aJXZhurmLiy+hUi56mMnwwASXWzLG36Uln6TCDll/I3gzGFTVgpf
         msEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFVbywhvRiGMFeEYzajNEmWxk/ylmxPmeI1imeal834=;
        b=OW1kHaeZHBHGqJtk2p3CbOeM54BU5GZRBICbEONLDA7xYNF6z8PlUMkWHpGJ4Bog3j
         RD1dgDl3bnnnL0OJ4cfcGuEQwtAH4Tgs8fpVqLYldSs+FsNM3tdx8XyaRCUEh5B2eMcP
         YuEEVsiIHcew+XdKH2H5LAdzAog0itZq/YNXWg9GcTyxRy7tXfxV5mr8gRS2IqCUEarm
         fOcAKwlsnVwWIoz0C/urftFDPMEyqnrXKyrdtrczRUU6iJgc3Zq7RPa6zNVUNdJ8aU4C
         htCVcWu6b1Mhn0AKUfl3+e1eCpRLSlZ5/8jwNO3DycenExZImIcB2IjGuJkviDUCfNIQ
         Tp8Q==
X-Gm-Message-State: ACrzQf3wdrmBfRAcS1HgelDEDrOySLzqeEyzXgvOnEgqUvTvWFVmHSx2
        mhOgK6Sjx25m0fRxYFh4C12r7w==
X-Google-Smtp-Source: AMsMyM5gZzXJzv1KbupXmMX9RD2HNxOi/wkqNceXmAYCJ7yTR5OU/XwNUOzVkCOg2a6fJOoeyystfg==
X-Received: by 2002:ac8:5d87:0:b0:39c:eb24:2e1a with SMTP id d7-20020ac85d87000000b0039ceb242e1amr1439585qtx.577.1666994881278;
        Fri, 28 Oct 2022 15:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id c2-20020a05622a024200b0038b684a1642sm3053506qtx.32.2022.10.28.15.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 15:08:00 -0700 (PDT)
Message-ID: <96ab729f-de17-cf6b-a218-e08fe4fc4a60@linaro.org>
Date:   Fri, 28 Oct 2022 18:07:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 3/6] dt-bindings: clock: imx93: drop TPM1/3 LPIT1/2 entry
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        abel.vesa@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <20221028095211.2598312-4-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028095211.2598312-4-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/10/2022 05:52, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per updated Reference Mannual, the TPM[1,3] LPIT[1,2] root clock entries
> are reserved, it is because writing the CCM registers does nothing
> because the TPM[1,3] and LPIT[1,2] IPs source from bus clk, not from the
> TPM[1,3] LPIT[1,2] entries. And because there is no SW entity is using the
> entries since adding them, let's drop them.
> 
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

