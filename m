Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86A5C54EED
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 21:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbjAYVvC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbjAYVul (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 16:50:41 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580FB66F91
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 13:49:04 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id az20so270610ejc.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 13:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KXsMJoxmG6msNyIOzT+xXKJjyw52diPo/oB2OGQFIc=;
        b=Rerd9H10x6Gx+s3IGAlP97PqeX97Nrs642WdP0JiqsdY83E7AXruxqbBbGJ0hKf8iq
         7T/utPMve4LdrvjfM/czuFm38RoYzkX8CGOYcjRMpRAYngdkL+IWL5l8A+Cgg06dsUDo
         D1Qcro+3bnEP74kdIsOmLT9vCapvdHpbtwcCj28Q5uD/sLAUy93EQ8/gwxpCxBVtuuCX
         //7qvIAuaJn8hKbfJe0E8j6ZV7zI9Ht1DZS7scNnl6slCK8cqM9Mi9VvXU/OmeRcEm73
         wpCgNQX5y8XSf83V/QPSxWmYwYM28MS2wLIV2UqJgzc7DuKU4Kx0unKEf54Cs9q1Ajxk
         Km3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KXsMJoxmG6msNyIOzT+xXKJjyw52diPo/oB2OGQFIc=;
        b=kRbnlJ++svw4dgHHYHn4wlplytSvK6g+n/k4HfCMpK84VLCCSEWVJXi/+MzxqNRjGQ
         Iy1iZYB0P54McQgymYhBJb8vrfTJikH2tdilCSMlsVL6hbfXyXgPGJoWt6eoquT+Ovk6
         rrovsL85EJ5jJ3TdudcJ0oLuiVEXyWRTpdy587z5d0uBKUwmK/9vh5cWXcKL2htb3WF6
         deDdJHnkENuUgZQNxE9tU5LUVhfmk6H9q2cERfHwjUJn2c/WvCRJl5RXNvV07kGFFStt
         xh6TUY6xqdx83IX2y5ENaotcm6Q7QL1aoS/8OndVA5MYlIOTXZUU/Xmu5vwtskl6Y6Xd
         rBww==
X-Gm-Message-State: AFqh2krZnIhiTx6qkvTba9pry+LOGnTfDzOJlfgT25mMBqiUgjVUgx9x
        3qv2G3K3Tz9TXl0UuRlCl1KraQ==
X-Google-Smtp-Source: AMrXdXtq7820kXaStsnx2W1/UkTYIvQoMzS4+ZU8NcgBhZqkbMKaCOv4tZLEjDxE5x1rTqe5hse6IA==
X-Received: by 2002:a17:906:4b4c:b0:871:e336:cd2a with SMTP id j12-20020a1709064b4c00b00871e336cd2amr33430411ejv.47.1674683342846;
        Wed, 25 Jan 2023 13:49:02 -0800 (PST)
Received: from [192.168.1.101] (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906c08500b00871390a3b74sm2956739ejz.177.2023.01.25.13.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 13:49:02 -0800 (PST)
Message-ID: <63f017c7-d320-a996-7bda-33d263a847bc@linaro.org>
Date:   Wed, 25 Jan 2023 22:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 7/7] clk: qcom: add the driver for the MSM8996 APCS
 clocks
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
 <20230118132254.2356209-8-dmitry.baryshkov@linaro.org>
 <7055af43f4a8894ac34e53c5847fb3de.sboyd@kernel.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7055af43f4a8894ac34e53c5847fb3de.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 25.01.2023 22:38, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-01-18 05:22:54)
>> diff --git a/drivers/clk/qcom/apcs-msm8996.c b/drivers/clk/qcom/apcs-msm8996.c
>> new file mode 100644
>> index 000000000000..7e46ea8ed444
>> --- /dev/null
>> +++ b/drivers/clk/qcom/apcs-msm8996.c
>> @@ -0,0 +1,76 @@
> [...]
>> +
>> +static int qcom_apcs_msm8996_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device *parent = dev->parent;
>> +       struct regmap *regmap;
>> +       struct clk_hw *hw;
>> +       unsigned int val;
>> +       int ret = -ENODEV;
>> +
>> +       regmap = dev_get_regmap(parent, NULL);
>> +       if (!regmap) {
>> +               dev_err(dev, "failed to get regmap: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       regmap_read(regmap, APCS_AUX_OFFSET, &val);
>> +       regmap_update_bits(regmap, APCS_AUX_OFFSET, APCS_AUX_DIV_MASK,
>> +                          FIELD_PREP(APCS_AUX_DIV_MASK, APCS_AUX_DIV_2));
>> +
>> +       /* Hardware mandated delay */
> 
> Delay for what? Setting the divider? What if the register value didn't
> change at all? Can you skip the delay in that case?
Waiting 5 us unconditionally in exchange for ensured CPU clock
source stability sounds like a rather fair deal.. Checking if
the register value changed would not save us much time..

Konrad
> 
>> +       udelay(5);
>> +
>> +       /*
>> +        * Register the clock as fixed rate instead of being a child of gpll0
>> +        * to let the driver register probe as early as possible.
> 
> The function doesn't block or return EPROBE_DEFER if the clk is orphaned
> when registered. Why is this necessary? Are you getting defered by the
> fw_devlink logic thinking it needs to defer probe of this driver until
> gpll0 provider probes? We should fix fw_devlink to not do that. Maybe if
> the node is a clk provider (#clock-cells exists) then we don't wait for
> clocks property to be provided, because the clk core already handles
> that itself.
> 
>> +        */
>> +       hw = devm_clk_hw_register_fixed_rate(dev, "sys_apcs_aux", NULL, 0, 300000000);
