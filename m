Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840E8C25B6B
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 12:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbjJZMCo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 08:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjJZMCn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 08:02:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639411B3
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 05:02:40 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40850b244beso6583235e9.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698321759; x=1698926559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paTNaTpvnpV4RHseAXbcaIi8qJ2kDljARlPE1mIBGfs=;
        b=PhjUbofKuJmiz1kbGxniTSsomPbL/BFXOT5vLlBS83apEMaVaVrWkUXaFzeMUmF9XR
         wrMgLalcS3+i67D4W62Pu3ZksfZPepUqI2ec5Um3qK/t2MPpzbS1o182R6Di+rLfomcZ
         AlW4tBaYF4s0nMgzVAEy2CiPIuNaRLiqMUqLVK4kCb7AkAlKi1pPW6RRIpDKzi5r26iS
         CrKOMBqHm7wbogMYVFap1XrOOo4ONnlYxp++hrCG/f1QKKq8UUGRAB9146cA/3i4Z51U
         fY5REXASNx5NaNnHvnh8orybYyKM6p9jq5IvJBEcYB6hlleHEKtRN/RDxmT02BOWjlvK
         WXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698321759; x=1698926559;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=paTNaTpvnpV4RHseAXbcaIi8qJ2kDljARlPE1mIBGfs=;
        b=xFAF0WRL/fplv2ID7hkhSRKWY9Z1QmpbCKBzB6RrBufnCcNIH4kgPp2U7Odcd8sywp
         hrpm9AIDP4vUMd9cPvrQosUqGqzvnYxik3x+xk9c5OARj2Eu48qjksjxFsARcUQGZRyx
         F2FePQDVEBu4Cdshot/UENs6im3eyiOaQEDunB5ioFV8fvuFFI2iUdTWoSaUu82/eynz
         IFBaYWghu8gK1f4c/XPZQGgGmTNADLrXtZqTJkwqX77BDgUz1RC7WSlvd9VoNmZd2YP2
         zKqutOaAwDnsTjEnutsN7bpvcTXkzqKDvWVo3GqPTIZ+xNzqgdqt5gxNbUJfqSbQsED1
         UkHg==
X-Gm-Message-State: AOJu0YxZZFPra2+2TvedDgjyA+6KCcfpgyAGGHZSbjxoOvKAPP0RgnFj
        zds13RZ4MaXBDZ7WclAbb/TI+77GUrH800WNxThhiOg8
X-Google-Smtp-Source: AGHT+IEmihfvfgXWfelOCluAlCfTnZRODC/sX2nEUu/hUXvNgExReSF3mDPhtjmfWGiJclVcSUFqbQ==
X-Received: by 2002:a05:600c:3c8f:b0:405:3a65:1b4c with SMTP id bg15-20020a05600c3c8f00b004053a651b4cmr14372770wmb.6.1698321758010;
        Thu, 26 Oct 2023 05:02:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c? ([2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c])
        by smtp.gmail.com with ESMTPSA id cc17-20020a5d5c11000000b0031c52e81490sm14436441wrb.72.2023.10.26.05.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 05:02:37 -0700 (PDT)
Message-ID: <2a72be5a-2545-4cff-a550-f9a53a1ecb83@linaro.org>
Date:   Thu, 26 Oct 2023 14:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] clk: qcom: add the SM8650 Display Clock Controller
 driver
Content-Language: en-US, fr
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-8-c89b59594caf@linaro.org>
 <4d6b8e54-8ec2-4774-9a7e-881af58093e2@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <4d6b8e54-8ec2-4774-9a7e-881af58093e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/10/2023 10:45, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 09:32, Neil Armstrong wrote:
>> Add Display Clock Controller (DISPCC) support for SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
> 
>> +static int disp_cc_sm8650_probe(struct platform_device *pdev)
>> +{
>> +    struct regmap *regmap;
>> +    int ret;
>> +
>> +    ret = devm_pm_runtime_enable(&pdev->dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = pm_runtime_resume_and_get(&pdev->dev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    regmap = qcom_cc_map(pdev, &disp_cc_sm8650_desc);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
> need to clean up RPM

Ack,

Thanks,
Neil

> 
> Konrad

