Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C744AC43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:14:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91C192086C
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550823285;
	bh=DpBV3JgeqWeM6hSwzRx2+3suu88eCRJUcSllZjdef9M=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=FGikMqNMoJ27AN7k1M5XKxUVlRcZZOK8Vo8vRf07DZ68UW2qEycEGvReInEUsnPzB
	 ewjJH18+hIbA/WpzI/GHaRohLgqb1fyuXsIjrnCcyZiJnApVyQmu3XI6kd8168Sgkw
	 VKBY6Kx0WeZbJ3JIa4PGx8eVGN/bJCqmxFbdDEQs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfBVIOp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 03:14:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:52872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfBVIOp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 03:14:45 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E0A720823;
        Fri, 22 Feb 2019 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550823284;
        bh=DpBV3JgeqWeM6hSwzRx2+3suu88eCRJUcSllZjdef9M=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=P7N9XVKttOKa95Q1uAPsxAuLC8VVM0ap3UWvj0e+cu/gq/lf3FJmaADXUglx+qDFY
         CllqdRQuW1ndBysy9/dvH5bbcK4e1VUu8rKJytvrAb9Qou3L9h5D/kwegOnz0e/RQW
         h2lw+xDScYfU/Iumr2b0dLXugmDSHENIKKrGUhrY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: x86: Move clk-lpss.h to platform_data/x86
Message-ID: <155082328374.77512.1461384740318422430@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-acpi@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Fri, 22 Feb 2019 00:14:43 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2019-02-18 11:34:15)
> clk-lpss.h is solely x86 related header. Move it to correct folder.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next

