Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE20BC2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86BF120715
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604540252;
	bh=2YX3HiSVvpQdklLmmGN8qOy9KFqyP1N/DLylmeCTzcY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=KctBamfcfGXqh3YRpfkgBVhLTSmKhrYkh6eBj1IsDaxfI9DMg0sGqGHdRiUgMWUIz
	 u4/pFV3AM+2Oku6m9gZ/5pIYic1QJgABtaBkiA8FavZlzjdrXp55/0ZZNAVDVO/sru
	 4cldoBF3xyTVt9SF4pqJK6AlZ6S5MXBLaOlTcbMI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgKEBhc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:37:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:60756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgKEBhc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:37:32 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BDFA206DC;
        Thu,  5 Nov 2020 01:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604540251;
        bh=2YX3HiSVvpQdklLmmGN8qOy9KFqyP1N/DLylmeCTzcY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bSA21IzA08gqjGYF0NO0DGUnHQZCyyzLCTIujqILBn7uN50/PF3Czi77m8Rc4574d
         vqB6ZicD/PtUsfZuWQOe93Vy86HTrz24b0wbYCZuLZwqBDsR5xd2I0IE/UcCEFx8G9
         aD3FEoDFIRwpf9tzCa8hWtoPnyJB0VQxCkV5kvNU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604488771-40827-1-git-send-email-zou_wei@huawei.com>
References: <1604488771-40827-1-git-send-email-zou_wei@huawei.com>
Subject: Re: [PATCH -next] clk: imx: scu: Make pd_np with static keyword
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Zou Wei <zou_wei@huawei.com>
To:     Zou Wei <zou_wei@huawei.com>, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com, mturquette@baylibre.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Wed, 04 Nov 2020 17:37:29 -0800
Message-ID: <160454024981.3965362.8179876172503811758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zou Wei (2020-11-04 03:19:31)
> Fix the following sparse warning:
>=20
> ./clk-scu.c:23:20: warning: symbol 'pd_np' was not declared. Should it be=
 static?
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
