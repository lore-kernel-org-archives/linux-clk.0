Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044CCC43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4D0E20878
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550822586;
	bh=RicdjWSA+G9qBUgR2bL/JC/oMLgNOjuxLyLIQUJg+q0=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=YRaS7QuHlFBnpnnLDKTTLFEn0xWT4iwhSNcWE6rvWZKc+wk3L0IOdr5DzFkDAQbIK
	 Dt2mT2pvYxoAIXjJF0mO+X3LOgnAfqOR3dStcK98AO4HimHlgRQDkXbKu06lGdWjEL
	 9TkiSbU9JDZb0+oQijaZaV3q95odhpifkfWtNhNs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfBVIDB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 03:03:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:42624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfBVIDB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 03:03:01 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B599320818;
        Fri, 22 Feb 2019 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550822580;
        bh=RicdjWSA+G9qBUgR2bL/JC/oMLgNOjuxLyLIQUJg+q0=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=UvizMhpK0/J9P6SC8vjyGuw1CyEp6rtXLstzYat7hMArbrSR2cOVknErRVd/xzfoL
         hYJzMwIJpxib5RPqxUHYdEWBrZdiWZ4JG4iaWjoLR3ntU26d7DbXFGkE28+xe5xpb1
         J+NTJ45K3qq8QJj5WM780G/nhIihWfYqeQ8OqH1U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/6] clk: actions: Add configurable PLL delay
Message-ID: <155082258002.77512.8979526306640099690@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org> <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        afaerber@suse.de, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Fri, 22 Feb 2019 00:03:00 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-01-14 19:33:35)
> S500 SoC requires configurable delay for different PLLs. Hence, add
> a separate macro for declaring a PLL with configurable delay and also
> modify the existing OWL_PLL_NO_PARENT macro to use default delay so
> that no need to modify the existing S700/S900 drivers.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next

