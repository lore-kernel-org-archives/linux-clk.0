Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73087C07545
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 20:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjJYUiK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 16:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjJYUiJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 16:38:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B03138
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 13:38:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso2153671fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698266285; x=1698871085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkNNejbCmL/k7pWRnrsJGwZqih1Jcn9nw5isK0ZcLhI=;
        b=BqFf2MHxH8RheMmwKqkJvx6gQAkizRpw+qnQqERHcsX8hjnF0eMrGg/5S0z1V5f7Dp
         mS5G+ZEcT3GDbiC5U7PvMZp2Fe6+T6ETsN2fNvz7XXSH+HTOsyy3xSv0EvzvI71FteF9
         QJZSJeVGkmq6aZVucENJgTZ7KFmm59YtZkiVPM34VvsIOeOhZrxCW5RMY1SdmZsDC86j
         pyU7b3eUsrhGVCgyYPvCDV+/kMWE+6PLAqcpMtd+ntEyP56O8qBDk9NRvrlPZyKXpnRb
         X1wgeNtQg6epvPnpGIJQ5vlG6SK7/wY9kLDhYWqKUSd1WEN2TlzmW53HbQMmlQVQKsjD
         zhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698266285; x=1698871085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkNNejbCmL/k7pWRnrsJGwZqih1Jcn9nw5isK0ZcLhI=;
        b=mrjoAK44EQkanfLzT+FMLPElHiLbjBJ+vwZHzyLHxgCtezxLJbO8VekhkvguxLa4QE
         K207A7eK9P4zIe1bmhdSGZoNA2qNd3qK+ghPDF5VH++Jt5BVyNW5xMicT0h3vDhTZtXS
         rRFLehGuJZwg6mZFI0mXVXLYXTWqPkaJQD/Dy9B+RIsLSF2Tw4uLQoOmWYiCy9bfgQXo
         zHo/z2xMAEMLy3bHHCrBaF2bkoKv/jpvGmNFH8JPeZ9LYZ6r2Q/QEgfXa4n8v3q1MbcU
         Qce4OGXv5ADUVc3qt5+j9UQJr4YgprLVF8DwWvdwwGXW+4sgNzKvL8Yo7NC9/cBpwa2v
         UDJw==
X-Gm-Message-State: AOJu0YwlOEPywKNzRnloCZ9BWzLeVFL9Iv7sqRw6WRG0SL7QTkq9dGzu
        NlFf+XBDl2bBqjLi5Fk1I4lU1g==
X-Google-Smtp-Source: AGHT+IFEsNWUEVHLgy9no9zt5n/oSi9ff1FZksTxjp/VP/wDM1Yxxc6Zxk7YI/vaALGIt3FYIrQlCQ==
X-Received: by 2002:a2e:bb12:0:b0:2bf:6852:9339 with SMTP id v18-20020a2ebb12000000b002bf68529339mr10819527lje.3.1698266284776;
        Wed, 25 Oct 2023 13:38:04 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b0040770ec2c19sm669758wmq.10.2023.10.25.13.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 13:38:04 -0700 (PDT)
Message-ID: <c9c6b20e-cac2-43a1-a026-ea01b0e245bd@linaro.org>
Date:   Wed, 25 Oct 2023 21:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Add support for SC8380XP rpmh clocks
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com,
        quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        abel.vesa@linaro.org, quic_tsoni@quicinc.com
References: <20231025133320.4720-1-quic_sibis@quicinc.com>
 <20231025133320.4720-5-quic_sibis@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231025133320.4720-5-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/10/2023 14:33, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Adds the RPMH clocks present in SC8380XP SoC
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

This looks pretty straight forward.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

