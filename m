Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B76C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 19:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346820AbiCPTjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 15:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238244AbiCPTje (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 15:39:34 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B003289B4
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 12:38:19 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1116F3F1AB
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647459493;
        bh=6+h9BeibtnFt0Fy4V0bEz+bagkoBJTSRfdm71NC24xs=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=qsZipiORv/nFk23zk3TB6ijV+rP1RnwVvsblAxN7JTa7UKNvcIIpSQZeStEwJRTNf
         EtYuJqzoGq8sLvWf5DDEd3THm1iEA/ryQaqR1AmmRcpvqyHHNfZLkkvkL41ExUXecG
         Wtz1tcFBdnOxadFd2DCXVuH2TFC7/m7d+vlVCGNpY8PUcycZloZw3U7dSe40gsOuBp
         OWbvjWSYqF99PqGONGin62JK0xf/LyFYf8F3stWMw6/EUSwf7jZcRxKN2Jjj0S/PZx
         lskY7xlovtPVUo3Jkzu++rCS2OfQ25H2UCHTw5cYcyqpLD6GRhvyLGxj8zidm0EA3K
         UDk2pXdpdxunA==
Received: by mail-wm1-f71.google.com with SMTP id r9-20020a1c4409000000b0038c15a1ed8cso1195247wma.7
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 12:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6+h9BeibtnFt0Fy4V0bEz+bagkoBJTSRfdm71NC24xs=;
        b=bGlGS4yR+HYo0u0OdbRvNW3+XnHXvZuUsmGOBkm8DclpH8ZRA7pbwY4Ye85+rynxYh
         /bgl9yOvC3jDSg+KSBgkjjTZn7EXWzs4h2048aRLV6DHaR1e/s1RODgq550l0/YUvh3D
         VDuBa4xpf8JZ+xMwpFop9n4JMXL8kOW57L9pO6eOAqMaSon0O47T8P0cu87dQNz6bdV/
         iPu7ZVPNpA8kayaoh5JiOP/QrSk3tRp60PQeF3gLTWJUGKlHI/b3VP/SPYMmZibmH307
         ytur2EzwK4m+29GOEYH/1kICyDZXIbM3VqgqahEi9hsBB32m1mXa9NKm1jYxaYlc9Bo4
         WjLQ==
X-Gm-Message-State: AOAM533UQC/vJ4yKIcM428xqINsVbiVmE1Av8yVgqAEekZQXPdMCpHV+
        jzwGOe4QbCKwIiIKk7pIs9pKSL1e0Va4BisVaHowNcxg2/ADgwSxI9cYE7HEAXSjgIqvQUP2zyR
        UxB7IbH8CS67sFnSwUbJgk1shmR0SIMAkXRrlaQ==
X-Received: by 2002:a05:600c:4796:b0:386:45aa:667b with SMTP id k22-20020a05600c479600b0038645aa667bmr1045816wmo.104.1647459492726;
        Wed, 16 Mar 2022 12:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz2q+ZfMVNL/xv6DCH0VHKA2cCReGbKqid/bgaItjng219g1bFLER3WRAwMzoyrwOoAn1bTw==
X-Received: by 2002:a05:600c:4796:b0:386:45aa:667b with SMTP id k22-20020a05600c479600b0038645aa667bmr1045789wmo.104.1647459492463;
        Wed, 16 Mar 2022 12:38:12 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id c7-20020a5d4f07000000b00203db8f13c6sm2300253wru.75.2022.03.16.12.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 12:38:11 -0700 (PDT)
Message-ID: <0cc4e90d-c5e5-e6a3-6cc6-23d3058b9731@canonical.com>
Date:   Wed, 16 Mar 2022 20:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/11] rpmsg: Fix kfree() of static memory on setting
 driver_override
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stuart Yoder <stuyoder@gmail.com>,
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
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        stable@vger.kernel.org
References: <20220316150533.421349-1-krzysztof.kozlowski@canonical.com>
 <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316150803.421897-5-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2022 16:08, Krzysztof Kozlowski wrote:
> The driver_override field from platform driver should not be initialized
> from static memory (string literal) because the core later kfree() it,
> for example when driver_override is set via sysfs.
> 
> Use dedicated helper to set driver_override properly.
> 
> Fixes: 950a7388f02b ("rpmsg: Turn name service into a stand alone driver")
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_core.c     |  3 ++-
>  drivers/rpmsg/rpmsg_internal.h | 11 +++++++++--
>  drivers/rpmsg/rpmsg_ns.c       | 14 ++++++++++++--
>  include/linux/rpmsg.h          |  6 ++++--
>  4 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 79368a957d89..95fc283f6af7 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -400,7 +400,8 @@ field##_store(struct device *dev, struct device_attribute *attr,	\
>  	      const char *buf, size_t sz)				\
>  {									\
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);		\
> -	char *new, *old;						\
> +	const char *old;						\
> +	char *new;							\
>  									\
>  	new = kstrndup(buf, sz, GFP_KERNEL);				\
>  	if (!new)							\
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index d4b23fd019a8..dd1f4ed616b6 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -95,9 +95,16 @@ int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  static inline int rpmsg_ctrldev_register_device(struct rpmsg_device *rpdev)
>  {
>  	strcpy(rpdev->id.name, "rpmsg_ctrl");
> -	rpdev->driver_override = "rpmsg_ctrl";
> +	ret = driver_set_override(&rpdev->dev, &rpdev->driver_override,
> +				  "rpmsg_ctrl", strlen("rpmsg_ctrl"));

I made here a mistake while rebasing. This will need a v6.

Best regards,
Krzysztof
