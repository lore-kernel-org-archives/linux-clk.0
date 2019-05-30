Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDABC28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 16:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2248F23A85
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 16:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC+9gVMI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfE3QOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 May 2019 12:14:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44221 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfE3QOS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 May 2019 12:14:18 -0400
Received: by mail-lj1-f193.google.com with SMTP id e13so6583431ljl.11;
        Thu, 30 May 2019 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XmK9q1mGN7b6J4ODdEo3M1qArYHGWBwKVshxM4f06qI=;
        b=NC+9gVMIPhE4UEq4DmEQVSxKVVvwWVxObVXuy3Dy5tCThFcZXko5nmhViQRnze2i/I
         fSwXUz+NaxDnIHe0IC480esVOWswPMZeWILlHqW74AfwllaX2QGptx7cKGx3qLTtS8j6
         NzEcEdw+QKfjvFBS0VtMyk1XfKXDuxdwvR9xdd681UFY+nT6KHPleB0RyM+ZDi7xKLOz
         /fHNz2v5OVDrGszE4fUAUl2dUU/+7pXCVebD+bHigJ2t7xUJ9S2ZoTX9Sj+0Jo06ctuC
         Mad5J+HrWL+0HoBvSW2iQKBWGlZMshQ8rU6aZjdEBMPedGBkXxcpZkeNF7Bw1hcwFUrQ
         NS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XmK9q1mGN7b6J4ODdEo3M1qArYHGWBwKVshxM4f06qI=;
        b=WQ445ZyVhmiQgwkBDPvgjhXRbcepTdyrQeY7z4GnRrLu640baOOoh4TVm4pW4DXDVv
         WCwaAPpHf0qhatTg7i1QkJ5QKu+NWiVZd0YNdnUkafm5IMbBtpdXfj7NMSe2kaK7I32+
         QxyovlH2CGvQpBCvMHrlaeTPQKTF3gSf9hF8FlxDUW1zbgGZ+Es5+RxPW0brT+kLAFrR
         3LJuVG7giRwzVUoAOCyM8GKeY13T0dOqoAh4/ZxwnPsUR/aNCKdoFY5eoayO/NhGEko2
         tN95o/5JD9rHePOJkqJ4+exZFU6Q9W7ix9loQGxBWAZ3+HnZZVuBQqWlSHT6QVljKbzR
         CZvw==
X-Gm-Message-State: APjAAAVYzXAWdXXoCdEzyJCt1V1lawNvcfDQOZ81tj+VW8UCrJYiVb4z
        XsNLuN2cSTBPVin9Clh7Cnw=
X-Google-Smtp-Source: APXvYqzmFSkb0VYg/nw/YZHYkemnGBzkLyFKJzkID+tESoZ47z/BnAUSJVfRTTWIL2jjvt0h3pYjCw==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr2523378ljj.97.1559232856343;
        Thu, 30 May 2019 09:14:16 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id r14sm570580lff.44.2019.05.30.09.14.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:14:14 -0700 (PDT)
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1e197124-57f5-285b-1624-bba2f3d31386@gmail.com>
Date:   Thu, 30 May 2019 19:14:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - fix the API with generic naming
> - use 'u16' in 'struct emc_table_register_offset'
> ---

>  
> +extern const struct emc_table_register_offset reg_off;
> +extern unsigned long dram_over_temp_state;

Please avoid global variables where they are not really needed.

Add reg_off pointer to tegra_emc.

Remove dram_over_temp_state variable entirely and replace it with
TEGRA_DRAM_OVER_TEMP_NONE in the code since nothing changes the variable.

Again, prepend all global symbols with tegra210_.

Alternatively you could simply include tegra210-emc-cc-r21021.c into
tegra210-emc.c, I don't see anything wrong with that variant.

	#include "tegra210-emc-cc-r21021.c"

Or you could squash it all into a single source file if variants other
than "r21021" are not planned to be supported. This will help to reduce
messiness of the code and will allow compiler to better optimize it all.

-- 
Dmitry
