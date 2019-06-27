Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D087C4321A
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 21:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07E5D2133F
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561670255;
	bh=tjUVhNwUylYppI6L6ObcmsGvQ+mV0tCzi7qFIIABWjY=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=e4pg2ph8DuG04Rg113FmmaM2TcUfiPbKS6VFbxzugOyJyKqO5B92kLz68jVkzifCJ
	 07qTOw7tT0qNI2XWe8IxcJ0Y/QJJnh8WHW+n767kwMCfa5j2KqAyAkpk/7bR1wKRxF
	 HEm6olz4k34+VoWUswa6/vvL1deB3oNmpikyp0lk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfF0VRe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 17:17:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbfF0VRe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 17:17:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAF71208CB;
        Thu, 27 Jun 2019 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561670253;
        bh=tjUVhNwUylYppI6L6ObcmsGvQ+mV0tCzi7qFIIABWjY=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=aWl5mqAk/vpVHjuT4R7MHOR602Sabl1/FTGMf9lDfznlYJKf/cslkrOdOoRm2rFBh
         EC9vqz3p0DLCo95kIUJnNUlhQATKxV3UoWXeJZEz4YGYGVP6fThubszzVZ8tsVayD1
         Rc/7iZEs4/VddxPSRsOK7+gi5DGcxUSnPseEA674=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
References: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: lochnagar: Update DT binding doc to include the primary SPDIF MCLK
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:17:33 -0700
Message-Id: <20190627211733.BAF71208CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-06-27 01:55:17)
> This clock was missed when the binding was initially merged but is
> supported by the driver, so add it to the binding document.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Applied to clk-next

