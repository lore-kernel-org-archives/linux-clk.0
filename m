Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A4BC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 06:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJDGd1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 02:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJDGdZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 02:33:25 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE868476E0
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 23:33:21 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id 13so26711465ejn.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Oct 2022 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UNNn+aJyKI7I3QUSuIMb8vSXj6mDccgMNFpRl4lXEZo=;
        b=qbzOi5HQQpg2bpB7VFrL6MOFvNBzUpBIFU0Jkug447grp9HeZAH2n6sy8rA5RIC6fz
         D8n3wfg+ocxPaaE3RS4ChENpq3hWVsLDgjrRoJ/2fpcca/lyYxZT0V/wragvfyqJDlcB
         X0J1x1UnAxcbjc0nbBMH0I3fHNw3Bx2vgihvUxpxp0iSLrVP+kodALGPHYcBG49/FSpF
         L6xEt84ML6OLZl6lfAlgF0iHsutBY2jOCKeQD7nZ0GooqspZ1LqBmdmOtPgEhqj+9Uru
         +VCJ5Np8yz7F0laVp5RfSpvYhPk8qgZ9gFX8WXIgNqGTU9w3uwsJxIinykmTcHrhG/s4
         WJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UNNn+aJyKI7I3QUSuIMb8vSXj6mDccgMNFpRl4lXEZo=;
        b=XZkwWcRqc3IE7Z3JakhdHHXazMJFrvBy4KphLiP1p9/KkE4da9ZT0PEdcuywPX+j3R
         ddueObqp+aJm7mcUzhjpnslMXRqnANrc5OgF3quOBBXavUWq5fh72QaLnF9Q/RQ3coSI
         suWEkoq/skEu4Z/Dp8JLBYxPZCXpvC9O6ZkYhc8/9Ch434n6F+v0f01/vE+a3Nm86cTC
         peU9nHFpPbaVZa6xCcAXJz59KTUWTfD01Z7HoDY/CD8el0Fi7EKhysbzhIt6yE+45HXe
         YNbLxRHgkXDgSgHL/dgazyvg4c2WQxFldo8TVjdThItWq43Vx1Iix7uoXnGqOjWrq08U
         81ZQ==
X-Gm-Message-State: ACrzQf14pydHIu6WzWzRdimM/wbiXm67c2MyIEUtr6CP+DEdXc/2OhHu
        dueUfLA83qqvpMx5adxxFOeE9g==
X-Google-Smtp-Source: AMsMyM4YNNSdZ3jELO3jJlClXSpsmKpVP+uzmbFBv3c3rAY2Qn0ESKGXEg2j9wNmf/k0HLhSJK89mA==
X-Received: by 2002:a17:907:1b0e:b0:72f:9b43:b98c with SMTP id mp14-20020a1709071b0e00b0072f9b43b98cmr18063878ejc.710.1664865200276;
        Mon, 03 Oct 2022 23:33:20 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id sh39-20020a1709076ea700b0073cd7cc2c81sm6526138ejc.181.2022.10.03.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:33:19 -0700 (PDT)
Date:   Tue, 4 Oct 2022 08:33:18 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vadim Fedorenko <vadfed@fb.com>,
        Vadim Fedorenko <vfedorenko@novek.ru>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Aya Levin <ayal@nvidia.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Gal Pressman <gal@nvidia.com>
Subject: Re: [RFC PATCH v2 0/3] Create common DPLL/clock configuration API
Message-ID: <YzvTrvE9HPHmtoQ7@nanopsycho>
References: <20220626192444.29321-1-vfedorenko@novek.ru>
 <YzWESUXPwcCo67LP@nanopsycho>
 <6b80b6c8-29fd-4c2a-e963-1f273d866f12@novek.ru>
 <Yzap9cfSXvSLA+5y@nanopsycho>
 <20220930073312.23685d5d@kernel.org>
 <YzfUbKtWlxuq+FzI@nanopsycho>
 <20221001071827.202fe4c1@kernel.org>
 <Yzmhm4jSn/5EtG2l@nanopsycho>
 <20221003072831.3b6fb150@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003072831.3b6fb150@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 03, 2022 at 04:28:31PM CEST, kuba@kernel.org wrote:
>On Sun, 2 Oct 2022 16:35:07 +0200 Jiri Pirko wrote:
>>>> What I'm trying to say
>>>> is, perhaps sysfs is a better API for this purpose. The API looks very
>>>> neat and there is no probabilito of huge grow.  
>>>
>>> "this API is nice and small" said everyone about every new API ever,
>>> APIs grow.  
>> 
>> Sure, what what are the odds.
>
>The pins were made into full objects now, and we also model muxes.
>
>Vadim, could you share the link to the GH repo? 
>
>What's your feeling on posting the latest patches upstream as RFC,
>whatever state things are in right now?
>
>My preference would be to move the development to the list at this
>stage, FWIW.

I agree, that would be great.
