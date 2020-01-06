Return-Path: <SRS0=2auu=23=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8418C32767
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jan 2020 03:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3658222C4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jan 2020 03:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578280432;
	bh=rRiXaqB4lKgL0CIczu5dMCejRCDmvD2iQ9XuI7vNKWQ=;
	h=In-Reply-To:References:Cc:To:Subject:From:Date:List-ID:From;
	b=NbSxghIxTYRz9hpky0KtTdN+i/VNsw06Yj9p6v1E+xozv4iMRt0I9xFZS0MPMn2CA
	 hWScWBTiYYpRB9CVs9AiwQigL/BgnWa4x0Tv1ojDtA5n0LKWbQhtL3AYYPcuVpka4F
	 XP0//D2N0mVgKVPlJhucqMKaIIjm4Mpr8hCG1WJs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgAFDNw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Jan 2020 22:13:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:36936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727369AbgAFDNw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 5 Jan 2020 22:13:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CAA221582;
        Mon,  6 Jan 2020 03:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578280431;
        bh=rRiXaqB4lKgL0CIczu5dMCejRCDmvD2iQ9XuI7vNKWQ=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=F5e4GLspOXukrm/Z9aTuG5SdIvceK9UtrGlDmdCQciJ9hmd38+xcEPzfaYIs6HZ1G
         VGULXAWpdEdmEISCX0rwT67ZcZgesG5+mh5iFERpvUYIol/uxJj1YB1leCamZTot+b
         BFHrkW7oAGVPcuUSXN8WU1+0mguaHax/PapccolQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001090202.26346-1-t-kristo@ti.com>
References: <20191001090202.26346-1-t-kristo@ti.com>
Cc:     tomi.valkeinen@ti.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH 0/4] clk: debugfs: add some simple debug functionality
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sun, 05 Jan 2020 19:13:50 -0800
Message-Id: <20200106031351.8CAA221582@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-10-01 02:01:58)
> Hi,
>=20
> I have been using a variation of these patches myself for several years
> for debugging / testing different clock issues. Basically what I do here
> is extend the functionality of debugfs to allow write access to certain
> properties, like rate, enable / prepare counts, mux parents.
>=20
> This allows simple testing of new features or debugging directly from
> userspace. The functionality is hidden behind a Kconfig option because
> it can be rather dangerous to allow access to these unconditionally if
> the user does not know what they are doing.
>=20
> Any thoughts?

I just applied Geerts approach to this. Let's follow that and not
provide any Kconfig things.

