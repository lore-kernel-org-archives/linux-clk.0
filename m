Return-Path: <SRS0=KxaG=3U=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951AAC2D0DB
	for <linux-clk@archiver.kernel.org>; Fri, 31 Jan 2020 00:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6562120CC7
	for <linux-clk@archiver.kernel.org>; Fri, 31 Jan 2020 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580430753;
	bh=pbku5oxSdWFnhwG9QmEtpN3eCvD0ff47YRww3piY2pU=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=mTXCdUkt3K8fdy1Kn1qrEILl0vpy4piosus90CM92l77B+T/6E9aOeewd/ivnMjea
	 WBmXH//ZGyqC3pai49Xgdbt82aSQJXCni874os+sXwCLWSZN0OCtjgiypmFyo9VHjk
	 QQVRFk8Q8z02a+5CZElK2XkUNxmaGS6N3fdGC78M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgAaAcd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jan 2020 19:32:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:55428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727566AbgAaAcd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Jan 2020 19:32:33 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C13B20674;
        Fri, 31 Jan 2020 00:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580430752;
        bh=pbku5oxSdWFnhwG9QmEtpN3eCvD0ff47YRww3piY2pU=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=NOyiUd2eH6ChL6JoXK4cVXsEwfaE+0sueJdb2LLfuDaJacVy2vr6/9MV9IgA/TLRP
         i8BE/16Lvk7XAtE+hD2WXyI0PjrvGfGn4O5UJhAGbTIrKxWsN7M1WyMgLPNnQfjG54
         nk1bTa1E4UWN6F1TkTdG7pNMJvxIMLHJl42pu1Kw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191216100111.17122-1-yangbo.lu@nxp.com>
References: <20191216100111.17122-1-yangbo.lu@nxp.com>
Subject: Re: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
To:     Michael Turquette <mturquette@baylibre.com>,
        Yangbo Lu <yangbo.lu@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yangbo Lu <yangbo.lu@nxp.com>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 16:32:31 -0800
Message-Id: <20200131003232.5C13B20674@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangbo Lu (2019-12-16 02:01:11)
> This patch is to add hwaccel clocks information for ls1088a.
>=20
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---

Applied to clk-next

