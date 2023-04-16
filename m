Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F4DC77B61
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 16:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjDPQXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 12:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDPQXX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 12:23:23 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B678719B2
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 09:23:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id iw7-20020a05600c54c700b003f16fce55b5so1062623wmb.0
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1681662197; x=1684254197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yXNr4yc6b0SDUY8hqCTB6iyF2qO+PN8qAd4295V67c=;
        b=zPuigPa7iCwg1CEtHJefuGYFujUNp3obPccQklOnX2Pgb49sfYfg4kNZIAxW9dm8Tm
         Yiv6DMBTJcTD/zHG7hrGEgJZsI3KRkxHhXB7wh3fw0pZ2+dmHDTouX2VovHZk1lt+GLR
         0yJpgOu1iuShN8GPx6Xyc9mUDiWF+ggG+UehSh2GSNU59Pa+JC2HnF8a8vqvfycbqc3L
         QrSqSy3YKfWNmlHGsp1duAU621yLavWG2NtR8J1AxevW8H4pcVemZL6el6KnYPxu9yF/
         JOztp4dMn9XdoDWZz0bPE2rrrH+PIMI5P7srT1VBmaqEhhciiqJhKy2rrk6A0+ppsUjm
         c5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681662197; x=1684254197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yXNr4yc6b0SDUY8hqCTB6iyF2qO+PN8qAd4295V67c=;
        b=ZjvIhuYARt41U8YBsOEkW7NvJlnjLCUjyzDBuoToRbwRzKz+kXJwnl63cM/suKGiIP
         NI2l9OZ4kGmAFCvGL6avkVU1P6rZEV5GSHAbJu860IfZHC8N9j1wAxr0M18MBO8EVuLx
         wzvBjaKHy+zwJGSyzD8Nic4XqHhSz0pEb1csZzF/p4gqSiLOw3HLYPM6rJKy3atl21BY
         bt4YwF6/CmOF7rlpUCfwOorQYnimJ5HNzU1NUiMLDf9w26a62lXBofabHST/rW3vM7RL
         42e5o3jC+OQiqtVC0xWjNO7S8J/zNPZgCRZgwM9Gq10VnSSLMRr1nHXtd9oqJP2vipyv
         j6QQ==
X-Gm-Message-State: AAQBX9cdniv3Rv8HXNfo2Vl6ud1uZCoeU5L7ZXs8oNVUh9Hm991VIvgm
        aY0bb+tz4NimF2TG2toozmx7jQ==
X-Google-Smtp-Source: AKy350b83ubou9a7dd6ujUEcrDBq+OqbrLGe/hr8g88G8CsO1BmtZzvITgZILxyPinR9lnlT6C2siQ==
X-Received: by 2002:a7b:ce0f:0:b0:3f1:6f39:419c with SMTP id m15-20020a7bce0f000000b003f16f39419cmr3370486wmc.36.1681662197134;
        Sun, 16 Apr 2023 09:23:17 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c155000b003f0a1c18128sm10573226wmg.29.2023.04.16.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 09:23:16 -0700 (PDT)
Date:   Sun, 16 Apr 2023 18:23:15 +0200
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
Message-ID: <ZDwg88x3HS2kd6lY@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
 <ZA9Nbll8+xHt4ygd@nanopsycho>
 <2b749045-021e-d6c8-b265-972cfa892802@linux.dev>
 <ZBA8ofFfKigqZ6M7@nanopsycho>
 <DM6PR11MB4657120805D656A745EF724E9BBE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBGOWQW+1JFzNsTY@nanopsycho>
 <20230403111812.163b7d1d@kernel.org>
 <ZDJulCXj9H8LH+kl@nanopsycho>
 <20230410153149.602c6bad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410153149.602c6bad@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Apr 11, 2023 at 12:31:49AM CEST, kuba@kernel.org wrote:
>On Sun, 9 Apr 2023 09:51:48 +0200 Jiri Pirko wrote:
>> Wait, not sure you get the format of the "name". It does not contain any
>> bus address, so the auxdev issue you pointed out is not applicable.
>> It is driver/clock_id/index.
>> All 3 are stable and user can rely on them. Do you see any issue in
>> that?
>
>What is index? I thought you don't want an index and yet there is one,
>just scoped by random attributes :(

Index internal within a single instance. Like Intel guys, they have 1
clock wired up with multiple DPLLs. The driver gives every DPLL index.
This is internal, totally up to the driver decision. Similar concept to
devlink port index.

