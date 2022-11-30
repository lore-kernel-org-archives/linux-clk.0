Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C2EC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 16:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiK3QYG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 11:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiK3QYG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 11:24:06 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEF943AE2
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 08:24:01 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v8so24804946edi.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 08:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6dECmYVoFeM8QvkxQM+EpP0QXKcCHnjY2XXjno6msVc=;
        b=ATB9MUuPd4tV+cbC2Fo4pGLB7I7ofbtE3dJuSo07zfvZgzgxU9+ZskS1GvcyA6+pDh
         FKQ4YttslVJyjDhFkm0hQSREZtLbFwiUwA27VVMmWT6+7ZmmAy3LF94EcDepNv9tTfQG
         hMoE6PtcsIStYn1OLOvqMXtPW9ggTmg3xBsoEw2grDy5l0PhuHUG3b/LWPON+rfhD3aK
         MVv7ZLNHauQpd8mU/0Pr/egyqLNG5VPnc0eSfHJZYDT7x1ChE2iaKFxxi8SjHrSwXcMl
         rRl5skjM38bFPx8g25zkjWYK7bRbV4P6evHe5x0OmFzyTT/gj1Pd8yFw5IbWG+Sx0hZ+
         j/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dECmYVoFeM8QvkxQM+EpP0QXKcCHnjY2XXjno6msVc=;
        b=5q2z79Nn83igzDBnH4y+rb5uBdpRMSEIC8+k4WdA/NAOMySumQTHjGQoIzxjHO06M4
         3vXHDES8+5r9PdAvhhuuo3F17HLPOfHnjNAozpGpf8IkL3gQxchnd8BiOxhKgEYx3Rga
         tkNBP5dDnyAy0SrPwCd8WwPtJT44rWyHdDABPgNyFtLPeXv25LONQaq33Vn99OPFd4vd
         KV4g5YUqdNCF8HsIxagpteQ8Rby70ryXk+Wn3OS7ePPw01Ktxp1fMHmHxMZ6kAVigqSQ
         cAXBTow14hWqSRxZ3t77WDFvUvB+jqyzv3ugFOIWoHmIQuHWHlTqX9JAf8Nn3YLeAY3g
         daFw==
X-Gm-Message-State: ANoB5pl8RrVSRfORExiz4WHQ3++QA+4NdxlSN4y9Lt8LYWUOKf4XOkUL
        icodqmoC8aFApP8eSCVFIrCPwg==
X-Google-Smtp-Source: AA0mqf4IDgDcF80Na0efP4E3n0kxN0A6261l6BDq1BohioAULXBFnQY0Jyrp8xY87DIKr11dFFFNXw==
X-Received: by 2002:aa7:c60b:0:b0:462:750b:bced with SMTP id h11-20020aa7c60b000000b00462750bbcedmr54855627edq.313.1669825439888;
        Wed, 30 Nov 2022 08:23:59 -0800 (PST)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090623ea00b00782ee6b34f2sm788580ejg.183.2022.11.30.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:23:58 -0800 (PST)
Date:   Wed, 30 Nov 2022 17:23:58 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Vadim Fedorenko <vadfed@fb.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [RFC PATCH v4 2/4] dpll: Add DPLL framework base functions
Message-ID: <Y4eDnrFcv+Issnem@nanopsycho>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
 <20221129213724.10119-3-vfedorenko@novek.ru>
 <Y4d06WPsKwqeYesC@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4d06WPsKwqeYesC@nanopsycho>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Nov 30, 2022 at 04:21:13PM CET, jiri@resnulli.us wrote:
>Tue, Nov 29, 2022 at 10:37:22PM CET, vfedorenko@novek.ru wrote:
>>From: Vadim Fedorenko <vadfed@fb.com>

[...]

>>+struct dpll_device {
>
>Just "dpll" please. Device somehow indicates this is managing device on
>the bus. It is misleading.

Hmm, on a second thought, I think it is okay to have the "device" here.
Please ignore this comment :)
