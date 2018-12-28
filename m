Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D222EC43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F24C20869
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546025799;
	bh=nyiCv7nkDp1lmyAEr+eIA63hjakIjXgWl2ozNMF4TwU=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=BnX/c0mCCapktHLZR3FjWmTzkBpm1EohczZncVNXcccokfLciTcfWnGI0aMUzx8AP
	 /3pX3SN4L9zgOZh4Szcx3HBKMG8qMNcws9OidrF7n5Tf9+u+S01L+BdKN76/Ndt+nX
	 3NDEux2YIzieMUtPENEomZUwrJ5zwERXW6KO7goI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732022AbeL1Tgj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 14:36:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:32940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730937AbeL1Tgj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 14:36:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A41220861;
        Fri, 28 Dec 2018 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546025798;
        bh=nyiCv7nkDp1lmyAEr+eIA63hjakIjXgWl2ozNMF4TwU=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=ZW+SG+mq30o5Amy47Z/M0nhPBZAUA+crO2EAntqyCNPO5b2UXQocUk1clJc0H4XG0
         wjkXgRqxZFikzVIGiani3Rjx11q0QPAwEKKutRz+mJnYDWBcSjJB6vMvZNnUZX1ocP
         3JYDHJHf3y3dp7GdFAitUymBb3ejwfwriYvfVFdo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Yangtao Li <tiny.windzz@gmail.com>, fabio.estevam@nxp.com,
        kernel@pengutronix.de, linux-imx@nxp.com, mturquette@baylibre.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org
Message-ID: <154602579775.179992.18206324177054144317@swboyd.mtv.corp.google.com>
References: <20181226135510.5862-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH] clk: imx6sx: fix refcount leak in imx6sx_clocks_init()
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <20181226135510.5862-1-tiny.windzz@gmail.com>
Date:   Fri, 28 Dec 2018 11:36:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:55:10)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Applied to clk-next

