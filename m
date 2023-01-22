Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4673C27C76
	for <linux-clk@archiver.kernel.org>; Sun, 22 Jan 2023 13:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjAVNvK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Jan 2023 08:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjAVNvJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Jan 2023 08:51:09 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833CD1DBA8
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:51:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so3070797wmq.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Jan 2023 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBQsna4Ml4m+CXKj50BA/m/QubV2oPbdfMdO4WVRYYc=;
        b=VLQgazTYjVfIt001bxaQt/FbWF7560Tm2HbPWameob7U/hMBFgmtO5QiueZDdoBgST
         yJRDUHKPcDtFlR13MfwK6UuMpmGd/SsY9jm8/56ZcX2A9c82dw/uikQ5rAqilaLe/AAP
         J0WyJ7vEcVPba/Y5NGTYvKgpEW6uxn1gOFOCq/R2CjuFU/COPhPmSg/syLVEs1LdD5BR
         uKL2zHK5Wj7t5i3jgeZLpULo6IME8uPpWMCqMAa6/ygs+p+fJP0GywNXldgX7EJ6mQRm
         N5ks7NmEbfrIZuWruK+nx1M60WisROVzxiueSsYiwDoXDdvIdTp5Yi8ukREaOlVTau2p
         1sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBQsna4Ml4m+CXKj50BA/m/QubV2oPbdfMdO4WVRYYc=;
        b=O3ewdcBfd5eJ1JOPkUaPI9hd0iG2k1S5gpB01+AxMKwBWtNR9bJk2tYNG6cBiiWC1R
         MQYEcu+lyRlPerg4EQVnVsR3XkEISIMFEJw4ofOHxeakLQRKLq10CBH8ThPNudnq/DyT
         Mv0YlsD+1F5H7jN5aMc38WKP0CvzzUcCIwC34GtbZNoRyQfqdm7KRYABcd8GbuEfu/Hx
         XbKSy/e2B8sEeTuvB7nL1wL3HlwIKX24YinW0R7mAPJWyEjBoYa8lphYt2ay6eB07wTZ
         H2uUKRob81M0QWwJooswGe6aVZUk4rlfAkF5t3aRMzCn8Ga1m3G5/kpy/qPr0/bAosPa
         HseQ==
X-Gm-Message-State: AFqh2kqke+XC4EaKfFS/0ZqfkUp2itlVXDOaVs9mR9b/CDkYQacE+oI9
        fuv9imNnjMM1y0gHXFaOMps8pQ==
X-Google-Smtp-Source: AMrXdXsXRA6OI2AcFH5C60qUwEPyDPWkyeNw6lIIh9+btcIBhRDQrJ9zcvZzYhgFuv/QMs45W/Znng==
X-Received: by 2002:a05:600c:1c9c:b0:3d3:49db:9b25 with SMTP id k28-20020a05600c1c9c00b003d349db9b25mr17348348wms.26.1674395467083;
        Sun, 22 Jan 2023 05:51:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003d9fba3c7a4sm7953734wmr.16.2023.01.22.05.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:51:06 -0800 (PST)
Message-ID: <030115dd-f489-5d4e-c993-e9fa8b550f04@linaro.org>
Date:   Sun, 22 Jan 2023 14:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND v5 0/6] Add resets for ADSP based audio clock controller
 driver
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1674322340-25882-1-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674322340-25882-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/01/2023 18:32, Srinivasa Rao Mandadapu wrote:
> Add resets and remove qdsp6ss clcok controller for audioreach based platforms. 
> 
> Changes since v4:
>     -- Update Fixes tag in Merge lpasscc into lpass_aon patch.
>     -- Revert removal of clk_regmap structure in Merge lpasscc into lpass_aon patch.
> 

Your v5 before resend have build issues. Please fix.

Best regards,
Krzysztof

