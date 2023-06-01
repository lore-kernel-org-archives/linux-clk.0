Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF5EC77B7E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 14:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbjFAOxx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 10:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbjFAOxw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 10:53:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A326918F
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 07:53:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so1233994e87.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631229; x=1688223229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=790tI55xNKd3xmitEfyE+MxPAwHRUWPcKekWE/6Wxf4=;
        b=iIEeuwI+RFGpPQMHkXqwx96h/6EIRBcmwyVDM/IRTV++XS0GtO/ixK9K9/wKNq8ll3
         /PyRDIL+9iYNDAzOt7iqUDtQWW/xc76JEGUNVmoYl4SRTMUH1Lg9rA6BHnczdW3Lf2HN
         X+rOjlBf2uGMHRFGYO37RqrKR+OGgdmiS6WGMLwvLyUYUX7m384QmDZ7MKNLnbW+VxWi
         FxWsyY8b/6rrnQctFVsjk2OvMbQA7IEVNUhdn51xQ/HsZTmwtOClFKlDKAiioL9Pj78H
         S+k2NhSS1MQazhKDh3HIx1Hr3DuTiIhI2/bA0/5HoUyM9tNBpwp9hmhTE8kc3N68Mv35
         EadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631229; x=1688223229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=790tI55xNKd3xmitEfyE+MxPAwHRUWPcKekWE/6Wxf4=;
        b=lGQQ1m9+NA+yZvOVEdCtTSB18GSADcPdePV4AR/uVD5aFNvq2ldH84HKCBoz+CcNNm
         if7DOG9WfQ5z2/54acNwCfk0dlVZVtbWp7Y+WcYvFBq99j8I1srFGKv1ZNFb4YurWz9G
         XlFUdI/8CyTnrstHTR8WF+DAF/oQUCZE9SZA7AP4hXzIA/qeJ+xA4prieo0iRjXoj5Us
         ZP05I+V+IPvKPZUWOsBsrB78DGP3eSjM49iJO/TcQg5R3uHAzq7XhEqGxPhwAjAWay6n
         UWu+XVwJMUnCbGifl9n9lFGZlTFgtWTtfzr69GkNo4q9nZxFCzar851oW+3JKNuRaAwH
         dvdA==
X-Gm-Message-State: AC+VfDyDWbjfsRJ2V0W/aeyiOUKgz+4Ze9v8+NEUxjlgpoDOC3ivMpPf
        GckV7t007KTaRCsQxb678NXf6A==
X-Google-Smtp-Source: ACHHUZ7enKascLJElckDsSOJWra6TM0JOvnbj8p/kfmTwGYiLGJ8vdY5feC0cuc5xFG4hKI3kFzfgg==
X-Received: by 2002:ac2:44a5:0:b0:4eb:1048:1285 with SMTP id c5-20020ac244a5000000b004eb10481285mr106207lfm.47.1685631228904;
        Thu, 01 Jun 2023 07:53:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t4-20020a19ad04000000b004f24e797c55sm1113384lfc.25.2023.06.01.07.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:53:48 -0700 (PDT)
Message-ID: <ee48f7fd-35f1-288f-2133-1c473e8804ab@linaro.org>
Date:   Thu, 1 Jun 2023 17:53:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 4/5] clk: qcom: camcc-sm8550: Add support for qdss,
 sleep and xo clocks
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230601143430.5595-1-quic_jkona@quicinc.com>
 <20230601143430.5595-5-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230601143430.5595-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2023 17:34, Jagadeesh Kona wrote:
> Add support for camera qdss, sleep and xo clocks.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

You probably missed the Co-developed-by tag.

> ---
> Changes since V2:
>   - No changes.
> Changes since V1:
>   - Newly added.
> 
>   drivers/clk/qcom/camcc-sm8550.c | 180 ++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)


-- 
With best wishes
Dmitry

