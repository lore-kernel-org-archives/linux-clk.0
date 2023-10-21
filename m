Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76910C001E0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 17:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbjJUR2e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjJUR2b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 13:28:31 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0B211B
        for <linux-clk@vger.kernel.org>; Sat, 21 Oct 2023 10:28:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32db8f8441eso1492538f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Oct 2023 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697909301; x=1698514101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5lqhGvcnMlsbzoqzAuSUnuytpJr6ezeGC98RUo/Y8M=;
        b=HnLgMqO4nIg7UyzG6fWBNZuPAs+/OVTmLKyUoohpGZIMddbYsR0uxxWJamOD5dibmS
         2adXJTY3mYyhk/KRKEfuZiFsdCmQXGgBiw4GhIl5JXsqqn6l2iJJ8ba8hLObP32eRDJ7
         267xdUcVPj0e/1yGWiNqXqiHJGaA+O2vKBvbmjSrEI1FL0jlPOphFquGwUEDFDhTQJ6o
         eRq8DutgGAIFUw0/QkVMxlN7cjOCtDj6NHKl91G4OCmPoHj0YlLubMRYZkftDuYQeRcU
         ElyszEL+PoKplyCi6EfBiuF+OwurKtq5tqbJTurr5s3zr/dut/V6i/Jy06fXEXluhkh7
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697909301; x=1698514101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5lqhGvcnMlsbzoqzAuSUnuytpJr6ezeGC98RUo/Y8M=;
        b=p9JduWnA0LUwFKujvJznI0fxwlKLhmZJUps8vbUgAjZi9Rhizc1g9BKvYSY4mPZ/B9
         1XNJkmsam+Ei3xllUSctbpmiO4/04pI/rIvmacUK62O2qFwE/ZGPQ3Oh150BLLY3DyY8
         R7r2Hd3rrklp4wdajOjydlH7dL89VQG8glQQYP+jDoXBaa86fhQOpTFXhuyPYstVUtcw
         Y/LAFARVgaVgiUt9UCrz0EJnzaZwz9R4YFLd1di0ypg6pjWP6S8+Ufl3TMhkY7CC7AJE
         pqmjVksHQg1N+Mkd9m0ULirTkzhMsI9j2Lng2R1mpspGRAxmhReOEXVy3xSfGCmCY8qm
         MlMg==
X-Gm-Message-State: AOJu0Yy54sU/pu48TeIUnPRr/+xV9qXbvr9OceLcINcMBuCG3tRp+Yj8
        fqp385Yzj7CKy6DVTs3qHV/mDg==
X-Google-Smtp-Source: AGHT+IGmBUU+684kwVhndOfmDIGujj1nA7C2Fw/RKXv7J2J5mZk1LxUM0RklCTrSkbBAfLVSS44XSw==
X-Received: by 2002:a5d:58d2:0:b0:32d:9b30:9a76 with SMTP id o18-20020a5d58d2000000b0032d9b309a76mr3225813wrf.47.1697909301368;
        Sat, 21 Oct 2023 10:28:21 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d628d000000b0032daf848f68sm4060262wru.59.2023.10.21.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:28:21 -0700 (PDT)
Message-ID: <8f01ff1a-1af0-4684-a69d-6eb6c79d2e58@linaro.org>
Date:   Sat, 21 Oct 2023 19:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq6018: add QUP6 I2C clock
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
References: <20231021115545.229060-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231021115545.229060-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/21/23 13:55, Robert Marko wrote:
> QUP6 I2C clock is listed in the dt bindings but it was never included in
> the GCC driver.
> So lets add support for it, it is marked as criticial as it is used by RPM
> to communicate to the external PMIC over I2C so this clock must not be
> disabled.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> Reviewed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
