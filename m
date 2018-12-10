Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E34C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 259592084C
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544470870;
	bh=Zl5CZWZw619W0iwbDydnx9ees4UuGnSgQ6tkP44mFew=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=ZxcsBlvX87GpRvr/peBprfkNi6h+DwCvGQ1XfYy9QvfHd51RCSYvHbcsRBhTg13zp
	 waO7U6Qnh7EqSTmlaI3zL7SxlKZJ3TDonLIAVzrZquGeVA0A/M1CsTK5J6fLNUSLn8
	 thpXisrOKxKkVkIJ1VrRQ4Zd3UIXRlGnxQdSdDKE=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 259592084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbeLJTlJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:41:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:52506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbeLJTlJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:41:09 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EE4820672;
        Mon, 10 Dec 2018 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544470869;
        bh=Zl5CZWZw619W0iwbDydnx9ees4UuGnSgQ6tkP44mFew=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=IDkM+Mr4nkcpDv3Q+F/cXHCxFBxLrjyyKqbjhREUS9r/gU3Ds53uDvrTSstV6Z/jB
         mgvKMVEvD9jNbpybpwAw+RM1BTQPK8iVcJZ3mBelrBkbYhBSzbePY/7CN4gUq/O836
         infP9uO0aPSvWh8HZP33tMpF95He+87BODJk7lds=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115143028.19087-1-l.stach@pengutronix.de>
Message-ID: <154447086823.17204.18171176566068710285@swboyd.mtv.corp.google.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: imx6q: reset exclusive gates on init
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181115143028.19087-1-l.stach@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Mon, 10 Dec 2018 11:41:08 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lucas Stach (2018-11-15 06:30:26)
> The exclusive gates may be set up in the wrong way by software running
> before the clock driver comes up. In that case the exclusive setup is
> locked in its initial state, as the complementary function can't be
> activated without disabling the initial setup first.
>=20
> To avoid this lock situation, reset the exclusive gates to the off
> state and allow the kernel to provide the proper setup.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Dong Aisheng <Aisheng.dong@nxp.com>
> ---

Applied to clk-next

