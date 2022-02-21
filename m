Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B4C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 10:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354871AbiBUKcx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:32:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355001AbiBUKcg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 05:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D33856C952
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645437155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rWKdB+xdsSGrYxoHd80FLMCMuF8hy6C+CmJuSV61wzE=;
        b=b8o5PB2mznPuEWmozr9J5d7rpYRGmQdyRxyTWwnNnVTfrxNdjGDB3peHoF8kIlLhzXPKt+
        irXsjchQURHfV8IcC2yuLbpX83QkbKFRPijOWktYvNYxBio0H5L3ob5YaIOgG9B2sJGF5Z
        +TF+1s+yFlxsIR9PxRjErH0bM1ZVON4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-ODXyIOVDNRCp0mpeXUT32g-1; Mon, 21 Feb 2022 04:52:34 -0500
X-MC-Unique: ODXyIOVDNRCp0mpeXUT32g-1
Received: by mail-ed1-f69.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so9844251edx.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 01:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rWKdB+xdsSGrYxoHd80FLMCMuF8hy6C+CmJuSV61wzE=;
        b=qmXyHdiFYRv7bNjqR4Fix/gqAVeAKWDqCaTcMnXbtqAN+apvAr7AgIHEgusKSaueZ/
         KcouSwexuhQ/SF1T1HPQsh4VYnpa/o3BP2rjRcnWOJ9be69EqOtq1pO3Luc6bSw8HLT5
         6nwI5sC3+6AYBrlWwWFvDUTROVq19U7qr56bSmAN3f4jNwGCS8EjwWOBPQFEidMYkE6v
         6+uhk+XLeyepbo87/ZSczDBqtqmJePN76LnjP/GN8H9/jc64HwjtLXUGH/oLbrXc+H6u
         NBrHWCIDH0I5Lm8mOwDxDu6ZtIf5Pu+XERsq/PuUWz0SPlp0v++cUMIi6KF3nuv1RYNa
         Aadg==
X-Gm-Message-State: AOAM533R7pVv1dV6BxSZ3fdjee3yOLxPbnAd20H72xCoSJuzU59svzH0
        RlQQmVukgVivCn/0Kw3V/XKKv9U0FAw0+ST6KvxBSobTGhLeqIpPKJvGqO7DX9koalYsayNo88T
        WwCgkeWnVSXOLiUr2yqAc
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id ek21-20020a056402371500b00410a415fd95mr20619461edb.288.1645437153005;
        Mon, 21 Feb 2022 01:52:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfjucEjn+NxsIVVAlxvKWSfIUNLfVlNeuy2epy4FKSTUnKHqY117TAezZRujd7MCV1h/QIvA==
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id ek21-20020a056402371500b00410a415fd95mr20619452edb.288.1645437152824;
        Mon, 21 Feb 2022 01:52:32 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g11sm5131745ejs.14.2022.02.21.01.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 01:52:32 -0800 (PST)
Message-ID: <d2bc537d-b311-6fb6-faf1-a847ae3b83be@redhat.com>
Date:   Mon, 21 Feb 2022 10:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/6] ACPI: bus: Add iterator for dependent devices
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-3-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216225304.53911-3-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 2/16/22 23:53, Daniel Scally wrote:
> Add a helper macro to iterate over ACPI devices that are flagged
> as consumers of an initial supplier ACPI device.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  include/acpi/acpi_bus.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 8b06fef04722..72103bcdd5b3 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -723,6 +723,18 @@ bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
>  struct acpi_device *acpi_dev_get_next_consumer_dev(struct acpi_device *supplier,
>  						   struct acpi_device *start);
>  struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
> +
> +/**
> + * for_each_acpi_consumer_dev - iterate over the consumer ACPI devices for a
> + *				given supplier
> + * @supplier: Pointer to the supplier's ACPI device
> + * @consumer: Pointer to &struct acpi_device to hold the consumer, initially NULL
> + */
> +#define for_each_acpi_consumer_dev(supplier, consumer)			\
> +	for (consumer = acpi_dev_get_first_consumer_dev(supplier);	\

If we drop acpi_dev_get_first_consumer_dev() this needs to be updated to:

	for (consumer = acpi_dev_get_next_consumer_dev(supplier, NULL);  \

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> +	     consumer;							\
> +	     consumer = acpi_dev_get_next_consumer_dev(supplier, consumer))
> +
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>  struct acpi_device *

