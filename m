Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2DFC25B70
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 18:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjJZSnA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 14:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjJZSm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 14:42:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928C11A5
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 11:42:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32db8924201so789081f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698345776; x=1698950576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QYVxFMIK+d/9mUTkspGoeUwkCqC2XLt21uyeNzGMBc=;
        b=X7RqHWdKtMJN9Fd897kGYN/fFujBPsJ7oFSJk642johSRYQfG3QOkLzDebzyyEzdHb
         8X+x4c8tAnGJrwvkhb8IlqMHFu0ttuMt3Adm5WC0uUK6kNeY4OUaRN1c4jnfeourriQB
         u4IiV4uTNpiiX6PkOMVC7nhPUiT+ybghrMxkPhEY+2exczQ9cryxPI03RdcmF0N/4tPv
         igR93nmcPkCoazPcOhUz6l7giw03JBchBN3uqcau3knEY/OTAeBpxbDpS4OdlAAC6gLM
         qt5Ew/io/FlwP5rfJaUVEV70dI3gq6jdetSvpoeKQ+ERjAcNovt31tf68pfDKbh8uY7c
         mSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698345776; x=1698950576;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QYVxFMIK+d/9mUTkspGoeUwkCqC2XLt21uyeNzGMBc=;
        b=P0MGkoPHMGPuOmHNKt5h+vEsMhQgCbwpwBF8EdyyF5ND30xTsGSKiuKhRr4pSWM8Ya
         mQk00ZZMgsCHJGRdF73SwWNE2jT+GoEa0b25oBPv84Md6g9UzBRYuagT51RXzPMmLhJB
         nt1AynXnoZ4FhsyZeYqg/EYzEl+rB8OwdUICqe2DpOIxIgpV9tzzPCGpvwQhe4/Y3H8P
         8feq9LzBC2KjS94lgr38H4RmsN+VlsmY+Ie+ZrMgkDVRvwIxnsCtXOZYIOfjr4kyvVNd
         /2h2fa9FOdrGG/r4AulFBBwU7WHO9tBRLqtHSFdhSVhJB7PVvJK9ICSHyPfuz5t8Pasu
         eMTA==
X-Gm-Message-State: AOJu0YxuROMqvRytC7atMpobq1RqwXUqPNVFqUcpNtLfLiIzOKK0UnQY
        f5JqVqPI6zcBwbe2Lr9WcH7Drg==
X-Google-Smtp-Source: AGHT+IG1fgLc96stbZJuy+8r4WUH6ETZyD9Q2v5+kWPmrovdmXxzDQOnIdUpRMV2sD7k9mrtc+StSg==
X-Received: by 2002:a5d:6549:0:b0:32d:a283:de94 with SMTP id z9-20020a5d6549000000b0032da283de94mr358358wrv.57.1698345776014;
        Thu, 26 Oct 2023 11:42:56 -0700 (PDT)
Received: from [172.30.204.255] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b003232380ffd7sm25522wrn.102.2023.10.26.11.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:42:55 -0700 (PDT)
Message-ID: <77314fe2-2936-4f89-a347-4eb288507c47@linaro.org>
Date:   Thu, 26 Oct 2023 20:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231025104457.628109-1-robimarko@gmail.com>
 <20231025104457.628109-2-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025104457.628109-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 12:44, Robert Marko wrote:
> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
> and drop the curent code that is de-asserting the USB GDSC-s as part of
> the GCC probe.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Applying patches 1 and 3 without this one breaks usb, no?

Konrad
