Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82929C43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 22:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 499122146D
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 22:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxsGDQ9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499122146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbeJBFEQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Oct 2018 01:04:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbeJBFEQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Oct 2018 01:04:16 -0400
Received: from localhost (unknown [104.132.0.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D30272089A;
        Mon,  1 Oct 2018 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538432656;
        bh=jaKuze6p7RtHvubPW0GFfMfL1tb6urRBrUekqWv6QD8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=mxsGDQ9Ii8rrjFP69t8Kl+Ml9eLzIGj+Z/+rjAxFgtlEJ7UOsFcr2u1eMXfFcbbyh
         QV5GsT6af7/5aWxhgnyIkKNxDX3lKU7301hM/EYGAxvEGTg58kUtmgEPTasCLe9VmD
         FtDH+BP5mzRLX6gN8B5W9sg7+j4zrdDw+7yFHc/E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180929150506.vch5wuujblgkngfp@flea>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20180929150506.vch5wuujblgkngfp@flea>
Message-ID: <153843265620.119890.14162967539697574651@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.19
Date:   Mon, 01 Oct 2018 15:24:16 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2018-09-29 08:05:06)
> Hi Mike, Stephen,
> =

> Here is one fix for 4.19.
> =

> Thanks!
> Maxime
> =

> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343f=
f3:
> =

>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
> =

> are available in the Git repository at:
> =

>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-4.19
> =


Ok. Pulled into fixes. Should send in a couple days.
