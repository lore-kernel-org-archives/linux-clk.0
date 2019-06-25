Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0148EC48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD44E208E3
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561504398;
	bh=blBwB9t95l88PXacUsjo0XQpWD///s/Sycw5SGwpq7I=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=pjZi9OvrBrS0PAGfbwOaaydFlo4f9NX3UfQzO9C8mwU8yTTNEqsIRfNqSQnzyTqq9
	 ngqeTSxruCAyONJfamMOJFE3naJ8Z2TxkTj5MbEwYqkVBrL0Rp7btLQA1cw/YMY312
	 R7emiuyWVlfe4Z2jGcSG87/tKBE0uF8JG8gqcO14=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfFYXNS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 19:13:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:54980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfFYXNS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 19:13:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C31A2086D;
        Tue, 25 Jun 2019 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561504397;
        bh=blBwB9t95l88PXacUsjo0XQpWD///s/Sycw5SGwpq7I=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=irXr9h++MxSRrponZpxkSzGV7d8XAgqZXsDL3PpQNef4i4hPIMbJttAzcEsFzWCPA
         nJqrqbZxice/Ulps9sWCTTKbTkMit+oUT8m9ee1jGm4nuqT13MJ/ydgSVm+nUFkuH6
         e0LqqIJkV7HdtuvQWtZzo2o9czX0QmJTsjjWugvA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190613161225.2531-2-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com> <20190613161225.2531-2-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: tegra: Warn if an enabled PLL is in IDDQ
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:13:16 -0700
Message-Id: <20190625231317.7C31A2086D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-06-13 09:12:24)
> From: Thierry Reding <treding@nvidia.com>
>=20
> A PLL in IDDQ doesn't work, whether it's enabled or not. This is not a
> configuration that makes sense, so warn about it.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

