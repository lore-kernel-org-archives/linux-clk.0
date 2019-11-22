Return-Path: <SRS0=tNAh=ZO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4378AC432C0
	for <linux-clk@archiver.kernel.org>; Fri, 22 Nov 2019 16:57:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1056820714
	for <linux-clk@archiver.kernel.org>; Fri, 22 Nov 2019 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574441873;
	bh=QwDLroCzEbci20tlC8TsKYbUBwfotf+yaXXjDJCMt6o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=wjLTALvvC8JVfd6ZbQZ5iA3NjsNQ0wggFUyM4+SV25nxu32/mmxoA30guYluxjuOO
	 0Ov5bOR9lhWDuodL2vemiH4VCWmuhmTJdOvAUIg5Vg2BYsVjxHcYKaHZuKgBEH6GHS
	 gnNYh3xDFCFvsKynpXM/lZ2igUqN/J0ZCVzAkj+M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVQ5w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Nov 2019 11:57:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:40802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfKVQ5w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Nov 2019 11:57:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF06D20672;
        Fri, 22 Nov 2019 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574441872;
        bh=QwDLroCzEbci20tlC8TsKYbUBwfotf+yaXXjDJCMt6o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WAHoqQZ6MvWNJIs39m0f82jTWTdLzRJ1u6w7++cAFvPwOtIRTMANdQy2eGUo5oiZC
         ic1YtxSfAfFqa0zXXTNhTF/+9howtiPjYt9BlWHhBmooNoFnprtIdGFNwd8spDKLs2
         RWT/DvjW10YbUezpmhChyrbWkdgyH9BIeC2FdA/Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191121100726.17725-1-ulf.hansson@linaro.org>
References: <20191121100726.17725-1-ulf.hansson@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update section for Ux500 clock drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 08:57:51 -0800
Message-Id: <20191122165751.EF06D20672@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ulf Hansson (2019-11-21 02:07:26)
> There's no longer any need host a tree solely to serve changes for the
> Ux500 clock driver, thus drop this from the corresponding section and use
> the common clk tree instead.
>=20
> Moreover, let's also add the generic linux-clk mailing list and rename the
> section header.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

Applied to clk-next

