Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7269CC64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 08:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjB1IKs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 03:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB1IKs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 03:10:48 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1BE24481
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 00:10:46 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r7so8749640wrz.6
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677571845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lZT49oy95m22EGxr6coWHrOvpI9jNUmdpagNrbHvNM=;
        b=kmrYBY92z4EHdQLcGzm06sr1j17uqz820eu2pjqPJ8grXAAIC+X9CD01WC8LQfAqfA
         Xbl2nB4N8aeoIDPb363pGNI1rt5EnVhSxTZAk1qWlKDbmYpfymiP8UexOKNLkgU7FIsR
         z+nDLz0PesWcQeHRlP6O37cnA9m5yy3XaKUt90BzlDFwdn5HWO94gN/PqpoErkRNxrpu
         J4p9eCwIEUQylukbzrmG1BtfJ6SSrSz1Y7jicXY8g1i3h5gxnAlV2url3bckgAUcfuym
         s2bmRLrN14puvOiP39jkOYkl9s+O/mGUo1Rr6QyO9SYPyWK//ro8DVZRFtt8w0OY6x95
         HbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677571845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lZT49oy95m22EGxr6coWHrOvpI9jNUmdpagNrbHvNM=;
        b=upEqZX4ADBrFRH+oINQDiyCz2jCEt3JFUc2+2HJxTxc1OjTdQGYMpGst2quTD7xZyk
         0hEHXb5SXtey2IvwEa6/4vfrn481PV78HCiJOjhZojgiUU5bOeLoi6f15dqDYXVh6ZsW
         kpg7ELpq12TgyRLDvB0NHMv/VnNBScbmx72z9PpxlMuvDZe4dMlu9utc2jrthjVaIN0H
         lCMFJudfscTLY9CeS0m69slbVWnKKMgO/bAuM9nqfIxTWCKwdyLl1lzh6INmkqqzKdKv
         zWRxUM+aecnqyiDoZQBaOs2YyQJtS6dsIixNk7zfZUmBsEMGFw7bwX1NfabhhuZz8kTq
         BcZQ==
X-Gm-Message-State: AO0yUKVbBQWMHcpZ/96f6qwvJgMrt60PuABkInjH+jV6S7zrXaC/AOI6
        YRNMeSZEI1WHtZLRfYhRKGuFQQ==
X-Google-Smtp-Source: AK7set9jNkGwv2a2WSq4/mD4IKvMJUFZALH8OCkO/Q+zbLQobS0DnHUXEdt/GO1AVrEG/l1GhQKgjA==
X-Received: by 2002:a05:6000:d1:b0:2c6:e87f:30cc with SMTP id q17-20020a05600000d100b002c6e87f30ccmr1388533wrx.48.1677571845301;
        Tue, 28 Feb 2023 00:10:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b003e91b9a92c9sm12145345wmq.24.2023.02.28.00.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:10:44 -0800 (PST)
Message-ID: <947af937-3178-48ad-998f-b048245f3ffe@linaro.org>
Date:   Tue, 28 Feb 2023 09:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
To:     Marco Felsch <m.felsch@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230227174535.87657-1-marex@denx.de>
 <20230227190123.znifdqympsantpt6@pengutronix.de>
 <a519eb0b-dc40-deec-03d3-676648a52f15@denx.de>
 <20230227200039.ugmtvpli6gvux3fi@pengutronix.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230227200039.ugmtvpli6gvux3fi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/02/2023 21:00, Marco Felsch wrote:
>>>> +					#sound-dai-cells = <0>;
>>>
>>> Please don't add it in front of the compatible and the reg property.
>>
>> The #address-cells and #size-cells are also always on top, why should the
>> #sound-dai-cells be any different ? Where should they be ?
> 
> As of now my understanding of specifying a devicetree node was:
> 
> node-name@reg-nr {
> 	compatible = "";
> 	reg = <>;
> 	// all pending properties below
> 	...
> };
> 
> @Rob, @Krzysztof:
> Is this a (unwritten) rule/policy?
> 

Each platform has its own coding style around this but I am not aware of
a coding style which puts address and size cells at the top. To me it is
really odd placement. First property is always "compatible", as the most
important. Then for most platforms second is "reg", as the one easiest
to compare with unit address. Some platforms put status as last property.

Best regards,
Krzysztof

