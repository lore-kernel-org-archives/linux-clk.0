Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476D5C77B7D
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 10:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjEEKcS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 06:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjEEKcR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 06:32:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FEC16094
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 03:32:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94a34a14a54so308741066b.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683282734; x=1685874734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oqFM0dfkiOziqgm+y7EAdXu3SisD+1/na/JyXA0Db3s=;
        b=NQZWiOt0UJlZjfg3GJnTv8hNzqx+Nl7N072M4bTaZxs0xwR0Yf7ZsNZ4lJOlNfNDT7
         tAM3IidgUlachT+I6uvo+sFy/kMTy4CK4kukqyLPIxM+4fNh6qP+GdbKDMu/oZh/a6qx
         UFwyD9deiM0sw3nx+TM0ukDI3KvNWNazhdaRacEp3YbYfQKLYoOkNL+2c02960OWlZa4
         v1wl7PnHnmRMcL/+zpccmr8m9ef2nHaEwHGPx5fMOA2aVjLtWhJyIX+sgEHtfAkADg7z
         jfXRcxJZYna4QCHkG+bmOZM1W4qv++/IHR1xYL6PO6xpRHk1cBF4ttlvVaugTUBYdLDg
         zOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683282734; x=1685874734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqFM0dfkiOziqgm+y7EAdXu3SisD+1/na/JyXA0Db3s=;
        b=gbsLWT1NjgUkgy/jktHdaVMoP1HfFzu9qAzIHiz41Cm32RTmcvl9psJVfr0HLpMZtM
         aHGh54TLu9cUeFOk20du3UD80i8eHOg3Rv0vYtbLGRrRJtLOZ5UARhksvJbDHt9uK7yz
         pdRCqgpfFfzhndXxD2IIsOlA8mXJSPBQ5sw9b/knHA3CTdR0T8CuKm1UJFRtm98SN2M2
         ghI1kHVgSgVsO4JCeIyGLuAtm87mkxrMEOI5tgeErpaMo4vbtOCq9QfSONaI7V+rjC4/
         3UZwccLDt0hiRFWRCEslzYuDUGpsYfYW2RotYPWwlszxms7Tk8/AOuzjlmdqg4JiJCj2
         4j5A==
X-Gm-Message-State: AC+VfDzNR9D5tr2gqBQMmrSeOuGdU0qw5vE9umRpZRMyH9yrAJAdD26N
        MFwwkZHzqnOPEZpMqJygq9KQTg==
X-Google-Smtp-Source: ACHHUZ4pZ9j/Mdczi1SYO7f5/FVFXb5vlqeJq2kBdYMCcTQvfFJrB/MTmDxvlObDskpJSZp8Qu6MUQ==
X-Received: by 2002:a17:907:7204:b0:94f:2bd0:4780 with SMTP id dr4-20020a170907720400b0094f2bd04780mr725346ejc.58.1683282733904;
        Fri, 05 May 2023 03:32:13 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id de5-20020a1709069bc500b0094ef96a6564sm772766ejc.75.2023.05.05.03.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 03:32:13 -0700 (PDT)
Date:   Fri, 5 May 2023 12:32:12 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, Jiri Pirko <jiri@nvidia.com>,
        poros@redhat.com, mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
Message-ID: <ZFTbLHnL9SXxqtzt@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-8-vadfed@meta.com>
 <20230504133140.06ab37d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504133140.06ab37d0@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 04, 2023 at 10:31:40PM CEST, kuba@kernel.org wrote:
>On Thu, 27 Apr 2023 17:20:08 -0700 Vadim Fedorenko wrote:
>> @@ -2411,6 +2412,10 @@ struct net_device {
>>  	struct rtnl_hw_stats64	*offload_xstats_l3;
>>  
>>  	struct devlink_port	*devlink_port;
>> +
>> +#if IS_ENABLED(CONFIG_DPLL)
>> +	struct dpll_pin		*dpll_pin;
>> +#endif
>
>kdoc is missing. I'm guessing that one pin covers all current user
>cases but we should clearly document on what this pin is, so that when
>we extend the code to support multiple pins (in/out, per lane, idk)
>we know which one this was.. ?

Oh, yeah. Will do.
