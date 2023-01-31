Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72723C636CC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 19:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbjAaT2v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 14:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjAaT2u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 14:28:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DBFBB8D
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:28:49 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id a3so8537598wrt.6
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNT+DCfUqwj/pE7ErUm6d5wjv6OQt/ojsZMbHaQZ/oA=;
        b=SNtOBvmPhKui/9LXfPudO1NApLtM1DNonJ6dfzYxgCjRzwJx0N6m3sRF0japNYQwdV
         mttElfQBTrvq/YRRfL65Sa54eaHp57m8ZnStBtTbqDJ80cd7wbkICsVJK4zayvhXPqsa
         BdLA8FBV0XtLoYJxfhsGboqrO+1TL8Wyox3oQuOwc6MbdKI9uCjuxSiyeaH0sS4fBNcK
         /FYxnvoZ9reZ9HSMg027PogAD25PVVAGtNw46txwzxLmCmOGGR2x/SfnIOgkGufZIek0
         T7i9hF2+boGYwS9jIEu2EdKYIvTCcMsLwt93aZ9gGFyDGgc85E7LoLupPtJuYLjtDc8v
         NRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNT+DCfUqwj/pE7ErUm6d5wjv6OQt/ojsZMbHaQZ/oA=;
        b=u0Zxg4ZgmHLkfQfAFNHiUv7oc+sJ7fBj42Y3cUepDYtNXLci58yjc4dSvJABBASn6o
         OVFXbYlcEoivGtdJQI+HG2YxFJAkYDK0OIn9ySX4cuWgJbGbEtSMtHGOhtBEU0pV5e3P
         eW1ww6uVs1ZT01VbD5DJ9Tmq7/73gHlz2dwN/kxfZaHMwJeh8+yCImJU4MH126UMA4XP
         3aVxoc7jtudTekeSLbEAndXdswaPialcnyFcFt3WfHrkhb1wb7paXbkWQsms8waZVNOA
         oLitjNlachOy5nHZeIK64XTlAKkfAbNeKth1fe3x2hMIQSZtjlgzSJmSkQ5soN0E/Jjc
         J+Ag==
X-Gm-Message-State: AO0yUKVQH0/UW5ayc653zTmxNVKn2LChTTZXBfFAV7fwbHwHdrnB4Dwk
        sJvONmoeEsPppr3/YtvyyXF/1w==
X-Google-Smtp-Source: AK7set/C1ywHvaqC5YRQoXkU+oZTXqBZrb05uso7vtdvE66T+ZCEjZ0xV/RTecCzPatCDsxrvkSrCw==
X-Received: by 2002:a5d:64e6:0:b0:2bd:f17b:bfd3 with SMTP id g6-20020a5d64e6000000b002bdf17bbfd3mr197868wri.4.1675193328057;
        Tue, 31 Jan 2023 11:28:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d7-20020a056000114700b00241fab5a296sm15294321wrx.40.2023.01.31.11.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:28:47 -0800 (PST)
Message-ID: <3afcae23-d23e-13bf-7c8b-ff984da74f2b@linaro.org>
Date:   Tue, 31 Jan 2023 20:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
 <20230130114702.20606-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-5-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/01/2023 12:46, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

