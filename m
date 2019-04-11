Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE328C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 15:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC8092173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 15:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yN0/QqWe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfDKPR6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 11:17:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41436 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfDKPR5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 11:17:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so7851382wrq.8
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/HPTyhpTZZCMQQkRclscxanz2gE7w747HH5mlULbwww=;
        b=yN0/QqWeJt+slmF371F5HdeAuu9fGHHex6im5bxktcHl8m+zmlb57h52FUAiutOFIB
         Bn4Tp/yBu4YqMzrIOGWCVd06VtrvaKt7r/+P05vqq5K9jFDPKW81MPQS4cQcKJd7IZCq
         tUMs8UMv/b5Lw4lqFshe2uRVs4LTznrWjVPHr7G3YGlCcHwoWJGjT5rs3DSEPibvNOwd
         xihG2TkjEPvh3Bm+Sg5ZHxOxcDbuLQ0DwpXQOxMkgz1MgD/odT581OsGONJChTXJH26Z
         2kAAZD/r09BnyKbaVXXU5qarfFUNIPJE8GkUfv/ZiGTzwCkz7r4NtLSaDB47/FWfvnpu
         x3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/HPTyhpTZZCMQQkRclscxanz2gE7w747HH5mlULbwww=;
        b=PtcJhyn69HDdu4XJtraoG9oRfWAQ+5mpC9afOGOYFE4mGaJccsdIEgRxYrEBzxt5Uf
         y+EKkgiARUHbEknshCzAfr5gEFMDRLWMGZBIqTvr4fhlIfDz762+nppdLHsvoK3ZL4jA
         U9b2no9tLaTbBQfMMOlR1qm4EHa8Dr/ss9D5fFmI0nq948FtJpqYSda4Z7XN/Mrmnsev
         pjQZODsxn0xIM6qa/KbOaaMBgY/POpU/Wu/xc9WIItxOCGhfERwB+VBevX8pSCvnqrHk
         XZAhaOiMA6fORXhILZlulJpxlakHKLhrT192FafNKYSx/z/uqq458DhHdcy87EZSsxii
         lq4Q==
X-Gm-Message-State: APjAAAVRO6Xw/E+Gxfh/QeOyCxfh6YD6cGzPMZcGdP+boFYVTtZXo5+G
        OLls/jts9FvvW5319nzeDa3UNA==
X-Google-Smtp-Source: APXvYqxVbbpkE4iOg3B0fFO8Fh+S5yDFJmiW0seu6Z68ScGcYj/4Go6icoV2z4TLySMDWApKYVVskQ==
X-Received: by 2002:adf:afd7:: with SMTP id y23mr30565080wrd.254.1554995876158;
        Thu, 11 Apr 2019 08:17:56 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id b9sm9177978wmc.9.2019.04.11.08.17.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Apr 2019 08:17:55 -0700 (PDT)
Message-ID: <e5a67b62d6cecc456633a4017f321807894aea3d.camel@baylibre.com>
Subject: Re: [PATCH stable 5.0] Revert "clk: meson: clean-up clock
 registration"
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Sasha Levin <sashal@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     stable@vger.kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Thu, 11 Apr 2019 17:17:53 +0200
In-Reply-To: <20190411144043.GL11568@sasha-vm>
References: <20190411101132.5513-1-narmstrong@baylibre.com>
         <20190411144043.GL11568@sasha-vm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2019-04-11 at 10:40 -0400, Sasha Levin wrote:
> On Thu, Apr 11, 2019 at 12:11:32PM +0200, Neil Armstrong wrote:
> > This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.
> > 
> > This patch was not initially a fix and is dependent on other
> > changes which are not fixes eithers.
> > 
> > With this change, multiple Amlogic based boards fails to boot,
> > as reported by kernelci.
> 
> I've queued this and the 4.19 one, thanks and sorry for the breakage.

We thought it would be harmless when it was proposed, so guess this one is on
us ;)

Thanks for maintaining stable !!
Cheers

> 
> --
> Thanks,
> Sasha


