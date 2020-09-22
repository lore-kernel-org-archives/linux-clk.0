Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094B2C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5CA3238A1
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600802989;
	bh=zGDpR400lF8sS+w2f5hNi8KhZtffSJpAzGWhfrD8OzU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=lcyxnuFlOsSf1v+K2lWI7KBrTCH4DfBbhbSNP6YcBDNWHtOiCJN6iHdaf9CStrxA4
	 x2KF8FLZkiJkZZON/JH1cvRDEd2jXZIsm9N3Tc3/Ray3xIsEl7H00Cf3Cc2g4dRFZK
	 +XzUl34APoqVqBeQcTQPvORrh3vMjX+QWyj7WtQI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIVT3t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:29:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVT3t (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:29:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9E5723787;
        Tue, 22 Sep 2020 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600802988;
        bh=zGDpR400lF8sS+w2f5hNi8KhZtffSJpAzGWhfrD8OzU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bS+Rzkl43sz53wzidHx/oul/Rhydw005z61pTAmsKzJZLANOqk+N929owXUth8KWt
         sFVFLqKdtb7vAC6D9IEizNy54CsCkl9gHvg3Er3icxdOCwjOGkMcuPbk2ncdYgdtgV
         txPA8ow67vjJcEKEXqyhK1RWO2ouOpc6/nieqPzk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200901040759.29992-2-hoegeun.kwon@samsung.com>
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com> <CGME20200901040851epcas1p28f443c0e819bea756ebf9296491b32da@epcas1p2.samsung.com> <20200901040759.29992-2-hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2 1/4] clk: bcm: rpi: Add register to control pixel bvb clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, tim.gover@raspberrypi.com,
        mturquette@baylibre.com, kdasu.kdev@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, phil@raspberrypi.com,
        linux-arm-kernel@lists.infradead.org, hoegeun.kwon@samsung.com
To:     Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        dave.stevenson@raspberrypi.com, eric@anholt.net, maxime@cerno.tech,
        nsaenzjulienne@suse.de, stefan.wahren@i2se.com
Date:   Tue, 22 Sep 2020 12:29:47 -0700
Message-ID: <160080298755.310579.12537322885845907147@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Hoegeun Kwon (2020-08-31 21:07:56)
> To use QHD or higher, we need to modify the pixel_bvb_clk value. So
> add register to control this clock.
>=20
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---

Applied to clk-next
