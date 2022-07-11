Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42740C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 11:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiGKL2P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiGKL1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 07:27:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E52273582
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:04:26 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w17so4196020ljh.6
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FcPD4ifirYFuSYB+4m7Neq/k9V2vE0FU8ah5Vhxzqkc=;
        b=XPO5fyUuyaFVyokqrvz8S/Y3v1cJyoeYZnUu+pLonL/Sb9tky6Zbhr4pZwMrY+/sqF
         5KYMJOwcE1RTP4QrqbXoOxrHHPt+BSV6sOi7niPc5gMcHN+9A+E59s08MqKcrH0xbHAS
         DgnMHCBxNYke15GVDK9+3uHsUt2TvC2tq4MGMDMWDXMtVoxea5Tjz1+hijPjh8PnlL3Z
         QQx3rTuUKh47xfbhHiuCNLmT91MXojLd+DEIhrbUrBGwlctJccJZdyXic70fHPFbSbJw
         xZPt4Tv0DaIkLD4wG4BXjGb3AMxE58kjoowqqLeC84hGXaedgUYFwgGn1oh+9QAaa+f2
         9ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FcPD4ifirYFuSYB+4m7Neq/k9V2vE0FU8ah5Vhxzqkc=;
        b=P4Y7DEXCXoyDD1sjKFDMRc/0GjJeH5bxknqN3xEPe8ib4uYO7IgEWtk/ZWkKUXUlW3
         odOe4nsb9mDaraRWVqbtGbe2Y+xq3FqNiIpAt9Z0xI0oLV3qKysqj1cTxs++LvTLweFJ
         TEIO1G7ebtbiGEx27crAXlUegOpO6ww76k1Y0bmcAx76WNeOM3DLAwurxGieifZk/PcC
         72OIjuOPS+Xqi9grOS1yr09j1EXl7ZbzkQT9YAl0+TbpoVOjrE5DVVxybdiUoWBe0qfU
         VbhvG2rVlV5pqQ+Mc3Qo/oMJWx/+5+GxIMDR0bHUdxElb2g7Bs/FwqjgZs6jJcIpi6BR
         jpLg==
X-Gm-Message-State: AJIora+Kmc96buUCwjR3pi8895lJ7ijN95CwLqCFJ9IjZX8HHBF6ElSM
        lZW3ESmekYJkOJO9TzSW4+aT9Q==
X-Google-Smtp-Source: AGRyM1s+f/FraDvu9vaVd0mrJ8CWtpGy9hoN43l5cNzjkstfeo26jE67otBqly5d1l3gPmJJGFBsBg==
X-Received: by 2002:a05:651c:11c4:b0:25d:377d:3327 with SMTP id z4-20020a05651c11c400b0025d377d3327mr9444910ljo.225.1657537464812;
        Mon, 11 Jul 2022 04:04:24 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id i25-20020ac25239000000b004891b4a4acfsm1480762lfl.185.2022.07.11.04.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:04:24 -0700 (PDT)
Message-ID: <8f68fa6c-172c-688b-f5ee-2a59ccf04636@linaro.org>
Date:   Mon, 11 Jul 2022 13:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom,a53pll: add IPQ8074
 compatible
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220711104719.40939-1-robimarko@gmail.com>
 <20220711104719.40939-5-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711104719.40939-5-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2022 12:47, Robert Marko wrote:
> Add IPQ8074 compatible to A53 PLL bindings.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
