Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0B0C54EAA
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 08:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjAWIBR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 03:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjAWIBP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 03:01:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53431CAE0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 00:01:06 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso9941655wmc.4
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 00:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgwS1wLKSY/UzsprCjGjz1jf0uYNHHiqTORdSq4h/xs=;
        b=IsuNxvgMqdlvZT3QGtWGnsuF4PY7RvVV499fHpcNx5aM1X7MZ0k5cdDgw9zZlzWR+K
         jVBQpgYP3Fc9W2dLwiUaBZ6UtY7KFBBnDxLMgIYDTHjmE3DBU4MUHgpYeGz47sPIKgcP
         ie+HLMFvjEUpDyYg93WbT5hA6/dT3wXGM76PuYvn+8nNnWc4XMsUvtaQcaUADycAIx3O
         CDnxYR6rYgFdUMJG5xFsPQo0ip2+vfQlBEuTTC+DQQ4BUriARJgmKA/mChWnpSGNGMDL
         EqZD71AB8iDeXKTuZ8JSRMn8nIFo7G1bdrtKehwNJ5huWinE3Pld4T+buE8UIlEcSlt9
         7GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xgwS1wLKSY/UzsprCjGjz1jf0uYNHHiqTORdSq4h/xs=;
        b=2/jeGLHE2Xb9huKqtwnYHFPP5xXgs6cYhJj+qvYxY30GXa7MZVsnK0WgV7/X/fAKLv
         oBTOeeFv4PLF+SC7pDLzy9qHcVIb2gnCeXWLLd12tBkhJyTQljY6cySzZ8RiDElZyuLk
         k233K+qV3jkc0d1MzNLhmPuyH9mp9jjIQQIeRgH3D6GszV4D7EMt8XLkbU5tjlFQOPXy
         KHQS/BagFcKnJTV6RzBbh1cEuqdQ3gVHnMvp65g+YaSigRcZmlVYVB5lmNHp0SPwZNyG
         tkp2nXVmrj2em052OqqrAx7IQbfb44uYmulZv+CD10T7LmkDyC/dSnfTv4xuMyolxr+P
         dYMA==
X-Gm-Message-State: AFqh2kq2D9KL1UuXDwWGY6Nmxzy7VtcEZgR8LGzB6fiHCSC7q1pGU/f/
        Lnv2OCdAdk0O6/MBtKoLUAB9/A==
X-Google-Smtp-Source: AMrXdXtBxcsmF6l5HL2ODsqVwfRUK9XbGKORvubwbbLb1eDRMhP295OnmpH8GomgMdPsglnkk0Vr8w==
X-Received: by 2002:a05:600c:1d0b:b0:3db:88f:996d with SMTP id l11-20020a05600c1d0b00b003db088f996dmr22170395wms.36.1674460865387;
        Mon, 23 Jan 2023 00:01:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c14-20020adfa30e000000b002be50604c81sm8386152wrb.47.2023.01.23.00.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:01:04 -0800 (PST)
Message-ID: <0c06bfb5-c0b7-c3eb-4c99-8e77280a942c@linaro.org>
Date:   Mon, 23 Jan 2023 09:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND v5 0/6] Add resets for ADSP based audio clock controller
 driver
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1674322340-25882-1-git-send-email-quic_srivasam@quicinc.com>
 <030115dd-f489-5d4e-c993-e9fa8b550f04@linaro.org>
 <43bea488-7a71-aec3-508c-6a541d5db508@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <43bea488-7a71-aec3-508c-6a541d5db508@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/01/2023 06:13, Srinivasa Rao Mandadapu wrote:
> 
> On 1/22/2023 7:21 PM, Krzysztof Kozlowski wrote:
> Thanks for Your time Krzysztof!!!
>> On 21/01/2023 18:32, Srinivasa Rao Mandadapu wrote:
>>> Add resets and remove qdsp6ss clcok controller for audioreach based platforms.
>>>
>>> Changes since v4:
>>>      -- Update Fixes tag in Merge lpasscc into lpass_aon patch.
>>>      -- Revert removal of clk_regmap structure in Merge lpasscc into lpass_aon patch.
>>>
>> Your v5 before resend have build issues. Please fix.
> 
> In v5, one commit missed to amend local changes.Hence resent it.
> 
> on Resent patch series no build issues.

Resend means you send the same patches. If you change patches, it's not
resend but new version.

Best regards,
Krzysztof

