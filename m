Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053A3C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 09:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238983AbiBYJWw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 04:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbiBYJWv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 04:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87C7DB7177
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645780935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zs/ymP2WaH294uTd9JZ+0QQGXWyIxaz/3V5QrO6MW94=;
        b=biznpZ90iKFMwMh151kYujtVtx+1q0rZPOzqtuCe7sbjdfHKX8mEC3aATvdwL+t8TmTkQs
        UVJJzbaWE53S8I0zaBR/kNSNokVycbfeVhBPazL7iCqHXnHZAUzJaq/dwXjo8emNAJnNre
        FAPKGpPzBzQucAtgJOQkAgeB9fscQVs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-ICvjSFtsM-mEu_QlvjtrIw-1; Fri, 25 Feb 2022 04:22:12 -0500
X-MC-Unique: ICvjSFtsM-mEu_QlvjtrIw-1
Received: by mail-ed1-f72.google.com with SMTP id m11-20020a056402430b00b00410678d119eso2025828edc.21
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 01:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zs/ymP2WaH294uTd9JZ+0QQGXWyIxaz/3V5QrO6MW94=;
        b=5B2uc2KOjAWy9/7eJrpA3Uy+nofMr5PhteCTuMLK8wPrh7Yt0nWh1B58CvVLvhMKXQ
         oBQRoG5ZTE0IknKAt2uHB1vt3ZFJNHQyP+B577gUTrg9lfpGAXgduUvk+xroqz4xcpPi
         jTsf0n9+u3VK3FjYlRTdCn6nohwkP8hB7ZkNs8gawG+Glulp3u0LAXyxSBNUGvyA9HKM
         gPIJ6+qEeyU2t2GkZGueVPUd6gEkbbhBDiqlVoi2oCCi88Nw3Jawkio0S1yLCEIPUpcY
         zU1FjnkFcXIDYAYptDhOvZAR8TkOIC3pjQevv7/+EeA+7tAvfYAmqE+EUnyxd0AuQXRo
         ySXA==
X-Gm-Message-State: AOAM530fFUST+GPs5fQYOGK40DjXHp5SLMfTDk2PIWzmpPNePeqvshWz
        VzZ31JcTc7Wo23NI2B/5b/1PCFcstXiktt9RFA387jT3DkwM02606QxK/TcI5WgEXHTyAcSkI6w
        /C3ASWL8WfilYtMRSrxu+
X-Received: by 2002:a17:906:6c90:b0:6cd:37e6:2297 with SMTP id s16-20020a1709066c9000b006cd37e62297mr5505991ejr.507.1645780931043;
        Fri, 25 Feb 2022 01:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNUBQNKtnE9iscoVWnpSlJ9Ku4C5VfWCOmUcgax8l/mtoni86gZdyc3Qew0e5w/6+PCHC5VQ==
X-Received: by 2002:a17:906:6c90:b0:6cd:37e6:2297 with SMTP id s16-20020a1709066c9000b006cd37e62297mr5505982ejr.507.1645780930861;
        Fri, 25 Feb 2022 01:22:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709062f8f00b006cd545d4af6sm786892eji.45.2022.02.25.01.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 01:22:10 -0800 (PST)
Message-ID: <d89e734f-2f85-aa76-f3b5-ae03a1f6cc0d@redhat.com>
Date:   Fri, 25 Feb 2022 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] platform/x86: int3472: Support multiple clock
 consumers
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     rafael@kernel.org, lenb@kernel.org, markgross@kernel.org,
        robert.moore@intel.com, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-4-djrscally@gmail.com>
 <c7d1539f-01a2-299d-ca4f-8e60cfe71775@redhat.com>
 <20220225004943.AA8EDC340EF@smtp.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220225004943.AA8EDC340EF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 2/25/22 01:49, Stephen Boyd wrote:
> Quoting Hans de Goede (2022-02-21 01:59:09)
>> Hi,
>>
>> On 2/16/22 23:53, Daniel Scally wrote:
>>> At present, the int3472-tps68470 only supports a single clock consumer when
>>> passing platform data to the clock driver. In some devices multiple
>>> sensors depend on the clock provided by a single TPS68470 and so all
>>> need to be able to acquire the clock. Support passing multiple
>>> consumers as platform data.
>>>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Michael, I plan to merge this entire series through the platform-drivers-x86 git
>> tree, may I have your ack for merging the clk bits from this ?
>>
> 
> With the type fix
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks, and sorry for not addressing you, I should have seen that
there are 2 clk subsys maintainers (and I know from experience
that you are the most active maintainer recently).

Regards,

Hans

