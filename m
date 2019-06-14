Return-Path: <SRS0=ubJx=UN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250E9C31E4B
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 19:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8DA0217D6
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 19:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7NvstzZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfFNTrM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jun 2019 15:47:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33107 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNTrM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jun 2019 15:47:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so140408wme.0;
        Fri, 14 Jun 2019 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=w7hWwTYJqqdtzNOgI2SlOoDpVDK4IVNaEZYhxTxW1ms=;
        b=E7NvstzZwUvIUkg8f3C5Owi9vBiTS+92/z/pEcuqA6hibXdSEb2sDw6Dn53Jj3fVrZ
         9K8Fp+1yWBowk4sbqNrKo/vC0yR//ZOlgCMTv09SH1iYKSr19Ea01b0EZu+tIflSlf8n
         KgT8Dk1suYc5/O0WG+rjESkWTjh0N6eJPOEGD90G5Ry9UzbHCMwkmFZ5W8MTIXcacMzE
         ZAorz2dWJpYNBIqNV/uTnimyE7hot3tGiDdpaaWoouPoCOju6iP1CMUMpFzOQnxi5oN7
         tyCTvUWST16V1kTGb+k4uY/SPK9bFqGJujeR6sWOZcicH0dtS1Iw2Nr5inoQOE0kjz4b
         0Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=w7hWwTYJqqdtzNOgI2SlOoDpVDK4IVNaEZYhxTxW1ms=;
        b=CiO0JaX1Wk2xsJBPInqjvfthAmzTSQ2P8+SagfZd5QrgJ6/U0u1tMswfyGv36I2qc+
         LqVA+TsHvktR3zVipd71gAFfmT7JMAhiMseWPKO0CR12u3xu5a7cLnO6Cs3HopJG2RT1
         ojbuA7x/CkkFkj2B3vNjulDFFdGroc42qhN/UfKlnFJGvfupzdYdBy+0AtkULFDaiPcj
         9ivzEQdECZUC1nPg5SoUx+CMKaYGc/vDFJj2S4l9SQJH0l9KHweC0VamxePTHn7D+Cha
         TzGbQqW++e98ayTj9iuqTEKzenAG1yJD12hu0oRmWYarwdQMQUh1Jgax2H/LGj7D3v8C
         egPg==
X-Gm-Message-State: APjAAAWSFc2GwT7WplcTpVUzoKlkUUwzSizKTH4RhcW+3UnF/QEhDjEP
        6kxwTtxnzTCFoU6DdyZhx18=
X-Google-Smtp-Source: APXvYqw+/lotMGB1kmoHtHxy2mEXLLxX8UP1pU2bI/ymsVBaIhukGMPveKI+vAdOPbMWJLLKawenZg==
X-Received: by 2002:a1c:3d41:: with SMTP id k62mr8215153wma.61.1560541630216;
        Fri, 14 Jun 2019 12:47:10 -0700 (PDT)
Received: from X555LD ([2a02:85f:51e:5d00:f1ab:2da6:d378:d0de])
        by smtp.gmail.com with ESMTPSA id 139sm4385668wmb.19.2019.06.14.12.47.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:47:09 -0700 (PDT)
Date:   Fri, 14 Jun 2019 22:47:06 +0300
From:   "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on
 rk3328
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     itdaniher@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Message-Id: <1560541626.1367.2@gmail.com>
In-Reply-To: <2207770.HSO279VB62@phil>
References: <20190605235714.22432-1-papadakospan@gmail.com>
        <5657669.4RvfzeBcXs@phil> <1560506054.1367.0@gmail.com>
        <2207770.HSO279VB62@phil>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


ok. I have tested the conversion on the platforms I did convert there,
> so I'll just apply the 2 patches later on.
> 
> Should I wait on you respinning the rk3328 watchdog patch, or just
> add the rk3328 watchdog pclk myself?
> 
> 
> Heiko
> 

Would be awesome if you added it yourself. You seem to understand this 
a lot better.

Also, I checked out the patch you CCed me on and I'm happy to see that 
the reused code has been replaced with a single unified macro. So much 
tidier.

As far as I understand then, it's a case of adding the pclk id, the 
sgrf thing and enable it in the dts. Cool!
Hoping to see it in 5.3


