Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F21C61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 08:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239336AbjALIk3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 03:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239247AbjALIjW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 03:39:22 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24F633D74
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 00:38:55 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id hw16so31113450ejc.10
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2MNWyXB7VrWbVzJQsnav8QmTtvtuo95UZG0nlSjZ2A=;
        b=YvMUyp4i4b09kRs5DZXY9qsK/SIoiI106V4Xx0eoJC9A642eV7V07HBrlVdRDQFM/j
         2Bod68H6EvXEsYW0d/B3ifQW5o6ROi1zolFm7/19zDvl/PJ/0gaIODDPRrIJp93BADoH
         xdhWRTs50JXDLpooWOKWX/+B6ZmIqVDSoBXpdH9NOHiaK6Gwo3h7pRV7zgikuwYORbzB
         KDF+75yB/XKm2uEbf2zvUjidKMBvFTymiO9lGhyWHaMPDACIqgHRX/R3Di981bdFyHrD
         RIRpnQFTI+9EdowbdJei8KuemmCeS7FhhrUxYOUkOwweZCwFzfXlIINuLjBzyQBXPH6l
         IKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2MNWyXB7VrWbVzJQsnav8QmTtvtuo95UZG0nlSjZ2A=;
        b=iaoN0mV2JNUpt4gjiTirbi+4FXCcCiWOHFITdtGpK2rUD/ZhIwoNV9SeFyHa/uU+Zr
         Mk44SUHB6R0IhJgh+OXrY6kWSAG0V/o6DgXA5i7TUhkegPaWBin6QYcW0OLwQv/FxRwY
         gYEakCGuaqLTm6uWfyeQvzM15NsN6zVrc97lDKCq0Ao3DjrtH08VtsF7DaYfqgSL8MpF
         tjfVK/LgHpdaNiMenOyfvhOhlSrZuUIOEHjcwG6VpF3t6PQEBNzKW5Ys4jUbhI5cH84j
         8MNPk3tBhj/Y5S4+MXakUUzIA620J8ua38H3p1zFlAZ/SKJ9y/uhkcXm4QYXMkLzqVoa
         9qBg==
X-Gm-Message-State: AFqh2koTWVlOJ2pUaSuIfRltQBI1U2BVkUx7At6J+tysaFCn5x9UQKA9
        SjhCLSym5QJpLadXwL7jQadnGg==
X-Google-Smtp-Source: AMrXdXuLXb8mazgCwccFIsl4I2twUlKO4egUyv1CWBY77YZ2PXe5wvB4tLMY9cIRGb7fo6nc7eZNAw==
X-Received: by 2002:a17:906:d051:b0:866:9c8:570d with SMTP id bo17-20020a170906d05100b0086609c8570dmr1364370ejb.55.1673512734059;
        Thu, 12 Jan 2023 00:38:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906311600b0082535e2da13sm7136237ejx.6.2023.01.12.00.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:38:53 -0800 (PST)
Message-ID: <fbeb2433-7b32-6323-6292-21a5b05aa12d@linaro.org>
Date:   Thu, 12 Jan 2023 09:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/14] dt-bindings: clock: qcom,msm8996-apcc: add
 sys_apcs_aux clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
 <20230111200128.2593359-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111200128.2593359-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 21:01, Dmitry Baryshkov wrote:
> The MSM8996 CPU clock controller can make use of the sys_apcs_aux clock.
> Add it to the bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Best regards,
Krzysztof

