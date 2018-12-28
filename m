Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249D7C43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E192F2081B
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546025245;
	bh=4n0hBtKwCEqwFcRVKhhCRAZncEoSgZGvHL/bMYj3+mg=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=YDtds9XREGDzU0H+/UaKF9PSEEPIwZVxpr/8h7demRazmW4TE2gWzSjGqD74DF2cC
	 R2xnWGumPsoCKf/23R7JzrjtQaik5MRlEX77qvtHklRl+gJBFUVH9I4K0mPC2DPs0N
	 P2J1DMim9pbMG3C4UPocLdXM31pHgAwUmsCPPZyg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387705AbeL1T1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 14:27:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:54504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732069AbeL1T1T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 14:27:19 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 791BD2081B;
        Fri, 28 Dec 2018 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546025238;
        bh=4n0hBtKwCEqwFcRVKhhCRAZncEoSgZGvHL/bMYj3+mg=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=LQ6A7fz4obAntWgB/jHJrOnbejq6wwv0AiC2L1d2A70SdrrpBViAl5VLI834moDgp
         sD/sdvIoNHPxOFtHRVutP766tlbFnmLzAw6G835NBNyOMUcjGTeyChsa+xGgpNLQnW
         /OpJEelaoCgxrLy1Ad97+YN/SB946Al8Loa2Q6nQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Yangtao Li <tiny.windzz@gmail.com>, mturquette@baylibre.com,
        t-kristo@ti.com
Message-ID: <154602523753.179992.582803383819271608@swboyd.mtv.corp.google.com>
References: <20181226132131.4619-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH] clk: ti: fix refcount leak in ti_dt_clocks_register()
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <20181226132131.4619-1-tiny.windzz@gmail.com>
Date:   Fri, 28 Dec 2018 11:27:17 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:21:31)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/ti/clk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20

Applied to clk-next and fixed a whine

drivers/clk/ti/clk.c:197: trailing whitespace, space before tab in indent.

please be more careful next time. Also, please add fixes tags to fixes.

