Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BBFC4167B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 09:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLIJcP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 04:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiLIJcO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 04:32:14 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8932C55A96
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 01:32:12 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so2978481wms.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 01:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOKcVGBSvpXJ6YqenDZ2Uv1WoT76b2s0yqDW6w0BsO8=;
        b=DHYdOHLm6p9L2O954UlvN9QikxB4zWgLTFbie1Vp4Cm2t3ARmZ6gSO1YzSMjKFfl2P
         l73rAykFaSDueP7jDxvAZzgFJ50wrLCC5GiowFWgIuhSiXDXuuJgo2/D7c70NuENd4+g
         q1HKRWN9W5WQLzF6AII9iHWEsOV4m7G+QL2ScfNU/zOFAusuHobKrhrxV7IZ0RYg5Ia3
         zusR+eSk+O5QxmXmYJi+cws/qPqI+KMGBU5sF96SKCPZlYVpfaxq2QRQHeEILM70oQSS
         +LHBmHc5Qlb55fJVFWvMy29TxkObOoxsSr60UoeLHWPzGqh9z+i1WeWSBJq783qtp5cV
         Z7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOKcVGBSvpXJ6YqenDZ2Uv1WoT76b2s0yqDW6w0BsO8=;
        b=bYGddAfltMpmSzB1q/XklbsMnurOuiLdATu4RVUFbUFFI8NUGthoaQWD+PrNJpcjn4
         0YfoLVQZuGsKE3zRraGwfiE3iJFVbQTISOn4nQs80EXKtapkeujlmBSUuIZQ9t7/Y8hF
         zpATVA7GWbFgRPf+3Iaacrao3cKVQiHTkdlplwzDLbS0l0ogwndl1kh/zUItPYwzoAvV
         MSClHXKjl6d2vTLlDR51pNe2yWSRaspJo8J+6w55/NmBxN8KZS3aEzG9ZtXVMrq3ED8X
         O3Yj5gw9rtnT/DdYxR9lkLeTRcLjMfsE3YwKu382TR3tYI+u1r2hHB9uVDRV3ZtT3o5J
         DW1Q==
X-Gm-Message-State: ANoB5plK78I+r2Yjp5eCKbVukwtZk9SVTthOUpZuTjmvuiu8AJgxzsyd
        JOJdXMQA8A305wFS1H0SaZAdVQ==
X-Google-Smtp-Source: AA0mqf7Sq5TRJX6nneA7N1IKgKs6qceML2JTgAv9r3uiFrFyir34vvSD8fh0CFvMpunSBzjxOWinpw==
X-Received: by 2002:a05:600c:3512:b0:3d1:fcb4:4074 with SMTP id h18-20020a05600c351200b003d1fcb44074mr4969407wmq.22.1670578331160;
        Fri, 09 Dec 2022 01:32:11 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k32-20020a05600c1ca000b003b4ff30e566sm15214766wms.3.2022.12.09.01.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 01:32:10 -0800 (PST)
Date:   Fri, 9 Dec 2022 10:32:09 +0100
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
Message-ID: <Y5MAmQW+xvxdxjey@nanopsycho>
References: <20221129213724.10119-5-vfedorenko@novek.ru>
 <Y4dPaHx1kT3A80n/@nanopsycho>
 <DM6PR11MB4657D9753412AD9DEE7FAB7D9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y4n0H9BbzaX5pCpQ@nanopsycho>
 <DM6PR11MB465721310114ECA13F556E8A9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
 <20221206183313.713656f8@kernel.org>
 <Y5CS2lO8WaoPmMbq@nanopsycho>
 <20221207090524.3f562eeb@kernel.org>
 <Y5HI4deFBTvDFIGB@nanopsycho>
 <20221208163634.707c6e07@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208163634.707c6e07@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Dec 09, 2022 at 01:36:34AM CET, kuba@kernel.org wrote:
>On Thu, 8 Dec 2022 12:22:09 +0100 Jiri Pirko wrote:
>> >To what practical benefit? Where do we draw the line? Do you want
>> >PTP clocks to also be auxdevs? DPLL lives in netdev, we don't have
>> >to complicate things. auxdev is a Conway's law solution.  
>> 
>> Auxdev infra is quite simple to implement, I'm not sure what do you mean
>> by complicating thing here.
>
>You didn't answer my question - what's the benefit?
>We're not faced with A or B choice. We have a A or nothing choice.
>Doing nothing is easy.
>
>> >mlx5 already looks like sausage meat, it's already minced so you can
>> >fit it there quite easily, but don't force it on non-enterprise devices.  
>> 
>> Not forcing, just suggesting. It's a low-hanging fruit, why not reach
>> it?
>
>What is the fruit?
>
>> >There is non 1:1 relationship with a bus device and subsystem in Linux,
>> >LMK when you convinced Greg otherwise.  
>> 
>> Sure there is not. But maybe that is due to the simple fact that auxdev
>> was introduces, what, 2 years back? My point is, we are introducing new
>> subsystem, wouldn't it be nice to start it clean?
>
>Still not getting what you think is clean.. Making all driver-facing
>objects in the kernel be a fake bus-device?!

Nevermind.
