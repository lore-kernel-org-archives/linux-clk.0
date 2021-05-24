Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817A8C04FF3
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 09:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5326B611EE
	for <linux-clk@archiver.kernel.org>; Mon, 24 May 2021 09:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhEXJis (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 May 2021 05:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhEXJir (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 May 2021 05:38:47 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BDCC061574
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 02:37:19 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id y14so25734617wrm.13
        for <linux-clk@vger.kernel.org>; Mon, 24 May 2021 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=eDrYI330g2FzhYKn+4hPogmPRz25LSNoxfJ23kSyb5s=;
        b=tJ0hM2HiTfP+YC6rqU8Hf9M4qSZMUM/bEXPJyVK2XaI5QBuI01GybBYIiLPWmTPsDc
         gPrRZJ1A6FMrkqdw/G8l1cw53JSD54otveALt429Ks6gahJkpIFqZWFeg/MZ7hDQH4oH
         ZE8olc/FI/kO9m/0RvKVsDjBFgdGtDKtVTlR+itw1HSGRdWl5R4MkvMEjfH9kAFMofw7
         6BO4mMjkeUHTMDdZUOyN0+7gdG+EESIFSNctYRlsQOEbYNQqRtF5pUnEKgTG9X934Vi3
         /CpirNJRlSxfzJ0EA1muZSCbcybqnLDOrkacNqPxo+xez6TKs429RQaiMv393PQ3ni1n
         PZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=eDrYI330g2FzhYKn+4hPogmPRz25LSNoxfJ23kSyb5s=;
        b=TppjDFx/PuBIsbglqI9vWFuA8nyrOxzq9vBHtq97HahiLoaH7aEBAXWDsowzqcnHPv
         S+HF8HZP8khFZCNu9DHOhtHu48WfXq4d+oAHVeQXtp0H9CfpohNIo4Q99dhm9IB53hVd
         mCyfsXdZm0E3bXzyTWtJ6q3RFB1sZTFhIEe27i3vF++V+MR545mGlVz7BtCdS1Iy6C5j
         NMq7f28lNOFV8twAlxiN9XboXLV+j+GEjkXKjKvVgEH5opkgcl0qyD8GLYiEYTXny8W5
         2kKrogdGNco3MZsaX9fXrygVHOjApomUwVmHVXQgC+IO8Ln+G1FHtKf9deyvhHpucw5D
         HdCQ==
X-Gm-Message-State: AOAM532CblXkUamlUkcCHvtmc0au8LCWnyIDrgQ9rEMQ5h6/z3aznCxO
        eoCc/uHNoxEizniENX/o7yqWOg==
X-Google-Smtp-Source: ABdhPJyxP4K03dqX+BVEirSz7HMQ95Xnk4RY0NTu/bRcZAbWtqcKa2tYpeP7fH6NjTaC+VDVjR9TTw==
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr21126282wrs.144.1621849038532;
        Mon, 24 May 2021 02:37:18 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id i5sm11881875wrw.29.2021.05.24.02.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:37:18 -0700 (PDT)
References: <20210520073136.272925-1-jbrunet@baylibre.com>
 <CAFBinCB=pAipcZOi8S005SyO8ptfzy8oGpW4S8Pi++A5-Jc5eA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: axg-audio: improve deferral handling
In-reply-to: <CAFBinCB=pAipcZOi8S005SyO8ptfzy8oGpW4S8Pi++A5-Jc5eA@mail.gmail.com>
Message-ID: <1jy2c4bhgy.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 24 May 2021 11:37:17 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 20 May 2021 at 22:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On Thu, May 20, 2021 at 9:32 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> Use dev_err_probe() for clock and reset resources to indicate the deferral
>> reason through sysfs when waiting for the resource to come up.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied
