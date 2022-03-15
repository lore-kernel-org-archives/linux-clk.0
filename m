Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3573C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 23:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352681AbiCPAAG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 20:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiCPAAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 20:00:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F64D54FA4;
        Tue, 15 Mar 2022 16:58:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1FDEBB818F9;
        Tue, 15 Mar 2022 23:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB595C340E8;
        Tue, 15 Mar 2022 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647388730;
        bh=u3ThAio+tSV+czwAr4+KRLfK77l7W6OzryrvZgLR9og=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nntWJehus9qBHHoEZCBnLmT0VfHwIGlKemDa9kpaQq4aGkXkjSu+v3euJpRp6cLsu
         Pqc1SeidquEM/mQxfp8ZEoMUZNn0rD81RIIO0+VOPgqIZu4ExG2c3HZOFuI6Hv/L03
         NMmHLmn2XC8GYXY5A/ZWlwQMMl/swRZzWLDsCmYZ4XjTKDXofS+USn8Rcsa552mcBh
         iqOjSj/F5fgnsU4R95Azw0bUVKNRxMzCmN2n0Ds/PKaofDohxQEUYZytZKKF4nv7kc
         DF2LS+aLcuCBBo+wrVB8dGz2ICbEKD2i6MNiQWdXCnOsZEp7jXk361xIPRu/jHjClY
         YnipS3l49khVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220226040723.143705-3-marex@denx.de>
References: <20220226040723.143705-1-marex@denx.de> <20220226040723.143705-3-marex@denx.de>
Subject: Re: [PATCH v3 3/3] clk: rs9: Add Renesas 9-series PCIe clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 16:58:49 -0700
User-Agent: alot/0.10
Message-Id: <20220315235850.CB595C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-25 20:07:23)
> Add driver for Renesas 9-series PCIe clock generators. This driver
> is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
> PCIe clock generators, currently the only tested and supported chip
> is 9FGV0241.
>=20
> The driver is capable of configuring per-chip spread spectrum mode
> and output amplitude, as well as per-output slew rate.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---

Applied to clk-next
