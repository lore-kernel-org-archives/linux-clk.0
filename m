Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7446EC7EE23
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 13:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243655AbjEZNW2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 09:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243618AbjEZNW1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 09:22:27 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A424D12C
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 06:22:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30add74cc30so181154f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 26 May 2023 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685107344; x=1687699344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRSS0thFL99+lzuHoifF3dKBkoe4uJEbtzhdpwYILHY=;
        b=VLUzFDnR6LmAKvVf/iHRwZPTSEkBdMW0byWyjFHRJjs/Uoucfx0YumoQ3szeRNCTL3
         9siep6Ca8Gu8v4TjCTadRwLlCfAaNHLyqn2mltKzfTKAKu4kUuZ+0cfD89seK0LMXm4P
         yzFHSTWlraCWICfPz071XFS46lz3LkqXHYH2U26T8g3wRuQEkUlmvqkMAAk4rGilsVuW
         Qovnc/kbwoRnetHqBGeDF2fPdA2V7xqLwQuX5gzjUZqwftlSyPiHOdBaRr0TqZ+vGxsR
         DahtQN6EIpfPDE5zsHIHB4J5OUzGFMAKGIMAY0YNlKoZP07R0R9N72Hda3NbY56IpXPX
         9iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685107344; x=1687699344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRSS0thFL99+lzuHoifF3dKBkoe4uJEbtzhdpwYILHY=;
        b=HfUFieNtbsi4TnuAWD7gIYDx1lFIVpJ0Kl4J41jRJplWG9/y/aO4+fxHMIrWu1a4dp
         mOsDbLGcQ9xvpb7VOmg0lzXw4xic3E6Y2HixjIaYZPFmGI2gUZF2vVwaElfc+6Dbuawj
         u21TIqhH3jNO1BJwgqH8doww5dV8wxTb7WqnwEkmTk4bz2QN+zfemIycglPV6VtAguzA
         n/bbWCc8cENSZbhb1T5BPuHkcGoRY9cMR0j3OMDh8FN54HRm8Q1OuO4jxQAKxITUlGyF
         JLXKY3xeIX7Eotvi3wOjrp1njTLMiNAS8SCzhsVNfFA5K9yWUyBiciydhjiGku9jD5M2
         xjYg==
X-Gm-Message-State: AC+VfDz5InggzjgS5KdjNEh7nKCkD0O5kS4QUE2io470G3vZom46FJJz
        D27zu3zzVn1PmDaMs8mOC8KvzA==
X-Google-Smtp-Source: ACHHUZ75vUnzwb3A4ipiR60F8XFG10wwRoZPtxebBNB2iOcxlq7vnIUuGzzo8AeX6KQO8t/SiLNumw==
X-Received: by 2002:a5d:4b06:0:b0:306:3435:f85c with SMTP id v6-20020a5d4b06000000b003063435f85cmr1467531wrq.30.1685107344084;
        Fri, 26 May 2023 06:22:24 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f9-20020adff589000000b0030633152664sm5024803wro.87.2023.05.26.06.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 06:22:23 -0700 (PDT)
Message-ID: <76343325-b06c-9329-2d0a-e1d351bcafac@nexus-software.ie>
Date:   Fri, 26 May 2023 14:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 2/6] clk: qcom: Update l value configuration for lucid
 ole and evo plls
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230525172142.9039-1-quic_jkona@quicinc.com>
 <20230525172142.9039-3-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230525172142.9039-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/05/2023 18:21, Jagadeesh Kona wrote:
> -	.config_ctl_hi1_val = 0x32AA299C,
> +	.config_ctl_hi1_val = 0x32aa299c,

You should separate out this change from this patch.

There's nothing wrong with having a preliminary patch to change all 
upper-case HEX to lowercase hex.

You should do that since the log here "update l value" != change UCASE 
to lcase hex.

---
0xb0d
