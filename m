Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18BDEB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jun 2023 08:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjFWIt3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 04:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjFWIt2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 04:49:28 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEF9212B
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 01:49:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso6438271fa.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687510163; x=1690102163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IzfcYheaY+2C+iIc318Id9jWD6NV9kWYTmaOaEJS2M=;
        b=zzEUF2UF3JFf8oHM+EKmxuv5eKaSXKD8Qi+k7j6+qovaDPyFIqhU3QO5PK87uU5oHn
         YSvH5mqaaGibj81PaPDlxCxqp6y+yC8fJShSXFD/IdpULUX90KlZV40Nb02yxw9v+B17
         E6nXeMxwUZ+riq/kQ33uEX9BZn1XMGB7xOqlzacRiX8C+OD+sBbXS3Rf+ehF1nBRs1fv
         freuuzcN0HfXJ1vVSAVaeM7yTLcqIC1zxivfrdHmpFqQFX7EUfhlBCGihbbKZCXWqjP5
         v7EYftAP1rLOuUw0xr5xVFFfGEJQ8FgU005wtw5ttTUKFZCJlGyNePfMtNZhVrwUnN+R
         EVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687510163; x=1690102163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IzfcYheaY+2C+iIc318Id9jWD6NV9kWYTmaOaEJS2M=;
        b=agxBdIjvj7qVyWSvFGfQY+hPoFe8Y1b+UvS3mxFhp6RDK2mTat+9XLmzPqc4iiBve6
         O1hk4nemLdVb0FjMo0nkCCbYmZaWbWqkO/GUcZwVD4Miwqj/c2iRE+xXoyHYqjTcgDYG
         +06hGWfDTg3M9M5gLOJl790iSzYlsvYa7FlgLhnq9dHMfgfvLPubIhbpIeJn7ivrwbqU
         N5eZR7maQUfX2a6U7x2fWndLJO1Ru9zRzgcMrhh7FEepIdMM+YXwbPSUNdWn7fsHvF/R
         QP3dVAVzYktM9xRf924vs0ftwpyxMOqNMAZrIkGkn/sNUAtoh5UYyUIXVlWEmlNFUGad
         UVYA==
X-Gm-Message-State: AC+VfDxnRoIbpCD3HLXq8+r+nTKrZu5/KGe0YdINx0iSzov4bWOkuavK
        8fleBxEtc09/6s91J7t8OWugwg==
X-Google-Smtp-Source: ACHHUZ6mnR6rzsfYwn2q0DIgVHx/H1L3imwZXf3H/3i+ulHmEW0dBIa+wPeJj3bXztcczdpDWmJQYw==
X-Received: by 2002:a05:651c:14e:b0:2b4:7559:f240 with SMTP id c14-20020a05651c014e00b002b47559f240mr9906581ljd.6.1687510162992;
        Fri, 23 Jun 2023 01:49:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c17-20020a056402121100b005158563be4asm5006927edw.33.2023.06.23.01.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 01:49:22 -0700 (PDT)
Message-ID: <dd5d7bc8-5ded-ebfe-48a2-55e330cd7544@linaro.org>
Date:   Fri, 23 Jun 2023 10:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/6] arm64: dts: meson: a1: introduce several
 peripheral IPs
Content-Language: en-US
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, conor+dt@kernel.org
Cc:     kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
        rockosov@gmail.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230623082201.7tfnpjvwi22omleq@CAB-WSD-L081021>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623082201.7tfnpjvwi22omleq@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2023 10:22, Dmitry Rokosov wrote:
> Hello Neil, Krzysztof, Jerome, Martin, Rob and Conor,
> 
> Would you please review this patch? The latest modifications enable CLK,
> EFUSE, USB, SDIO (WiFi), and UART (BT) functionality on A1 boards.
> 

It's not a binding...

Best regards,
Krzysztof

