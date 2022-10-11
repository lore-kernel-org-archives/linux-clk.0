Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F99EC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 03:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJKDLL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 23:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJKDLK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 23:11:10 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555D280BDB
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 20:11:07 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pq16so11360094pjb.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 20:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTAfYsbOtFvtvqiWBTGIW5SrFGY1WvU38VWPZFuksuo=;
        b=PGaSR7UKyhRUOCcgSBulfS7m9SVQfRvoQ9VUGGFPWDD2PumauAxBTOVmVa6sZ72tIN
         FEKCqq1XTMOH9tuQ5VlUuFOsJcPJ9NmAiqqeBQsR8g5ZMQTkAfOgD+d7p9QSLQk7AhKC
         YmxzU9GCheoyaLuwC1Nrw7pLXlka51aqtPrMhi2EVBGrXB3ns8rMpDBNiO5wp8+OSbRs
         MjteoZ5roNjW2OBvIA2BajgXdZRQ7pZIeLSF7KE8MmBpuC5vaLdUv6XnD1HQAbfmYcJ1
         uqEgH6M9tMAm1wbYbpFqro7SyLge4QGZu6zdhjBvc1/+nECWEJovLlEPk8ecE0Y0pNre
         OKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTAfYsbOtFvtvqiWBTGIW5SrFGY1WvU38VWPZFuksuo=;
        b=LCGDsa5zWXeDlvbjpdaRNwCY1qzwK3EXtgpNuMxGqWbx4e0m4dX0H6g1nSc6v0jDhi
         r7rJePWfrEsRKo6vOMAo3bbJYkOToV+7MJSVvIo632erDMlgCojCeshBmewQvzjrzZdI
         F29BmX+PHWwu/duQC8BxzV843+XvuzIC80eVQxxJwhc3crcGZHbPNvR72OKD7/th3rEH
         QISfDa8PBxsH5AqBkARA1QzpKsUfKa1vVd1ghlPzASYx5YCB2mikvDwlz5vzAdrINUtA
         n6u4nTbIFokVu3GuMbt1N+KO443OtYaj8gTRsD/K8kLfgzIlm9j70CSjuw23Kn6hFiq6
         EQvw==
X-Gm-Message-State: ACrzQf1jev+5c5wlcwg7TQWCnyqYaYkaZUtEUahHHTJzM7Ak/fe8AgmA
        3FMt/pb7mSEs7j67w6nlZmDSBQ==
X-Google-Smtp-Source: AMsMyM7AsryBn7diqfnZGV99J5DsEPP+gjPJ/BTTrBn5RpG8aEx2pM4fMziiDUvFnGmZybJ0ybfUcQ==
X-Received: by 2002:a17:90a:d48b:b0:20a:97fb:3eb with SMTP id s11-20020a17090ad48b00b0020a97fb03ebmr34324711pju.189.1665457866732;
        Mon, 10 Oct 2022 20:11:06 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id e24-20020a63db18000000b0040caab35e5bsm7005412pgg.89.2022.10.10.20.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 20:11:06 -0700 (PDT)
Date:   Tue, 11 Oct 2022 08:41:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>, soc@kernel.org,
        kernel test robot <lkp@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: spear: Move prototype to accessible header
Message-ID: <20221011031104.5gvw47ocbhj52oxy@vireshk-i7>
References: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
 <20221011010116.A6245C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011010116.A6245C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10-10-22, 18:01, Stephen Boyd wrote:
> __init is meaningless in header files

Technically yes.

But then I grepped include/ and it is widely used, even by core kernel
headers. Why is that ? Maybe just to keep prototype consistent ?

Also init.h says:

 * If the function has a prototype somewhere, you can also add
 * __init between closing brace of the prototype and semicolon:
 *
 * extern int initialize_foobar_device(int, int, int) __init;

Hmm, I understand that it is just saying that __init can be used after
function's name instead of just before, but isn't it also suggesting
that headers may also have it (maybe just to keep it consistent) ?

-- 
viresh
