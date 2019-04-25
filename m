Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3D1C43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 793462088F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556207095;
	bh=litMVQpHU+/YgQJSXnL07b1ADLT5zH/nv4RFj6AZUA4=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=BhZ2e+Lg0H5Ont2ltyCpsccWqDvmujCG8DJppV7I7D7+TAFC8piCr8uilPcRFf0Xc
	 KoOxDoldLG9OASykdZdjGSwuNWNTr0lsEz+xJM+6HMdUiV0LSFni3aKEuwgcWOkIpe
	 C8K22DKUZgX11KzvPzub+8iKDfIpPtHu5nn9O6rU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfDYPoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:44:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727631AbfDYPoy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 11:44:54 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C794206C1;
        Thu, 25 Apr 2019 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556207094;
        bh=litMVQpHU+/YgQJSXnL07b1ADLT5zH/nv4RFj6AZUA4=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=KGy2LTK2ECluGi3r8eiaDket3hCRfhEjc8C0WPODz1bEIj7xdJdmjpaIiAEEextJx
         5OP3bkRZ18RckZttVkZbDh6pNFeZNVfRuW77VzIAnrB5+p9RJfUMFWOruHTDLK1BaP
         +FGeFS+so7X5l+QAW20z5vN7jyt+LoSeN+KoYxEw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190422062314.1354-3-shawnguo@kernel.org>
References: <20190422062314.1354-1-shawnguo@kernel.org> <20190422062314.1354-3-shawnguo@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL 3/3] i.MX7UPL clock changes for 5.2
To:     Shawn Guo <shawnguo@kernel.org>
Message-ID: <155620709327.15276.9748665722176236865@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 08:44:53 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-04-21 23:23:14)
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx7ulp-5.2
>=20
> for you to fetch changes up to d058fb60d56b89548028acd6f70b8396e633ffc1:
>=20
>   dt-bindings: clock: imx7ulp: remove SNVS clock (2019-03-20 16:00:03 +08=
00)
>=20
> ----------------------------------------------------------------

Pulled into clk-next

