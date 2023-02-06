Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C328BC6379F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 11:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBFLWD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjBFLWC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 06:22:02 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F141DBB9
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 03:21:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id m8so11254088edd.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 03:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
        b=h2975W79UPeeiMEZ9AHtojxXjXqOEhIDNnOz1yRgLa3z3fTqwO5ib5AUvbn9kl8Xus
         eI8miGLIVwq79HupZGifhB8PqSOJOrF3JDBYP9XNQu6f96B9HxrjXCkpZnSvKxzx3/2M
         ULpkreJdUypaoZ4c537hHg2Mc8bA3z7ON/M2VvT/4XImGF+E34CktBe/FPDQi92zzIzu
         Dv0whz5pE5h+HT/IjJWz9A/ZKv6/8yQWVSpYxMnOpxzV8RqxdMraMlxriEBf42SlCKQ1
         mHjsp0TkTypKa8fR7mjQEXGmXuRe4rni2pR3H3xMhNAKgnTn0n9siJbq78W6jHRBRfEs
         Z26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
        b=jcwor+mc37lxe2mkjRzCEazepawsRentZr76UxmtkaKbarBWYVKIYEEuIkECrXUG9L
         xgFBExnjvP48G5yNQLzbI1/vpnX/JFjkkfmZM5vneJ0iYEhhHgKYNVdQf9DxbLCRzMUu
         EQYJbcb8awdu8EJ6UhhrFqEfA8+vxIFCaXeqlCDd278c0gp8yxShlScHHq4EXeBC3TKj
         catKl8m5X9H0UmnpI+BDfl+udF1RrOwbHk+faMny++3rS0RtMXs13KH3bFCjMeJpFzAM
         EQw5lyx285YrQbxqzKlRdrf+wYnp9j5FFNomPTyrWYcz4oS4zlDRfOxcj1IumcEyBXZR
         nvbg==
X-Gm-Message-State: AO0yUKXt6OpclPRN5WLfygwxIqCrHKvdIbTbTTLxiv0fEXsFvPWheIMA
        iy70H52rPYqm+lDZClpmHkNiIA==
X-Google-Smtp-Source: AK7set9MAC+HCPhW7u6DHBaY5VdUEuLOfkagFMD0u5hl4QeVmrZYor/UME665PgvQT+hcODcQdZlcA==
X-Received: by 2002:a50:fe86:0:b0:4a0:e415:d39f with SMTP id d6-20020a50fe86000000b004a0e415d39fmr17308791edt.41.1675682518249;
        Mon, 06 Feb 2023 03:21:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b00487fc51c532sm4971343edt.33.2023.02.06.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 03:21:57 -0800 (PST)
Message-ID: <5c2df97d-43a3-ccdb-267e-4dc5485dbeb2@linaro.org>
Date:   Mon, 6 Feb 2023 13:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
 <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/02/2023 12:44, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>> Add another power saving state used on SM8350.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
> Wrong patch once more?

This patch is wrong and was sent by mistake

> 
> Konrad
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>> @@ -211,6 +211,7 @@
>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>>   #define RPMH_REGULATOR_LEVEL_SVS	128
>>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>>   #define RPMH_REGULATOR_LEVEL_SVS_L1	192

-- 
With best wishes
Dmitry

