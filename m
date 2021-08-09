Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687FDC432BE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 16:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A12560560
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 16:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhHIQIj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 12:08:39 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44342
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229502AbhHIQIi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 12:08:38 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 418413F345
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628525297;
        bh=dYynETD7e7Go9Y3JtAn5FrP3ZxbiVg1MuIylXG2rAf8=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=pyGhmHpfOH+p4Aqapn+twQco7LEoCG1gYBl9POr4f3LhdJt70NCdLVLm2jG6Yfz10
         9pPa29XIwscOAYrlr3ik1qI2zXlFlBJwA2/43BIWwgivjg4wzQ+UHp8wfOjq1Hg5Af
         JG/B+Q8mHKGZ2kNX/5IcRieQB1Ks0ZLGl+Lzjh1pQc+lObEtpThMzTWeD2kg5FiSV7
         IbwV1UAOHdTGeJjhcNgHiSvI9lhhRDDGndh2a8A5Lwvhb1W4gD4n8ZUMn+ixhMfwra
         n529bvMH3EaywjyK2xwQUxn1iuAHpIx6It3kuY2Rd+yZHTYeJh+McDhiFcbMZQ7ksw
         N9dJhNtVCzc1w==
Received: by mail-ed1-f70.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so9142754edu.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 09:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dYynETD7e7Go9Y3JtAn5FrP3ZxbiVg1MuIylXG2rAf8=;
        b=tWIY8ZONrSoUXULljLrXe0MkbAzYUECFVlmF47fdPasgK5Yq+XCmiwf7kC93nBxWud
         l+TR8NPEIXOeCsH73WqpuV/0DmGaMx7cPu9rcryiMw+1wBnkcoQ5Z9Y1FYRXz3sYiSra
         QvIX5DvNKhOzLwT4uqzux0mNnujuCOVZUiulSyXTJRdH+BKXXeMQ8Cadeg+EZgfT8Oz1
         8rifohwoadved9XLCZpVnJErVUZ/+3cGkrkgVcPsg6/TPDX9H6zcC+n53dUU/UI9v9xu
         jha84/xZbIwSjBLAkMvrkrqWswu4P4Nn0QIUFrcCAYGqUgGogJWpWg6AJKYGjUgFmOZw
         tPQA==
X-Gm-Message-State: AOAM531r7nBCdO6VRKgB5PNfbYNcOXftCxthEG3fZWMUpVM9QysqDkHp
        VNOnFL3b55euzsSvNt3IzyW1y/UtXGW6vioL48E72ljcoJuI195rOUAXl1i8rYChwcl2VsO2MpG
        Hs+NMHl8noKvwVQbUbbdO/MTbkuiXdx+tyvKwwg==
X-Received: by 2002:a05:6402:4246:: with SMTP id g6mr30558358edb.95.1628525296919;
        Mon, 09 Aug 2021 09:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqPYbBDvdZ6Zu8eRL5FMWxXMVz1K8C56iPevCS7X6zyD5UDOu9mh2jlErjtcaIA6EgN/i2TA==
X-Received: by 2002:a05:6402:4246:: with SMTP id g6mr30558336edb.95.1628525296752;
        Mon, 09 Aug 2021 09:08:16 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id m3sm8239214edb.7.2021.08.09.09.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 09:08:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] dt-bindings: clock: samsung: convert S5Pv210 AudSS to
 dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
 <20210809135942.100744-3-krzysztof.kozlowski@canonical.com>
 <1628523608.157762.3895394.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3ba3aeee-7ee2-2b38-397a-71ea1543163e@canonical.com>
Date:   Mon, 9 Aug 2021 18:08:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1628523608.157762.3895394.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2021 17:40, Rob Herring wrote:
> On Mon, 09 Aug 2021 15:59:41 +0200, Krzysztof Kozlowski wrote:
>> Convert Samsung S5Pv210 Audio SubSystem clock controller bindings to DT
>> schema format using json-schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/clk-s5pv210-audss.txt      | 53 -------------
>>  .../clock/samsung,s5pv210-audss-clock.yaml    | 75 +++++++++++++++++++
>>  2 files changed, 75 insertions(+), 53 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.example.dts:24.31-32 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1419: dt_binding_check] Error 2

Thanks, I'll fix it in v2.


Best regards,
Krzysztof
