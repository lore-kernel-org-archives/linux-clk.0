Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95129FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 15:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235869AbiJ0P6b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbiJ0P6a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 11:58:30 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9366D1958DA
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 08:58:29 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id i12so1705372qvs.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XThBhQQU/fAMR7//UjBcVca9eLJYq0zQRqbYflF3e60=;
        b=vn5+VIstoT3RANnBakJr3oJjBGf3nRuZN0W49n/m5aEv7EzCNUfP8eqJz0jkJtP/nh
         ea8DtB0ONmmQcGED66p0MgwexUnbkOOlWMJgLMJOC4kxkiyznwKDexg41DM4giKqvMLW
         QMLF+YvW9Rg8s2N7XkK900Yfa7eCiYO1V36vOxjMXQHOZl1OBifYkQXOwV0wcBrOBBHc
         H2hMrx6ivQ9VclJzWvz7HNCiCU0Tsvisyc5k14hb+7+IoPKqJot5Vuvn27LXF9+f4qNj
         OVTD1sGcXmDLEo7O1VuDsPNQ05dbaoCOF90pRkxi30DCgQyE2Ksq0Vu4jo6VZXNeDGcM
         cHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XThBhQQU/fAMR7//UjBcVca9eLJYq0zQRqbYflF3e60=;
        b=mlApUbxVGU1CqvgDZYSnrv+R5gA1doQKQ0dcfsxJQbS5IoEiMRGVNhJVy3BIDUr2Ar
         B5SIUTGRyrg2j2CHfA0eKXvK0xg+C1lEn0PLSfFMh6ysNdY/i1iFu+Vh8cgGvqSF+B0u
         6yDzfhIX++2zYjrIAAn+hAd9d0GRr6U65Mfr3tx3tapGrHZ6LSfRh/07gJsx018oCMkC
         X9KepiLWGTNkvLHSZvTh/xlo7LJgRecQKZ+HF68MKJVa++MFSHCJaUXqmQkRaBk9qOSm
         P9qUj/NxllHiMSRVz2Me5/2mqKhKl5FW2ZYtYJOj3EOnlObNdSUtTFM2AGQmM4tNHKQ8
         Up3Q==
X-Gm-Message-State: ACrzQf1Va3mzVSHs2c/9UrPp8G9kPDaG2Mx4X9/jG09l/Ox3qVeWrydh
        gL9ys5KollkqTT6ggY0kUOCBeg==
X-Google-Smtp-Source: AMsMyM63dAZmL6dYeU/3TYl4x1vmFYE4NdY6zOrpG5oeG2B9Bloxk1vl5nT4e1Q3apnTjbkPHHAhQQ==
X-Received: by 2002:a05:6214:2461:b0:4bb:4aa2:e59e with SMTP id im1-20020a056214246100b004bb4aa2e59emr27458509qvb.98.1666886308766;
        Thu, 27 Oct 2022 08:58:28 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h129-20020a37b787000000b006e702033b15sm1183574qkf.66.2022.10.27.08.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:58:28 -0700 (PDT)
Message-ID: <621c7467-6c3d-09a6-dd16-b9fbc22f7896@linaro.org>
Date:   Thu, 27 Oct 2022 11:58:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 5/5] dt-bindings: qcom,pdc: Introduce pdc bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-6-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190441.4002212-6-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/10/2022 15:04, Melody Olvera wrote:
> Add compatible fields for QDU1000 and QRU1000 pdcs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Looks ok, except usual stuff to fix...


Best regards,
Krzysztof

