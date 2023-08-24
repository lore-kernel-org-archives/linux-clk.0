Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB52C27C40
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 18:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242998AbjHXSHh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 14:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242983AbjHXSHN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 14:07:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CB719BF
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:07:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a1132b685so253847a12.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692900430; x=1693505230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SNsiJrErSwjlu0Cfj9DTAj/ei9LJJOL39t6xspM++DU=;
        b=uZsDdfi9TnEUePdHmGF9o8f+AHqC2kq+0XeRHUevvRe/dXBSrCbS5CJqW6PwuBjnxP
         +x5WUXEBO/KvVzDzEgQUgGQVbiQlqnZs4v8VuvZTVqrpn1HR3cywATAYyVrJ6sab3ndR
         yieqFNpNQJK+ch0XprIbTIJzRhzdg+YQeTxXDV2im8gH5Fkecq7BIeoUc6cV9Xqrx0GH
         4uo6romKwNBAIj2h3Z6t2Og7mSqh4KvUcFpGaO9UGV5d/k++zo/s83HatUHljQXqRrit
         nCm3dDQdCqOkPNZg2gXDUC+dyvRvcDvXA1ksBt2PlLOzqFUzegWxNBClPeHrKPUqXe7Q
         KUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900430; x=1693505230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNsiJrErSwjlu0Cfj9DTAj/ei9LJJOL39t6xspM++DU=;
        b=EZA7B3nZhhCADqXPlm/ZnZgyvFEl9k0LR1hnr67lgtXrI05IjCYH4I8IQ69WO02T/o
         /5cV+gWa6M2wb2TySDlbAoTAoac5Sf2Lu8jtF5h/FrS2FoXHfyB436hizOnMOmuauzAa
         3bAjh6PPIgrXv9NIKdOCTxEaCNg6PjYgYzIWdFP8b5sWcAz/oqxbospNMK7S1xRAKk3e
         Y9ZgA5nUFuTB3UWSW/Al/+bt1Vn7Bhcu/nhwQdYgzQxjObnmMUfPslU1ejvn6T5lF3VR
         rjwFpYWEuBCJx6QO8Q71f4N0giLyAuIO8M63X1wv+c5gj0CiSUyFq3QuNCJ0m+LoaUWo
         Wxpg==
X-Gm-Message-State: AOJu0YyqQdSjUOkXaL7iZPUrq923R+eDSQmpamH6WkM/s0MGvrZ2aY/q
        fxflCvcTagOwxnyKy9RUZQCC7A==
X-Google-Smtp-Source: AGHT+IH6zD496GztLRBoA0hxHEdrLiGr/znb4J0/yVBC8p/LERI8GQycAMjvRNjzkkYoy6fOAIEIrQ==
X-Received: by 2002:a50:fb04:0:b0:523:2e63:b9b with SMTP id d4-20020a50fb04000000b005232e630b9bmr12690578edq.24.1692900430035;
        Thu, 24 Aug 2023 11:07:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402120600b005232c051605sm22287edw.19.2023.08.24.11.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:07:09 -0700 (PDT)
Message-ID: <e16687f5-bfea-f986-ea89-575f4ac87989@linaro.org>
Date:   Thu, 24 Aug 2023 20:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add RPMHCC for SM4450
Content-Language: en-US
To:     Ajit Pandey <quic_ajipan@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230824173410.550126-1-quic_ajipan@quicinc.com>
 <20230824173410.550126-2-quic_ajipan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824173410.550126-2-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/08/2023 19:34, Ajit Pandey wrote:
> Add compatible string for qcom RPMHCC for SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

