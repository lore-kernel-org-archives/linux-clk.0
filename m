Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E0C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A279C218DA
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556056990;
	bh=bLY2glHN+dHRvmk6tRVWqyc0PtgOZK6TWGUjtm76H5M=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=Rw23elLieXTwwSVAqcFlFTWVLXkDOkUnP4cbwtIuO9c7PDkbzkGRB0SHTk3FnSakj
	 z+GARRMfh7DfKYOBU92qsrNoyQbQ+LKUf5WxXsp7a+OzxR+rwDqpeMRJvD3QfjlIRH
	 rTYYspax3Cf6sr1ZhR5LJIpsWuEFFdPuDkAXyxWs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfDWWDK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 18:03:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfDWWDK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 18:03:10 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 657482148D;
        Tue, 23 Apr 2019 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556056989;
        bh=bLY2glHN+dHRvmk6tRVWqyc0PtgOZK6TWGUjtm76H5M=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=WmKspbHkLxaHeyVXZ/D19k7majqIxOOUdPjTHEP7xRqMy6nUw4iULRkTqMSnLPFgP
         8axBowe0Sm8mJE0LlnchNzXj072QU9QR+4d+0KIQ7dl00PoycWnYDLtrCv8v4PD19C
         FpMX2u63TODf7oSXgUbZhlPI9VX1AIJTMVLem/7c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319133700.23878-2-ckeepax@opensource.cirrus.com>
References: <20190319133700.23878-1-ckeepax@opensource.cirrus.com> <20190319133700.23878-2-ckeepax@opensource.cirrus.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v7 RESEND 2/2] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        mturquette@baylibre.com
Message-ID: <155605698860.15276.671362216532944829@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 15:03:08 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-03-19 06:37:00)
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
>=20
> The Lochnagar can take several input clocks from the host system,
> provides several of its own clock sources, and provides extensive
> routing options for those clocks to be supplied to the attached
> CODEC/Amp device.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Applied to clk-next

You may want to take a look at the clk-parent-rewrite-1 branch on
clk.git and see if you can convert this driver to use that method
instead of of_clk_get_parent_name(). It may simplify some of the driver.

