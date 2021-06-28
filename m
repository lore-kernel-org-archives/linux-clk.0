Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CDEC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 714A861C2F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhF1DEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231753AbhF1DEo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:04:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7129161988;
        Mon, 28 Jun 2021 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849339;
        bh=cnsKi5eaK29RrwH3IZdPHerd5IolaP2txgKPxl/j1Lc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HxOvkEDWXJ4A+Ss90MZI7dAPElS2v+OhZ4zpB+VbNnn04LcZN9lYXzetoHAlw8VXM
         B041vdszLpNtiU9X6BJ4v2mFxgWIwGL0K6h3U+/9RmcxjMGyCscuQNko0zVTYtGTnl
         lm3nOejWJzTw2taiIQrn+BST8WwGv8rvE48tOEHA/XwKyzGhM6h7G785zJ6CQBjm4r
         hAqpDijisNVKe37zMony+qAjJn9k0SNryziM4UiE9GffbKxhG1Ifwzg4/TcTdZamQe
         Y3NxLGkJMr4Sp+9jKSu1ABlSfdK6iuYh18D6kwYISI1RmTxVoX0tTxdokgfP3WII8t
         Gh7EXqQRCWuRg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-2-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-2-robert.hancock@calian.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: clock: clk-si5341: Add new attributes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:18 -0700
Message-ID: <162484933814.2516444.5607074946847777797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:35)
> Add new silabs,xaxb-ext-clk and silabs,iovdd-33 properties.
>=20
> Changed vdd-supply on top-level node to optional since it is not actually
> used by the driver.
>=20
> Removed vdd-supply from output sub-nodes, as it was not supported by the
> driver and it is not easily possible to support this in that location with
> the kernel regulator infrastructure. Changed to have vddoX-supply
> attributes for each output on the top-level device node.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
