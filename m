Return-Path: <SRS0=aKI2=4P=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E17AC11D3D
	for <linux-clk@archiver.kernel.org>; Thu, 27 Feb 2020 15:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E82A72469F
	for <linux-clk@archiver.kernel.org>; Thu, 27 Feb 2020 15:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pi6014v0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgB0PdX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:33:23 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:42497 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgB0PdX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Feb 2020 10:33:23 -0500
Received: by mail-wr1-f52.google.com with SMTP id p18so3886223wre.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2020 07:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PlJh7KwKwoF0roUHWyMbx5bXkeNuxqQ6kJ4bjrWS/zk=;
        b=pi6014v0Go8GE5haEJVnBIFl5daGsjiqZ0iAuCENHOjFCGR13ufCGyRIqLA6+tf/45
         24xnGbYiWqrzaVZIaqqd75LzkVauRnrtIIbQ7l/yadmGgDddEm3VfYQYlFU4cEKPM0iJ
         m/ecL8ESWrXhYvfGDtJHqyB9zurXebzNiI1kNy58nUkHqsGZXXYo+OAWQxwz+NDNtQwH
         FClSBK2noFpnRguJvgXLDUBhPfm90chb6YtRW+1YEPL6Es40lGD+Etct6cFWxVwEHf6c
         01fdiTEulkhYOQfKLZdReRRmwpbOfxmsrpuxhVx17SMUsbyxionm+Q9Py9U2m4EAVr96
         m+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PlJh7KwKwoF0roUHWyMbx5bXkeNuxqQ6kJ4bjrWS/zk=;
        b=RJEPmxtB/S9/0eYTYyg8lnrj4LorRhPCWBckafv9c5e0qGbJKh4yK4DAHPS+d8TV8D
         8NE1y/dfuoa/bgAawgV2HJOtMT1UAbJWwufLTdVr2rNYnu01L1pehP9/xAQad0BrlWtn
         bU2c4uBa8ufh3S0675cS8li2JxwaA15LiHQ3J14tTmDuYm+3mV98AXhJf0/dj57FKPat
         djCXKlryzwCY3/U5a3O9Cii93qHMtg1uXERC7Wv0zeBLfh8K/nL4rS6NXCm/Wn0OiFg4
         NeNcE/4+lOicQYZWg/ock24Op9WKh4Pw4rtxdnIkuQebAsu08kyqdgWY+sTMkxVayeK2
         hfjg==
X-Gm-Message-State: APjAAAUjG/Z6k52PCdA5Pk3T0jWcXmqnCzR40DMUVs29GDMz2sbjc2nh
        VwmPCvyPlgpo8xBFRWYuFfR9pLX1pwhVVA==
X-Google-Smtp-Source: APXvYqxXLkSUtpO/z197s3b7m3PoVu3Ro0Ve0lrD4EFasmcfhXnfbinA5eQ0Kmtn9ANbx21whjfZQQ==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr5813925wrn.292.1582817601414;
        Thu, 27 Feb 2020 07:33:21 -0800 (PST)
Received: from localhost (dslb-002-207-138-002.002.207.pools.vodafone-ip.de. [2.207.138.2])
        by smtp.gmail.com with ESMTPSA id n13sm8435089wmd.21.2020.02.27.07.33.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 07:33:20 -0800 (PST)
Date:   Thu, 27 Feb 2020 16:31:10 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     aisheng.dong@nxp.com, anson.huang@nxp.com
Cc:     festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        s.hauer@pengutronix.de, mturquette@baylibre.com,
        leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: RFC: imx8qm: imx-scu-clk: probe of clk failed
Message-ID: <20200227153110.GD16310@optiplex>
References: <20200227125743.GC16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227125743.GC16310@optiplex>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/02/20, Oliver Graute wrote:
> Hello Aisheng,
> Hello Anson,
> 
> I get the following imx-scu errors when using Linux version
> 5.6.0-rc1-next-20200214 with scfw Build 3353, Commit 494c97f3
> 
> It seems that important clocks are off somehow and that lpspi isn't
> working because of that. What is the best way to debug such issues?
> 
> [    1.103799] imx-scu scu: NXP i.MX SCU Initialized
> [    1.111383] a35_clk: failed to get clock rate -22

After some deeper digging I saw that the reason for "a35_clk: failed" is
an IMX_SC_ERR_PARM = 3. Because he trys to get the resource SC_R_A35
which is only available on imx8qxp and not on imx8qm. No clue why he try
that instead of SC_R_A53.

Best regards,

Oliver
