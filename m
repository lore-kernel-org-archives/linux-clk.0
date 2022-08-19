Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30819C32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 12:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349063AbiHSMq2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 08:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348552AbiHSMqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 08:46:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200088C03B
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:46:24 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so6013229lfr.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=K29+GrLurEVMz+IcmJCvsL3+V3VFmxk9IgPRnZQasec=;
        b=TCew6KzbEtV2gO9hXzpONAq4N4e+nQyw/iU+jfOE5az9Be/FXPJIBc6GNySAnomO20
         FgIqmRs+DEWlBchnjqHuoz3YZE/geyl87pjMz/Ohgiyr98XF9LbdAXYkAh1tN961/zPe
         nvE0Puw8RuLjR+ICfL2cnUsxHafBSNqAxo7/f0FDLkrQBKd/PfhZ/XQ1uall65czZmHI
         mS1Qz+aPkdTW1EnsyUJFILOw8mHFqrISCcZlrg2QEGnc1BV+YJUaqY+92Vi2aAOj6RFp
         90pqM0ZgqacFn5pYXGPSz1TOerkmaYMdg85naGczDEuR53WgtlRXDWo4pwIQTxpTFJWM
         jdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=K29+GrLurEVMz+IcmJCvsL3+V3VFmxk9IgPRnZQasec=;
        b=xJzXnqHgmGnqnXy6iDi3Lc2Qyap8bt8Z2A+oAtpSiSSwFLRFm884IsC5SkgQVCzTjf
         brl5e4bNSztaj4uz/yj7sd6kiRNkIS2jxbQ4KRaEadct71Vkh4KI0bwku6C+r+Cqk2I6
         gwQZXuOfe1v2S9UxwcMdbStTdUv/UaOzaauWZAJsAPj6edJYE22UIw1rHM7gL5MZIMI5
         nM+H5Mgqi8gvDIWm17PU5/9ANn4h8KX/ee21pnUpNITB6MBXW6jk6wgBjsbE3oUkJ/hR
         QKJu4Jr7UzSJBo2LIJYnm86hxCKNN0L0GHsbIOtPlTyIuHXcioqSOvOA/7WbtWLau2sQ
         Iklg==
X-Gm-Message-State: ACgBeo0VeJYQkqWKPzYc8KRhck6ZxYOdS5qk2cEUCLNj64BGbtncmrO/
        aAx4sFFHVmBi2PO2XcNYgLGgPg==
X-Google-Smtp-Source: AA6agR5/vAR5q5Kr0vJwYrqhtgqJma98MRzgessllT6tIdcRYL/NOV9mrbay71eWVKq/BdtNDBUSLw==
X-Received: by 2002:a05:6512:10cb:b0:48c:e0a6:221b with SMTP id k11-20020a05651210cb00b0048ce0a6221bmr2775454lfg.218.1660913182522;
        Fri, 19 Aug 2022 05:46:22 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id c3-20020a056512074300b0048aee825e2esm88260lfs.282.2022.08.19.05.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:46:21 -0700 (PDT)
Message-ID: <3b1a99df-58ed-9bed-aa11-14a1cd8b62b5@linaro.org>
Date:   Fri, 19 Aug 2022 15:46:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/6] dt-bindings: riscv: microchip: document icicle
 reference design
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-6-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-6-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 15:22, Conor Dooley wrote:
> Add a new compatible for the icicle kit reference design's 22.09
> release, which made some changes to the memory map - including adding
> the ability to read the CCCs via the system controller bus. Technically
> that was always possible, but the specific CC chosen could vary per
> run of the synthesis tool. Hopefully this is the last reference design
> version impacting the memory map.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
