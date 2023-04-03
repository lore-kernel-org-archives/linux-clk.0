Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74746C761A6
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 09:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjDCJnn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 05:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbjDCJnX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 05:43:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D9C12860
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 02:42:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h8so114814307ede.8
        for <linux-clk@vger.kernel.org>; Mon, 03 Apr 2023 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680514944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mid/9140p0j+BIWe4O7dq8r3UXcENeJox8otyQeR9vs=;
        b=dtaCwqrv4AubbV+H8Ff4368MUtQRSkXtmi4rmNuhv4dpaFEdBUDzSgYPDWVWFRuecQ
         gLfMa0ei7/5SFypxWp8+DfFP/XhDnMZCuic8MHCEwWhLB/50qD0cm6eSkIZgULt4H45/
         hkt/RO3Hlg/nNkHdWPr47R7RgdY2s94aegyOY2LoSwcF9Hd5q+El5fNZGDJV/9uasqZQ
         vL3yOFxDlmbqf6f7mQYEyXwDHQE3IJzfiADIPiXsIMh6JjupJ8iBMBqDenUKRgFfZmZr
         D32D5u5UZAMDLMg8UXY+RQwYovMwdUj2X7Mcf7lSSijxv6az7YZSS4kqqTLlf+ZaYwz0
         9JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mid/9140p0j+BIWe4O7dq8r3UXcENeJox8otyQeR9vs=;
        b=m1zOH4cwoFSfgV8yhzTWcFMbho3Dnd+F6IZDJx9QWchtWTGK70nwgOObdbJxP3MoRX
         nYo7kCKUGrf2QXP+GNvvpcMJfVfcACR1iyHWqNwba+pL3EynFogTyT3alkmht9B+OpTI
         DkDUAN5BXNpio2krUBJ1mNtlVi7BnVq4NedT2w3rEmZ8VG1BbU8fKWZRcPq1lN6vvOaX
         A9E7ubRVapLZcIdqBtMOTaYN75nqJIxGZf5vMVoH3e2bZiC/z5EmHBC4hL73mpNApbMM
         knMO5d3tYPvyADWk3k84VNj9jzUo6TUIU1+IcvOrd6hIJAtt+8/VMcP4GyDDCz0b5ebs
         ozFA==
X-Gm-Message-State: AAQBX9eexYHwL+o9+AcfZAhyWFBQYkP440Qtv1zZG8YDRTnrer/q34rZ
        2y+g4KoEmiKVvpeEvqZ6mg2ObQ==
X-Google-Smtp-Source: AKy350aGBf01DI9O1DJpe7Q3su5fHDbbsMj9CrGhR+/iZ5zzk5IK+LNG0aBWLPnxiQgOTtdsYr9i/w==
X-Received: by 2002:a17:906:54cc:b0:932:c315:b0d with SMTP id c12-20020a17090654cc00b00932c3150b0dmr34352442ejp.34.1680514944715;
        Mon, 03 Apr 2023 02:42:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id y1-20020a170906518100b008c76facbbf7sm4351871ejk.171.2023.04.03.02.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:42:24 -0700 (PDT)
Message-ID: <073ec19d-7194-0b22-7b63-ad02aedea12d@linaro.org>
Date:   Mon, 3 Apr 2023 11:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V3 2/4] dt-bindings: clock: imx8mp: Add LDB clock entry
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20230403094633.3366446-1-peng.fan@oss.nxp.com>
 <20230403094633.3366446-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403094633.3366446-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/04/2023 11:46, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add LDB clock entry for i.MX8MP
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

