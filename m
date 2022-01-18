Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF19C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348091AbiARSgt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:36:49 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43754
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244937AbiARSgt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:36:49 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A4D003F1E0
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531007;
        bh=Xr6SgdUN1TZh8LNJdRyo3Mtp+OngI4NaFYJZFvhIHmw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nFXwymUmK6PuXWMzuDZAe13AX/3pVEAFditXE5RLGxrIdSIjnfc9f5mwmmbxsC7uk
         wzg0KF4FIAbcRsu39wriY5CWAShGkHddYExPenJxQVw/998MqgFLwBBIAGE0uluAML
         Z/E1oeYhGuf4HWhw8EDyoe5X5iX+QPUt45gc17P39q0b9P3/ccU7zQqXXtAlvPf/rT
         WqtJIWSbs58i0s+GXtm75t3h7Xi/CxHQ4RsY5ythNC2KB5kgCr2GunxkKDqlCUQwsG
         0BkEfa9HrDAMJ/5SISHjy58CWzXuI4WDhYxsC8x3BfX4RVB/idhdu0TxInJO2LuxiS
         F4ADSKoyOAyRg==
Received: by mail-ed1-f72.google.com with SMTP id el8-20020a056402360800b00403bbdcef64so1921365edb.14
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xr6SgdUN1TZh8LNJdRyo3Mtp+OngI4NaFYJZFvhIHmw=;
        b=j5X641cofh/DJO1NJwBsZRY7vtgW3EUJOXTb4WcIWp33bjMcrYgfz1+M32BdULyGIZ
         FZWr4zI2dJ+f51V0Hhdj4xQzsp5tj61Q+KwDxOJHmlkwJHEmkQiWBTajbIUp7of+MFE/
         KlFZSNRP42kiS0hQoRG9zfV/SMqRmGEvFonh00JwDh3d78mRTZnfncCZrUT4dBtCELHz
         ya1FUS7wn5LY+ZqfcNF/7fpKMNkuJjayup0jJb59UtMZDqQRomSz9bfTgs8ROUmkk9dw
         yVgg+pvWqxR8eQnoISK6WExO/yEd+3Khy3k/02l57VBHrtxnv4uX7QtniwOsZs96C7l7
         wAZw==
X-Gm-Message-State: AOAM530LHHMWZSFOqjUI/MuRRm3hPAozJgPj9RN089FEV1CWQaGpkDPC
        mwnehbuU+Aqkkf3VuLxQBmKpfGzvvo5c7pq4FmI5d5u2RvDZXA3KY3cm0FwNWCHF2aTLvunXkcJ
        t1TMTlq9Ojwo+14VxErd/yhzcPCx1p87S0Sqoaw==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21430535ejc.202.1642531007361;
        Tue, 18 Jan 2022 10:36:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhfrqj3ReK7A0ko54v0kjJtEtaJOwjxvJZxY2r3mMd3765xiW/XF5zsxzkUqpiG2o3Eafuww==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21430530ejc.202.1642531007224;
        Tue, 18 Jan 2022 10:36:47 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id kw22sm5615885ejc.132.2022.01.18.10.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:46 -0800 (PST)
Message-ID: <ad954b04-9df9-6675-18b8-8cda01467ce8@canonical.com>
Date:   Tue, 18 Jan 2022 19:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 10/16] clk: samsung: fsd: Add cam_csi block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Sathyakam M <sathya@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150052epcas5p12efa399d1a59fc2fb0595eef128ffdf9@epcas5p1.samsung.com>
 <20220118144851.69537-11-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-11-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds clocks for BLK_CAM_CSI block, this is needed for CSI to work.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Sathyakam M <sathya@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 207 ++++++++++++++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
> index 72a2b38524a1..afac8760ebe1 100644
> --- a/drivers/clk/samsung/clk-fsd.c
> +++ b/drivers/clk/samsung/clk-fsd.c
> @@ -1543,6 +1543,210 @@ static const struct samsung_cmu_info mfc_cmu_info __initconst = {
>  	.nr_clk_regs		= ARRAY_SIZE(mfc_clk_regs),
>  };
>  


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
