Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D2C7EE23
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 06:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjEDGaD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 02:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjEDG37 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 02:29:59 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D6F2D62
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 23:29:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so92599a12.0
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683181790; x=1685773790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKDghn2BEzef2X05qs9Bay+N6tZZ6zhNZbbQNcDAi/s=;
        b=jY89SL8jkoTW1rehE16YV3Kv+XZi1ga80FlmYc5KdWLuT82lWIXEy+kT9npuNhhTCC
         IVot5eVw3iWlvT0GTziyqWYH6TvE00ZADAQJY1NZEWJ7bqW/NJe3ElgS5wCQoGVeqsNb
         UtrRvgeWsa5E9ugG6lSiSFsLiiVey7DHiUBbGnyq2RzpM1VsCPzep/9ibQbBqnFm+UN2
         ChSSx8C4Oh6MCGU97uQEkuZhinBqXKyPCSYJxdV/nU0WIe1+l2Sh2XzfDpUWTLq6GXVv
         PM+xudNzGugw5W3T4rgJtlON+rjYAJor0ezqCJ4/kEkwT+Ojq7rfb+oHUQ+6ywbC5ySz
         MKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683181790; x=1685773790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKDghn2BEzef2X05qs9Bay+N6tZZ6zhNZbbQNcDAi/s=;
        b=VHmTlZ/KaNZTEJUqt7R4nQDdqZKpqLHcpbAB6d3A1PEkPAMdmOv6ymal9JL9sgcH0f
         OJnmF9R4oLjN4OrCAlm5z2UP/IHZDhUTw1hQ5ooUtVceTqKbmJ3laeSCxBCaFOHXuvis
         0/fmqitaWQ1CdVuoDtBnQc2PHc7AUpE0yIMFywfeCJrUhv9gb7AeFYmEqNvJHUQWdw61
         T2fTqrHUbcwcMicwW8ozDkNc9WPeaKERQaYv5X0jP07MfQMyB9W3i4tdz9CAGxKdcOlh
         S38tbEL6ZhTC/0voCFjflutbbWMhcdLOd+UhxE6MHLWNHEWZNyht4bV+BSpgzB3Bq6g4
         74RQ==
X-Gm-Message-State: AC+VfDylYNxK6b14t/Y1FQQBTrdEV7SkmE36GVn4OaHg6nkQII88/kji
        c98E1oE21Vjqx5vXO2YuiDthog==
X-Google-Smtp-Source: ACHHUZ4L72kydfTXaK8lkI4sPCk/X09R0evirbNAkxA8WqVqFLyJgSHDJUl5pxE7BcYaMscALWexzA==
X-Received: by 2002:a17:907:1693:b0:94e:4c8f:758 with SMTP id hc19-20020a170907169300b0094e4c8f0758mr6212909ejc.76.1683181789930;
        Wed, 03 May 2023 23:29:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id gt11-20020a1709072d8b00b0094f07545d40sm18151574ejc.220.2023.05.03.23.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 23:29:49 -0700 (PDT)
Message-ID: <4ee1f249-ad75-273b-f8f0-e5b00a3d77a3@linaro.org>
Date:   Thu, 4 May 2023 08:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v9 01/10] arm64: Kconfig.platforms: Add config for Nuvoton
 MA35 platform
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        tmaimon77@gmail.com, catalin.marinas@arm.com, will@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, arnd@arndb.de, schung@nuvoton.com,
        mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230504033726.93-1-ychuang570808@gmail.com>
 <20230504033726.93-2-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504033726.93-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2023 05:37, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add ARCH_NUVOTON configuration option for Nuvoton MA35 family SoCs.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

