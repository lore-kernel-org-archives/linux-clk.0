Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9168EC25B6B
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 11:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344833AbjJZLv3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 07:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjJZLv2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 07:51:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38191AD
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:51:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40842752c6eso6495565e9.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698321083; x=1698925883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bEXKDY0O2dJcBx8PzS4T9juifD+BCTKEs1j4rNwC1s=;
        b=VTVcVWhcGRkOUFd+5rhYkj+iqsqtMkVgWDX7GVP1GWBFQ90Z4gB/yCqjgNUOSEb42I
         caFbItMu4G4cABcdR1VcrO8h7N1LdffBy1KPClqqZpy1JCUbBwQzIr9AgpKb3bZ+CmFj
         abIQeFggxPsS0CJ0ECqy2Wb7r1Rc5bkeIlHDUQIf5KpphR2IjwyNBd1UhrY/Mz5yikNP
         zgBB2RPqAA8ihia1VnObvmuNbURUqgBTPfmFjexymZLa/T9n+QBGwzJM7yr4Brx4wb5v
         L//8GncHYTvbt98gUNUynAe8Xtl43zWlShWCSbRyKjQVEpV5YNIQnh67KnRSMmXAZHOB
         IKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698321083; x=1698925883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+bEXKDY0O2dJcBx8PzS4T9juifD+BCTKEs1j4rNwC1s=;
        b=vSGh1ALr3+32LEpbdgpH0sF3uONA4tlT9+Aot33Q412hEuQeSFxA0Q7xSg1ICSkifh
         LYbn6UQ3A4QV7lTbYDrjxXtjdLghQbinit7yMGD/KIQYdZxcajzG6WWP3G9MfWE5kUaR
         9GEzrFln2y+vA3ZjJ3IOV8t+ZcbtvA7uDwRA6eB2iumq8X1Axxgyb7V5092OgvXjOI34
         Ke3RzsfW4MNkDg9Hb+khjxVSjyZSLRpomWM+a5Bvch8OwAluSrQAB+qDcnZjPwUBB1oQ
         Xnh0L9EmHBPGKC78XTRmy2uRfF4YURWzutXufaJdyQS2KShoT7y0q3Sa2aaaX/zdxXVG
         VFRw==
X-Gm-Message-State: AOJu0YzrkGxStu3D5Da5rJLva7xacS/sl8o5z+RPnmPHrY32f1ZfCmyb
        Vtw7W0F6h72Wski2f3OzeDGbCA==
X-Google-Smtp-Source: AGHT+IH8qEeu0Nv7Dhl0dcFqtz/6wuFEaJuVWtoYvI/ohEGhBwiXHsTI1LdqZ39vCFJmokVpoTlNLA==
X-Received: by 2002:a05:6000:b4b:b0:32d:a4c4:f700 with SMTP id dk11-20020a0560000b4b00b0032da4c4f700mr13224768wrb.38.1698321083300;
        Thu, 26 Oct 2023 04:51:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c? ([2a01:e0a:982:cbb0:f57f:eb08:d29b:8c9c])
        by smtp.gmail.com with ESMTPSA id k12-20020adff5cc000000b00326f5d0ce0asm14094197wrp.21.2023.10.26.04.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:51:22 -0700 (PDT)
Message-ID: <4f0a7c6c-b221-46c8-888a-34b94cafeb8a@linaro.org>
Date:   Thu, 26 Oct 2023 13:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 06/10] clk: qcom: add the SM8650 Global Clock Controller
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
 <20231025-topic-sm8650-upstream-clocks-v1-6-c89b59594caf@linaro.org>
 <ccd24edd-b713-49f3-96f4-af653a8fd6b7@linaro.org>
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
In-Reply-To: <ccd24edd-b713-49f3-96f4-af653a8fd6b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/10/2023 10:41, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 09:32, Neil Armstrong wrote:
>> Add Global Clock Controller (GCC) support for SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Just a couple remarks
> 
> 1. looks like there's no usage of shared ops (corresponding
>     to enable_safe_parent or something along these lines
>     downstream)

Indeed, it was missing, I'll give a test before posting a v2.

> 
> 2. none of the GDSCs have interesting flags.. I have this
>     little cheat sheet that you may find handy:
> 
> qcom,retain-regs -> RETAIN_FF_ENABLE
> qcom,support-hw-trigger + set_mode in driver -> HW_CONTROL
> qcom,no-status-check-on-disable -> VOTABLE
> qcom,reset-aon-logic -> AON_RESET
> domain-addr  = clamp_io_ctrl

Thx, I updated the GDSCs.

> 
> 3. gcc_cpuss_ubwcp_clk_src uses the XO_A clock as parent, but
>     it's not there in the ftbl.. Could you confirm whether this
>     clock should even be accessed from HLOS?

Downstream this clock is only used by gem_noc, since we don't use such
clock upstream I think it's safer to remove it until we have the usage.

> 
> [...]
> 
>> +static int gcc_sm8650_probe(struct platform_device *pdev)
>> +{
>> +    struct regmap *regmap;
>> +    int ret;
>> +
>> +    regmap = qcom_cc_map(pdev, &gcc_sm8650_desc);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +                       ARRAY_SIZE(gcc_dfs_clocks));
>> +    if (ret)
>> +        return ret;
>> +
>> +    /*
>> +     * Keep the critical clock always-On
>> +     * gcc_camera_ahb_clk, gcc_camera_xo_clk, gcc_disp_ahb_clk,
>> +     * gcc_disp_xo_clk, gcc_gpu_cfg_ahb_clk, gcc_video_ahb_clk,
>> +     * gcc_video_xo_clk
>> +     */
> Could you make these comments inline, i.e.
> 
> regmap_update_bits(regmap, 0x26004, BIT(0), BIT(0)); /* gcc_camera_ahb_clk */
> 
> ?

Done

> 
> Konrad

Thanks,
Neil
