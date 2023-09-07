Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D42EC874B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 18:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243472AbjIGSLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjIGSLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 14:11:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB34B2
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 11:11:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so21432331fa.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694110275; x=1694715075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpHIUYmzApKmGGiHZZpnMSxi31KSn/xZKBPfgME94EA=;
        b=L5NSHxaYRo85QaNncBqMrN3YkoC3GFwfF96KxEkVt+v5wgICvOcXdlK+9AhH95rdC5
         Pf7ggsPUAa90A1quEmo+0AWH4eQNndOxc4PXh+3kkBTGHebH3vkZ+iXsbLlaPTY9Jrhi
         xpapVG6qVXcPj5qx094lNTLjtF1nostRMtQ8bKoBsenm8XkjKK6mqaZA9aX7ji+yt4Db
         MxJiM0bSBfEtulhYj4hRO80SuPJQ0BA+Fh0OhIiY2A+uYWGCy5nmzK5L2S+/tSTW58fa
         iBfJYgbP7TLVythhMqyQM/PCJRdc1F8E2E4kXr/TSHjSPkPIpe22K8gzRJ10b2L13btb
         kHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694110275; x=1694715075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpHIUYmzApKmGGiHZZpnMSxi31KSn/xZKBPfgME94EA=;
        b=CWvySE4F9YujkPcDNm2Jpw/ZoeXEVD0aMrahxn8DkZxV2litJ/qWc28q9EX8Q+cBDa
         YDhdmqsD6mTkH3HllQp2+YJKg7DbU6iXR03q2cf7awSwd8l+4iwMMVl7PVGvrW946bHN
         Nt9GOgE8Hh2Nox7vhn8eurvX0N2v/oKnqvHqf+E/bL5URIJclWPQ4hkG8oeZ+kh0gWk1
         Y4CqVu/ZLLsCM+DJwDOAvkPyRqdTZw+J5ircMbb0+G7Jkn2msxxVhXQGEyXeZOVIdAcb
         rH6FBQ9isxeEObmLuHb8XrOrro3hpng/4QVfEkpvhuxJQvpf9TZSp2/ss/e8pDGSiP8G
         EP+w==
X-Gm-Message-State: AOJu0YzPFPr317fMK8LUt4TGVd4JMO5KCsktzb3y6IF78/AutIYvdmy9
        cUyuB/AO3/Ny8YKvhfvpSjMv4BfU0AyJn2HywkTo/Q==
X-Google-Smtp-Source: AGHT+IE6rP7AS4FnGxp/huXUuWImGW5DpdIfQDtTj/sIRkZFOXfhElTxhQiu10RgpaNZRjIoSI51Qg==
X-Received: by 2002:a17:906:5c:b0:9a5:db06:4264 with SMTP id 28-20020a170906005c00b009a5db064264mr3607933ejg.72.1694066638936;
        Wed, 06 Sep 2023 23:03:58 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709064e4200b009a5f7fb51d5sm9928020ejw.21.2023.09.06.23.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:03:58 -0700 (PDT)
Message-ID: <4f882fa1-8174-2816-71c4-a2941372aa19@linaro.org>
Date:   Thu, 7 Sep 2023 08:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 10/10] arm64: dts: qcom: ipq9574: populate the opp
 table based on the eFuse
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <1512a94f8fe1f8fe22cef2bf8498a6ac27989633.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1512a94f8fe1f8fe22cef2bf8498a6ac27989633.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> IPQ95xx SoCs have different OPPs available for the CPU based on
> SoC variant. This can be determined from an eFuse register
> present in the silicon.
> 
> Add support to read the eFuse and populate the OPPs based on it.
> 

...

>  	};
> @@ -223,6 +254,11 @@
>  			reg = <0x000a4000 0x5a1>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			cpu_speed_bin: cpu_speed_bin@15 {

No underscores in node names

Best regards,
Krzysztof

