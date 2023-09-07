Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3DDEC874B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 17:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbjIGRXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243905AbjIGRXB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 13:23:01 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381AA1FE2
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 10:22:31 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so13553265e9.2
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107288; x=1694712088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y6zFmhlb8oBiHulr6SNzDGIOTaQJEEOwxmUItsSBI=;
        b=FU0e0le3QDzntwka15fMhUAXDeLBVLSwPGf/Y51t/1s6n2DjsGIe4IPqg9X1D1HP21
         Rlyy0wEXpKf7WcGQ4oQKM2gwOk0KXIJouLVNNzDjEJkP0j+OyuLCj0BpRMCHl1hxZCS2
         E2fq2z6avKSWvxfOSta61d2dQD8fVMhbWJ5di7XCMucNRmF9jtg/wCR2kpi1v02CilIZ
         F9K/Sz4IJZ+WWvuSbOjgKNvcRqqcgqcWj+ys8X2QCgYZ3f7W1br9R7HcSsa153p0N9Tx
         5cLtdDcgDqsPrvT+9oUBb64JA+jUA1fF/v29Eqr9PF28wXLfI1Vgbi8V9QfFiLfmop6z
         UaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107288; x=1694712088;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y6zFmhlb8oBiHulr6SNzDGIOTaQJEEOwxmUItsSBI=;
        b=K4+4HjxF83MbfEk2YTUcgzaqG+AtYbnPOn7o+Oua031sAAOO0Y10GaAtT/8ECWEKM7
         n/blTGHz7ebLkMeJpGG6DIx5PX94GG7RqHid1Sm5sudCfp2VSFozsBN9QIJ60kgPvICZ
         NX9lMAy2fZuXeEEdQIwNvl3K1aYuB/bnR6BkiDBu7glv7WKI7q44olkQYTQNCC8PykNi
         ZtXPYZyySJlnv2JE8EFVWbs82g4OmTHjJazEpLCKw3tKba8QjDTBxdc26oy3tmW9S59h
         JozFxpSIuvL2Xy+FWEFQGtfUc6FehBPo6FLZHhdiDQX2cchWl3h1z8sFWeI3vGnhV2cy
         9uHA==
X-Gm-Message-State: AOJu0Yw+DJ7smXG11/H0J7Ida3ooe9ExPwheMS67wwKaSFs0lEjcfnGa
        BkTWnb/W3Heh/14eN49JUe2EwcZFEGHthhdWz6O19A==
X-Google-Smtp-Source: AGHT+IEKmnSNSlUtiCWpMx5epfLO+Rm4w2bJrzAa6Be3omHD0KXp967h3WlCKIuq9OnSAsdvXE+3AA==
X-Received: by 2002:a05:6402:3c2:b0:522:2dcc:afb6 with SMTP id t2-20020a05640203c200b005222dccafb6mr3798766edw.7.1694066597001;
        Wed, 06 Sep 2023 23:03:17 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id t3-20020aa7d4c3000000b0051bed21a635sm9237337edr.74.2023.09.06.23.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:03:16 -0700 (PDT)
Message-ID: <3f68d3bf-3273-2339-ea41-3362ced3c91b@linaro.org>
Date:   Thu, 7 Sep 2023 08:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 05/10] dt-bindings: cpufreq: qcom-cpufreq-nvmem:
 document IPQ5332
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <8fe23b5401362e214078648926a00f7ceefaa542.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8fe23b5401362e214078648926a00f7ceefaa542.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> Document IPQ5332 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

