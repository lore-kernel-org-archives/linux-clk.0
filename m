Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7CFC48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0071208E3
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561506302;
	bh=2srRusj4JiJ9dqvGnl1rSyXYmKaGPjVC3wWbEnqs4f4=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=akRxveaQOb0XfweUeGWjv1BLbc2kaZvBFZ1GgX89NBNz7oQMPOIzikclpbvCgbCNq
	 Dwlz+1PczOOIe28ZcllAz5nR21Mi6a+rjqrHSaW4XEwbvDbWtovlQUTgzRSJrjbYyN
	 EomaxYyfuv+UjnqKEBIxAKTJzJ4Fo/T+brV4iTb0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfFYXpB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 19:45:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:38034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfFYXpA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 19:45:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14A052086D;
        Tue, 25 Jun 2019 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561506300;
        bh=2srRusj4JiJ9dqvGnl1rSyXYmKaGPjVC3wWbEnqs4f4=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=NYCeh9IdMT50gUdsLrYoU6+GeJ46EI4ORhgTE55UFDk4/2ggmTr3cLCbhxda/ctUT
         65LP6ayWHaMSjXoTDZQ6fpT7nzBBwIWJloIqtFy2RCzmW1NSIOVCH+Ef3X1VPOMJv3
         2ebbjGfJMCIyr694oi0ZI4wfuVh3o84wsHAj15P8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190625131053.25407-1-ckeepax@opensource.cirrus.com>
References: <20190625131053.25407-1-ckeepax@opensource.cirrus.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 RESEND] clk: lochnagar: Use new parent_data approach to register clock parents
Cc:     linux-clk@vger.kernel.org, patches@opensource.cirrus.com
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:44:59 -0700
Message-Id: <20190625234500.14A052086D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-06-25 06:10:53)
> -static const char * const lochnagar1_clk_parents[] =3D {
> -       "ln-none",
> -       "ln-spdif-mclk",
> -       "ln-psia1-mclk",
> -       "ln-psia2-mclk",
> -       "ln-cdc-clkout",
> -       "ln-dsp-clkout",
> -       "ln-pmic-32k",
> -       "ln-gf-mclk1",
> -       "ln-gf-mclk3",
> -       "ln-gf-mclk2",
> -       "ln-gf-mclk4",
> +#define LN_PARENT(NAME) { .name =3D NAME, .fw_name =3D NAME }
> +
> +static const struct clk_parent_data lochnagar1_clk_parents[] =3D {
> +       LN_PARENT("ln-none"),
> +       LN_PARENT("ln-spdif-mclk"),

The above two aren't documented in the binding. Is it intentional? I'd
like to apply this patch, but I don't want it to use undocumented
bindings.

> +       LN_PARENT("ln-psia1-mclk"),
> +       LN_PARENT("ln-psia2-mclk"),
> +       LN_PARENT("ln-cdc-clkout"),
> +       LN_PARENT("ln-dsp-clkout"),
> +       LN_PARENT("ln-pmic-32k"),
> +       LN_PARENT("ln-gf-mclk1"),
> +       LN_PARENT("ln-gf-mclk3"),
> +       LN_PARENT("ln-gf-mclk2"),
> +       LN_PARENT("ln-gf-mclk4"),
>  };
> =20
