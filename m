Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F67C4332F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Dec 2022 11:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiLHLYG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 06:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiLHLXY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 06:23:24 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED87E63B8C
        for <linux-clk@vger.kernel.org>; Thu,  8 Dec 2022 03:22:12 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id c66so1647687edf.5
        for <linux-clk@vger.kernel.org>; Thu, 08 Dec 2022 03:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aT0YDbPxl4cyyIrH59SeYHqFrAHclRVJHpPUYMXLkaM=;
        b=jAXtwwTzrBSYYD6swadRH1d2XpmDrnmLilC05AlDn650px8Zto6Bvp9bkb46yTs0xP
         bwpWvSZl2lpT/VA6RKalG7ZMn35Emw6KWl1qZbKCuX1px9khd/XX4CQe5LLaQxGdOZet
         Xg0XeNXcxYUSPHCur02XlRa5nszWFP6xTEznVhfpKQ78S7QdIC/IZfOxHw+vX/w3JnD/
         9E//sIVrr2fgFAQj+QAcmwOtMy2hpH0ozU8694v7xTbURpbxC067u/5cpQJq2TMGVIkz
         I3xZNxXPemEFmgqh1P8ST+pfb0sWKjdZ0LqUWPT+tiJMgxlHZqTMgdikggIeQJHXUA5X
         VC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT0YDbPxl4cyyIrH59SeYHqFrAHclRVJHpPUYMXLkaM=;
        b=sdem4vE2GI6MOMQgzPokrQtuaQRALxV1dtcYYA6BJmoIakDqLxn/ON5298m+Fmb/Gr
         cgTXgVVl60YDObISnem/7k9iXehT2TySBB/Bu2zglYGWYynqHa8gzJwzW+QM0fH40hCD
         usYejQZAcdukQb7WTNW1b/2cEXdU8SsYd8SV7rUYcLpsRRV1hGcdMuvbTbMZobtI1kaZ
         Im8dMpOVBrZ9SQRfivp3PBhrFYxE9afdJj5/NvXlLUxj1Q7CP2+tIa4KkDq803I3e3MF
         wn9gsFV5KvCrXxDkqm5CqQajM0ODk9+Rn9b0dy2RMyixscStkUsbFr/LyIp7365SX8eI
         OAbw==
X-Gm-Message-State: ANoB5pk20EteJle3gSojZvQLCYFHyQNTqKCsrFyBMaO8ArYdW6fMIv3K
        1ehkKYnpSAf0YtWXxJnJeKI8PQ==
X-Google-Smtp-Source: AA0mqf7D8UtfvONcNnijImJWpgg0vr14ZiA98rrVnXwdmKKquSHB3AGkzwJHPhlRvdCMwjmk/FAUug==
X-Received: by 2002:aa7:de83:0:b0:46a:d8b7:f3bb with SMTP id j3-20020aa7de83000000b0046ad8b7f3bbmr1821084edv.26.1670498531408;
        Thu, 08 Dec 2022 03:22:11 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7dc14000000b00457b5ba968csm3246187edu.27.2022.12.08.03.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:22:10 -0800 (PST)
Date:   Thu, 8 Dec 2022 12:22:09 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vfedorenko@novek.ru>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Vadim Fedorenko <vadfed@fb.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v4 4/4] ptp_ocp: implement DPLL ops
Message-ID: <Y5HI4deFBTvDFIGB@nanopsycho>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
 <20221129213724.10119-5-vfedorenko@novek.ru>
 <Y4dPaHx1kT3A80n/@nanopsycho>
 <DM6PR11MB4657D9753412AD9DEE7FAB7D9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y4n0H9BbzaX5pCpQ@nanopsycho>
 <DM6PR11MB465721310114ECA13F556E8A9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <20221206183313.713656f8@kernel.org>
 <Y5CS2lO8WaoPmMbq@nanopsycho>
 <20221207090524.3f562eeb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207090524.3f562eeb@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Dec 07, 2022 at 06:05:24PM CET, kuba@kernel.org wrote:
>On Wed, 7 Dec 2022 14:19:22 +0100 Jiri Pirko wrote:
>>> FWIW auxdev makes absolutely no sense to me for DPLL :/
>>> So Jiri, please say why.
>>
>> Why not? It's a subdev of a device. In mlx5, we have separate auxdevs
>> for eth, rdma, vnet, representors. DPLL is also a separate entity which
>> could be instantiated independently (as it is not really dependent on
>> eth/rdma/etc)). Auxdev looks like an awesome fit. Why do you think it is
>> not?
>>
>> Also, what's good about auxdev is that you can maintain them quite
>> independetly. So there is going to be driver/dpll/ directory which would
>> contain all dpll drivers.
>
>To what practical benefit? Where do we draw the line? Do you want
>PTP clocks to also be auxdevs? DPLL lives in netdev, we don't have
>to complicate things. auxdev is a Conway's law solution.

Auxdev infra is quite simple to implement, I'm not sure what do you mean
by complicating thing here.


>
>mlx5 already looks like sausage meat, it's already minced so you can
>fit it there quite easily, but don't force it on non-enterprise devices.

Not forcing, just suggesting. It's a low-hanging fruit, why not reach
it?

>
>There is non 1:1 relationship with a bus device and subsystem in Linux,
>LMK when you convinced Greg otherwise.

Sure there is not. But maybe that is due to the simple fact that auxdev
was introduces, what, 2 years back? My point is, we are introducing new
subsystem, wouldn't it be nice to start it clean?
