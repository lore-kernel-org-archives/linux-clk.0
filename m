Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651AC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 902AF60F23
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhH2ETW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2ETV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:19:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 599D960231;
        Sun, 29 Aug 2021 04:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630210710;
        bh=CbQ9gzpHf6sFvMhiD4zW63O1ivKFrjkNQO388CYuQJg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gfa4G6dOOX2crSWPBw7ZRL8KvQIlK3kfXbJdFMvRZpy4KN/hD30ODwTN0IfLek5aE
         JpEQkX0AXdU6dgscQNrOjz9rPYaCr165AofU2aKt+pmI3uPNHU/88qqXpK/JIPJ4pn
         E/2zRrvtBly17RKY/fjZYih6/dwmQgqILwnAQaQac113+7ZScz1lz1sR80uVCEsjZN
         QnToaccb4fZxEC23XuJxIW85KD+qhDjqEwBvGPAa5pi5B6eBx9S9xt3IOhxhdO9jY7
         O6kdIZ01xy0jBW0h/MtlivOmdQVH2yOTF4t0MO5kFaDi+rUImWTN9LnsiZvYC1VFeH
         9Ur4JeI4MDriA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1629720433-19019-1-git-send-email-rajan.vaja@xilinx.com>
References: <1629446294-1056-1-git-send-email-rajan.vaja@xilinx.com> <1629720433-19019-1-git-send-email-rajan.vaja@xilinx.com>
Subject: Re: [PATCH v3] clk: zynqmp: fix kernel doc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>
To:     Rajan Vaja <rajan.vaja@xilinx.com>, michal.simek@xilinx.com,
        mturquette@baylibre.com
Date:   Sat, 28 Aug 2021 21:18:29 -0700
Message-ID: <163021070902.2676726.2887966939262149767@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rajan Vaja (2021-08-23 05:07:13)
> Add missing description of 'custom_type_flag' structure member.
>=20
> Fixes: e605fa9c4a0c ("clk: zynqmp: Add support for custom type flags")
>=20
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> ---

Applied to clk-next
