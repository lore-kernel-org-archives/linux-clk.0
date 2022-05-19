Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18542C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 18:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242385AbiESSDL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 14:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243588AbiESSDK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 14:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8AD8D6339C
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652983387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2frcxiV78p78ZYkCzsqmMpjOuw+695LnW4R6FejMjC0=;
        b=htaM4oNyJ8YoTX/tC81EfgeqhPsV79akre7YuWSpNPE7ICnKC0SAfgD9Lg7rTxZKAv37PI
        guoj8NcU/i599ZbiIUkqFdEERnOaQBOAAljAsMEqNL21kolXh8FDG6wI4Ig3bvEBpuH4xE
        Z9KGYW63/mWc40KbkXp5HV3/fa+NMVo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-zYp8OiJAOfCZ_L7Mzy38EQ-1; Thu, 19 May 2022 14:03:06 -0400
X-MC-Unique: zYp8OiJAOfCZ_L7Mzy38EQ-1
Received: by mail-ed1-f69.google.com with SMTP id q12-20020a056402040c00b0042a84f9939dso4077900edv.7
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 11:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2frcxiV78p78ZYkCzsqmMpjOuw+695LnW4R6FejMjC0=;
        b=AIueYSPcd6/XIO2kzGAm9LvWckzQ7HzPL1MQoch5dG5T/70JYs7uI25fY++YP0b1bl
         3gAOQv/NHZQIMTIc4haG22jw6yEtkNKFIy+LoD6E/x74t7c6YZ0Cmw7HVP3PPZLMoDRY
         hDi0hKsu7yZWm8GH44Q3Awb/1ahpc7TyYZOcB/8hySS4Jya5uLZqewE2lBbY10VR+K04
         HQAGIeRVz+eugEth3TqpoMT1FmPhDo5cMrzYbWIVkPiXts48dhsgCyhbLrvnkFrzagmZ
         SBv1kQjFX62P+e2tft7zm5CNvgJZacXyrKoCtWVmJfpuZ9cA6BzcHigB3HcJkgbeBRaZ
         vMZw==
X-Gm-Message-State: AOAM532ErqGOQwxmT9c76Yi8T16o0VF4sj/x8bP4knZkWibJRV4FAyUM
        1rrcLKC3+PVZEswbXNioCK9GVMi+Nnks3LPo2Lq3udRrn6udEXjuac47MzcXerPmK4kOyB571i5
        jeKp+o+sVn0/xz5XvJWHx
X-Received: by 2002:a05:6402:3787:b0:42a:ea83:ad25 with SMTP id et7-20020a056402378700b0042aea83ad25mr6676483edb.233.1652983385156;
        Thu, 19 May 2022 11:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmaUwxIOd3vD4MCYTe2nN/S76LE1Vg0HIXf3vwpkrreSs0DSeFRRdl7H9Mq2cMF7iD4GvBeA==
X-Received: by 2002:a05:6402:3787:b0:42a:ea83:ad25 with SMTP id et7-20020a056402378700b0042aea83ad25mr6676472edb.233.1652983385005;
        Thu, 19 May 2022 11:03:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d29-20020a1709067a1d00b006f3ef214e39sm2323740ejo.159.2022.05.19.11.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 11:03:04 -0700 (PDT)
Message-ID: <5c591b27-8524-2589-d7af-97cee9e5cf3b@redhat.com>
Date:   Thu, 19 May 2022 20:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] platform/x86: Drop the PMC_ATOM Kconfig option
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220503114607.98844-1-hdegoede@redhat.com>
 <20220503114607.98844-2-hdegoede@redhat.com>
 <20220518210007.E4BDCC34118@smtp.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220518210007.E4BDCC34118@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 5/18/22 23:00, Stephen Boyd wrote:
> Quoting Hans de Goede (2022-05-03 04:46:07)
>> The def_bool y PMC_ATOM Kconfig option provides a couple of symbols used
>> by the code enabled by the X86_INTEL_LPSS option and it registers some
>> clocks. These clocks are only registered on Bay Trail, Cherry Trail and
>> Brasswell Intel SoCs and kernels targeting these SoCs must always have
>> the X86_INTEL_LPSS option enabled otherwise many things will not work.
>>
>> Building the PMC_ATOM code on kernels which are not targeting the
>> mentioned SoCs and which do not have the X86_INTEL_LPSS enabled is
>> not useful.
>>
>> This means that we can simplify things by replacing the PMC_ATOM Kconfig
>> option in Makefiles with X86_INTEL_LPSS and then drop the option.
>>
>> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans

