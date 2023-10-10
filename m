Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C41CD80DD
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 13:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbjJJN5C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 09:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbjJJN5B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 09:57:01 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2BECA
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:57:00 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406618d0991so52575835e9.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1696946218; x=1697551018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYWciwUfzF59aHppIFLCZXbAD7SKQWPGWbHHZOCCLvs=;
        b=wfN99QRgDjjm2iGMpo3oWU9i3lUsAAhm/YBsddPpXjMWfLu0kCIfJqToljQSsvj58z
         QK5eQ+FrojKspVLIv7zv5egDon7dfv5FGNCdECC+Nohtu6Tniwy2kDR3JSgldruhNbnN
         C2oUE8JK0UxkNetAyEax4/wlysI72nvcEqJlMZ02wZ1W3gyeNkfDoKgT7khWuQUsk4XO
         YSWIQkvC+Z1m95g+fNgqn2TdHzC+kKD5sgm8rAYRBmWvOejaSmfg3gx4g6fT9G1Hmn91
         zKFTsiYMsnbU9NyTaGbLbl/DjQiFtcHcxjHCc+N7cxJGGYff4IlUYq5v69LD0iOpJbn5
         nleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696946218; x=1697551018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYWciwUfzF59aHppIFLCZXbAD7SKQWPGWbHHZOCCLvs=;
        b=WazoaObbNZmuf4DNaUzDb8Nr1phWNrB+gGTsk9QXLJcLjtmNFiVqsNqh/O3vs65WY2
         RxRJuiyPr/6T6V7XuIztqmtb/ckHUK6xZDlGByKMKjAmUDxCN7b6oZLxeBKXWAwe4Ydt
         VkQWqCeDqu89a0clXmM3Y0y0QSXBV+W28h3JxCrt09zbd7EWvhbMr8STveJiDEtkvPXw
         ur3VT9ACdTlRMTatymKv8F+uxAd6uIsYMOSL3tUq0PpqTXIF8iCIENCzKKBP1bFyBOpJ
         hMLxEg0TXzEcxTTAjQkIYK5rfK7il0immW/6QSTnYZcyK3oEWAoMf7Aoyh1iFCL8fWzM
         FhMQ==
X-Gm-Message-State: AOJu0Yy/iVpaD92xDDXLIYyNuFxh+efSwf9LfD5L2g38Sj3YtsQhzCNH
        uMCp4FGgikBkqoJ8WktqU6/NqQ==
X-Google-Smtp-Source: AGHT+IE+vnxzSyo9AaWe7ZgaXykbBDq6JHcYIoNKc0hMWYtSIGkzVrq3qNRcxiIk6PFrwBLg+2Ku8g==
X-Received: by 2002:a05:600c:3781:b0:405:1bfb:ff14 with SMTP id o1-20020a05600c378100b004051bfbff14mr15183186wmr.9.1696946218169;
        Tue, 10 Oct 2023 06:56:58 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b004068def185asm14420554wms.28.2023.10.10.06.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 06:56:57 -0700 (PDT)
Message-ID: <04374506-023d-4680-9f0f-77d6893288c4@nexus-software.ie>
Date:   Tue, 10 Oct 2023 14:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     konrad.dybcio@linaro.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, jonathan@marek.ca, andersson@kernel.org,
        quic_tdas@quicinc.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        mturquette@baylibre.com
References: <20231010122539.1768825-1-bryan.odonoghue@linaro.org>
 <20231010122539.1768825-3-bryan.odonoghue@linaro.org>
 <169694433325.625737.10533845261157845416.robh@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <169694433325.625737.10533845261157845416.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/10/2023 14:25, Rob Herring wrote:
> 
> On Tue, 10 Oct 2023 13:25:38 +0100, Bryan O'Donoghue wrote:
>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/media/qcom,sc8280xp-camss.yaml   | 582 ++++++++++++++++++
>>   1 file changed, 582 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,sc8280xp-camcc.h: No such file or directory
>     26 |         #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I guess I should be embedding this


This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/

or


This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/#mc33be3fef01bffe892f72bd5e567dba6a047283b

below the "---" in this patch directly, instead of in the series 
description ?

---
bod
