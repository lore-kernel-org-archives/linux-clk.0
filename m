Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D685CC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 20:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238730AbiBWUNm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 15:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237733AbiBWUNl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 15:13:41 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5B04C419
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 12:13:13 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5683B3FC9E
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645647190;
        bh=iwWa9JcbVhEYFFR9LsmnA7bsxJWJbrU0gOV0sfgjYeA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=du8Pg/IOLZV9hwCe7b5UtOxlvcAIAtCRDsMLy4NotC8eN8BPndc0MXZs52qin9tIQ
         2g2Ogfv+ArDipFRraBxTTNW/sLMCiLPyuHHxznIMGiRe0DQXSPrsf1M6k44OM5vVrq
         Gf1gqiQMThnQ0XluqeQKAc8d+0L/kNtNMcwtn1mXu1EFw7qAJ36IpQlwrgEApFUyey
         a3J0B1D520gbqlSDnJKOAQEg0zk2ksCK5lMV/WEk2HRxTfGMhDcHrMtWvBH5+r2emN
         n4Uv4ALd6YxWVQubY0C0XkFsCHAGEPrVs1nnEq/SlHzm+8eOcQSUor8yfgGJFRg5H8
         iXkVK9wdU769A==
Received: by mail-ed1-f69.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso14163937edh.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 12:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iwWa9JcbVhEYFFR9LsmnA7bsxJWJbrU0gOV0sfgjYeA=;
        b=UXloa5aVPA3k1hsNa/uF1AwXq5IUF5/Sx8Bx0W+MLyty0l0P56b58NtzxxWsdZTJrt
         wIzj49Q9vTIF5I9+HwPg6OQ7xxvja7N2qaHePSz8R0nElVcsjsKjFccLe2bT5ZxGnlJd
         oDY6l3+YEsWYe0N+TnMLjWOpEUvYRr32qUoEaWBvx2SQNpdLJH7Mcy5+yA3mpdQ8IdUM
         o67qC7QOeDP/JdmG1yU+c5ZyWhaJEdxsGRA8FuwDoKUVIkAnJzYnsIoDfuYgjyaYtM5i
         ZM76hFt1RmjroZzzdQEMsGo7s5/ERxW0aAznhtDT39wY9i6qj9x3nR0un+qBfOfDtTqu
         AX0w==
X-Gm-Message-State: AOAM533qTKttt72oSKTBnKKqoiClPa8VgMqjzpUWoIRCNZPX3sb/IRDC
        v01sxz0juukltKI16F4ydD+rgYJkO/CkAA9nwx5CU3vbQ0+G+I7tmmBjml4QpPwwpS9b0w8OInC
        8dma0B+CmCkYvDwHo5xg/eOOlMZjOs8Ax45rPIA==
X-Received: by 2002:a50:d4d2:0:b0:410:9fa2:60d6 with SMTP id e18-20020a50d4d2000000b004109fa260d6mr1046072edj.35.1645647190018;
        Wed, 23 Feb 2022 12:13:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz26puqYUhlyjvmoVu/kDMW076CFmPiGqR/4gF9iezSP9z6kTJySAPUmRGeoBQCBAPnogL/Qg==
X-Received: by 2002:a50:d4d2:0:b0:410:9fa2:60d6 with SMTP id e18-20020a50d4d2000000b004109fa260d6mr1046041edj.35.1645647189826;
        Wed, 23 Feb 2022 12:13:09 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id ee30sm359292edb.4.2022.02.23.12.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 12:13:09 -0800 (PST)
Message-ID: <ab308509-0f81-6f6b-7b94-0ac1086de53a@canonical.com>
Date:   Wed, 23 Feb 2022 21:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/11] spi: use helper for safer setting of
 driver_override
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-1-krzysztof.kozlowski@canonical.com>
 <YhaTWiSQl6pTVxqC@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhaTWiSQl6pTVxqC@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/02/2022 21:04, Mark Brown wrote:
> On Wed, Feb 23, 2022 at 08:14:37PM +0100, Krzysztof Kozlowski wrote:
> 
>> Remove also "const" from the definition of spi_device.driver_override,
>> because it is not correct.  The SPI driver already treats it as
>> dynamic, not const, memory.
> 
> We don't modify the string do we, we just allocate a new one?

Actually you're right - the SPI and VDPA implementations operate on
"const char *". The others do not, so I can convert them to "const char
*". Thanks!

Best regards,
Krzysztof
