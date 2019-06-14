Return-Path: <SRS0=ubJx=UN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95DDC31E4B
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 09:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82A55208CA
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 09:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7LRvmk3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfFNJyX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jun 2019 05:54:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37358 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfFNJyX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jun 2019 05:54:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so1845907wrr.4;
        Fri, 14 Jun 2019 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=LWEB8ckSGavXUOifK/FNIHz754vMT8jwdxRqtMwH6kE=;
        b=G7LRvmk3POU+NfRGqqYuCSJMz3UH106Tx4DzVHDT00eqoT1JMmhdt419m+q4PA4cWA
         GqS1td5Y02NnWmca3NBhGZ5RBdkUD+ftxMiA9ng1vLPGpejuSv9CL3XQd33bCsAaSHNJ
         GKYUb/ViSQxYFVPB3UYyAgTmuWyXk2zxoMZDwM40Xh6np86G664ZmIzHrfKP2ZdGc1/c
         /OeckQtPvyK2glURjFGggu9hCmnZqO5K8PgMK9VwNdO0QevYdQjgZ54kMy/kFwEgnDRJ
         6O95dLwZSw6adB/ygzgxQJ2XGUMzjxktFd5atTerYJWKce7h6hL1A7DcdxzcOwhgPg5U
         8Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=LWEB8ckSGavXUOifK/FNIHz754vMT8jwdxRqtMwH6kE=;
        b=K6/bNTMK4mNrBKks9mzGkMSgyNlw1M5Cq/9F57YfqwSddGbqhRkrU8SfIBiCDPKFks
         Py3XfSzunJJkhIKSvi8sdSaRzmcqDGvag6hQHvImWqvyrgb7g2xF/LW/VPdKSzLbwPLn
         2h1J6UTAdNmEyKjL0GlkHsVJNv23hYv6g8aHHH8CF5zUX08aw9MoHPwcetL3APAbgl81
         p7O5w/zrgcBcXsor+rVFSBdEgyTb5EboVyDKCMXXtzA+UCragisVQ3p9W2XAgKJcjQtS
         /In8DNZbbHLn3dF3jmO6KjTtYNnVzZeFkTVusPu1dZ+kvNMBnDTaEv+kOtW7nq2FvdpP
         3T+A==
X-Gm-Message-State: APjAAAVm19H9GxNZ1zr3IlcCAWkAv6tFq9qTcTViUI6fo+3r7CI5Lbrs
        QTBed0HW3tE1SRa1glZKb50/bzli9Gc=
X-Google-Smtp-Source: APXvYqzB7aNgd0DaRCc0E3obAyX4lpX8BdOe5J7ACbuWSLX34+034VaK+l8Z/815LR4vBxwXv2kD4w==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr62795063wrp.133.1560506061675;
        Fri, 14 Jun 2019 02:54:21 -0700 (PDT)
Received: from X555LD ([2a02:85f:51e:5d00:f1ab:2da6:d378:d0de])
        by smtp.gmail.com with ESMTPSA id h84sm3825923wmf.43.2019.06.14.02.54.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 02:54:21 -0700 (PDT)
Date:   Fri, 14 Jun 2019 12:54:14 +0300
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
Message-Id: <1560506054.1367.0@gmail.com>
In-Reply-To: <5657669.4RvfzeBcXs@phil>
References: <20190605235714.22432-1-papadakospan@gmail.com>
        <3485393.4UdOu2YNQE@phil> <1559821340.1384.0@gmail.com>
        <5657669.4RvfzeBcXs@phil>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> Were you able yet to take a look at the clock-patches I Cc'ed you on
> and look at reworking your patch accrodingly?
> 
> 
> Thanks
> Heiko
> 
My time is limited due to exams, and I have no knowledge on how the clk 
stuff works, but I'll read up when I have the time. The patched you 
CCed me on is certainly helpful in this regard


