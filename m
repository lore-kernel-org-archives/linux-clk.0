Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252EAC25B48
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 11:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjJZLeh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 07:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjJZLeg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 07:34:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054631AA
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:34:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32db8f8441eso583277f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698320069; x=1698924869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guG/4XeVgfANKrbZu4mGuhf3LMfrQDPCzTLE4W9xTUQ=;
        b=CcTu02xmrvd6uRdisUSflC264cuI3LaRZaMPUmMAM0Le/0hRKug8zchKwTCFTJI+/W
         L7o5BqsG4o0FD3uLRbShrXzZtcZ2ijAlqBs2INot0WJ8aXeIs993Km7A/e2u34mnBpgU
         4PnvJaH//HnHLo+mXMa8Z7aIeRP1Svfm40UNRXiuf89TOTeMdFZ0XIaBrtGCguXiUIIb
         IYYjhnxKptGHiOkCH6RjX6lo049quIcPEN80G3YbR9PRdQ8gXb4B/s53wGmtznJ26kXF
         K9jQpRTymjG953grbhLwDthysc4vMla/ETH/qSE20qi6LOOi+agptyHlsHsYnIOHsDE0
         teJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698320069; x=1698924869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guG/4XeVgfANKrbZu4mGuhf3LMfrQDPCzTLE4W9xTUQ=;
        b=nZtLQAc4XBZR9bTZucBb1hzNQJDiADt1UDM1RDzCWS9I0KRxYBiClHKilM2oYiDMPz
         YSLgtbwgtbvdaOxX5iX/rRYlpVYqWVpEH4mFOq7Reua7vU4z0ko2SVCGPYxwjS3npieO
         wAEMzvhVk8d/D8UTN4lzP/2UGdR1+Cn/D4NQrmZNH75EjRMxmuE8YftQDJOp1MGgoDiw
         zq1Af9RSwpCW+efz31/xZEiM9fzlt16MlbjiF8FlWLNRa3qVczrjYILgYVh9K6ncqtJ2
         dkgic0q1FFgJcPuSDRaqsrsPB7JNFMWfXkWh78C7oYCoJEVC+/kgw+mUKyrOJaP0caSq
         q3ag==
X-Gm-Message-State: AOJu0YyTL7HUniRvIAT6B8diQav0zJEzTnS6naAEMHL4wDk2Ruz+azDe
        yA02dDv4cSrOSJMxrNheVEa+bA==
X-Google-Smtp-Source: AGHT+IHSkVTTrHEK5sk3YvrLqIt1UC98bLaicwEdKbLfLHhFFxSyL8PtT3Zt2NSsN8z3RRf7Nbph4A==
X-Received: by 2002:a05:6000:a:b0:32d:8830:cda1 with SMTP id h10-20020a056000000a00b0032d8830cda1mr13865846wrx.63.1698320069155;
        Thu, 26 Oct 2023 04:34:29 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id w5-20020adfee45000000b00317a04131c5sm14075315wro.57.2023.10.26.04.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:34:28 -0700 (PDT)
Message-ID: <6d44b972-9337-472a-9010-71ebaa0d45cf@linaro.org>
Date:   Thu, 26 Oct 2023 12:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp
 CAMCC
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
 <20231026105345.3376-4-bryan.odonoghue@linaro.org>
 <20e2801d-df4f-436e-a677-2c81d43e3273@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20e2801d-df4f-436e-a677-2c81d43e3273@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/10/2023 12:21, Konrad Dybcio wrote:
>> +    .flags = HW_CTRL | RETAIN_FF_ENABLE,
> This should really be HW_CTRL_TRIGGER from [1]
> 
> and then downstream uses cam_bps_transfer_gdsc_control and
> cam_bps_get_gdsc_control to control hw (fast) or sw (normal) mode
> 
> similarly in drivers/cam_icp/icp_hw/ipe_hw/ipe_soc.c for IPE

I'm happy to do such a conversion if said patch hits -next, qcom-next or 
clk-next before this patch, otherwise I'd rather not gate this driver on 
stuff that's not queued anywhere.

There's alot of CAMSS stuff driver/compat/dtsi that is gated on having 
the CAMCC upstream, effectively all of the CAMSS stuff for sc8280xp.

Fair ?

---
bod


