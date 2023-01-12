Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE0C54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 04:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbjALENr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 23:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbjALEMp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 23:12:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2511C4D49E
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 20:12:22 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bu8so26623695lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 20:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHLy6O4jqHDTKSztpi7y2ZBtM/9lIWsx/M8aFoCYq2E=;
        b=H1u9LiNnyHGfmPscslHjxDyCO203/4x90zy+Xk9OatTpYvkbMK87ZRAkBso5UTXN23
         S+rP+kmGyIvxmK5FJRsAhl6PN+r0RxZmigBNwl0MyizeN0EsxG+axMIbUed/MucEDxoK
         xlh+DHqjlJXkikm0G94qOGjIBgpZEm3LRTphUoD7jnN5Lg4f3/1pPkPEGNgQH2dQIf2K
         wuaB463jDTWT9o8dwisigPOFa2aWsKPOd7hbV2zoOaCt/fy/IJomk1XcQjhufZLQQLiM
         EqIrK0XkVuG6vWfTplmvefb9omY05xi57gDZQEGy1aaY4HexWvkGjlGEdeVQ+hjdt9R6
         7S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLy6O4jqHDTKSztpi7y2ZBtM/9lIWsx/M8aFoCYq2E=;
        b=lnWv55BhwPPvIf+b9JJ4dlmIg7s8h/+XaA+nht6+JQRgctRy1HW0gWHvfYoCBfJFz3
         1AGBc1YWZx5eLu13mbWazfmJgQmDvsKpKlrgm9M5uQmuM5kUKt8zZpe7WCqUUxz0yf3q
         MfpguvXcyeRc9WzaSQRn6QnIVqCw6jFQmvZMcL5JdZxZHCZ3JPyuLB/NGykyHkU+kZfa
         A7FKgtI8lkIKCZFL5SmGn+sxfdzJj+F1gXiL8Ylm9+JYpNtthflrW8MptU8Fj79hkK4N
         erpJBLK7fcCl8WaYb5O68yJQQiueU2ToFCvehvGSs4rfHvH5aKxIhJLAO3UNt0ESqRGr
         fkfA==
X-Gm-Message-State: AFqh2kqMxehAfCuBlRrPO49esnowqTKIPL5bjIx3Zvj5cvvYPhnmzS9f
        RD79vswv7P0Gvcfi1NH9Y49/ig==
X-Google-Smtp-Source: AMrXdXu0zASLL432Ldc39pvDctyaFF9ImEH0Re4xHuqAMoQnwm+xDAK/0m6p2WCCIOGrimgIrLfUwQ==
X-Received: by 2002:a05:6512:3190:b0:4cc:a111:2742 with SMTP id i16-20020a056512319000b004cca1112742mr219414lfe.15.1673496740548;
        Wed, 11 Jan 2023 20:12:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x26-20020ac2489a000000b004cb018ad4dfsm3053566lfc.135.2023.01.11.20.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 20:12:20 -0800 (PST)
Message-ID: <d09516d5-d67e-2314-0ab0-3af04b9d1f61@linaro.org>
Date:   Thu, 12 Jan 2023 06:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 6/6] ARM: dts: qcom: fix various wrong definition for
 kpss-acc-v2
Content-Language: en-GB
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230110183259.19142-1-ansuelsmth@gmail.com>
 <20230110183259.19142-7-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230110183259.19142-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/01/2023 20:32, Christian Marangi wrote:
> Fix dtbs_check warning now that we have a correct kpss-acc-v2 yaml
> schema.
> Change acc node naming to power-controller and add missing
> binding #power-domain-cells for each kpss-acc-v2 power-controller
> to reflect Documentation schema.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

If you pick up my power-manager suggestion, this patch has to be adjusted.

> ---
>   arch/arm/boot/dts/qcom-apq8084.dtsi | 12 ++++++++----
>   arch/arm/boot/dts/qcom-ipq4019.dtsi | 12 ++++++++----
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 12 ++++++++----
>   3 files changed, 24 insertions(+), 12 deletions(-)
-- 
With best wishes
Dmitry

