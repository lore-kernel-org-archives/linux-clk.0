Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4430DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 03:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384350AbiAYD1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344411AbiAYB7l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 20:59:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF2AC09B049
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 17:18:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 139DA61212
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 01:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D84FC340E4;
        Tue, 25 Jan 2022 01:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643073515;
        bh=DZbUXaEUPNCPLfIU0ECcUxC12Qex5BANlbuWtENvK3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bkDrkjp7lcTUq7jzOqyyv5TDHm1ETl/mza1DY6ekr79VLXuDONtKKtl4COGKGJ8P5
         iBD8cJ8Ft5cCa44Kljy30KWiUgSBDV6Rs1OswfofNCWqRvAjk6L4lpy7oMAE4jOTPR
         oJ+nNO+A1itOtWyspHcomIFv7WLgxkWZZCTtq2LXMIRRQDB8enM+zh/d05/A8px/Rd
         yrnwRiEovFkgNY0HQOaF33Vf9aQOZlC7xwAx1jFQFo2GIWFPhjKuSbLaD0Z5hSZSN6
         m0A4Ao/03V6t9Gr9MhuSTEzke3vIJTNg5oahR0a4tw9tCFqs53WLpSJ67G6sOTqM6R
         h4APpalH8h9qQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220119115434.2042017-1-m.tretter@pengutronix.de>
References: <20220119115434.2042017-1-m.tretter@pengutronix.de>
Subject: Re: [PATCH v2] clk: zynqmp: replace warn_once with pr_debug for failed clock ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        rajan.vaja@xilinx.com, kernel@pengutronix.de,
        m.tretter@pengutronix.de
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 24 Jan 2022 17:18:33 -0800
User-Agent: alot/0.10
Message-Id: <20220125011835.5D84FC340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2022-01-19 03:54:34)
> The warning that a clock operation failed is only printed once. However,
> the function is called for various different clocks. The limit hides the
> warnings if different clocks are affected by the failures.
>=20
> The clock ops might fail if the firmware that handles the clocks is
> misconfigured. Therefore, replace the pr_warn_once with pr_debug to
> allow the user to see all errors if necessary. By default, hide the
> error messages and let drivers handle the errors.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Applied to clk-next
