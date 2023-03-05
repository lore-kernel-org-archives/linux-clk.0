Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE223C6FA8E
	for <linux-clk@archiver.kernel.org>; Sun,  5 Mar 2023 09:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjCEJzN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Mar 2023 04:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjCEJzK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Mar 2023 04:55:10 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261F4D324
        for <linux-clk@vger.kernel.org>; Sun,  5 Mar 2023 01:55:01 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id cy23so26840580edb.12
        for <linux-clk@vger.kernel.org>; Sun, 05 Mar 2023 01:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678010100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3Mz8nGSypISQ5Iob2JuXsUI2Y6N6SPOQnq6dbwkLTE=;
        b=eG9Xw9uQnFHiva9f5dum6CQkumtzYV9plb92VS1a8qYzFomDfrCfC35VI6YfXQ5fhC
         NfiYiqT8sfGCd/5BMfXIFyq5k/owyRT8POPqryozvMyrb/n0hHTm3HqtkxDa/WBieq1d
         fPgDS9Ygl2nXX/8CUr1V9+xZUklEwQVqputF0Cx3dz9SPot8/njTXJoToWkSH6RFwAQm
         KnSpkKcFjLMOZ9l3e+dWEE5LdGdwWBYV8E5KHHmnwBqza+C+cj7m25K53BirlDds69K9
         vB2u9ZdRXgx0TX0TgxQtMC6exTgXKlRGqZ4TcNCKqH3zpg3R5jJywj9c7ux5vuTaJ8vy
         B5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678010100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3Mz8nGSypISQ5Iob2JuXsUI2Y6N6SPOQnq6dbwkLTE=;
        b=oXHMkAs3EORO7Xly/8AR68UaB0LOU9RuFAK3zrgIk/xu8ZXrnRLotm9U1ryo+hvG78
         OHwxDOiJkaYKOgSyRzqOTIEQZdJECabCjHdk/VnEXnRdGn6ul+mph5JOxwxVUo9Xkyem
         2VVTJgS3eAysiKiFcZ8QmPtLSkWJ+Llkxg0W3YgZs08gufW2aJP3h5KECnlqeQG3xvbb
         y1z3WdO5cMwBCCmAOSL3Tx386aDkiSBwXOF+EtzWi8id+w8KaCGV1MUcafUyHv+NKdBC
         udVYASO7AGDM2ei6DMLh4jx7gQlGzn7w8DBI/b3tJ9Sh6IIIKp7Wi9oLBtkEtRbZswBl
         kuog==
X-Gm-Message-State: AO0yUKWjnow5udR9MFPUdEPR8SJyYStOTnDUADiBZzXSjSDjEV2cRnvQ
        r5hc/3TIw0Db2aL1sdUEcjeLMA==
X-Google-Smtp-Source: AK7set80nCfgRmhYAiNs8HixNvxmB6fcSKTKascs+iD8glJ7/xFifsreyHUtbTMrnEsxOVn3YawkHw==
X-Received: by 2002:aa7:c0cd:0:b0:4af:59fa:2a20 with SMTP id j13-20020aa7c0cd000000b004af59fa2a20mr7653723edp.15.1678010100459;
        Sun, 05 Mar 2023 01:55:00 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090648c900b008b17b0f5d07sm3017195ejt.217.2023.03.05.01.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 01:55:00 -0800 (PST)
Message-ID: <c7f26dcc-ac39-ae5f-8642-34814a22b9fe@linaro.org>
Date:   Sun, 5 Mar 2023 10:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/6] dt-bindings: clk: Add Hi3798MV100 CRG driver
 binding
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304063333.162309-1-mmyangfl@gmail.com>
 <20230304063333.162309-4-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304063333.162309-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/03/2023 07:33, David Yang wrote:
> Add CRG driver for Hi3798MV100 SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.

Subject: drop second/last, redundant "binding". The "dt-bindings" prefix
is already stating that these are bindings.

Drop also "driver". Bindings are for hardware, not driver.

> 

With both above:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

