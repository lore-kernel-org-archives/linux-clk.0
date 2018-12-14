Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9826EC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 547E120879
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 02:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544753194;
	bh=oofKFFdzq2Rza/u4kJvP+EsLTIxPjnVd1+e3slj+aBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gBpcG6LdtXhrwUlv8JmvPAvmBDezphYy8/vJewje/4MneaynZYfcfZxBSiITz0ggf
	 1Be+JoTpKsB7sFF0MEHZp1gw2CkDo1rRvjm89bnyN5KqzEYtKsBVE1lz+T0NUx54ZA
	 N4hAR7lBxnyexPpNoxoVKDUWjPOUwND+CfcoJ+hM=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547E120879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbeLNCGe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 21:06:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:41634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728130AbeLNCGd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 21:06:33 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4444F20870;
        Fri, 14 Dec 2018 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544753193;
        bh=oofKFFdzq2Rza/u4kJvP+EsLTIxPjnVd1+e3slj+aBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIDmzxHyHJUce+shdW9CMtF49h7VHLSCYj6hSK9f4tO9TjIU531qr7u/f4MiNZOBo
         I1m5/4yURy6SyrR9OO9EgmJtQQfX5AKj3AVoIjxevy1RgyqAkI9vY/ukyVhXuh8y/y
         pvGnaecJiwmj3oJEh4MIaYVc7IqM5oSAVCXvd1+M=
Date:   Fri, 14 Dec 2018 10:05:34 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH V12 0/5] clk: imx: add imx8qxp clock support
Message-ID: <20181214020533.GC13243@dragon>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 13, 2018 at 03:42:46PM +0000, Aisheng Dong wrote:
> This patch series adds i.MX8QXP clock support which is based
> on the clock service provided by SCU firmware.
> 
> Note: It depends on SCU driver which has already been merged by Shawn.
> So this patch series could go through Shawn's tree as well.

To be clear, I'm not going to take this via my tree, and it definitely
needs to go through clk tree.  If there is a dependency on my tree, you
will likely need to wait for the dependency to land on mainline and then
retry.

Shawn
