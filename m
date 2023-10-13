Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF583CDB47E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 15:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbjJMP4Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbjJMP4V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 11:56:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A61FBF
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 08:56:18 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32d9b507b00so797162f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1697212577; x=1697817377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL18hk5JsFe4nXO4KOVUi65U7rixgreCJydX/X6y9mk=;
        b=MFNMVQWIr33fr2xNVIQ62hr6045OYsT6A6NdQDqCN+o3+1kM5q5Or/4WEYsuErirFq
         h+XAaFwTsxn0/IUjegURXb0zWIm9GewtqwPgVHCsr6QGQPM0MJaHpYlsFsWH7/BzX62v
         bXepjcwN5coQQGwRpzBuiLgxlQJo70X5Db/qShAvK2c+lAeKwFprLQyu7jZBFCiCcBXY
         rFcd6g9XPqqvsxEA/hA7tsnoCMqCxLAAFQ1n9ET1mHdHHpF6p58o8VReK9m5V4bIFTrd
         EgOGeH2FHeAujzddTdb4mTJXAegRZ2AEmDh1nWSGy6zTXMmflP4UV6cESzN9CHwQQkJy
         nEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697212577; x=1697817377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL18hk5JsFe4nXO4KOVUi65U7rixgreCJydX/X6y9mk=;
        b=N+q5new+118mQZ5+0y1OAUR6HejIevdz4m9f7sbDw/ScvJ7IM8FhJUhHaVc1HOnwsf
         nu766s//v7/x8H2PsYWzLzoOffApERL2LVBwMZLuR+iHn2+N80FMmHfXTLjooBhvYjI1
         BuOft/aKu46opo//w/hEl35y90KXWss3bINrTi06d3z6e2/7CqpEf4IH00V+ITEub0ul
         0mNuhUVoAfy0z4QTbCmSK1pz+O072QV8gpsIp6pMIDGCLw7wNpEn45YRNzSzLl5jJDsb
         xfsdA2xE3aYY90f3CPhl/wKpOQQhsCRXOaWLbf2TJBhbOv4eoZ8T3N0Pkl+8b1ZKh8yJ
         lrmQ==
X-Gm-Message-State: AOJu0YyQugcaYXfxVX7MrsgeJUZf3wFxTZO4U588xtSD/GyQb52B+6U+
        39/irBXrmn/7HODFKhBixLqWrA==
X-Google-Smtp-Source: AGHT+IFCoo0IzBlMAA4TrE2I6pvmzmCXr+kr/lGD7qgNi5epMPiamTtxMdZhyMwsiYp+iIcP5iaD6w==
X-Received: by 2002:a05:6000:1001:b0:32d:81fe:7104 with SMTP id a1-20020a056000100100b0032d81fe7104mr7622602wrx.63.1697212576925;
        Fri, 13 Oct 2023 08:56:16 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c450f00b0040651505684sm488980wmo.29.2023.10.13.08.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 08:56:16 -0700 (PDT)
Message-ID: <6fab7459-42f1-4d3c-a777-d92ee000f243@nexus-software.ie>
Date:   Fri, 13 Oct 2023 16:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
 <20231012113100.3656480-4-bryan.odonoghue@linaro.org>
 <20231013140921.GA3773179-robh@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231013140921.GA3773179-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/10/2023 15:09, Rob Herring wrote:
> On Thu, Oct 12, 2023 at 12:30:59PM +0100, Bryan O'Donoghue wrote:
>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
> 
> You don't need 2 'media' in the subject.
> 
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>> This patch depends-on:
>> https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T
> 
> Who is supposed to apply the above and this patch? Normally, this would
> go thru the media tree, but you didn't send it to them or the media
> list. 

Ah you're right.

I've reused the list of recipients for the camcc series and missed Hans 
from linux-media.

---
bod

