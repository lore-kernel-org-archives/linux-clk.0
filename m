Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8205C7EE32
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 10:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjFAKKm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbjFAKKJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 06:10:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE16139
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 03:08:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3edc05aa5so698736e87.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614127; x=1688206127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYo8BRl5LkkQXi3mYOgwIwVJRno87626SaL9vwHSxWM=;
        b=LYa5l9f+Co4mqxLciHYmPqSTu0vn9mtS7s3xt2p4yR/EvZmDTHHVjN9r8koGe/yfBs
         BaLczKu0EPtcUXAjTsHitxB/7fAR0Lhveg8+Cr3YdioC8SQqCpUxgX0jdKtzkHK6s9OG
         T+8qtMgIQCJjSon5oofyMR3UMs4h2SxAeVzbCp3RPCVeipl+aYJyfmO/NTxuhdtP2Fj5
         3ROO0jiH+i1mR0thj6g56VxHcA/P05/+t+AOp3NfD+UIWFHUUXRo1yB0DqgU4J7KkN97
         +L0PrClNEpqxUezuWyzgFiPcI4kv92P8DT4JKRut7s5hHb+/LR2f6PACYuhUpLzOtAcD
         fA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614127; x=1688206127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYo8BRl5LkkQXi3mYOgwIwVJRno87626SaL9vwHSxWM=;
        b=DD3NnMLOF0mrX8I+e+vpK3ztZAgvBGFC8M3DjebgwwXSRsqlI+G7sg20GK0y7pJc6Y
         8oSMmEwR6TS2TQe1ixK4H33sk66Pu2QRCwtzooL4/PbfDWry3JY4VdlWTsPIC/yAn7XB
         7io99UpBb1L/yaHDd2HZimxnF/TQT4JIjyWulY/FvyrJi23XHHb5OtlBIW+ZYitgAisc
         D1Es2NMPGk5SJhStSVKkSrJbQD3AkPzDHYSryAWTp+n6VW++lYAVpd+PoVeIAwrC21I6
         b44SeLhzRhZpb1mBfCvTFPcgXCWbjn/ge8e5lIa/9gPP3DazTyvLP8vSJ1ubLgh/JLow
         37oQ==
X-Gm-Message-State: AC+VfDxa7o9uuJoXzJBqip7b6bPYC0OOkvdNMlRa9SlY3/6p2DJPSK2X
        ULvblp/r8/eRkGc42QDJOL2luA==
X-Google-Smtp-Source: ACHHUZ67/smOf8ihbVtI+96ZqJH8SqDguoqxhAr6nWP7ZgonkmQvW270cRUoj0abDxlenEg3q9kV2Q==
X-Received: by 2002:ac2:518f:0:b0:4f4:d45d:1616 with SMTP id u15-20020ac2518f000000b004f4d45d1616mr1015233lfi.67.1685614127627;
        Thu, 01 Jun 2023 03:08:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24a83000000b004db3900da02sm1037672lfp.73.2023.06.01.03.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:08:47 -0700 (PDT)
Message-ID: <327d8f65-f6e8-fbb6-a159-2db424b29b0d@linaro.org>
Date:   Thu, 1 Jun 2023 13:08:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/20] interconnect: qcom: sdm660: Hook up RPM bus clk
 definitions
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-11-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-11-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> Assign the necessary definitions to migrate to the new bus clock
> handling mechanism.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/sdm660.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

