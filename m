Return-Path: <SRS0=/Yer=S2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E9EC282E1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 23:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 625C221773
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 23:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556148193;
	bh=957fOFQAN0C6XJmCCGy9dAvWhCB4IusbiKTa3Wx+WEg=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=hBKJUFg7AKJjj97NvoxrhI7GkYM1GJx+Ya0aQMaLi/NENmtJ7Hy/F6UY2qWhcqy3s
	 ikTYPT/TbjsI4qC7BbwqLZVKGnpUww5Rjq2nMemPwPTcggrWYKe71VaQG6CQSe+R/r
	 zP4M4EueKg8pktj2HGBJqB6+EYW6iS9k5WW9ibMs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbfDXXXN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Apr 2019 19:23:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728155AbfDXXXM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Apr 2019 19:23:12 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1372F217FA;
        Wed, 24 Apr 2019 23:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556148192;
        bh=957fOFQAN0C6XJmCCGy9dAvWhCB4IusbiKTa3Wx+WEg=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=Td8y1JFwZU8hEBXyn6ttij4aGjtBZY8dPwoLOhTNXb2uvdFIhNAGmmUZHT619r5if
         RjGHUU385QnllGSdYa7MfGiLDeIPMslSee063X8w2iGesM4LDN8OCvSyYTVCPohKT3
         ZI3qoXV2e5Dc7zSZzS7oc77LlrQkbQg6optP3yyc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
References: <201904242234.3ZpDzMBq%lkp@intel.com> <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
Cc:     linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [chanwoo:devfreq-testing 15/16] drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of function 'clk_set_min_rate'; did you mean 'clk_set_rate'?
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>
Message-ID: <155614819134.15276.7176628667441699971@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 24 Apr 2019 16:23:11 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-24 07:41:56)
>=20
> Oh, there is no declaration for clk_set_min_rate() when CONFIG_COMMON_CLK=
=3Dn. Either driver should be made dependent on CONFIG_COMMON_CLK or the de=
claration should be added to include/linux/clk.h (the same applies to tegra=
20-devfreq).
>=20
> Chanwoo, what will we do?

Send a patch to add the empty wrappers to clk.h please.

