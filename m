Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA9DC43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 07:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbiF1Hol (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 03:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbiF1Hok (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 03:44:40 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB13CEC
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 00:44:39 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u12so23903319eja.8
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zq/zoDCA8jkbMwKNAy9bJTFRAP6pi+CqTQmV/4VW5cc=;
        b=J6+R+ZJxZ5WMZYC1Xz+JD8N6ys6rItHjA2OxOgR0MWp6JEf4xmtZzktEXeYeJZRCja
         SGtyOHZow2Q+8RuefZrs+GcbyX/63XIWJvpQ3Ox1bqrK/ia/CQTRTr9XSLCvvHBAKmQ/
         SjKV3a/PnxrUtFxz6mtBZ6ePo1iiMIvKHdYDRWN19JxSW317zlhFIJpytoA9e7Goh2Ql
         gaWuLz422fP7uYIpTH0waHhaC6vLTUGRQlmJVAdmf5cfkVi9O155ullX+GBfUzTBnMdt
         YSFw358TrDEOglU1lwxOH7Ygl4lQWD6lTK9Q90v+o8NDK9VTXu/V/HgF8J6y0B/8zO31
         k1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zq/zoDCA8jkbMwKNAy9bJTFRAP6pi+CqTQmV/4VW5cc=;
        b=eZ0JUNL268m0ErYQb8BAQo1d5TQAFcvVtka+l1f9m7kkZmqmdPH2QHEbu2po65ZRQN
         R+5q/Xp/oLynRY/jZklglS+sD2cdwMjMoKZtyuoB5h45/Eebood7Ai+VpzdMAGxabUIz
         1zG7zB1h+gMMyRKwAKX79XxMWRt6o0oTfYjqgPZA/iUYo4+BbHO+3QqNbZsTkJkEvNna
         1PtC9NmF+eW4l0LXeaiQay23KX1x/bTphDNT/dCN8yCThrkysDNKuMYwIW/ZVpAlEte/
         3v0FbphggtIX61h4wqdqxd81kUvTzAoNAD9C3s/2MeQRbXMghfZHew73KgmFmBBU1zLL
         vHrQ==
X-Gm-Message-State: AJIora/Vdw8fwlzE7kkoAdYVZ9Y3HI9ZdiOdhzKUzuE+Mp46aJmrh3Aj
        8CRH2rsHMnqw7FOtbx2VxMfwNA==
X-Google-Smtp-Source: AGRyM1sUvGNp42m0EoMOT8UjF+RNhH6apZ5uKxebl0YaN1Sz3iljjkB484+h/YCeAv09qo8cHorM7w==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id nd20-20020a170907629400b006e10ea474a3mr16885978ejc.168.1656402278305;
        Tue, 28 Jun 2022 00:44:38 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7ce14000000b00435d4179bbdsm9161123edv.4.2022.06.28.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 00:44:37 -0700 (PDT)
Date:   Tue, 28 Jun 2022 10:44:36 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Message-ID: <YrqxZFvKen7QybA9@linaro.org>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-27 18:23:33, Marek Vasut wrote:
> On 6/27/22 17:35, Abel Vesa wrote:
> > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> > > series of clock gates and muxes. Model it as a large static table of
> > > gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> > > SAI PLL has to be registered separately.
> > >
> >
> > Again, there is a chance that the blk-ctrl driver might disable the PD
> > from under this.
>
> Can you elaborate a bit more on this ? How/why do you think so ?

At some point, the PDs from the Audiomix IP block will be added to the
drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with the
same address range and the imx8mp-blk-ctrl also has runtime PM enabled.

My worry here is the possibility of imx8mp-blk-ctrl audiomix (when that
will be added) will mess with the PD leaving your clock provider driver
hanging.
