Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C20C43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 17:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D83672145D
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 17:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR6e5HrK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83672145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbeJBAem (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Oct 2018 20:34:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725740AbeJBAem (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 1 Oct 2018 20:34:42 -0400
Received: from localhost (unknown [104.132.0.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95C22208AE;
        Mon,  1 Oct 2018 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538416546;
        bh=S6bmfBDQJQZOdRcEhoFL5PNyz8nEwJzt/VBSn9JKyqo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=DR6e5HrKYrc3zvvwdo0yV+DQT2CnHCEO6iMIZXfblLCCiAwqJeELBnOlcv8OJymi9
         uz6irnKmap9mklzalXo7OfaJPnk2ln1s3fladl/cfmh78Aem30NoD135Oh1bJqMzaP
         n7EOJIfOrD/mXyTM5d0+UnrrhYxFgsT6rciQriec=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
Message-ID: <153841654593.119890.11490720497943121631@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] clk: meson: updates for v4.20
Date:   Mon, 01 Oct 2018 10:55:45 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2018-09-27 07:45:02)
> Dear clock maintainers,
> =

> Below is a request to pull updates for Amlogic clocks.
> There is not much out of the ordinary there, except:
> - Even if we don't like it, the entire meson8b is now using
>   CLK_OF_DECLARE_DRIVER(). Previously, only the reset controller
>   part used this but it seems there is no way around it (yet) to
>   handle certain things on this SoC, such as the TWD timer.
> - We are a bit late compared to the usual schedule, sorry about that.

No worries. I'm also late this time.

Pulled into clk-next. Thanks.
