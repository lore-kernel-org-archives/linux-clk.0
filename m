Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7052DEB64D9
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 14:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbjFQOoG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 10:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjFQOoF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 10:44:05 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B581BF9
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 07:44:03 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so5834702a12.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687013042; x=1689605042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KK2+YFUG/6HmL4tcdhB8f8ESWlAE0VcF40UXIVzAPuo=;
        b=uRkenpha2+Snmt2ZqLpbiOEu7lU0WybjKCO73iSIQE8Uu9AevsrBAAIbbG0jobIoie
         g1X3Pql5QlV4aL26S5MbUKVwefxWQP7+8omvrHKRjkh4H7ELph0Udn54Li/0lDgjwCjz
         PKR1MjnETnS7b9yTta1/+kYxnHiLBYp0cSv97Au6wdgGuNkOyQ+FLyNHRIHcaRlqoXuq
         abDbL99zb0WRxwoOpWlmA6KtJyPIbjBaamsFOCKdKIA82V2/tP9XCLWW6k+1D1V7hokN
         JvkjhCZb02tFrqVUb681zLCIW/9T8jSzsSTZxXO1zwQhBCFGCOfmfWJ/qWP3NzUOxo4h
         A2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687013042; x=1689605042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KK2+YFUG/6HmL4tcdhB8f8ESWlAE0VcF40UXIVzAPuo=;
        b=ihxks7AP9PFKxA2y/0XDwOSzZ1C8kpf8DgjjG/tC1g4Ya1Y0cS3rwhhMRsP7WBiAcZ
         IwsHBlCuoqdl7blK6mkmFBb66FLJHjqJbEe0R1f6eDr5d2tYTXPZ6EOOS97kF1/rlucs
         5FzrH5K7butJIPBEaF34N5gOSvB9XTMf+SAKuJwrlBQeBS+mNow2taFBJ7Zz34w0Dy0F
         H5vv9v231lhNVtkGhOtisT3MDAssq+XyyuoxE1uOJA4c6btvgOlhhhPA0cgBnOwX2tdg
         sE1Vm1YUZPHNfdI44oFsp5bKVmQrHCJunrsq4TPR4Q1rq5VwWx07qt5AhouOY8AI5yks
         g0uw==
X-Gm-Message-State: AC+VfDwQfypQRtYMeqDPdxoYSYYranRD5+sl01OxrItZukwY6U/crtE0
        jsGvfz3auGzFK7Hg6AC14y7nww==
X-Google-Smtp-Source: ACHHUZ5Fu0+bj+UPlLd3J6AJvxrm4h1iSaRendUhAIKFPorvmtKoMwQaDwq/rbuf4+ub5GoxYwYsTg==
X-Received: by 2002:a05:6402:18c:b0:518:741e:9314 with SMTP id r12-20020a056402018c00b00518741e9314mr4660226edv.11.1687013042132;
        Sat, 17 Jun 2023 07:44:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00514bddcb87csm11293575edr.31.2023.06.17.07.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 07:44:01 -0700 (PDT)
Message-ID: <a61180e8-5732-2208-3a0c-e2b0137f9290@linaro.org>
Date:   Sat, 17 Jun 2023 16:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/9] clk: ralink: add clock and reset driver for MTMIPS
 SoCs
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Shiji Yang <yangshiji66@outlook.com>
Cc:     arinc.unal@arinc9.com, devicetree@vger.kernel.org,
        john@phrozen.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, sboyd@kernel.org, tsbogend@alpha.franken.de
References: <20230617052435.359177-3-sergio.paracuellos@gmail.com>
 <TYAP286MB0315AB8274CDD341D49809A2BC59A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
 <CAMhs-H8rt3-ffvjkNSORiNXQUVCUHCc7FNwYN7TOyQ0DxCe2fA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H8rt3-ffvjkNSORiNXQUVCUHCc7FNwYN7TOyQ0DxCe2fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/06/2023 15:26, Sergio Paracuellos wrote:
>>> void __init plat_time_init(void)
>>> {
>>> +      struct of_phandle_args clkspec;
>>>       struct clk *clk;
>>> +      int cpu_clk_idx;
>>>
>>>       ralink_of_remap();
>>>
>>> -      ralink_clk_init();
>>> -      clk = clk_get_sys("cpu", NULL);
>>> +      cpu_clk_idx = clk_cpu_index();
>>> +      if (cpu_clk_idx == -1)
>>> +              panic("unable to get CPU clock index");
>>> +
>>> +      of_clk_init(NULL);
>>> +      clkspec.np = of_find_node_by_name(NULL, "sysc");
>>
>> The node name should be "syscon" as the example node name in the
>> dt-bindings document is "syscon".
> 
> sysc is label to get this node since it is the one shared by all
> different dtsi files.

If it is label, why do you use it to get by name? name != label.

Best regards,
Krzysztof

