Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FECC48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA2D5208E3
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561504403;
	bh=PksTGrbGqanTWCejYELx1hUtQLfaMlrmJVL71KB+jRo=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=ETCaQ6oScxXeHHe9Vo2tQXZIDStrbj5OuyIbKHGwqqyTdW1g+Br7G2I1yFSIr5s9R
	 nu6RVMqARYs3VIUH8r18SVRnwqC1EtvhMdJgQCMaTze+3zDy6LDNgzs0F3PvO75aj2
	 zZPH41F7UDwdWnMVxDQkV8dWQ0wUuYQpArqdECe4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfFYXNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 19:13:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbfFYXNW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 19:13:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF5BD208CA;
        Tue, 25 Jun 2019 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561504401;
        bh=PksTGrbGqanTWCejYELx1hUtQLfaMlrmJVL71KB+jRo=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=oDXy9L+em3In/byx2U+UbLjWXE+n3H7IGdnQFRXus3VDRAHsF7ZtJVb+NGP5mXkUU
         zEllIlSFIqGOhwc+7SbrtscuUD3rlI5q3y7A+UU83fJQV+mUHf+bp168os31qbB5y/
         4aI2sli2Lrmu0tAhZiuMv08aWU9vR7JuPKU8lq6A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190613161225.2531-3-thierry.reding@gmail.com>
References: <20190613161225.2531-1-thierry.reding@gmail.com> <20190613161225.2531-3-thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: tegra: Do not enable PLL_RE_VCO on Tegra210
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:13:20 -0700
Message-Id: <20190625231321.AF5BD208CA@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-06-13 09:12:25)
> From: Thierry Reding <treding@nvidia.com>
>=20
> It turns out that this PLL is not used on Tegra210, so there's no need
> to enable it via the init table. Remove the init table entry for this
> PLL to avoid it getting enabled at boot time. If the bootloader enabled
> it and forgot to turn it off, the common clock framework will now know
> to disable it because it is unused.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

