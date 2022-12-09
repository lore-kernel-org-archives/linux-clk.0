Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4047C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 09:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLIJaB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 04:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiLIJaA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 04:30:00 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F185945EC8
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 01:29:56 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q7so4580396wrr.8
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd0Q9/mveJy0Lwn890efpGQgEXkOblEDmPcf79XrkkQ=;
        b=BT8fxi9GcEF2JyCMb8Sw0YghkV1c/k7p4wSo1ZRi8ISKDEv9M+srZUTiLhTqXRVNWZ
         KpVNa+wLoOioesFisqbxEas9MfFudH2Mk36PDRf/xYYIR4fsog7xadEN/de4gY+ZtSY7
         GtTJrK0wYiJ9LiN/geBOGScUQmjWyAqzW3sF7HG0GdVxIX94Nx1huZ2oeIeugJzqaBQ7
         I/Pn3+Pcs+6Gl9FwzbBIVpXMyn4mv6JrLCZ5cz+KGTHM4Rb35NiyFzwiLz1PZxtpVSAv
         4CGADCOvupAvRj4aKWd0XciRT9y6YM4nJq1yOYi5vpKLit3Ob4LgWzQqJBZCkLEpRD7/
         /otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd0Q9/mveJy0Lwn890efpGQgEXkOblEDmPcf79XrkkQ=;
        b=pTg+3JAeOLXlT9TdWBvKNu28qIfvAod5nYBYAwol4wkzcg0aOI1vAmKFQS2zaCOC8B
         093P6+rRwN2VEB56Tuuttt96A/tssvENkirda1lEXOduuQgHiwTMo9Sg1WDkSTaBnU2a
         O1Tf/oEPHvk5BlNtqQ2y7Mx8grwj2mtP6c9mdp5rbE+7QfCtkrDzZWgXe7C0mdyHvkoR
         OrTTtNOj5ckg9NTpBS7MYyJlg8Kxs7vs4nUaPN4HG3BeSe/ZZ6OF/IQ1tQ28lZw8yJzV
         aPfvrgsXmlOAErL0VSdGMetwAqmkStL/sCBUCQPJKgSkOs8rWT99RsbTcdQFMLYPkYgd
         8gFg==
X-Gm-Message-State: ANoB5pk07AJb8oRsv3XSWzOHUnOnFYwQ2q3QKZJN25QXZx0IRNlQIkE7
        SzWpU4lIANvde/rZrnOCVc/Q9g==
X-Google-Smtp-Source: AA0mqf5OxOrmV8QTyiXLdwQu1aeyUmC111n5o9sLgwCXbheBLohpdtTgp/HYB9p5dVIz9VsnrJUCzw==
X-Received: by 2002:adf:d202:0:b0:242:ac4:4a0c with SMTP id j2-20020adfd202000000b002420ac44a0cmr3966224wrh.32.1670578195531;
        Fri, 09 Dec 2022 01:29:55 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id m6-20020a5d4a06000000b002420cfcd13dsm870752wrq.105.2022.12.09.01.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 01:29:54 -0800 (PST)
Date:   Fri, 9 Dec 2022 10:29:53 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vfedorenko@novek.ru>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Vadim Fedorenko <vadfed@fb.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [RFC PATCH v4 2/4] dpll: Add DPLL framework base functions
Message-ID: <Y5MAEQ74trsNFQQc@nanopsycho>
References: <Y43IpIQ3C0vGzHQW@nanopsycho>
 <20221205161933.663ea611@kernel.org>
 <Y48CS98KYCMJS9uM@nanopsycho>
 <20221206092705.108ded86@kernel.org>
 <Y5CQ0qddxuUQg8R8@nanopsycho>
 <20221207085941.3b56bc8c@kernel.org>
 <Y5Gc6E+mpWeVSBL7@nanopsycho>
 <20221208081955.335ca36c@kernel.org>
 <Y5IR2MzXfqgFXGHW@nanopsycho>
 <20221208090517.643277e8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208090517.643277e8@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Dec 08, 2022 at 06:05:17PM CET, kuba@kernel.org wrote:
>On Thu, 8 Dec 2022 17:33:28 +0100 Jiri Pirko wrote:
>> For any synce pin manipulation over dpll netlink, we can use the netns
>> check of the linked netdev. This is the netns aware leg of the dpll,
>> it should be checked for.
>
>The OCP card is an atomic clock, it does not have any networking.

Sure, so why it has to be netns aware if it has nothing to do with
networking?


>
>> I can't imagine practically havind the whole dpll instance netns aware.
>> Omitting the fact that it really has no meaning for non-synce pins, what
>> would be the behaviour when for example pin 1 is in netns a, pin 2 in
>> netns b and dpll itself in netns c?
>
>To be clear I don't think it's a bad idea in general, I've done 
>the same thing for my WIP PSP patches. But we already have one
>device without netdevs, hence I thought maybe devlink. So maybe
>we do the same thing with devlink? I mean - allow multiple devlink
>instances to be linked and require caps on any of them?

I read this 5 times, I'm lost, don't understand what you mean :/
