Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C432C77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 21:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjEQVGL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 17:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjEQVGH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 17:06:07 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206E17DA4
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 14:06:02 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ae65e44536so295855ad.0
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 14:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684357561; x=1686949561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqFXYd9rNq05jqE+OMCTpUFM3DmoW2ueyhDNCFXpm8M=;
        b=THdBU5Ib8gbAy2/3Y991wevBJmGC4A4UXz/Zt81XYqMks32DOHBX41c1Fp1jKHs/fR
         t2eu5Yo6ZqNMRH6wojhD2x1ZbwNhNBB5RNORXM941lIjMk8yyn5oQgEAylbhkhK/JqBr
         iqfwzzODNzaVUVF5XJRIHY/nlIbgsoSCU5h1s3wILD4+qOi8dnAU0D17wV1fLtoAN4fO
         5Wp6Xkls2cjVbLEGM/9G+sz8Q+3syTvNO6eJQ5DrHLgt0T9sf0+TGeTB4MxEK86EaCme
         LrM37X5njTJUhTTjZdkphTo95JmPfeHPjK1TBiuUfOaoTXOeI9InyJvJAkFdA4ulr5Hp
         QweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357561; x=1686949561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqFXYd9rNq05jqE+OMCTpUFM3DmoW2ueyhDNCFXpm8M=;
        b=i0jxICJ9TNRjGpFZ540bhaFmfQ1dbAtmCQKa/rFAjIeKSbQ+7u+zsEpW0F6bFg1W4F
         XQlgMZZ6xuZHPkeg+QL+JfWyP7dt2EiEV3+D5GaSKEqjFoI3CGx9uVPyPXAnbec/vYIf
         KLymGqi7UWBisWEJ66vx/gGFcqwNhB+wXwYuVn1vJ1mxraD8ZFgwISzHHW4X2not8cgg
         uvBa+RgljZJOqYN+pphEP0XsgbYrR6bFC0DtsdkRsHLOXuIcn0iDa5BairJh/nUPhyC/
         N7yPr3AyxTS4/rcv/TJ36ZPT8AePQYvMW8hE4Tzzzybl3VQPEXPRK0a+C3NVBVsau1oO
         HSzQ==
X-Gm-Message-State: AC+VfDxmwLnHqVpJIEMIsFPGK0vRbM5Pogk91heAqU+UwlcyFs7Xmz0l
        WasafMq6Q1LJtiS4Bvw3715K17ebIHRE2QaEtiff1OHp
X-Google-Smtp-Source: ACHHUZ7nuFHJajJvBkmUdRtWfHJoFLNNBID89m3iz79dqyCn7vUx6QtLSTNzq5KIemwSCK3shDdEqt2k0KMAWHWWAFk=
X-Received: by 2002:a17:902:d50e:b0:1ad:e3a8:3c4 with SMTP id
 b14-20020a170902d50e00b001ade3a803c4mr4974239plg.4.1684357561077; Wed, 17 May
 2023 14:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230416150004.16834-1-festevam@gmail.com>
In-Reply-To: <20230416150004.16834-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 17 May 2023 18:05:49 -0300
Message-ID: <CAOMZO5AJBcQxHKWtNjtFUbo8_Mb3ECBY0KePCsJmROKGEVqaNg@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the LDB clocks
To:     abelvesa@kernel.org
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Apr 16, 2023 at 12:00=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> On the i.MX6SX, it is common to use the LDB and LCDIF with the same
> parent clock, such as the IMX6SX_CLK_PLL5_VIDEO_DIV, for example.
>
> Due to the CLK_SET_RATE_PARENT flag, the LDB clock would try to set the
> clock parent rate, which can mess with the required clock rate calculated
> from the eLCDIF driver.
>
> To prevent this problem, remove the CLK_SET_RATE_PARENT flag from the
> LDB clocks, so that a correct clock relationship can be achieved.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

A gentle ping.
