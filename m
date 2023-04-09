Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64F0C761A6
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 07:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjDIHvz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 03:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDIHvy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 03:51:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089724ED4
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 00:51:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j1so6103901wrb.0
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1681026710; x=1683618710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dfO6Q33trJc9amyhdRbPtb/0kOtWlf2GzxFdUmEYiZk=;
        b=xu7oqttuRrYeLuPwLeDqLWb1YoZ2oNd1KlEtRiVW19w9PN84nrTEoob2dNVqjAD9if
         cZdXB0iwrxjSRq00/78tUW84AOS/LKBqANL8Kba4+ZetKECF6QpXg9lZL6tO7k+w6tEt
         2MZz30BfwHo3HJmn+g/tvTeLYe76HtSh7mg1QMFQm7XKH3Uy3jAILiR0h8uACNBKJPuk
         TDQjU3qcdm+cLcnc69nC6WBBw4W0EmdwaBKnD700yE7yCLtC2B/xnkXk/KPAdbH1iRr7
         OjYYlLCCbzJFGM8nBTm+g678wcPsBZQy47Q1BK4gifH4PBIiqJolIS2RPA+Pe7JEf3Q0
         eMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681026710; x=1683618710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfO6Q33trJc9amyhdRbPtb/0kOtWlf2GzxFdUmEYiZk=;
        b=7lPVXHi7MMl5YSXXE/eXoPZPyb5QmUYHMbUt/lHygwUGws84w8OLGyorHbDzsmLB4P
         aQIMGPBLM3qrMq770lw2C5HMMTD647Ocap2qIalyPFPxoaKfaiR3nO+5utbASgGg0YQk
         eiUR3gqHv9bTXONGFiuf2ywDxHYylvsc1osx8nw6iVTwxE5sVJifrfkdW/b76P0VrVvJ
         2P3lN+mbn3ExfNtF6o3bJGZozeE/eWNhdUZItVMfwAS+L3FENn/LoqKQM0ps07y9hezO
         z+Cr6vDQ8tihMh9n5QbHM/3b91x7dML0NdrxftSn5/tqODFTpiNtzRG7N0ky68rhzEv3
         T6tg==
X-Gm-Message-State: AAQBX9dJTFUK+8nF6oKcem4APWawrHGoT/DXV1lk7Z2Wq4FxSCvtlRx6
        AfQtIQjd/BCFz11BcxCpvWDTpQ==
X-Google-Smtp-Source: AKy350a7jE9qhPToVvbG60Udd4ofHEpP3TiNv3InRKJaBJlwkFhj4NxtJ4QB9S7gt55caA0ys3LmQQ==
X-Received: by 2002:adf:f60b:0:b0:2ef:bbbc:de7d with SMTP id t11-20020adff60b000000b002efbbbcde7dmr2140633wrp.46.1681026710389;
        Sun, 09 Apr 2023 00:51:50 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5052000000b002cfe0ab1246sm8642373wrt.20.2023.04.09.00.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 00:51:49 -0700 (PDT)
Date:   Sun, 9 Apr 2023 09:51:48 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZDJulCXj9H8LH+kl@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
 <ZA9Nbll8+xHt4ygd@nanopsycho>
 <2b749045-021e-d6c8-b265-972cfa892802@linux.dev>
 <ZBA8ofFfKigqZ6M7@nanopsycho>
 <DM6PR11MB4657120805D656A745EF724E9BBE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBGOWQW+1JFzNsTY@nanopsycho>
 <20230403111812.163b7d1d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403111812.163b7d1d@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Apr 03, 2023 at 08:18:12PM CEST, kuba@kernel.org wrote:
>On Wed, 15 Mar 2023 10:22:33 +0100 Jiri Pirko wrote:
>> So basically you say, you can have 2 approaches in app:
>> 1)
>> id = dpll_device_get_id("ice/c92d02a7129f4747/1")
>> dpll_device_set(id, something);
>> dpll_device_set(id, something);
>> dpll_device_set(id, something);
>> 2):
>> dpll_device_set("ice/c92d02a7129f4747/1, something);
>> dpll_device_set("ice/c92d02a7129f4747/1, something);
>> dpll_device_set("ice/c92d02a7129f4747/1, something);
>> 
>> What is exactly benefit of the first one? Why to have 2 handles? Devlink
>> is a nice example of 2) approach, no problem there.
>
>IMHO for devlink the neatness of using the name came from the fact 
>that the device name was meaningful. 
>
>With the advent of auxbus that's no longer the case.
>
>In fact it seems more than likely that changing the name to auxbus
>will break FW update scripts. Maybe nobody has complained yet only
>because prod adoption of these APIs is generally lacking :(
>
>I agree that supporting both name and ID is pointless, user space can
>translate between the two trivially all by itself. But I'd lean towards
>deleting the name support not the ID support :(

Wait, not sure you get the format of the "name". It does not contain any
bus address, so the auxdev issue you pointed out is not applicable.
It is driver/clock_id/index.
All 3 are stable and user can rely on them. Do you see any issue in
that?
