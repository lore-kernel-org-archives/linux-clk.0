Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0092BC433F5
	for <linux-clk@archiver.kernel.org>; Thu,  3 Mar 2022 09:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbiCCJiV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Mar 2022 04:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbiCCJiT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 04:38:19 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528B42647
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 01:37:31 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A3C53F5F2
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646300249;
        bh=WN0fHS1E3WYhaNTMIUFWDS4nw/cwGpcpJ5Ec381RmGw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=k2hQd24JScVsX1Ixeq9TUSFbK+09EuipWJSvhrcFxsesEMJRA1ua+PFjHnBkjr6OK
         /t9uIioomzQvwHGpaOqY2za575U+Mf6im8w15V5OHJ6s2ayW6MPo5IHlj5UmFhtuxP
         IsoMKSadiSeA+cj5pQ9MWWgDCt5Nbj5txVFPBAWdzxRWiuLElp4p7Jxk50ROa9AgUH
         g+nQoBihW9a2kDMYd2lfoRPjcUQao4izqdpCTqtLOCY5tlAzjqB72e8IclZAneFzao
         q1VmLxA4KNFaD5Fg8szB8m4sVgr+DN6+Rwtattize7kpHOVEOVWKHQPEh0g33SoP9j
         Mn1sC0L3WMB9Q==
Received: by mail-ej1-f70.google.com with SMTP id qf24-20020a1709077f1800b006ce8c140d3dso2427690ejc.18
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 01:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WN0fHS1E3WYhaNTMIUFWDS4nw/cwGpcpJ5Ec381RmGw=;
        b=ASdSgfIQPoByQU8qh3O/rtC/e4BbuhIYFeKtQxlE1YTbRNmauT/PvzJXCs29iaaOmB
         tQGItGo6SPwpop1WjGhvcqmxA3b79JHk0vXrVFaFrZluv7vV+ZlvFdAqYRDUsLo/y3gS
         8KEo/o28E/7TC4ocXIa/9rKhJ5xPZm6zr0/83D+4t2H55OK+pHnY6XYFtA2O/kKDWuWN
         gUP+MaYWuT8Btmb4IV7wrOBGi5Drnd/c+7RhsxOPHyzx6IhLU84LHnY0FsnMhbh5mPCH
         jhfkWhtACh/rQGa0Le/CovlYaoh8VxiTwN3hLz2HzJ4HtJ8MW8vthTga+h/V30/gM5C7
         Nqmg==
X-Gm-Message-State: AOAM530OQ5aSfTuTnHQIV8avMfexzMDFUMr6tSVyqJ+7gc9eU3xkKlH+
        W2/rAzg+kQFM8RjTU2xa68triW0TS7Qnt6d+2hL9cDX8OpJYDvhzlzBeZXmTursAoMvYKDHWXlF
        3JHGFYIMh98bqWQe5/OL1JhQAToMjzgQ5Mo8Tvw==
X-Received: by 2002:a05:6402:d06:b0:412:eafd:8b9a with SMTP id eb6-20020a0564020d0600b00412eafd8b9amr34091224edb.278.1646300249136;
        Thu, 03 Mar 2022 01:37:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEOItBLjufIOG9pn9AcKVKBYrCqc0esYl+3bxjYohOhF8iGM2MCH5hndXuQg+/CTNrvTsxYg==
X-Received: by 2002:a05:6402:d06:b0:412:eafd:8b9a with SMTP id eb6-20020a0564020d0600b00412eafd8b9amr34091202edb.278.1646300248959;
        Thu, 03 Mar 2022 01:37:28 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709066b8200b006bbea7e566esm506462ejr.55.2022.03.03.01.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 01:37:28 -0800 (PST)
Message-ID: <77a147f9-794c-83ca-070b-fb17d665ed8f@canonical.com>
Date:   Thu, 3 Mar 2022 10:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clk/samsung: Use of_device_get_match_data()
Content-Language: en-US
To:     cgel.zte@gmail.com, s.nawrocki@samsung.com
Cc:     tomasz.figa@gmail.com, cw00.choi@samsung.com,
        alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220303092223.2060108-1-chi.minghao@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303092223.2060108-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/03/2022 10:22, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Where is the bug report to be credited? Where is the actual bug which
justifies usage of "Reported-by" tag (it is *only* for crediting bug
reporters)? Last time this email was invalid - why do you add invalid
emails to commit log?

NAK.

Please resend without this.

Best regards,
Krzysztof
