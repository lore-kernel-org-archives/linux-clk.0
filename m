Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9380C6FA8F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Aug 2023 17:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjH2R1I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbjH2R0i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:26:38 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819F5E5B
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:26:03 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so101328a12.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329926; x=1693934726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
        b=cI7DrUQCA0eO3HR1BMDsh3g1QKwTRitG1EGpq/PrigRr/OMRllvUBLx7redXF3v4jx
         skJPD65EZX8LBcHAbqVQZ9N/ESeI+VNm5kyV3fVprRHi9ksg+OucTErw42JlRLftfAom
         PgA2xt0fXM0fhRgnW7mmSK7oAIO1NWCHqiVOxWmFgQKDnoXQ2fgtVllFwTOlwdSQeOzc
         ESTLnHVFN0H4Mxb4m20xc1pQJrzsogvk4SrbRqZ8gGgPpeU9EKTyCzvlj+NrlrFZ0usB
         OqFofAjgmruBGyIC+ZMBUXp0v3bQ9PaAXuOKCwnBiR018GOOqvXk6SYekWPDxQlLVx0K
         tt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329926; x=1693934726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
        b=DsqQdupPsZ4KryuJsVbSxHUADJNIwbHG2lzexW+kx/cxVGoTtwERUyCXI1RBlD0g7U
         WhQuPzNNOmewmsx8uyKhWHyfotTA+6VBrq66w38Ckmuzc42Ide7NGP2G5HhVtZzbKcw5
         oIF280Q5JaX5vMJqjEaBe2oaqQbYziCwwmdCnguUbUYNvzzNKa1b2QBwI/zy31l+3T2B
         gYS+XNwuCQ18IEeZrD/fjcZ5ZbMutS7Z5uunhADtLxBLgfLoNaRMVyuNLOR5dD4KJi5h
         n3Nv66hEwer2E+1gLfL34UY0GVjw7M4Lm5PWSgrfnSFjbrfqUmx6TqdD23YKYG0OXJV/
         gXYQ==
X-Gm-Message-State: AOJu0YzPfVlTiY4oghZrubfcvUMq7eRWavI/AhRq1XooISCh7p8XkkfS
        gbZoskkJi5JuCTn8PfXcgaWi+g==
X-Google-Smtp-Source: AGHT+IF3yG8pM/1QQYR3cM78PgXLt47SF3cJUeeTGTYGaG5gDIhDp0rbhT11KNATVil2Mt43nb0AVg==
X-Received: by 2002:a17:907:6d0d:b0:9a5:7b9a:f32f with SMTP id sa13-20020a1709076d0d00b009a57b9af32fmr3582562ejc.1.1693329926489;
        Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090606d100b0098669cc16b2sm6103226ejb.83.2023.08.29.10.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Message-ID: <771e116c-7e0d-d238-d35a-c5e9a44ce571@linaro.org>
Date:   Tue, 29 Aug 2023 19:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 16/31] ARM: dts: rockchip: Add SRAM node for RK312x
Content-Language: en-US
To:     Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-17-knaerzche@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-17-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2023 19:16, Alex Bee wrote:
> RK312x SoCs have 8KB of SRAM.
> Add the respective device tree node for it.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

This really does not depend on your MFD, GPU nor ASoC changes. Keep
independent work for different subsystems separate.

Best regards,
Krzysztof

