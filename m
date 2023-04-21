Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF5FC77B78
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 21:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjDUVIu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 17:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbjDUVIt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 17:08:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4C0B8
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 14:08:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec9c7c6986so2192368e87.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 14:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682111325; x=1684703325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9W1D3wCw6XKucfchy0oa7eoctRHM+fcPALZxgsEbNBs=;
        b=ixIJ9Hv+jHR8BhY4DAOaBAYeOne2MN8aCbLx7zyPBmkB0j+AwCl5fX1SBIDbQhoesO
         oErScNiR/ChWnIPnHRsYPYAKqG5DUj850++d9s/1uI3clSI2bmZMv/mLlDlbA24facqM
         OiZ3BA/fEer/hdoIBAy9g6tM0ZPvlVW1UMvOSjSo3XK36mcB+zON9FtyEo+0taeHu96j
         A/iqY9N5A/vIoqxL4JEXKEkUml+uJiWtFpRsUZPncmCkCDc4Hz3AR90uuIcyYY/pxv6A
         lFZ0oaPawAeo2/oPWRVo+XUhy6kjA5epdzfh2QuPm6L005wXQCWc66QWeF8FsHUWVU8R
         6zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682111325; x=1684703325;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9W1D3wCw6XKucfchy0oa7eoctRHM+fcPALZxgsEbNBs=;
        b=lxT6bi9DXz/AFU4xDZ8MJ+GgUyKNwFFf7Kk3Tviol7Hf9zgUowgvTzrkQtntH3bUnl
         0XOBquxlO+KNAvPd24ddErNdD3CMEnQtrXTJ28D2I9TOCEfoldEPGubXmF41ZZaljz3h
         KX/QtpMYLxrufGd5CgYrLbnE6I9aqrL4MAXTIaI+zKlhl8ZrqWJpKH+20a9xX8d4pnK6
         vscUpH51Z/J11LL7McIRN5pSBXyjaf9Wd4+nGLpTZjECnbK0oPiM/dAw4HQFKD5SI+fZ
         Sk/U4ifpS5f3qqUdvjZtsbjGmYekHs0G0EYe0ee/NjRi9V3Eznw1vk+A6wDVz1g175Jd
         L0JQ==
X-Gm-Message-State: AAQBX9dP3K2Nhz+3PfelKjLZwuugNyDNMI7VxaqMn/JyjxUwJqoKStuH
        NKyX1ASkYr+khZ4wWLtgnKdfTg==
X-Google-Smtp-Source: AKy350YLTGBr4RyKMwcNF7D0+hyZdpX3tIb57/K2TAvk9TNPrByM+p/YOtKMAaJG9fIoYe+Yxdik/Q==
X-Received: by 2002:ac2:4211:0:b0:4ed:bb8c:5036 with SMTP id y17-20020ac24211000000b004edbb8c5036mr1639270lfh.14.1682111325170;
        Fri, 21 Apr 2023 14:08:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h23-20020ac250d7000000b004eeda08e9d9sm670853lfm.150.2023.04.21.14.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 14:08:44 -0700 (PDT)
Message-ID: <6837a467-7d6d-2d6e-3b4a-191a5d32e650@linaro.org>
Date:   Sat, 22 Apr 2023 00:08:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 5/8] phy: qcom-qusb2: add QUSB2 support for IPQ9574
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <096d01ea7b833cc990a3c7cd071528aa50fd1020.1680693149.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <096d01ea7b833cc990a3c7cd071528aa50fd1020.1680693149.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/04/2023 14:41, Varadarajan Narayanan wrote:
> Add the phy init sequence for the Super Speed ports found
> on IPQ9574.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>    Changes in v2:
> 	- Place the entry such that the list continues to be sorted

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

