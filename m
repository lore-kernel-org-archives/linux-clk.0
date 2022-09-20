Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978CEECAAD8
	for <linux-clk@archiver.kernel.org>; Tue, 20 Sep 2022 08:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbiITIbM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbiITIac (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 04:30:32 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894003334E
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 01:30:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so2495704lfp.11
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=agy8Tt80j/kRvFU4gLKj231EcFlYzic5Np99mPIQ+dE=;
        b=yDdwc5dVZfa5Ye5xdoVmY3cDbvFbZB10xPeKDFXq7D41eQXxQdn6+pvq/+yVQUdrHu
         DGcbAXGyGPQa+f0OPN16C12QivySbGeQ00/0p4ThY05fEH298++HY9ihEIaGxKFtPwsJ
         rXOYCl+R+SVx11uwBbr1Nwfp8TfXXWT+NWFNZJwT71UPDP4Dr+/FTn2DvQLFVkdCHHjM
         erEQh1kq4u/SxxmHs0X+Ndev7iZMw3iYiSfnnK90gS8yLxtcce07on6wj4UQAxkxFiXp
         RWpP21ZwmZmda/4a86qVRjeJuQoZxoIZcVt0PTNZVuvqHtyvwF1ykr3V1ecooU4biu0l
         iZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=agy8Tt80j/kRvFU4gLKj231EcFlYzic5Np99mPIQ+dE=;
        b=vbiDJVLBhWD1yFkmjyJtdadGnLwalfu0sAuA4Jbv1+6EcDJlLWyBrGSfVyjDAcCT+g
         mNUbSJXJF0X65r9+LjpEo4LUymTvPkCew5lF2DrGMNQvDNRZJv5wlRPnODRD7LuP05KB
         9XO+73ye/wTe1O4Vh1RP/uDiL+jKf8cHtpS5czKU7a5187ueve/gsAtmwxt/3oqU67kB
         Yv/DxZkDULcnmW9/jCF9AaD+Oos0YACyrOwab1wesgTE8MV+xP7n+Wa3RPWFDXtwGVSf
         C3o+Dsz09gu+E0XDB48UrRllOIXPvqvx0u+lztNq2geDrxImQwJpboHgvoR5Tq87ECtf
         F3aQ==
X-Gm-Message-State: ACrzQf1QFn3we23W2+XIxz7n4Ut4EBihiTEkEnRSd4Aoz1DQR0OPhj8V
        JGMEZVVLpV50lnKLUNnfqUYiLQ==
X-Google-Smtp-Source: AMsMyM4UKGyEa5JByvPQbjpNBv7kTtyqXSl4s2097VZx6dOP0gE0xHx1NyWr1NYhR8xB7Hu7ZxwB/Q==
X-Received: by 2002:a05:6512:3c93:b0:48c:dc60:4786 with SMTP id h19-20020a0565123c9300b0048cdc604786mr7594820lfv.208.1663662599775;
        Tue, 20 Sep 2022 01:29:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w4-20020a05651234c400b004948b667d95sm191945lfr.265.2022.09.20.01.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:29:59 -0700 (PDT)
Message-ID: <7d61568d-4fb7-a1fd-8418-cad65e2172cb@linaro.org>
Date:   Tue, 20 Sep 2022 10:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] clk: qcom: rpmhcc: add sdm670 clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220920023709.4865-1-mailingradian@gmail.com>
 <20220920023709.4865-3-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023709.4865-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/09/2022 04:37, Richard Acayan wrote:
> The Snapdragon 670 uses the RPMh mailbox for most of the clocks used in
> SDM845 but omits two. Add clock data for SDM670 so the driver doesn't fail
> to resolve a clock.
> 
> Link: https://android.googlesource.com/kernel/msm/+/444bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F7

NOT_FOUND: Requested entity was not found
Do not add non-working links.

> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Best regards,
Krzysztof
