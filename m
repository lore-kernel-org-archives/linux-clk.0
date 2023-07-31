Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148D3C04A94
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 07:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjGaHKa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 03:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjGaHKD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 03:10:03 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13DB1725
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 00:08:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so874020066b.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 00:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787293; x=1691392093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mG/2HxcAIk6z1uz1JvaPUjuQBhvN09rQwMA4D+YrQLk=;
        b=f07lG0sqQE8vuiqGwtRI3plpKUYZSrIcqOkwXmS+k6MUUPb+JRvmy96RtLmLTICRmw
         zqEOZ2qBW/QEIjGtF27s33hpHx+8zAizl9taILHTNMIjr2GjxkzmEF7IMRZ5aLqjy1eL
         2QMBVyCXXsKBxEJz0jCCtss9aUgAe1bTiyKs1G0sFAUQNscRl151oowsGsa3Q5vPQkSB
         sxE6b8h8xMYu2QLfmCnPTQkNE4xuhs31rxSHNsYGQCegl2GprVz/79wB7lc6ChCCTZA2
         EGT+9R6O1l+tz1ERLIKSmU3mFfNznRLhJul5IoBJ+KEjaAhLbJeG6RdkdnGuLO15EOu+
         jo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787293; x=1691392093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mG/2HxcAIk6z1uz1JvaPUjuQBhvN09rQwMA4D+YrQLk=;
        b=cGLm5MROgp7Mx3gjH5JUR09pLB8deBibyFGBM2eYEjg9wgahPqVrh37TEBcVAfxn5v
         feIHyi+x9qc1z9ZXncKbxL/YYDcwnXizxpsEuy047fFCLw1waHXibtO0Nejc8Zx3dmfy
         OnQ70qZuLNPWpCjjHQATuStQLFUZQ1Fq+i8EJ5VVnkVIptz6XHxOKrgUxGlHn/0fwj2w
         28a0Apt/4nAKqiJ3rkUEWNO3yJDCXk0Zl+Idy4iaLtPnra1eOgLt2RsNoJyfyrRvTm56
         u71VwJ8dbapfQK+XxjaA9YDvGB4RUv7rPPH0cewDv83eYPmz0Kqy1e/WHQjEoONNUkVc
         G8Ow==
X-Gm-Message-State: ABy/qLbZ+n68VP9XR1d4HcMfIWDwd/oxJn3Tm+f3KX93CP6u5n5aK3VS
        LvsbAXB7XLeF98O+tWYT6wtWYA==
X-Google-Smtp-Source: APBJJlEDszrkZwqPnS0BlylIsnDkBmB9OkzdNsVs94MxLXP2D2hJAu5Mba7Z+RIWI5Agr6jCLrV7JA==
X-Received: by 2002:a17:907:a052:b0:994:1880:dc32 with SMTP id gz18-20020a170907a05200b009941880dc32mr6644297ejc.17.1690787291452;
        Mon, 31 Jul 2023 00:08:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id h19-20020a17090634d300b0098e422d6758sm5697057ejb.219.2023.07.31.00.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 00:08:11 -0700 (PDT)
Message-ID: <e3d692d9-82a3-22d0-7fa0-4e89876ef8f4@linaro.org>
Date:   Mon, 31 Jul 2023 09:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 4/9] dt-bindings: clock: Add Marvell PXA1908 clock
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     phone-devel@vger.kernel.org, afaerber@suse.com
References: <20230727162909.6031-1-duje.mihanovic@skole.hr>
 <20230727162909.6031-5-duje.mihanovic@skole.hr>
 <fe60d09a-aa79-f3b9-cf9d-e8ae8ff58d09@linaro.org>
 <2897221.e9J7NaK4W3@radijator>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2897221.e9J7NaK4W3@radijator>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2023 23:18, Duje Mihanović wrote:
> On Friday, July 28, 2023 9:18:44 AM CEST Krzysztof Kozlowski wrote:
>>> +/* axi (apmu) peripherals */
>>> +#define PXA1908_CLK_CCIC1		9
>>> +#define PXA1908_CLK_ISP			14
>>
>> Why do you have gaps between IDs? The clock IDs are supposed to be
>> continuous, otherwise it is not an ID.
> 
> Similarly to the PXA1928 clock driver, each clock's ID is its register offset 
> divided by 4. Should I use continuous IDs and put the register offsets in the 
> clock driver instead?

Either that or drop the bindings file, because otherwise what is the
point of having it in the bindings?

Best regards,
Krzysztof

