Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD93C3527C
	for <linux-clk@archiver.kernel.org>; Mon,  9 May 2022 07:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbiEIHmj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 May 2022 03:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbiEIHRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 03:17:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0940D1B12F1
        for <linux-clk@vger.kernel.org>; Mon,  9 May 2022 00:13:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id kq17so24982360ejb.4
        for <linux-clk@vger.kernel.org>; Mon, 09 May 2022 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ac0wdZ20AHn5wVPxVYwtmg/c1OI3pc9hHhoSEjeifpc=;
        b=ZZC9iQtnZRNTyGmUsZa7/DrBwotSxXWiCSY2rboitpOCAh5WrIkUR6+tiDV6P6cATU
         ehuALpVBNDk97t5KAdpXvbLp/CuJ5FnMeFfFgl9/bNVMlvNmtiEKFpDIF8qiGq5Qt4uV
         ar8B4lD5t+y0ZSto5BKU/hh382WJ7p86RlTPfYPkX23Gc8KIaFQXpDOMr7Ueq5zM7DhK
         IhAtt/Dh79iqqrSZhheHZtUqo2pdyfZktnorxHQc9xRp7P73r5JGgAi94xxjvLNcjPjw
         nR5lm75IXPdMJl0v1d/Cj99tEBivO7D+42vYsNRhEYzcK468IkLUOuAaVWeFFptHcHiO
         qkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ac0wdZ20AHn5wVPxVYwtmg/c1OI3pc9hHhoSEjeifpc=;
        b=3N/chK02T6YLRud73PBQaHopBX73LzMN13hcgaw+s+7kzWr/Y6xXvKv8KlE0YGxnhV
         E2Dxs7/OwAvIpg0PicszSJ34fdVbZj0VSZlSNzk8FAQIygGtk5zPVe3WadfIHjNPjBCg
         l26wPiHeDO6aebECTsu+AwpZliPWOYUXpccFWb2GQqRJdMAMp5nJ8rBbyu9Cgt8dZLVi
         xzr5dvebZH+KR3C2RdMuCgi/+f2oI6td6hj9amaqGqSBFlQ+51BcSnPlEbFg4xOWbjXF
         JgOLDcKIa9NZYGKWQKFlgJSFCfF5dbHYDtQJKUOMKeYuDYlHjfGj+eRM2q2F0Q7jY0vB
         ZjUQ==
X-Gm-Message-State: AOAM533YKZgX57mWTMZHTyMu8yAcNSaNwcV631R6LBCnbJrtpTwHAasv
        eCRjPWfeOJnBDswBpt1u0HASuw==
X-Google-Smtp-Source: ABdhPJyZUiyqYlM/No92bKswLQXC05uEE20qb/n8pLGATD1lJjK8igzRKiN8DiowBQA0FrB0/i1gZg==
X-Received: by 2002:a17:907:6d9e:b0:6f9:b861:828e with SMTP id sb30-20020a1709076d9e00b006f9b861828emr5170050ejc.427.1652080426647;
        Mon, 09 May 2022 00:13:46 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id el22-20020a170907285600b006f3ef214e1dsm4771728ejc.131.2022.05.09.00.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:13:46 -0700 (PDT)
Message-ID: <f0e27ff9-8eb6-1250-1262-e7ab7908bb33@linaro.org>
Date:   Mon, 9 May 2022 09:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: Add support for IPQ8074 APSS
 clock controller
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220507203620.399028-1-robimarko@gmail.com>
 <20220507203620.399028-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220507203620.399028-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/05/2022 22:36, Robert Marko wrote:
> Add dt-binding for the IPQ8074 APSS clock controller which provides
> clocks to the CPU cores.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Correct subject

After explanations about license:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
