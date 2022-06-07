Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F53C43334
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jun 2022 11:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbiFGL5r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jun 2022 07:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbiFGL5p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jun 2022 07:57:45 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B9A35868
        for <linux-clk@vger.kernel.org>; Tue,  7 Jun 2022 04:57:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w27so22621624edl.7
        for <linux-clk@vger.kernel.org>; Tue, 07 Jun 2022 04:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yZDBuoVlQ71P4cKl6Kapb0clRrwsrrvDiAbyCiR8ot0=;
        b=Kmk6lPezqek4hazrchUlF3SwI3blkWE9a1Oms0ehWdjz94uADugBjeyrjtU+zCmV5N
         6QdG/2Bp5tUYJlu2RG+1e4G2I/90ULDJ5R4iK0op0G7znqXcM+7HPC1RyhkUqjPqMW11
         xOMNnKBoLfZOfZszGKbaxBrJOF6CW+upTZhvQiSoiTHqjBtbMH4IuqjBcs3dSdsvvcNc
         vWa0tpEdLOPruoTK0oK3kde6/E5DgsgRJkEGZ2tSAF773DHvMAwvo2LkxfkvTyryz/kj
         0J4KcNpXIPrTcXOEztHmQ9bQfP0haiJeLKYMQkmFraHHqEr1UpbC6clqXTdpHsk9gswm
         ecEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yZDBuoVlQ71P4cKl6Kapb0clRrwsrrvDiAbyCiR8ot0=;
        b=rep12X5dh4FOGcqHQjZv8F5Is0Q7cXZqIAvp24x11hyXzDORrERh0B2DI+hPVy5+Z1
         hSyyALmAMjiGSgEE8QXMXjN4YZD533eOJ47g3OqM1Kuy9yrrT4q22CDXy3PxcMBMizJ6
         D03bz/OTJyHJT7GmoMjkKhQjD3h284aOppKX1OF0aFhvU2n4ehRljtU3G6p14Y/fui4W
         ZeYkuAdEs05AOVk5TO9+BXgwTHIe+Qu5DU7ygjPOvUQslQBBvPV7wDaVEAgk4jsAFFoH
         PGSvnNt6LxUIrsF3rIMjZcTOUqEcfi6tlyTl3mIUHH6RxCzdO36OWNiAu8yZzTTGzAEb
         SeJQ==
X-Gm-Message-State: AOAM530vR2laN95OhYiJc7ZXCQC/ast5W2Dsi33/MOK1GXtK9Ni2SuSi
        wiNCoyShZIahqFQOKuFewENYPQ==
X-Google-Smtp-Source: ABdhPJy5IOhjy3MQT0HkzRMlUxWQFG4EiGON9lppvA3+TQzxKlphzo1A5dyIGWXxh/ppAL7ZzunKkg==
X-Received: by 2002:a05:6402:289:b0:42d:cd82:be22 with SMTP id l9-20020a056402028900b0042dcd82be22mr32920366edv.373.1654603061912;
        Tue, 07 Jun 2022 04:57:41 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id da7-20020a056402176700b0042e032164a4sm9126964edb.61.2022.06.07.04.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:57:41 -0700 (PDT)
Message-ID: <7aa025a6-a08a-a11f-3931-7a1a0750a15f@linaro.org>
Date:   Tue, 7 Jun 2022 13:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v17 04/10] dt-bindings: clock: Add bindings for SP7021
 clock driver
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
        olof@lixom.net, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1654565776.git.qinjian@cqplus1.com>
 <8f5673ae8730ec117c1d8fe1e28fb50a2216e891.1654565776.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8f5673ae8730ec117c1d8fe1e28fb50a2216e891.1654565776.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2022 03:58, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 clock driver bindings.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

Wrong address...

Best regards,
Krzysztof
