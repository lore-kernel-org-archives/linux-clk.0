Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31175C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245607AbiETHLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346351AbiETHLU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:11:20 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556CE12A8F
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:11:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id e4so8126166ljb.13
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IkAH0H3IBxHLU/CbxKDtJHZQyKc3Gg/d1mUG6mepk2M=;
        b=lmmyHfzYh8kQYYO7BHfpd7uoUwQkuCL0uSnOgPDyNBPIujbLS3z7aEHbumNnT767zp
         vBWRQf57lAzWjHwgBcEsJFTmOC/p4Pz0PlQCWot/BHsASQalXSUfGZ2mxFWgEpnjG4EO
         oQStUMLVjudja2MoIzu4dt8AM0Mz09/BuFmdZtIPrK62PoTRIw+szSylZugH3fb9AKsh
         3N6MSV4d4YKrsCdiELbTlLbbDsnOesTS+JP/O1dyHxSo9reuUhSyHUz75jnPbMb6z5TR
         n4znBFkkH8oG1wxEdfsTAo3zGUOErw2Y+TWNbweJz0J0TnDng0riJu0wucPZiQb8QxRC
         bV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IkAH0H3IBxHLU/CbxKDtJHZQyKc3Gg/d1mUG6mepk2M=;
        b=WE6Qf4vJ6en8baqQzLJ5oyaveQoRgNvjv67kKtqlIeWlWfH0bs3Szqhc4IDpIZuwcC
         gnU1Op5R4jzRrIM6EkBBE5FIkwOAyyU/AY/cwG3fhgpIu+88vehpY5ezc458zbQGEITo
         2oKWY+KY2f2btix3BkoWeMEVd6kgHcrlZWifTrBBT85VF8xS1SAcA5Ad4qINvEcCytxZ
         NOtYCfxT5qNai6DiUuaj3Lj+HEUBreSKVXF+vRW2NNwP8i64T+mGt+PDJuXDl03ZDsda
         xftECHDBhJZZ2+u4Z+wdJVP1gygp1dYi4olaj873JkyZPfhulAwrjAVvkpy6sU35MaED
         bqjQ==
X-Gm-Message-State: AOAM530eY6VixoYv4bFusYEwqC26OaSppNPAjXDgC9g4UUvH6vRqTe+o
        SPRJ1VZysYGBL0/D1z5TB/BXxA==
X-Google-Smtp-Source: ABdhPJyyk9JZA2aznwu1lFh9WNmGTR6aC3+XhBXUxMwr9pMbyFwO9qcO8LkrwszjUEFXa/Uh5qrTfg==
X-Received: by 2002:a2e:a794:0:b0:250:5de1:1ec5 with SMTP id c20-20020a2ea794000000b002505de11ec5mr4759321ljf.270.1653030676679;
        Fri, 20 May 2022 00:11:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p5-20020a19f005000000b00477c2fc6180sm543536lfc.293.2022.05.20.00.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 00:11:16 -0700 (PDT)
Message-ID: <a59d1bce-702e-b865-0daf-008f4e2d4c11@linaro.org>
Date:   Fri, 20 May 2022 09:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v16 04/10] dt-bindings: clock: Add bindings for SP7021
 clock driver
Content-Language: en-US
To:     Qin Jian <qinjian@cqplus1.com>, sboyd@kernel.org
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, tglx@linutronix.de,
        maz@kernel.org, p.zabel@pengutronix.de, linux@armlinux.org.uk,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <cover.1653027644.git.qinjian@cqplus1.com>
 <3e65fb889dc99ca91f1b583b058267b396bfecc7.1653027644.git.qinjian@cqplus1.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3e65fb889dc99ca91f1b583b058267b396bfecc7.1653027644.git.qinjian@cqplus1.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2022 08:50, Qin Jian wrote:
> Add documentation to describe Sunplus SP7021 clock driver bindings.
> 
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
