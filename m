Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938F1C6FD19
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 07:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCMH0i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 03:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCMH0h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 03:26:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E5E42BDB
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 00:26:36 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id da10so44768167edb.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678692395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUl1AFnYvuerz550S0BZk6CYNrUrXiWnBF8NxSyBHH8=;
        b=c22S9BoOYA+deLdPWk/xqbJhblQOBc5tLzrxCmqoWCP3SCvnSY1UoiFdjYUa299DCG
         e6Et+eZ3SJkJ59ktcr5S8xZnP9UWlqVwKOz0u7NjJe7CXHO6T9+/QdJpmgQ3ZKyb9Phi
         nEGcUW88KKzPVkJnMejXU3FaKWd9TqiefjFCNeUguSfpzIEVhzzv2QMhEE+zf4uYSn2C
         ItTdsnoIidx2TZ9XtSY4Mwwc9QdnC2dVAS8lZWNkqQJnzBiC16kPYgf52q2gI2NyVSE6
         oy9G3XMrG524mCLxZb9VTWOrDZB5KxEsLAa68WvytObOvN4jUY6Ikk1DrNjYE7EAW9hX
         WBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678692395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUl1AFnYvuerz550S0BZk6CYNrUrXiWnBF8NxSyBHH8=;
        b=YhUAgPIHCWLwFdJmC+oyrDZZ+aRIwLZ3cfuGNtu/xwjN/KYxaj9Zn/AuKGy4KItIol
         65GLowMrch0bvtRZyOPpsSB4JOv3ij+FR2KxYbz8F/4Wft+RyTtUH/tWM9f/5o11T9D8
         0mfFkLAuIJFF4fN+ZrlfqDdpZFw+HqF+yp9M6qbE0LsOpjtqC6DtCdlrtwAWEuknaB/l
         jVf1ZUKJc2LoxkemSHf+ALOW7yZjDmUYptH76+hzAR9XXR5yRZzkY8yAIeFNFzlOtqWW
         rK4V8AtSiTbh0ccEBK4TxmMnR9L8CXAGfbeYIgG1ozpLfXNhhw4DPtCroGvMaSL5bG2O
         fZaA==
X-Gm-Message-State: AO0yUKU1XhCsROFj6Uklv5qyPXCUVvl/Op43Ov7jnCC4s8F+hA+RsOV1
        BOuVIFamm90fsALX3gXXR8fT+g==
X-Google-Smtp-Source: AK7set8Wq10BVaJ8gwsEXYSDanCExZ4CSHiQo+LsZ05oGrhduvmJlUmlFtNTB6kPZBxDXb0JvYu+iQ==
X-Received: by 2002:a17:906:cccf:b0:870:94e:13f9 with SMTP id ot15-20020a170906cccf00b00870094e13f9mr32346108ejb.0.1678692394855;
        Mon, 13 Mar 2023 00:26:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f052:f15:3f90:fcb3? ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b008cafeec917dsm3087353ejb.101.2023.03.13.00.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 00:26:34 -0700 (PDT)
Message-ID: <23cef09a-be82-2765-13a6-8874cc578989@linaro.org>
Date:   Mon, 13 Mar 2023 08:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/7] arm64: dts: exynos: Remove clock from Exynos850
 pmu_system_controller
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
 <20230308233822.31180-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308233822.31180-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/03/2023 00:38, Sam Protsenko wrote:
> As described in the corresponding binding documentation for
> "samsung,exynos850-pmu", the "clocks" property should be used for
> specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
> pmu_system_controller is incorrect and should be removed. Instead of
> making syscon regmap keep that clock running for PMU accesses, it should
> be made always running in the clock driver, because the kernel is not
> the only software accessing PMU registers on Exynos850 platform.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
>  1 file changed, 1 deletion(-)

To avoid any bisectability issues, I will apply this in the next cycle.

Best regards,
Krzysztof

