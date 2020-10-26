Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1564C4363A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 16:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86A2F24641
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 16:11:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aelHvFZ7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1785094AbgJZQLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:11:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37664 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1785087AbgJZQLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Oct 2020 12:11:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id c16so13071409wmd.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2020 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=MrGekxdAPW7pCql7h2Tv9omsiLJVrXPqKjbDYUjsVnA=;
        b=aelHvFZ7VVoaw66b/eTLcw4NHujLV695zzPkcCEpslJ4CI5ITS6vQRjIAN4sm5h9LB
         d10q/bjwym5UJov3m8CGeWzzCl8f4Didlm5LECv+ucmsz85lSdD3UC5JJVUWBphTWCYe
         vI2SbXAmqTzZF4t4nxS5uWOMlhpZIpP1EZScernN5WsxN4J4MLnzITdjcHPKyGmhopq0
         XjGEpfU6kegq+H8XTOhN9UVU1DUfoa1DWrpZ7GTbPMp8iD6s8OSLDoTqtrkKxuy6WCiA
         woL6ZF4W8K7yV//EyLospwQj9LwbTSynxgbXd6MjAOst7ImQwE8e4C+NjdfY7buKJBUm
         991Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=MrGekxdAPW7pCql7h2Tv9omsiLJVrXPqKjbDYUjsVnA=;
        b=T5XKL2O3HL8SlahdzpiNW920fFy1yqD+B0Ou6QJDI0IzgumV2GXiLUzJrTufQfIoos
         rQwedO/2ABQPGFIho7TwXA6Cv845w4d771xZZXUsUM+GrxmZHWP12Ru79j1Pj3gyHbDQ
         QBYA1hDIAgjQsDFyaSob/pW7AJZhxijfEx40j8T69r3LLRSIYzst/ACwRfdt36IWrCuQ
         4lb+dnOyou1SwOGW81VzsBkK93VgOV3Aoyoq8Xz+KGCMMJthLpA8lSY+jx0XYUkMchPS
         rTGeD9i7J8gsTUbisRFlrl0CnOVjIY21tjRykoRCwINT8cb/Fy9Oss9dS/O+1XmYEN+1
         buGg==
X-Gm-Message-State: AOAM533E0J0N49WhCRgdcGTkmQZyjH8bsV9+oci4BX/m7RAz1TEcS+Ft
        iPEIukLVxD8es3vHzCes8Vt/cA==
X-Google-Smtp-Source: ABdhPJzXeKf52x+EglQ1SghEou/lfwa539rkLDDRWOkVklRdCre8gRDAcrgh2xpkYdkN5qhbfxywHQ==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr12411658wmf.104.1603728706221;
        Mon, 26 Oct 2020 09:11:46 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r128sm22825689wma.20.2020.10.26.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 09:11:44 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: add api to get clk consumer from clk_hw
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
Date:   Mon, 26 Oct 2020 09:11:42 -0700
Message-ID: <7hk0vdhsqp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset a call in CCF to get "struct clk*" from "struct clk_hw*"
>
> Changes since v1: [0]
> * Add a con_id string to help keep track of the consumer
> * Add devm variant:
>  - Following our discussion on V1, I choose to have the dev as
>    argument as most devm function do. However, as Stephen pointed out
>    we don't expect this to differ from the one linked to clk_hw. In
>    this case a warning is thrown.
> * Add a first usage of this in the amlogic clock driver.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested this on a couple g12a based platforms.  This series also allows
me to build the g12 clock drivers as modules.

Kevin
