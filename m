Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22883C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D96AC217F9
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py5iQJGr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfBEWfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:35:53 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:36046 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbfBEWfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 17:35:53 -0500
Received: by mail-ot1-f54.google.com with SMTP id k98so8741637otk.3
        for <linux-clk@vger.kernel.org>; Tue, 05 Feb 2019 14:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhSzsx5n09KOXy4oehQ6Vp11eApZl8xLa5hJcu+sfC4=;
        b=Py5iQJGrKoFIYbxLiwhLDAoO8X1Yf9UMxsG3o+ZJhllMhKx2cF8mQMy8JBmVJz2EKw
         tEswTia98bmF88HcFS6yWCs4hcNkQx3+L4OsGctb9rR3FaKTQdk+fRMQ5OMppyO1qKBx
         1rykVdkMHtBMdbAfGVAyq4OqQBBghHwhME1SMcgNWi3sDXhjIYAvIWHS2B/WDcN9QQKh
         Z8PX9hhL8tp6z9nxafMjINF47Tg3bwyZMyDl6LzOHCB/fIT9ZkO8kTMPtTYBF0UrZ+xy
         aU1U2lr896MREuTBYAkfHQi//bd5qcFexQr2Q+9p2oqciqIrRPSRKByIniN2ACKqvJ61
         YEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhSzsx5n09KOXy4oehQ6Vp11eApZl8xLa5hJcu+sfC4=;
        b=MO52iqCD6FjXWD00oIVxUc2Vyn/trMejOlg8vjp6jwTnaDpQwaFxC6eTT/PjvWskV0
         q9mmeSzzaeJt27cUMDWGomGjB2PXO++VwTLwP3mb1KaFblZsym+aMxrJCzodFlowO+PU
         tMKVlGfpp3EdFkDECd/e/E2fl73gSd2Z+t844iCKJcokJrW/5M58LIZkWSuD6Vlb9iMx
         z4ktA5Mlunl+NGt6zVDpKEOpriucow9pkZ+He1/DusOmLS3MnrzQ0O8WWEpoV7OhJImI
         SrNOpwgMlowaJQRTlHbJ9vH1Blm/vwGQE5ZSmUUjtZZ/Yufs0JD5aDzKvwFEB5hJ67pJ
         xjrw==
X-Gm-Message-State: AHQUAuY13LVGIXm4Q0TBjlDkM3Y04ezeGX1Zy1LsCEqfG7Xw1JPNEUuB
        xzUPVhLRP+b4ZKupuOVz6rXDW0LRgXpUzOnKngQ=
X-Google-Smtp-Source: AHgI3IYPYFWXmrqYQlXm5eJvOOgD/Uko56pk1fZuXQXWTKPY4zaojPIkfro6kv/kumGR6l+A1GhJHRNYtYmXBe4KlLk=
X-Received: by 2002:a9d:aa9:: with SMTP id 38mr4160232otq.255.1549406152604;
 Tue, 05 Feb 2019 14:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20190130192102.7065-1-festevam@gmail.com> <154940574088.169292.15304825462770873584@swboyd.mtv.corp.google.com>
In-Reply-To: <154940574088.169292.15304825462770873584@swboyd.mtv.corp.google.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Feb 2019 20:35:49 -0200
Message-ID: <CAOMZO5BYr_JXZ-ibb5JBvVtF0=Y-cz+qNsPHd0i-kkrC9Ok4ag@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rogerio Pimentel <rogerio.silva@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Tue, Feb 5, 2019 at 8:29 PM Stephen Boyd <sboyd@kernel.org> wrote:

> Do I need to fast track this into v5.0 final? Or this is a non-critical
> fix for something that isn't used right now?

This is a non-critical fix and it can wait until v5.1.

Thanks
