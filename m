Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78C3C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 20:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346957AbiATUzM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 15:55:12 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50274 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238683AbiATUzL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 15:55:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B71061873
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 20:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6866C340E0;
        Thu, 20 Jan 2022 20:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642712111;
        bh=C9je0xIRjVjhFncEpxZVqat86IpesllsCZIAtvTDohc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qY9utx2/Bqu/gDa6iaKvQl6KCwMMI98Lc87Mf93sjYczd6Z4ICzvqpkkCFs1XTXfp
         aKxB3Ty17KcxJAEDfrApvuhMzNRoKExFJsdeI5fkM+kFqkcygF9SFPYhgFCUuSq5v2
         kOjjFugrPsf8kiXwqop1KFQUlsM/yVJPTMuwUMbcA4XGs9QJrZxj54pUvfQDunF9fs
         2OMjsJvvWgP68KkhuXEsb7lqheQxH3alyOHGPMRfvs3lVFFbuZqnu/+ECt1JmedW43
         i467bEQq4YMpIW15YGSf1HcWgUF8rl4yF7Q/XQlxBKNvLKcHzgE8YsbBSjM7QssDnm
         NFSIvSKrrhZQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220111081435.GA19822@kili>
References: <20220111081435.GA19822@kili>
Subject: Re: [bug report] clk: visconti: Add support common clock driver and reset driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        nobuhiro1.iwamatsu@toshiba.co.jp
Date:   Thu, 20 Jan 2022 12:55:09 -0800
User-Agent: alot/0.10
Message-Id: <20220120205510.E6866C340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2022-01-11 00:14:35)
> Hello Nobuhiro Iwamatsu,
>=20
> The patch b4cbe606dc36: "clk: visconti: Add support common clock
> driver and reset driver" from Oct 25, 2021, leads to the following
> Smatch static checker warning:
>=20
>         drivers/clk/visconti/clkc.c:150 visconti_clk_register_gates()
>         warn: always true condition '(clks[i]->rs_id >=3D 0) =3D> (0-255 =
>=3D 0)'

Is there any patch to fix this?
