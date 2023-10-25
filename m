Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490E5C25B47
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 08:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbjJYIql (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbjJYIqh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:46:37 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 569A1136
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:46:31 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c5056059e0so82068611fa.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223589; x=1698828389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/qDJt2TktcCTAjVqQQhY9/t4tuTrwTtLlHAGkujnds=;
        b=L0rH+BHDTRJltVtYgGHibtc2kAhZRpfQzX17xTaf3FYZUoehotgfexGZAO95Qkwgfq
         if397bM3mt7YLJHPb9Th3IP1sbeuZsdX3XZf+kkLx4vtkpl6VfEV9fsQh2XbAMNvelsw
         V/pCYBedExVegIoHtCxuAUWLdj/sF3a1pWr97uMFh5w8PsADJLZKUYcIAzmJ0eVmlb9W
         i4B4iX5dUBtNbOQX+E1BpVoKcK9CXXCOoMkzDqhcjpWqnXateDLDRMTqGOyf+vRMVhJ6
         +BSZdyfHti2XZIRpvKvSAvDVxt9sTyQr60Ys9XjWypganqFvsTgOnaIFJeNic1AmF3Po
         2VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223589; x=1698828389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/qDJt2TktcCTAjVqQQhY9/t4tuTrwTtLlHAGkujnds=;
        b=dNsya9P/cu7+NIUgvJ9hrqTbb+WtcSiIxmCOeVvP5ltY/Gd/DtVaIGlzjvnw5Vqjw5
         sBhDpktx2JkCSDNOaLHEfW7uQh6w/KAvnP7wcZTZLBXnD00mSACfB7fAD0TJ9d0+90zN
         gxrUJV3Qzki2iKT3QADf/+hogElOY1Qx6itxx2sXQPFluKhL8Z266soiy6l54yM31Gs+
         ChFM44R6n7E3rT+Uy6jnUpNvNnqt+j6XxpgVs//+R3crNwTyJfOIjRWhZdOoTVUeC3ye
         bqCRlEhxuXUvUnWmDKpMBegxxG2eDuA+YVm6+UUpH/W/HdUxta9dsTxLmr2xpKP1XsJT
         Qpnw==
X-Gm-Message-State: AOJu0YygbxvY3rXqnjA9P/B97ofiTRaU5klFMBsMMLyoiiGDuvwnjF14
        kXTInuhqEFCEJ8Qo6Bui7dnRLw==
X-Google-Smtp-Source: AGHT+IHrkSVsX7DyHcQJ6Dgs3IFMRhs0xM2WvS141qWk0u9YzRxXAMgcw/0DND/s9rBxWOKyOBFj7A==
X-Received: by 2002:a2e:81cc:0:b0:2c0:2ef8:9716 with SMTP id s12-20020a2e81cc000000b002c02ef89716mr10491238ljg.1.1698223589554;
        Wed, 25 Oct 2023 01:46:29 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p13-20020a2e9a8d000000b002c5122f13b8sm2320875lji.30.2023.10.25.01.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:46:28 -0700 (PDT)
Message-ID: <73409bba-b27a-4c8d-af4b-9efb4c0a5efb@linaro.org>
Date:   Wed, 25 Oct 2023 10:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] clk: qcom: add the SM8650 GPU Clock Controller
 driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20231025-topic-sm8650-upstream-clocks-v1-9-c89b59594caf@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-9-c89b59594caf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 09:32, Neil Armstrong wrote:
> Add Graphics Clock Controller (GPUCC) support for SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
