Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C3AC43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 19:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34C63214AF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550691498;
	bh=2vKmiNiduUQX/xLBpCgvOkzm1ROQPgac++vXwY3FWxI=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=CINHuUttV9pId3TqKoQPmjGEaP/jACwDtvI3oIyK13AoM3kaWy0vUQpFDu1CJJoJ8
	 MI9iKn2hWopG6iNVWntPA06rOmFGWepbMyMEGyNP9l5UB5EOyT+E0pL7PRp9jxoxO7
	 +9SD5G/0haaIPESqa76XtowgvDwUG8hp74TMYrdU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfBTTiR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 14:38:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:56808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbfBTTiR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 14:38:17 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1203E2147A;
        Wed, 20 Feb 2019 19:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550691497;
        bh=2vKmiNiduUQX/xLBpCgvOkzm1ROQPgac++vXwY3FWxI=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=EUOWrUfcB/YQvxf5HyDtftNGfmnFItTB8Fvx8fbgm/4ypaNgbfcOgo6ZJkpjkErTL
         1j8bfrub7NAA5GNeOF7mp6PGX+LMjSk2fYsXI0mbnRCsvGHuepXb8J/6vaICzcg8kO
         XpAMMgfGhC50oD3pJRGXrMdqc8FQwyTL2dDfO8yI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: x86: Move clk-lpss.h to platform_data/x86
Message-ID: <155069149625.77512.9023068568198598983@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com> <3313613.aXZoxbyzyv@aspire.rjw.lan> <20190218224643.GK9224@smile.fi.intel.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190218224643.GK9224@smile.fi.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Date:   Wed, 20 Feb 2019 11:38:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2019-02-18 14:46:43)
> On Mon, Feb 18, 2019 at 11:00:59PM +0100, Rafael J. Wysocki wrote:
> > On Monday, February 18, 2019 8:34:15 PM CET Andy Shevchenko wrote:
> > > clk-lpss.h is solely x86 related header. Move it to correct folder.
> > >=20
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >=20
> > in case you want to take this through the platform-x86 tree.
>=20
> I guess clock tree is the best for this.

Ok I can pick it up.

