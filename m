Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0DDC0018C
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 19:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA8AE238E2
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 19:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgLGTDA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 14:03:00 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35201 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgLGTC7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2020 14:02:59 -0500
Received: by mail-oi1-f194.google.com with SMTP id s2so7101893oij.2;
        Mon, 07 Dec 2020 11:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HY0hN7EFmwAeOpekASH1D+eW1UviLPnBJxGZclXefu0=;
        b=jhs7ja41n/gDXd8s+PFaKKnCRAhQHH9Zyy9oIyDLk61qmXVXp++RnqMi7wi86m7QN7
         r3m0350AeQHhkBVbm02BPc2zuSDj1zVLjFbkHdPM/dtVYavUD7On+7bKnDrUjrHV5p3M
         6VD5Ao9DUFpPWRhaqJYILkSSZbblJTmcSmrQIWuXL1bgHQFxB2PHOAyaOMnegJ1g02Ec
         2GaAYno8ryRXNTELn1t3KaKr4LU6XuWqJx2bcq0RisyVGVfW2GfdLIj9esMjqjPnhmel
         KVTVPT2vAeY9xePMITOS6oB3gYaKTSZlHvxQikaBVZ2Rc60Om+fLK+IyhXZIqfOh7kWR
         XANQ==
X-Gm-Message-State: AOAM532/vXXUDWL/bW7hh3Ng+nTmPrX08YcJf/6n738eRehoQRRQlGrh
        R0BincuPXV34CF+id/phqyz2fF0lFw==
X-Google-Smtp-Source: ABdhPJzwSPMRrQKLv11ZINQGdwR6C69RDQ4j3GgSogCMZ11o/iijHddVfVmozpAzu46Xr3kRdgGsEw==
X-Received: by 2002:aca:fc96:: with SMTP id a144mr217689oii.146.1607367732978;
        Mon, 07 Dec 2020 11:02:12 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 73sm2822461otv.26.2020.12.07.11.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:02:11 -0800 (PST)
Received: (nullmailer pid 626990 invoked by uid 1000);
        Mon, 07 Dec 2020 19:02:10 -0000
Date:   Mon, 7 Dec 2020 13:02:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linux-kernel@vger.kernel.org, w@1wt.eu,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clk: mstar msc313 mpll binding header
Message-ID: <20201207190210.GA626827@robh.at.kernel.org>
References: <20201114135044.724385-1-daniel@0x0f.com>
 <20201114135044.724385-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114135044.724385-2-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 14 Nov 2020 22:50:39 +0900, Daniel Palmer wrote:
> Simple header to document the relationship between the MPLL outputs
> and which divider they come from.
> 
> Output 0 is missing because it should not be consumed.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  MAINTAINERS                                   |  1 +
>  include/dt-bindings/clock/mstar-msc313-mpll.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mstar-msc313-mpll.h
> 

Acked-by: Rob Herring <robh@kernel.org>
