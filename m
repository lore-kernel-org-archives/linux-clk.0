Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C039C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 01:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiJRBCf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 21:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiJRBCe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 21:02:34 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F8879694
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 18:02:33 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id b25so7798981qkk.7
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orFSqE2BEwIkJmytrqiupr4Ypb+zklxtz9GR5dOGZmQ=;
        b=aTnXXdxYPx1sRm6BnUdhvTTcYSj2rnidRY1jY422VxRv+ju+i5PvJhvC7aU4LuS97S
         GhnlLAPkozGf77rnwSXRmEl/yWM9ZRqpZ+vAxWEjR5dAtH1uyqSMSc11hwcpJrN2Y6u5
         bwOxesqYiQYSiMId2oo8GoKKu55lUoAKWMRLLxM4mnTXYCYhOOwSkn/U8mVei5iJW32s
         DHUj+zkWoW6mOWi/Fq6BtAnYmOkgwxxw2gCYgr/YlbE7+l7HAqHcx75ED0/lc3k4DGiU
         3GQaEeCtFeHrnnea6HqOiwZae4AN55tkKyxYudvnLHnepQ9Yu/nPPx4xAJEDd4OrOEZq
         haYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orFSqE2BEwIkJmytrqiupr4Ypb+zklxtz9GR5dOGZmQ=;
        b=ERDFXwY9k/AghWV9HKcPEQ53mdjklYMXxI4e74L1p7wCJBCrHGz76KdgcTY74wByeZ
         /WYxRlZAphCAyylNABdjFfk2SAgakIogf1E9Le+DrHWxzamDiqOxCM8HNiNj5ikQhfon
         jgAbHSqdV0oJeYXyFMqTLTUv4eoQ3RDDykT1vM0/z1i3RrZjPf4Vzs15a89ZxWEskILL
         NkAwmZ0VWO4PPvJ+uEYuQqyWPPFKoykozMKaCRVakhpRkiAwvHtH8wrKUMxTZENw583k
         bIB5xEyfigD40SQWrHQMY9Z1+5gqmo/dfjD6h3jcA1KylaTB55EsltbB7LNO+ust8FbA
         IL+w==
X-Gm-Message-State: ACrzQf2jSzILQTVal1agrEnBHaUv8ieqYXHeC0liBc4pSiz67dSYGCEg
        SacVsqtTBxfdz5DXcDRRwY1pyA==
X-Google-Smtp-Source: AMsMyM6eRS8wZHL6RHm2zlZvUxxzBYUanEWE+zoFfrmAR2ebdTHaD+w8Xc9EJYj4McYsAAJUD9ENcQ==
X-Received: by 2002:a05:620a:244e:b0:6ee:d8f2:6d56 with SMTP id h14-20020a05620a244e00b006eed8f26d56mr267023qkn.380.1666054952664;
        Mon, 17 Oct 2022 18:02:32 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s6-20020a05620a0bc600b006e6a7c2a269sm1224306qki.22.2022.10.17.18.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 18:02:31 -0700 (PDT)
Message-ID: <c2aacd7c-1773-2ca7-415e-0b3ec7b5ef02@linaro.org>
Date:   Mon, 17 Oct 2022 21:02:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SC8280XP display clock controller
Content-Language: en-US
To:     Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926203800.16771-1-quic_bjorande@quicinc.com>
 <20220926203800.16771-3-quic_bjorande@quicinc.com>
 <a8bf3887-b4fb-1f60-14e4-998f71b84181@kali.org>
 <bc96324f-c560-3baf-a771-beef6955a537@kali.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bc96324f-c560-3baf-a771-beef6955a537@kali.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/10/2022 20:51, Steev Klimaszewski wrote:
> Round 2 because the patch is too long for the mailing lists, I hope it 
> is okay to strip out a bit of the patch

Yes, it is okay, actually expected and much better way. There is no need
to scroll a lot of message looking for a tag.

Thank you!

Best regards,
Krzysztof

