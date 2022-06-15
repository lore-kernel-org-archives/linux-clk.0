Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A4CC43334
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 14:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241332AbiFOODl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 10:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356373AbiFOODF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 10:03:05 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164661144E
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 07:02:59 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 184so11437229pga.12
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M66DAB+19p6w4Na1SDbCKZUUw5Zn5mhELOHN0rTlLtM=;
        b=UDjUEJIiRoVktXJeykSYszQEk/7Fo9qKyvSGWv6zm3yB6tuZvYVMddV+i8fQajPkE2
         aAaZE2cW8WfJiV9Bl+ja/qocfZ84YXu66CvwLgyWfYpBuRUjIAVQEVjMuyhiy55sy0gE
         YOvQWptxx1hqEzX37f8EcQieP+Vbu9XWAZq5akpeLLmyBJFhwQ9UhvZYcBtFuhISrnOI
         FfbJhNxSShwSO+3+Rz9AZhWy9ZSyMi/6umtFS4lMPcttPWLIfe2s52GsUErh6DBdP0Kg
         Z2qNqFD+vvD2WozRI6qLTIw42MhWmb8/TfULi1FUTchhKTMP2R5yRC8BhddQzPIyQxHd
         +i8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M66DAB+19p6w4Na1SDbCKZUUw5Zn5mhELOHN0rTlLtM=;
        b=mulH7j9xSQVCEr9+8OE2WHQjaZ32oSEA8cDFP0uPi0VLVsc4XsYki9ltFHBlbL/ZgK
         XisI8R/1AUyMJDy1ugysd+kNE4DVkohbFDmcRKovJ1MKQbt6yWncVVsPMwziJ9o/QPAD
         IgEKX47E3+/E0BisNAW9Motk8EX8OU4DF+fRn/f3ls+uRMURv4a9TQzeBBKup6BR41kP
         YvLfajDuDgOSBRzqCqjEO/neAotcNtqpQBTYoFYwMYBnHAbQNnkqGySwfmdyp51z+pec
         YfDkZdtHazgFzi9X8R1pfDDd2hjv66fH9ZPNyB9dsrPJZK0DTwRyMwE7QE1bRujtGV3h
         1skA==
X-Gm-Message-State: AJIora8dhOSjI1PJ9oCSBreIU5ayAjS+sJy/u1GOxkVC3JTeAJycTqQ9
        HtZpQMAeR36OZfPoFq7VMBeAuQ==
X-Google-Smtp-Source: ABdhPJx3UrcgrUWHd4kpkHv8SdYGvKistJLOVKNX4XSrYpzd92CUkt0EJ89uNYlWk0nQnhp3+4adig==
X-Received: by 2002:a05:6a00:421a:b0:522:8b4c:69a9 with SMTP id cd26-20020a056a00421a00b005228b4c69a9mr9997626pfb.60.1655301778548;
        Wed, 15 Jun 2022 07:02:58 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id x3-20020a1709029a4300b001663165eb16sm9358196plv.7.2022.06.15.07.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 07:02:58 -0700 (PDT)
Message-ID: <53d94169-d724-7763-1b34-30f219c9963c@linaro.org>
Date:   Wed, 15 Jun 2022 07:02:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v18 10/10] ARM: dts: Add Sunplus SP7021-Demo-V3 board
 device tree
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
        olof@lixom.net, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2022 01:31, Qin Jian wrote:
> Add the basic support for Sunplus SP7021-Demo-V3 board.
> 
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
> Fix the comments from Krzysztof.
> ---
>  MAINTAINERS                                  |   1 +
>  arch/arm/boot/dts/Makefile                   |   2 +
>  arch/arm/boot/dts/sunplus-sp7021-achip.dtsi  |  84 +++++
>  arch/arm/boot/dts/sunplus-sp7021-demo-v3.dts |  26 ++
>  arch/arm/boot/dts/sunplus-sp7021.dtsi        | 318 +++++++++++++++++++
>  5 files changed, 431 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sunplus-sp7021-achip.dtsi
>  create mode 100644 arch/arm/boot/dts/sunplus-sp7021-demo-v3.dts
>  create mode 100644 arch/arm/boot/dts/sunplus-sp7021.dtsi
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
