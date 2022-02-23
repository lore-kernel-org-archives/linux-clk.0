Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B91C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 19:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240508AbiBWTTu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 14:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244348AbiBWTTs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 14:19:48 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C39F46653
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:19:20 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5476F3FCA4
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643959;
        bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=s5j2PepsxZrpuRarrNEWXtkZzslwTRkDBlBldzSqLbk9r/a5L9UKDxOHzvBO855jU
         CZ+kj2bTYA8vbQSfnMbeX7KQDtWG1i6qI8tLNiBwj/yRqvH9qeYG3tqrx1esQhsdtV
         vfLRCkUXeTj2VyG2WZUwqsUjpIOzCI6SCkiBP/TT18GnTvuGkV/FZNr+lNgjRlcdc4
         lzCyzpFcQDtFfSfc5k0CC0+W8JTd1zyhR2vhUgU4ncj3/0BYWRiieVnPi23IoGU+tC
         jC9/1EaP7iQ+wm+A2P02NiGdparO8ngldk8Bcig3vLHvVP5yByC5gdrHsCk5KOxfsY
         /0867GHBKK9kw==
Received: by mail-wm1-f69.google.com with SMTP id v125-20020a1cac83000000b0037e3d70e7e1so1545454wme.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 11:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OsmDWPse4xUb7lllvZErJnLq536hKmJqOuDcEnXswgI=;
        b=R9ba8u+Y+Bn5mp1eb4ZYJHY/OIY8YQ+piHjWbQ66n2WAskJRpIojXhhNnAifhgUboe
         6nMyayy0RGVlEVkxHnw1Z8ulycQMnNyztSWpcHhPYnch2LPeWN9PyDXjBf0hlWYGvKy1
         /o9aAW/6teb7k1V0zbR7XgiqT7RJaDF7KopOZiCDuGLLTpFGwAbfQVqAgA+83gDPrzjc
         ZhApw5K+LgBJGMf1HxS02DlDppn8bCZZzYAqEYIpDzx+/Zjvu2CgTbWZOilXuy2Hsz+a
         qlLDqcFk4vbovVu2s72IMTSum6QTehoBrIMd/yezV3V4IguMewcIa8+dJa5sDNTm6Umj
         AmvA==
X-Gm-Message-State: AOAM531oi3PP01e0u1nfCbomyhOWAzX7n0N9+gUmmNa0yPaQOoZ/+2kh
        vC++Ia6KvFHr6h2MuCnn6n7AYWZ7VIOVkd1KYhpOW/R995Vn9gvN2LiPM+RDFniYm92QmqA1Wjz
        Xbm1lgfYaznha+RHfSH5Am08qhzaPBD/xlGwl/A==
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id l14-20020a1709066b8e00b006b91f27073emr863407ejr.361.1645643947956;
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ9QUyPanWfiXE6vKIo8o+c2pwl8ckmaYif3CteDvcltA9YiJZAZD09dYlCxpl8UKoIvZBag==
X-Received: by 2002:a17:906:6b8e:b0:6b9:1f27:73e with SMTP id l14-20020a1709066b8e00b006b91f27073emr863390ejr.361.1645643947743;
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id x14sm302707edd.63.2022.02.23.11.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 11:19:07 -0800 (PST)
Message-ID: <31c4f987-6480-278f-1d49-02bd611b521c@canonical.com>
Date:   Wed, 23 Feb 2022 20:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/11] clk: imx: scu: fix kfree() of static memory on
 setting driver_override
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>, stable@vger.kernel.org
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/02/2022 20:14, Krzysztof Kozlowski wrote:
> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/clk/imx/clk-scu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 083da31dc3ea..15e1d670e51f 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
>  		return ERR_PTR(ret);
>  	}
>  
> -	pdev->driver_override = "imx-scu-clk";
> +	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
> +				  "imx-scu-clk");
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;

This is wrong - should be ERR_PTR.


Best regards,
Krzysztof
