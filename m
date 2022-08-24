Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F5FC32796
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 12:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237462AbiHXMwa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 08:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237458AbiHXMw3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 08:52:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF4E95E5D
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 05:52:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id s6so12626025lfo.11
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZwNSTKnVcPIYK6dbm0TWSHkaFbJiNUWrAYxpc2cQruw=;
        b=Ix90db/x25enO75JqAudO2Fr12aKUu/W8WOwZL7LYqPtppftySDvVFkRwUluS3S/wE
         P0z8H6tHvrvCnNrNUzNdfBe96gzrHIGRPbZ3ZDSDSnY2H+69PyF8cvo0dHU7zNMuwYKs
         3XAF3Dk2Yu2d/4sDOqwhuKBJ32SJiTqJTrMb61hZ9qneNiALxmXEXuf2lVoSfy2Y+nUe
         WZGIIQsM5pIOSNKMYHnABwZkv8cKdweAPb0cbJtuGmqaZtu46nYgRfD4de1wv52ypgLJ
         mExU9thjfVlm9wPJTNL3TbBYcjT94qPe4OZlJDUnSjrAaBynS8Yq1613gcIGOZ40wkjq
         38Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZwNSTKnVcPIYK6dbm0TWSHkaFbJiNUWrAYxpc2cQruw=;
        b=wBANcU4VKZHi+50B5dpUqLJWSwhsDoo5rU+csl1AFMUd64S2N4QzgmAC0+XiCw8E5T
         aJG2pH++hUbBRathNS38VgTkc01drvaTYwrxGPUTwb0BP50Irlp6IlFc6ZFfA2eIqgru
         iXExvvdSinCEQ6Zu6Jj6g+ujjW1ZyLo1ElSrrj78/5Z7clARacCslflj7+GmtNrap48a
         AeLNfkasEERcMUQC8aCaKMkT0LO+RPYIWJCFGhk4WROaJcRyxBa316e9rfsefGVVhi+L
         Zek7oKfhu2m2hx7jgh6S9mahbFkXFxd3LU5MLsiH3heJ9m1/3q7xMd1sVUUlNvQl+cnA
         /CkA==
X-Gm-Message-State: ACgBeo10AD7J9QcI+WMiAwRtgMLQslNZHEXtoowquaHz64jkXra+pJb3
        g+6mJrm7uk3qC41VOd9X8WBXvQ==
X-Google-Smtp-Source: AA6agR4Sl1C1PIBuf+7AFbf2WFYP6PKZHBPj1Cqt/XCdlSfl6eNtX6pgeP/X5QCWGx9INqfdG3JCNw==
X-Received: by 2002:a05:6512:210b:b0:492:e4cb:b93a with SMTP id q11-20020a056512210b00b00492e4cbb93amr4558908lfr.601.1661345546939;
        Wed, 24 Aug 2022 05:52:26 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
        by smtp.gmail.com with ESMTPSA id c4-20020a196544000000b00489e2156285sm3006920lfj.104.2022.08.24.05.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:52:25 -0700 (PDT)
Message-ID: <72f2a044-6271-4d4e-1782-0271516cc7b3@linaro.org>
Date:   Wed, 24 Aug 2022 15:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Content-Language: en-US
To:     Li Jun <jun.li@nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/08/2022 11:04, Li Jun wrote:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
