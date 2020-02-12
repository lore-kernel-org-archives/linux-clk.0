Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF79C352A4
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A92B21569
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="etSOx2QQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgBLXEk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 18:04:40 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:36347 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbgBLXEk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Feb 2020 18:04:40 -0500
Received: by mail-pj1-f53.google.com with SMTP id gv17so1529412pjb.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2020 15:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PhL4y2Ns/NFToQF8DJTrK0HgwaVtHS/iKBzX00SobGg=;
        b=etSOx2QQEAZg4TSjUxAks7fbX9BcsRkiVRRMYr6FIwMR3psVVZ5yLkRbRsEvo+digw
         xIvPLGAyoOVYrzyaTe6ptofGbcLLTD8Tqobl/9QXZJhfW6O2F2FEKHl1Pwa0mrPViUMW
         YdFchCgHQPcm64dUWuclWZGdJc2pBos0E7WUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PhL4y2Ns/NFToQF8DJTrK0HgwaVtHS/iKBzX00SobGg=;
        b=pyvrOl+cmmunEQjNu2M3eN9ltswqI4DQdtLDwGNgMXHPWWcJAJ8JDSGWvVmYUKJgVi
         JVz8VYAX7G7o3OfjxmwD+mIa8AyRb1AFU7Y5Kw77AZ2rvUYHyn2VP0/rXmpUPFR84P14
         ANha31yQxNEEMPlZHF+TtPbeMhCYyhzvyOThPsfhyhfcMMUMHovHHWaBOsAQQ8jN3OG8
         G/TXmmB80Yi3894GoXZlaukivH8OKcJaPX/uuZSCQLoUoVLg91/iWS0GZFYQH+eRtzIA
         WC+pnmu7/CrIfPIh+b3Pu3f159DDX9lvrdLSL/V6iaCe34OxVwMdDIfXtJx8kmJC1Yh8
         pLTg==
X-Gm-Message-State: APjAAAUrH794BEAKC7zwaPu2xV+xs2ugKZSHWON8LCZulQyeseBgDYyI
        OrEr1au4ZIxXK2hHv/1cGdUrRA==
X-Google-Smtp-Source: APXvYqzxgU+5yuNF5Rv0HXS9zL8x4pILgTjsHg6W5JxhCX4rgS04HgMQN0+uAntRPS6fbBe1asYfFA==
X-Received: by 2002:a17:902:59cd:: with SMTP id d13mr10720820plj.146.1581548679950;
        Wed, 12 Feb 2020 15:04:39 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v5sm191562pgc.11.2020.02.12.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 15:04:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200205065421.9426-1-swboyd@chromium.org>
References: <20200205065421.9426-1-swboyd@chromium.org>
Subject: Re: [PATCH] clk: qcom: alpha-pll: Make error prints more informative
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 12 Feb 2020 15:04:38 -0800
Message-ID: <158154867848.184098.3370579513642470683@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2020-02-04 22:54:21)
> I recently ran across this printk error message spewing in my logs
>=20
>  Call set rate on the PLL with rounded rates!
>=20
> and I had no idea what clk that was or what rate was failing to round
> properly. Make the printk more informative by telling us what went wrong
> and also add the name of the clk that's failing to change rate.
> Furthermore, update the other printks in this file with the clk name
> each time so we know what clk we're talking about.
>=20
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next
