Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AF8C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 20:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1839F20892
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544215098;
	bh=9dPrsfzAikK0GdTd80xH0jLKGqrFo4qOAIwrY9Y11Uc=;
	h=References:Subject:Cc:From:To:In-Reply-To:Date:List-ID:From;
	b=KB6zlmtkHhVd6oCgLPYQd2uJ7nlYfdQYoE5Q71hCtbk+RqX3r66eFPfarqXttWGt6
	 Jhmltxzb5kw5xjr8tTxA1GAaUoLk869iJStVYGXBH/kvrl3jdXIoRqHnxC//KY1MQU
	 e7HCd3f6w34EPRs+QjEh9ApaUKKE0H/LoPEzFlJ0=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1839F20892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbeLGUiQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 15:38:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbeLGUiQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Dec 2018 15:38:16 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82E852082D;
        Fri,  7 Dec 2018 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544215095;
        bh=9dPrsfzAikK0GdTd80xH0jLKGqrFo4qOAIwrY9Y11Uc=;
        h=References:Subject:Cc:From:To:In-Reply-To:Date:From;
        b=KxwhZDh3OBStLiwSV2wAodQnY9lJTGMQTYekBdkXzmFIfR0Y6UkAuHf1VT4CkZIy5
         lD+YB2aWFemaneJ2fS9bA8OSMLrHcz0pctEUgQBMuEU5V1L+c9qv0YZUSzhacqA3GH
         NGjeWmurn49JmnbXKHhDsKOA32O7YnVywpLtaUhc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181207122203.32763-1-geert+renesas@glider.be>
Subject: Re: [git pull] clk: renesas: Updates for v4.21 (take two)
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <154421509465.168715.11812357129668013837@swboyd.mtv.corp.google.com>
In-Reply-To: <20181207122203.32763-1-geert+renesas@glider.be>
Date:   Fri, 07 Dec 2018 12:38:14 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2018-12-07 04:22:03)
>         Hi Mike, Stephen,
>=20
> The following changes since commit eb38c119dd91c61de26f67050671a84064554f=
7d:
>=20
>   clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.21-tag2
>=20
> for you to fetch changes up to 36c4da4f552a126bb29a95dc5c9608795491e32a:
>=20
>   clk: renesas: rcar-gen3: Add HS400 quirk for SD clock (2018-12-07 11:45=
:06 +0100)
>=20

Thanks. Pulled into clk-next.
