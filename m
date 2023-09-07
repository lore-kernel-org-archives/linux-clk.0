Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BA3EC873D
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 16:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240717AbjIGQgt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241254AbjIGQgh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 12:36:37 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379FC14022
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 09:27:25 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52c9f1bd05dso1558805a12.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103972; x=1694708772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a51rbBUhl2yVMBaRWJfNm+10uIGnQdsMPdqet6PAES4=;
        b=q5Va59M9HCW2XU7Gu1mcu3kiMhxfaoBLITFalWanEpjxvSgnZr1il4DXFyQv+BETFF
         ZrYAkj4UE5dT0+GNo5ZDAPudTSO7QJFcQpTJSHkkvFWZeyocqzAFi7iQsR8zIEX/bneq
         bKmz1hfbFPnF80YCpuLKJ0UAcF+avKip/cAKTIDAkNpKPClL0mxQJZarYsvlL6CaKmoU
         YJ6hr4f8p54EmLv2xU3kfAgGpjY0z4qXp+vLPbOUb6xlgcPYTiO6MdPrCsEggECZj/xF
         FT0oA7vhVfFZ6WmXhxrYf0M5JVxP3RJJPQxuYQZ1T9V6DWVSAGYGPl/IDsIBSxDY+CUA
         2ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103972; x=1694708772;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a51rbBUhl2yVMBaRWJfNm+10uIGnQdsMPdqet6PAES4=;
        b=WqiCrPQ1L/7JatI0EXCS0ra4oCUxLa9DdNFDVPCDIGynqRWfJ6aofAdwhdwwLmHbKa
         O6w7v8AFt6s8a6r93K6oRmphy4tMinjCRXTXlPq9K6Ca3aa4d6Md6GsEPTFGtJCizmJc
         hUlFiiI8rgCC6F7llhAxEClB9si9cC2OpeQbNTo8bhoePO3HDhW+o2bGGYjbL08vNXbM
         J7ux9APKayQg1AC19oY86Bqla/OQ0ILxOaqwiaHaFy8/ByjnAFR6igRvD0OlUKPnc02G
         ntBm+6Q1cJAuPorH7/xyO7jDF7fAPcIFGbfeVozlbXYmDmR6BNeG/Kl9vP74A6HYFyaN
         XtxA==
X-Gm-Message-State: AOJu0Yye+6LJXiwWLv8m+rQUUB3XDTVSWvm1E25wVWu2W8Q44WPeHw54
        qpgiuVvarzlNPDKSn+necHGsKemTxzwuzgxSMKZ0yg==
X-Google-Smtp-Source: AGHT+IFlXAmlomGcmhe6S0hUGMXYE4sEpDzId5svN/29k+3GVd9pMgSG9ox0ZZbhaW0oXLRASeVmdQ==
X-Received: by 2002:a17:906:24b:b0:9a5:ebfd:79a3 with SMTP id 11-20020a170906024b00b009a5ebfd79a3mr3449605ejl.29.1694066582736;
        Wed, 06 Sep 2023 23:03:02 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906684100b009920e9a3a73sm9946636ejs.115.2023.09.06.23.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:03:02 -0700 (PDT)
Message-ID: <d822da46-b6c0-6932-6ed6-8806fbeee51d@linaro.org>
Date:   Thu, 7 Sep 2023 08:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 07/10] arm64: dts: qcom: ipq5332: populate the opp
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
 <a6d12e3b253d6a55d85f66979ba8b7d9c9ff6072.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a6d12e3b253d6a55d85f66979ba8b7d9c9ff6072.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> IPQ53xx have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Add support to read the eFuse and populate the OPPs based on it.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>


>  	};
> @@ -150,6 +173,11 @@
>  			reg = <0x000a4000 0x721>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			cpu_speed_bin: cpu_speed_bin@1d {

No underscores in node names. I am pretty sure I repeated it multiple
times already...

Best regards,
Krzysztof

