Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D017C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  7 Mar 2022 12:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242011AbiCGMJ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Mar 2022 07:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241650AbiCGMJJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Mar 2022 07:09:09 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE35D22522
        for <linux-clk@vger.kernel.org>; Mon,  7 Mar 2022 04:08:03 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AFB533F5FD
        for <linux-clk@vger.kernel.org>; Mon,  7 Mar 2022 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646654882;
        bh=SscxEwLtn9PbvAHFFvVc1pe8Q22Jf93pqrW7gUvO01I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QMno0OImdh6pJucm1E+XESX120IXOV7isfqvUfk0f/z0Pgz3svbXI2UowGM8Mya82
         IpqJdwvPmjgn4WVs5R1uIy2aYfq0toWY+AKA6+CsNxXnEVIsnEitnkwYJIrHgeOUe3
         dTfE3jX3ULjChux5Nl+7Trv8ATj4QXoMi51HfLb2iI6ayByi1erouAgAW1Uh0GcsdO
         n8jojhcxwmPqTeqnQR41suU6iU2VF9T+VCFNsQP4mJ/oqbHfQTkpxYIQE4FJSHGtiF
         PHv0UuNhatbQIH+T/WYGU313Tg2/OMsL8FgaTF0lr/E1IGhzdCzk9bUKBjtitXzORG
         E7BQxAIPVJYoQ==
Received: by mail-ed1-f70.google.com with SMTP id u28-20020a50d51c000000b004159ffb8f24so8503167edi.4
        for <linux-clk@vger.kernel.org>; Mon, 07 Mar 2022 04:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SscxEwLtn9PbvAHFFvVc1pe8Q22Jf93pqrW7gUvO01I=;
        b=NfkXlh9r8XQPOmnZb21wnpWgfMSI09bad+zeDionQrGxaLmMw68Nvlo5OoATom61i6
         HVYLVZQjQRkU2a3NNSH5byEjzmSz142Sd1EahGs1/6YuGfK4AVOKYL/9f9JsmjXc97pI
         +oWzha3gHxD2B8HtbtNGag21stYSYc2Dr2l34GSXsgs3ew5jwh1dRsPMOaiF0P9nLi1L
         7khtn3q8AQoYUPSwu/DSuetCVu+XFafZVcaEqnFQjjzWVPYeKtjtm9CvV8YBRenfexJN
         GtKkLQdJ31q0nzs7T+rlB2NBcG9oBj66v5kbiOH2u21Hrp36LWUh9nIybaguLiNpbtXj
         5j1g==
X-Gm-Message-State: AOAM533BFVNmeCz/pObOR8mat9legqGUYq7O01hL9RijyeOJK1il3axI
        9mFKSmqgJ2ej6bAIvHss4UtXMn/Ffli3rkRcg1vBqbA8HcNUMJfLRY90M+sU6Z1mdnbUpLezDpK
        khhPO3JaBh1Chng3AO5MGrwjiW+8voucTfIKSkg==
X-Received: by 2002:a05:6402:2142:b0:413:6531:bd9e with SMTP id bq2-20020a056402214200b004136531bd9emr10668119edb.5.1646654882229;
        Mon, 07 Mar 2022 04:08:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeYcv2RExIUxa4m6LYCf109OdSC39ae7tloduW06t1udVnhgFmzNLZ7nIj+qIN66EcU/FmYA==
X-Received: by 2002:a05:6402:2142:b0:413:6531:bd9e with SMTP id bq2-20020a056402214200b004136531bd9emr10668084edb.5.1646654881932;
        Mon, 07 Mar 2022 04:08:01 -0800 (PST)
Received: from [192.168.0.142] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709062ad300b006d1289becc7sm4598993eje.167.2022.03.07.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 04:08:01 -0800 (PST)
Message-ID: <87c050a4-6f82-08ba-e06b-168e43efce15@canonical.com>
Date:   Mon, 7 Mar 2022 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2] clk/samsung: Use of_device_get_match_data()
Content-Language: en-US
To:     cgel.zte@gmail.com, s.nawrocki@samsung.com
Cc:     tomasz.figa@gmail.com, cw00.choi@samsung.com,
        alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Minghao Chi <chi.minghao@zte.com.cn>
References: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307033546.2075097-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/03/2022 04:35, cgel.zte@gmail.com wrote:
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> 
> v1->v2:
>   Add a judgment for returning variant to NULL

Changelog goes after ---, not inside the commit message.

With commit fix above:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
