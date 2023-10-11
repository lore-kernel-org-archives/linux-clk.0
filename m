Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6282CD6E5A
	for <linux-clk@archiver.kernel.org>; Wed, 11 Oct 2023 11:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbjJKLHw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 07:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346135AbjJKK2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 06:28:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE708C9
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:28:51 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so8456651e87.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020130; x=1697624930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ht5utTuG5wW1wq2rrU2pauj363H+uTmJt1GixQr1DSM=;
        b=EVRtXE67gk+LC0mXBwljVYzi7ZwnklKR9lIwbViIMLS3LuACZ2Ry91HKub8sBBvcuJ
         RkRbXaFKh5xJZypm8mBJf53ajuE+YprOBiwkDheoECB3fBFAxDffEIgfC/svXUpyBfPj
         qfBGh6SeTRH42VEABkdZrlk5pud2VkPC9Z3wbbGwqWg5VJyjGrLq8HWkXltiiObQ83Pm
         0XA3JuhDADijpZMLFoEQaN7adtiB9nl8nENDKH1k35upik1KfHMPW5Y5kD9uPyk8w0S6
         mWAxFA6jriXiW3sFn+uYXhdc/QiYGadLly1xxn3kMJsHV1+R3N4AE8Ww0QOVVu8cEurV
         LPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020130; x=1697624930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht5utTuG5wW1wq2rrU2pauj363H+uTmJt1GixQr1DSM=;
        b=se48QA3IUJS0teaZrD5mrm6oBsPykEMuQV6qORb52Wu/d9gi0q8aoUrQLsL14jvELk
         PexmDwEngKWXze/oABefkDPqNnZfreRfkoQfSAft7VzXpBx6AMEx0FoTefeNflmLWhC1
         uO5BHm9Aw53YBsewkediKJ4Cr6ZjNJoLfEz9lhQh9YvLkRbBHE6SCR7pgMsnzM9AFBGo
         CxKWLKG7y1gfaespbf3TxirOXtLzZBGMo+4zXTUFtpQ8GuM6dYTVohRPlj4gf2vLxjeb
         hdUQvXGBC20Uh2M4MYTYKwf1GUCIk/WXePf2WIhsRnnyHPGeetWfauRO5ExDHsRRoJ3H
         P6Iw==
X-Gm-Message-State: AOJu0Yz2kdC8gFARmq7YCP/i/uGo4g5/ygtVC/90YO64ld/Z3sdBg+z3
        VRFnlysB3vgYfeYc+EmqQ/QRJw==
X-Google-Smtp-Source: AGHT+IF/+tcyWJy167xh1iz46cHV+3zXA/HdYlUn1jZqjis4ijk83UImTqPXKpAuX5ROU8uJiy4E0w==
X-Received: by 2002:a05:6512:34c8:b0:503:200f:47a9 with SMTP id w8-20020a05651234c800b00503200f47a9mr14500380lfr.15.1697020129912;
        Wed, 11 Oct 2023 03:28:49 -0700 (PDT)
Received: from [87.246.221.93] (netpanel-87-246-221-93.pol.akademiki.lublin.pl. [87.246.221.93])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512096100b0050480e8a676sm2213434lft.268.2023.10.11.03.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:28:49 -0700 (PDT)
Message-ID: <427980eb-3235-4d63-bb8f-3af06978a3eb@linaro.org>
Date:   Wed, 11 Oct 2023 12:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/4] Add support for Qualcomm ECPRI clock controller
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231011090028.1706653-1-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011090028.1706653-1-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/11/23 11:00, Imran Shaik wrote:
> The ECPRI clock controller support for QDU1000 and QRU1000. The clock
> controller has a special branch which requires an additional memory to
> be enabled/disabled before the branch ops.
> 
> Changes since v1:
>   - Updated the dt-bindings
>   - Modified mem ops logic as per the review comments
>   - Update all the hex values to lowercase
>   - Aligned the clock entries in DT as per the review comment
> 
> Previous series:
> v1 - https://patchwork.kernel.org/project/linux-arm-msm/list/?series=774092
That link is gone by now, as patchwork is periodically purged.

Please use lore links instead.

https://lore.kernel.org/linux-arm-msm/20230808051407.647395-1-quic_imrashai@quicinc.com/

Konrad
