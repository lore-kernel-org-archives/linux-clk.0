Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7820DC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CEDA2086D
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544470873;
	bh=Q2CjiwgHCRrrmdsTpm02jQ3VArLmiHpGaTwk2L36MW4=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=S8+f6NtMg04K+9pwBiOrIXGmQHLTJiTQltGMP2b3qKbn8/l0p9GaxdbgtclnNn0+a
	 2uMeoIi20mS47BEYuYdzB6LZbfwnxJ8pDtJz+gWbh/25b9rqaTmGIwGU42XuAYoj0i
	 b94TCxnerWYZrW2hvgG60BDsXhr3pArtWRlFZRQA=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CEDA2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbeLJTlN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:41:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:52554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbeLJTlM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:41:12 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 283332084C;
        Mon, 10 Dec 2018 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544470872;
        bh=Q2CjiwgHCRrrmdsTpm02jQ3VArLmiHpGaTwk2L36MW4=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=V4AsPfiz/0gCHrm4KyjmwABFQ+jCM1R9n/bAsa78dZ6mG74O4iZtqO0N4IwXXywtu
         8f4Y5yH1tBa4bXQmihEcM2Yvp78zf8BmjS1mU/yhMj3Do47A8eavBDYnkdLH1q+zvF
         fksy4KgLj+jBknYJPSVUEfVW4otiS2HIUjB7cie4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115143028.19087-2-l.stach@pengutronix.de>
Message-ID: <154447087143.17204.14938556723783178565@swboyd.mtv.corp.google.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 2/3] clk: imx6q: optionally get CCM inputs via standard clock handles
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181115143028.19087-1-l.stach@pengutronix.de> <20181115143028.19087-2-l.stach@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Mon, 10 Dec 2018 11:41:11 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lucas Stach (2018-11-15 06:30:27)
> When specifying external clock inputs to the CCM the current code
> requires the clocks to be in a "clocks" child node of the DT root.
> This is not really conformant with DT best practices.
>=20
> To avoid the need to deviate from those best practices, allow the
> clock inputs to be specified via standard clock handles. This is
> in line with how drivers of the later CCM driver revisions on
> newer i.MX SoCs handle this.
>=20
> As we can't retroactively change the DT binding, allow this as an
> option with a fallback to the old way of how this has been handled.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

