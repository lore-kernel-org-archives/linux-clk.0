Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A58FC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 13:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359609AbiBUNrT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 08:47:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359405AbiBUNrR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 08:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04BDBE7D
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 05:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645451214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L8wxK0sx0ARjItoAWBtZbxxCje2iLbxe1SCm7RJ8TpE=;
        b=fIlBTsxyTfiBe3qKm2FJ0/v96fg8v3qoIs/K6PwQDhHpudo/D8OXk0TziDgvh1ZPWjVsD+
        vLSkVblTWkTo84AnFKX/ceQX/gCKjpJ+Ec5NZ08pRqYjxfiawzZKcZ1vp72FA9hA88JBkH
        tRSxIdPAbjv546zKIcPPql7Ybcn4/6o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-RomKyWcZNfKTGZZ1Y4zZYA-1; Mon, 21 Feb 2022 08:46:52 -0500
X-MC-Unique: RomKyWcZNfKTGZZ1Y4zZYA-1
Received: by mail-ed1-f71.google.com with SMTP id f9-20020a0564021e8900b00412d0a6ef0dso5190892edf.11
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 05:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L8wxK0sx0ARjItoAWBtZbxxCje2iLbxe1SCm7RJ8TpE=;
        b=CaODmLWSUxP4RQPFMpt84ZlCx/CmqzgF/+FClEMqKEXHiLqrAhKI661/7HaccVCgOs
         voqdecTswOfUx39z/VS4n6Z/bAggOChU4YdCsemB3GIoS2hg2yNxZJkswaJlr2wvBJWO
         hRmPGi3WScu7uPTC+FUcbRxq4nO0Y40VgnR+7Kp1AqiM000Nxclqil6qP1n9T6wGVGSM
         mSZ66V9jR+/tRGRNHW7Xg0qvtNIVk5q0tqs5S5C591Yznby3qJXxk5do1qcjoxlMudw4
         IZEeMmZ+mrrndp3hFUsxZNzMxNze3oeZoe5bvytXq97tT9Oq3Gk8TPgFfA53ppVrLB1Q
         FV8g==
X-Gm-Message-State: AOAM531Bm7+ceCAtkMty+YOK4VyGgF8dwBiAxXQK1OT9H6NM6jf7lroP
        8UD19kIA16rCKPme8XUEa+E9WatIearVocmrVVlTXfqJ/9//rThNKcobAtBkX4y5RjSBRGzbnfD
        XRHYiBbgIr2pJEBz6w3za
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr16122873ejo.23.1645451211815;
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJympFeYNPwVrvpdOujabcUfBrLcZOhXrnp6/5Mq9sO8/wrPnfABGYtpZyaMWkA/NIB/5P/gXw==
X-Received: by 2002:a17:906:6693:b0:6cf:3cb:89c9 with SMTP id z19-20020a170906669300b006cf03cb89c9mr16122858ejo.23.1645451211599;
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 12sm5240258ejh.30.2022.02.21.05.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 05:46:51 -0800 (PST)
Message-ID: <be628caf-15a6-d1f2-8c5f-c40baaeb0b5c@redhat.com>
Date:   Mon, 21 Feb 2022 14:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/6] platform/x86: int3472: Add terminator to
 gpiod_lookup_table
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-5-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216225304.53911-5-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 2/16/22 23:53, Daniel Scally wrote:
> Without the terminator, if a con_id is passed to gpio_find() that
> does not exist in the lookup table the function will not stop looping
> correctly, and eventually cause an oops.
> 
> Fixes: 1596ef1251b5 ("platform/x86: int3472: Pass tps68470_regulator_platform_data to the tps68470-regulator MFD-cell")

This fixes tag is wrong, that sha does not exist?  See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/platform/x86/intel/int3472/tps68470_board_data.c

I've updated the hash to 19d8d6e36b4b while merging this.

Regards,

Hans



> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index f93d437fd192..525f09a3b5ff 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -100,7 +100,8 @@ static struct gpiod_lookup_table surface_go_tps68470_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
>  		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> -		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW)
> +		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
> +		{ }
>  	}
>  };
>  

