Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF10C38145
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 12:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiIHMLk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbiIHMLQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 08:11:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0EDE22B8
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 05:11:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y18so4888469ljh.12
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HE4UrmbsszimxBA10K+Mo9fbyO1aQ7zw1Xn/FvnzpTI=;
        b=tbBT0Jov5/rivZeHODKa6HL/FUv7Zvgs7cnIC5JD66eT9To+moCr8KJRy775zxnPCN
         FItkqiK9fv2svHmQNqreKea7cfnjJ8VKXS1J9dR/jA3Pu0mgx0zmB4l2khJAukXne3/1
         vuinh5NdOk6MbPFqMbgg+jd2ZQDJgUXYXThZvqjCA+SDw6uXbQKakBpf4bxCqfhnAZUt
         6mQH9siPAntIdi7WO9wqEgQ6Y73vCy8DIypZDKeVNdgaNYIefhjiUK9D/iWDM8dtGZHK
         fu91KBjPyh2FtA4aL2rj6I/GvCf9EcXU2bJ9EIRf3S5ap6qaFisSRO7UAWzlhzMdkbHD
         7hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HE4UrmbsszimxBA10K+Mo9fbyO1aQ7zw1Xn/FvnzpTI=;
        b=WsBR+dAd61cRoExXz1hONLIyzo8OgGAprR6ZK4QpUmfesrIz6jRS8Ag+m0gfgr3lGN
         s2+YrgcdkNOf8lqt3pRB8SPkHV8uRHmcqbl8DQW0y2V3nEbCg8rYIjEes00Sau1ATEZc
         6EcFvp+I5eGkLql/782bJaKoaut9DhPv2jonzH18PJ7ryJ87IA+/lDhmh7zNfDKUo7qt
         f0zK2jg971lmyIE2vRxvR8TQZXjWOBFdNN9iRWTG3EHYWwur39i6aLgx5rpQ6o2C0a67
         Nu7AeCxcl1W3LoBMXV44zO0uFOcp0zeNIyHkN67THTWr7130fJ3AEN32+gXn0DBkS+u5
         rJeA==
X-Gm-Message-State: ACgBeo3EzMsXCERzFyHUCJm64yfGAUkShWO7I0yKgrg2YVjOaIiEv24e
        5uQdJOGthDu4DqkK+RZ9YCd8Jw==
X-Google-Smtp-Source: AA6agR5GdJ5ru2O1Jk/kEhUampTfR3JKZT/TvL4zK7Cq9Re+54Aa8mcma5TQjP0bOl2xNmnaqKLQlw==
X-Received: by 2002:a2e:8553:0:b0:265:d5df:e137 with SMTP id u19-20020a2e8553000000b00265d5dfe137mr2460853ljj.70.1662639071164;
        Thu, 08 Sep 2022 05:11:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt26-20020a0565122a9a00b0049668ebacdcsm1895111lfb.99.2022.09.08.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:11:10 -0700 (PDT)
Message-ID: <25a6ff76-d178-d1bf-0064-5c9238a58ed6@linaro.org>
Date:   Thu, 8 Sep 2022 14:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Content-Language: en-US
To:     Li Jun <jun.li@nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/09/2022 12:37, Li Jun wrote:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Signed-off-by: Li Jun <jun.li@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
