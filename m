Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF36C10F14
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59DB12075B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555015280;
	bh=iUG93rEwjau9iO4ygIK55CfqQTZgMkWN6io2r8HZ+OA=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=sQayCI7ZWoYODraYX51dpkeU9eOmwR2N3hfT81r0lrUeSDucXc36knc6IVrTNYDlY
	 ZBSrJBaUIspatnJdqKoLNim8WMnyr5DiRJ7A5ZEn7WtijPrdoNWpBx69KZTsyGcrCt
	 PXUx2yLTygOzULPb0WFW1FsQGmgVkI7rnpDNxqfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfDKUlP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:41:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbfDKUlO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:41:14 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D50BA2184B;
        Thu, 11 Apr 2019 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555015273;
        bh=iUG93rEwjau9iO4ygIK55CfqQTZgMkWN6io2r8HZ+OA=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=errk3Lo9CDUFil8Lv/wZ17uJIkT54XXyTo7bPS/XtdhiYK3jesiHaDNr6u/Xz1nDP
         ssJbAOdKb4AC+vogYf6YQF9Y3wyxY6VBU4UpDcysSeLdqM0jh5mCzRNF9o0BppekZk
         wpMp8oyZwm4rGirdlTFwyddK3WfndYkDPL0f+eVw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319140536.27945-2-paul@crapouillou.net>
References: <20190319140536.27945-1-paul@crapouillou.net> <20190319140536.27945-2-paul@crapouillou.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: ingenic: jz4725b: Add UDC PHY clock
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>
Message-ID: <155501527313.20095.14993764415449049274@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:41:13 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2019-03-19 07:05:36)
> Add clock for the USB Device Controller PHY.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next

