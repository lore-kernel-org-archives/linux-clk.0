Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA80C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC8882086D
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544730570;
	bh=fm5UmYkgQ6WRq/+JmcaPnDTkmmGVN7qkhKj9RuF9Krc=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=H6133PH5erGvkelpOJDUmOaqyRrhBLFdfH7xznJ1Dt8QGaIJwg1LxVogugbbUFQBx
	 v284Z8DlBpWmp7Q8LI3yVt41v0o4H+9XwBVqaO8i0PPUwlqyJDtrpXvf6CMFK4Ekz+
	 KICHQHhNo2N0RYVRfO2E/AGkWUaVmUIovnKsCYR0=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8882086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbeLMTt3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 14:49:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:35624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728023AbeLMTt3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 14:49:29 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96A302086D;
        Thu, 13 Dec 2018 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544730568;
        bh=fm5UmYkgQ6WRq/+JmcaPnDTkmmGVN7qkhKj9RuF9Krc=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=rmXNSUQWBIuILonEx+9loVLA/KQ6YGWZm0Fv6BwWV/gWw2xFQaxpfS0qF/wQmRIcH
         /GB0yw8iuL6jVmUfn3HrOblOFUaP6uOtofzCgpifL9r3/S1UkYZsdn+prGWUEKkZJn
         MndbWJmEAkcuvH9O4j9Ux/nC1y38yF2xzfcccJAE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181206215858.3880-7-sboyd@kernel.org>
Subject: Re: [PATCH 6/8] clk: versatile: sp810: Remove usage of CLK_IS_BASIC
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20181206215858.3880-1-sboyd@kernel.org> <20181206215858.3880-7-sboyd@kernel.org>
Message-ID: <154473056792.19322.17686768139057371781@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Dec 2018 11:49:27 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2018-12-06 13:58:56)
> This flag doesn't look to be used by any code, just set in the clk init
> structure and then never tested again. Remove it from this driver as it
> doesn't provide any benefit.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

