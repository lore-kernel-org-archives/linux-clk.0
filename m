Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCFAC25B6B
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 11:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344764AbjJZLHo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 07:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344776AbjJZLHn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 07:07:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9D71AD
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:07:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507c91582fdso1070455e87.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698318458; x=1698923258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nz+wA04FPf6lhenNUiyQXPpaKAqsi4awJDETCh+1Qs0=;
        b=dZnjCiGdQqNkBuAn1Q0191p1Eo7f+mrEUHVNbMnHCt82xp4rbpKVNDBcEm9JG+b3Om
         fP0CnWcWzN3wBcSp7hBYTcKY6OCHbgiUqatyoRFG0MH/GrSDP1CzwOceiRgIiWbB9kYg
         mcnz3llS/AJ0/uz77m2OCD98QZDPidv++MARMbhb2m8qR1ijuswrmVRzBXmAgPy1f26h
         +KUmCt791qmD1R3f7S4g2tPnz8dkrCiquNgqGsoJpyG89eifD2nYDY/asxrZK+C3Q/Th
         n2ji46w3dpF+oBc465QgdCDKxzQsEhtUMRmvhQCxIf/WOr8tIfQcXsn/x99Y+BjfwFU7
         ++Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318458; x=1698923258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nz+wA04FPf6lhenNUiyQXPpaKAqsi4awJDETCh+1Qs0=;
        b=fxKTy6toXuhR2JUIWXueVSzQDX2VAd+nswg9LdsQ7PA0JJA3YdrqYD+ZscCVxI6ABc
         i7PtqW6q4ETL8HDyQqxxlBOq5i+iV3aWQA7mW8kVtM3CWO8/ocMrQ+hn3S93qX+kSBr6
         vIBOyoORTHhE8OkVZJiNjutc77iyzYVmPItJW48kO7vFzAq5xP4gaS+PG/GxHE+PHp3a
         rJX1ixO3XdNYx6VWegSF+HKvsH3c+XodwVBRTwfpnoeWumPIz8T1GvwWiEUokYM+mruE
         7LhQbIlG7EQ0DBLGfvD9X3gj32j91i31XqHQ3ZgeSYm7mg1SdDgnKb2x2P6Z7aPFjIFz
         N2zA==
X-Gm-Message-State: AOJu0YwZxlx3s96szvtnPMfuisoAgWQkOleIECpDqGlMVPGjvjd8aYBy
        AZgym+b5lJaCUtcqNKn2c3MEdw==
X-Google-Smtp-Source: AGHT+IG4jLAcGNTYqekXkUs1H6Lj4A7OmRy+1PEC3vBfbnyzxVeHpULor2PTFDDoJRlwQ98aINnPiA==
X-Received: by 2002:a19:760d:0:b0:507:99fe:28f3 with SMTP id c13-20020a19760d000000b0050799fe28f3mr12617130lff.34.1698318458678;
        Thu, 26 Oct 2023 04:07:38 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q9-20020a056512210900b005079691360csm2978277lfr.49.2023.10.26.04.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:07:38 -0700 (PDT)
Message-ID: <17a61f24-3af2-4749-881e-2fbe5275b6c8@linaro.org>
Date:   Thu, 26 Oct 2023 13:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Add support for SC8380XP rpmh clocks
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com,
        quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        abel.vesa@linaro.org, quic_tsoni@quicinc.com
References: <20231025133320.4720-1-quic_sibis@quicinc.com>
 <20231025133320.4720-5-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025133320.4720-5-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/25/23 15:33, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Adds the RPMH clocks present in SC8380XP SoC
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
