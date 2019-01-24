Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2242DC282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 22:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD839218D9
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548368288;
	bh=2q61rjfHLgndwILZQOjqmJa+dAWjEnAkWd1PD7BZosc=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=lkN7pe25P2YjzbnTazoSV13uGjbUsS13ksqDfYJhvjWUjcO2udd/rKeMQ/p0VADLw
	 ctnQTb6Ioq8yJ5l2UVmmZi9cnkRkBHQok5t5fxZfTLH90HTBE4p45cdM434v2fWX1v
	 RXtHN/WXACFdj2tL6AfnUymjMfLWd4nCPxVl2+3Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfAXWSI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 17:18:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:36022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfAXWSI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 17:18:08 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C4A3218D0;
        Thu, 24 Jan 2019 22:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548368287;
        bh=2q61rjfHLgndwILZQOjqmJa+dAWjEnAkWd1PD7BZosc=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=Eck/fGdD3qT8SmHpYB0vdWkBHyVLnmB9AN36uxZPz29sHTQT/jGdyy4ER9frlfwqc
         /C8sjtNvOIJoAJm9q2Smpcy42TACr1qCFrPiOfn7vVdJhDKarjAaXnoa7W8ujCie3q
         LQRv+K/8S7rhRidciOtwIgqWrkkDvY/kb9TZJrdc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: samsung: fix typo
References: <20190104214826.29519-1-mcroce@redhat.com>
User-Agent: alot/0.8
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190104214826.29519-1-mcroce@redhat.com>
Message-ID: <154836828666.136743.622751457008173570@swboyd.mtv.corp.google.com>
To:     Matteo Croce <mcroce@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 24 Jan 2019 14:18:06 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matteo Croce (2019-01-04 13:48:26)
> Fix spelling mistake: "lenght" -> "length"
>=20
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> ---

Applied to clk-next

