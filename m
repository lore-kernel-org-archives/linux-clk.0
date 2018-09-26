Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFD3C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A45C214C5
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q/Qa19Tc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A45C214C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbeIZQLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 12:11:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51890 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbeIZQLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 12:11:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id y25-v6so1591467wmi.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Sep 2018 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=531H7wSqmTGNxBOsJ1X79g+MnPu8zH5Q997nw3eCUec=;
        b=Q/Qa19TcQgb+3/qCu2F9tL0if13jiVmZX5TxzZm/ASCsEb5fH8qQRY3DoEE91wMXhi
         8i3Y2beH0OCN1a2jbSbZwPHAhg7Vzxuv3cCLWNDpb2F0M3q7Bdu5Oy71MFzbdI6+8Ya1
         44Bn+j20S8unmlCugoaGgmNgx2Rbko8b4HlfpP18YTJEACeHvXUeB/POHJMX4hRPdf/D
         24eRZ3+voUBn455Zrb8MXG+AgAjqKl79KyTceM3jT105cwwF/nvHjME9Knfx42auYZ8X
         jnBTXRUvv4iBPKSfNU8XLWuUTLJ80C60l2niHdjHHG5xqP4KD29V6Rh2wbjrGqV9j8a4
         ckTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=531H7wSqmTGNxBOsJ1X79g+MnPu8zH5Q997nw3eCUec=;
        b=fDg9zZEq/UzJCklqT2P7A9CANVIGJ2aBtLPFinYI90avWP/OBBSgjs3rgILOW9S8lo
         FqjfAxs4AW8Dkp5jgDiMj12uSY2JnhZd84VUpy6+StTqO9ttFRimGNf3Ntj9wdHAUhzu
         gRq6cdXXJZIyJV3hYNV337FFti1GIZfi6gJwhlHYPVq1VwTBFSO/sOYq2hxCXQYuvxzn
         Fb6x8CZiZv8c01JZ6CHdkYwtcNCq8DVmIfh81F+qQNyV1ox5hjNhPpLmtyyAaWE7pf4w
         MMYT7tDzVSoj9D3N6cW7Wl6odnMMKzpnOT3Qne14pPsEbasc1ZxFYU0mKwl54Dc+8MHD
         Yktw==
X-Gm-Message-State: ABuFfojIrB4gftT28bd51QarDqUus5eSFxq9drhsNBv1mA5OPXLC7r/W
        P4RSpXRNUe7H/cNOnWL8mfDQYg==
X-Google-Smtp-Source: ACcGV62tv/5rj4VjDkU84zpV935ZPXS0yfcLLxE0DKpOcmwH1WedrLyAHaHFUJ5YO+N9ylnPyWX01g==
X-Received: by 2002:a1c:dc41:: with SMTP id t62-v6mr3842085wmg.137.1537955973902;
        Wed, 26 Sep 2018 02:59:33 -0700 (PDT)
Received: from boomer ([2a00:8c40:243:232:9287:a644:860c:5a1b])
        by smtp.gmail.com with ESMTPSA id l12-v6sm4232127wrv.29.2018.09.26.02.59.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 02:59:33 -0700 (PDT)
Message-ID: <2868cb9dc7536d8c3b94a83ce14694f93643d555.camel@baylibre.com>
Subject: Re: [PATCH 0/2] meson8b: add the CPU_DIV16 clock for the ARM TWD
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        carlo@caione.org, khilman@baylibre.com, sboyd@kernel.org,
        mturquette@baylibre.com, jianxin.pan@amlogic.com
Date:   Wed, 26 Sep 2018 11:59:32 +0200
In-Reply-To: <CAFBinCAxB7MLK_dypQMkKD7=GeFSCN-L47Yoz3PqRssD88bZsw@mail.gmail.com>
References: <20180721172537.15639-1-martin.blumenstingl@googlemail.com>
         <1532337101.26720.89.camel@baylibre.com>
         <CAFBinCAxB7MLK_dypQMkKD7=GeFSCN-L47Yoz3PqRssD88bZsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926095932.9zMRQN7ZApto2Rsv9YUV_0RaUETb56usY_sU9fW2sPU@z>

On Wed, 2018-09-26 at 11:56 +0200, Martin Blumenstingl wrote:
> > Queued for 4.20
> 
> sorry, but I found out that this doesn't work.
> I'm not sure why I assumed that this has to be a CPU_DIV16 clock but
> it's most likely a "divide by 4" (more details below).
> so please feel free to revert this / drop the patches until I have
> more information

Dropped for now, feel free to send it again when things get more clear ;)

