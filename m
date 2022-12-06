Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39A6C3A5A7
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 08:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiLFIu0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 03:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiLFIuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 03:50:24 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36CC6441
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 00:50:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so7458471wms.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 00:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6MLEMifrOrAUJyiSNGyAY6fT78MNUKLEB+8w+o7FY90=;
        b=YlErl1grOuPOm9ucyT+J7AqqdsFweAD5LdsekbhpKGbraE4N5YdAqg8rSYajR0ljUM
         +64umJysE99/JVhfURudPQE6FyhU/VqRjGCUYExvh6QLrmD9m+VYn91GnDq5zBVHxwAi
         nofeqbvzdVvdZgHYUT3CT+0J2Z05qs4hgpOgaNw4YRwhAbc+UYPPIK8vb36R/HZUoYvt
         vJS5QUnj7NG7nY1rL3p1FKJPlURrxdY0hdvfeJwpxzuymq1QPC51O1nHrocX8zjEQS+Z
         Z9wgpYzP+nV14U91RpkJQrfvjiPX6AiuWOJRdEd/nUyzukEDKwA0GOXMBtwLiR8GrF4N
         kySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MLEMifrOrAUJyiSNGyAY6fT78MNUKLEB+8w+o7FY90=;
        b=udiSYPRq2hmtb6tKMwxdmnHlYUtu3m5Rha530YRJraeK2/JyosRJsH4lkLnYTCmZeQ
         /HcFdLNVNOOVkQGz4iHqeMTt6DOSQfxmsSk9zJk917bLHa1HtluuIV0+8ADvQFHatqSi
         pCyE39NJ80DAIZClYZSyylC6b0PoFIFtL/bhxf7wS7XtpfwaCo6JuOU10/PJ4Vg9zm8O
         zRrdWvQx4J7cmjSUHzS8HWQ/fKd0kbBEs3MMcL/ourc7xAiR8WgC725b1WnWXYYmI7j+
         T8MFC/UYCaRFvnpYHBe1vGvGrfDs0nhICxEhM5eOTUVsujq0b+Xr8l52y2a3Z64sEcW0
         8s2w==
X-Gm-Message-State: ANoB5pkvELizvO0Rl5hXvq6NjkEcHU6DKx+kh8c5j9pU/KrJtTMRb6M8
        x5jJlMOEHPWQyeDFxX2RcVTH0A==
X-Google-Smtp-Source: AA0mqf79OI9dXCe3xYaQOVHi0Mcw3RUmVy3FxZc4HYB3KfTJSvGj1hBcHzNQ5QzTmm11mjMaKGIl/A==
X-Received: by 2002:a05:600c:3d98:b0:3cf:e9a4:325f with SMTP id bi24-20020a05600c3d9800b003cfe9a4325fmr61498931wmb.98.1670316621409;
        Tue, 06 Dec 2022 00:50:21 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600011cf00b002366e3f1497sm16065586wrx.6.2022.12.06.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 00:50:20 -0800 (PST)
Date:   Tue, 6 Dec 2022 09:50:19 +0100
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
Message-ID: <Y48CS98KYCMJS9uM@nanopsycho>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
 <20221129213724.10119-3-vfedorenko@novek.ru>
 <Y4eGxb2i7uwdkh1T@nanopsycho>
 <DM6PR11MB4657DE713E4E83E09DFCFA4B9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y4nyBwNPjuJFB5Km@nanopsycho>
 <DM6PR11MB4657C8417DEB0B14EC35802E9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y4okm5TrBj+JAJrV@nanopsycho>
 <20221202212206.3619bd5f@kernel.org>
 <Y43IpIQ3C0vGzHQW@nanopsycho>
 <20221205161933.663ea611@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205161933.663ea611@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Dec 06, 2022 at 01:19:33AM CET, kuba@kernel.org wrote:
>On Mon, 5 Dec 2022 11:32:04 +0100 Jiri Pirko wrote:
>> >> I believe we should do it only the other way around. Assign
>> >> dpll_pin pointer to struct net_device and expose this over new attr
>> >> IFLA_DPLL_PIN over RT netlink.  
>> >
>> >The ID table is global, what's the relationship between DPLLs
>> >and net namespaces? We tie DPLLs to a devlink instance which
>> >has a namespace? We pretend namespaces don't exist? :S  
>> 
>> Well, if would be odd to put dpll itself into a namespace. It might not
>> have anything to do with networking, for example in case of ptp_ocp.
>> What would mean for a dpll to be in a net namespace?
>
>Yeah, that's a slightly tricky one. We'd probably need some form 
>of second order association. Easiest if we link it to a devlink
>instance, I reckon. The OCP clock card does not have netdevs so we
>can't follow the namespace of netdevs (which would be the second
>option).

Why do we need this association at all?

