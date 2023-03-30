Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAAEC6FD1D
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 13:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbjC3NxR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 09:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjC3NxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 09:53:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA549773
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 06:53:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g17so24631641lfv.4
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680184390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FG3LYyeKyzOlPVZDphJojew4K4QdUYrf4yISTJWKKVQ=;
        b=kEIVUbxLnj1qdLvhXQ1MEJ/mnPJYXkGEboRU+ox1QW9K9B9uz6kvDo68j3yAfQuq4P
         O6APGuz3fXR8csxAW57NUXRYv9p7I7Ymvy5g2y0Y03GoUjFJ8BkAO0TfL909XVhHTy+7
         uetj/WFC+mVZYvk1yczP0lR5+wtxv8YYZvqlKxP4JIdphbredkn9Bo2RHiYOyH2Ld+jk
         eJqChBAkp00O0Tt5EdL0v55EkFYENAMPEoox0M1vvHc8cNn9wtucgYzXGq7seJQMDVwV
         IvK0OLYGqpISp/sDahxvtSNUc+s+ppIpqzkdj0Pd/RfY0dcXKoOAqaAUWcWRjVArT5Ov
         3W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FG3LYyeKyzOlPVZDphJojew4K4QdUYrf4yISTJWKKVQ=;
        b=lZz58VEodFYQFZRiRKSLGeD/cVhrqTeIgPWlz/uCB3ysaeuxvSlnP06PNHRnLB0xmv
         dBF3NMtfdaP6awEH5Xu4Z368V/t/Jq5ceUgdVktiiO5jmnI4pTJrWGQmWtr7uGfsQYRW
         FhobcXs1eBazy8y2Z6XCZI5tM3cYNXUaSg9xW16IExXnYSDlTEJLZGZ3i1NdhUPKoCf/
         WNlc4vIZAnBP9uhZqXU3354L/JmE5MCM3PpmUQIn3wPlMfhP4crSyO2v/5tLRygarHCG
         /YkrG57DdLFrzJxkvSbAYz/4XcLtCuA0d6HA5R480486mKXKjui9dCwi8KZmjfZP/hqQ
         e6pQ==
X-Gm-Message-State: AAQBX9eUniG4LYwYeJhln2wcJA/EU9lIFFnE6YzZDS3Mlj2G1zphhYUf
        8NvoR4UnY2sPwXtBH/e9APAl2g==
X-Google-Smtp-Source: AKy350bYeOM2mPCk0/HBGXVg/NVXb5IPUO2Bs/RkayxfXkyDj1RLxjlGuBjFokZ8uPZuBo5n+Kvmtw==
X-Received: by 2002:ac2:5dee:0:b0:4ea:f74f:c077 with SMTP id z14-20020ac25dee000000b004eaf74fc077mr7488939lfq.12.1680184389889;
        Thu, 30 Mar 2023 06:53:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x20-20020a05651c105400b0029ee7bc0114sm4042047ljm.64.2023.03.30.06.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 06:53:09 -0700 (PDT)
Message-ID: <c430a7ca-0778-8262-4a45-11134cf5ad76@linaro.org>
Date:   Thu, 30 Mar 2023 15:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: clock: versal: Correct example dts
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
References: <20230330084846.14516-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330084846.14516-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2023 10:48, Shubhrajyoti Datta wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> 
> Correct firmware node name and compatible string in versal clock
> dt-bindings.

That was a valid compatible, so you need you describe why you are doing
it. IOW, what was wrong and required correction. Because correcting a
correct compatible is really not obvious.

> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index 229af98b1d30..4bbf96484b56 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -50,8 +50,8 @@ additionalProperties: false
>  examples:
>    - |
>      firmware {
> -      zynqmp_firmware: zynqmp-firmware {
> -        compatible = "xlnx,zynqmp-firmware";
> +      versal_firmware: versal-firmware {

No. If you touch it, at least make it really correct:

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof

