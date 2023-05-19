Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7B5C7EE26
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 20:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjESU05 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 16:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjESU04 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 16:26:56 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0658102
        for <linux-clk@vger.kernel.org>; Fri, 19 May 2023 13:26:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3078fa679a7so3613883f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 19 May 2023 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684528014; x=1687120014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAE6bKGD8uI4B1Ojm7oaDsntRbDY/p/o83Rm9HGs3vU=;
        b=KhQh40O1foL2uAE4MXyDZfPQ5dBQPWBnpePjc4y7//CUqlwhXfNm71R7dYxmEJwWWG
         rcaOqd+lIjIKiEE08whNoRF97O97YYF1vTCQS2xZ7QSSLDW5/OKkcyEGapsecuN9/to2
         v2BNxDmrF1a3IEzJiwbJ7osQD4vwrNfvAKgQiMfw1I++7sILIG1YSGGVeWdJCEOROapP
         wfLarCWDjHf6uPYYt0NeZ4pIgzO2tEoUuUMIFC/JxzpARfwOLfcGJz+utC+29Nof1tWj
         726P5tfBTvxjVUdwixgi/sKT1pl+HCC3hmOg+yCSbfISpiLD0/Y+qWcyKGM1JmallZq0
         dZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528014; x=1687120014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAE6bKGD8uI4B1Ojm7oaDsntRbDY/p/o83Rm9HGs3vU=;
        b=cF4QtlnUFjLLiz5S24YWbxCet/KyG9qzPMzBkKhvEX0D4ojYVMlHUQoh2vz4F9aJC8
         iqdc/QDudkDTMgGLG5yhjvZCx3c0YWWzClhKd2cdHfYs86yVuIL9AtxzSd+4jwxLK+yD
         Pw1X9VSynkIQcLJwZvH9kRYwpqnNGY5hd1veixlMjTGGg2norEIj4OiUDi2KLLj7VRXM
         3KtUmJwKUhlf9ShJYFVz7yX0whDMAIkUlQxY6OF4pu4q1FTGKh2G/NHpgMSrZTlGnymh
         canJJvknNsAvoxpCH9uM/LvDMDEtJPINTpJwLCN5zWgFM9X7jFaOrK2fAvjX+Vhtpe3K
         O35Q==
X-Gm-Message-State: AC+VfDxkvPIgwu4+9xdQ2sHnv3wQyXPKMv+z2oEE/im3hXBqQATj180v
        H7vQvMRlJCO88uR22CFHYW0wUg==
X-Google-Smtp-Source: ACHHUZ4uiJw3o5Q8DT0mgGSljrWF/EZLsfHVRRKzsHn/aWcqBrnB/38cAQiKQNUue0GSQcyZ6n1WNg==
X-Received: by 2002:a5d:5188:0:b0:306:43a4:86b with SMTP id k8-20020a5d5188000000b0030643a4086bmr2636003wrv.4.1684528014184;
        Fri, 19 May 2023 13:26:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d5251000000b003079693eff2sm6137050wrc.41.2023.05.19.13.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 13:26:53 -0700 (PDT)
Message-ID: <0d0a1985-a08b-29ed-4bc4-2eea560d7ac0@linaro.org>
Date:   Fri, 19 May 2023 21:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] clk: qcom: camcc-sm8550: Add camera clock controller
 driver for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20230519155602.6642-1-quic_jkona@quicinc.com>
 <20230519155602.6642-4-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230519155602.6642-4-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/05/2023 16:56, Jagadeesh Kona wrote:
> +MODULE_DESCRIPTION("QTI CAM_CC SM8550 Driver");

This pattern looks odd and inconsistent in our clock drivers. We mostly 
have CAMCC or VIDEOCC but occasionally have CAM_CC and VIDEO_CC.

I'd drop that underscore to, in addition to Konrad's comment on Ucase hex.

Other than that, LGTM.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
