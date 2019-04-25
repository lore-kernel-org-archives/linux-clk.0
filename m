Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28EEC43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE06B2077C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556235876;
	bh=WY6LG+z5naSmq6Wmx0aKnLfTZ/oqvxKHvm6WtIJ5kRA=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=auBFasjJ6wnSCsQ7iFbKBKtzUnkal675rvLVfh5xQvKpUNHPW1F/T+DKIFBS0tPvG
	 dxnUy5Jz+2rOF2uCGJXm0QMANpBjHDR7IwTCfXFKkgwT3l6qOwFE3+TFuBxTcXRWWs
	 6xce+ueyf8INh8RdKr5rgxol/faNyVkqF8wNu+LY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbfDYXof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 19:44:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:58964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfDYXof (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 19:44:35 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6755206C1;
        Thu, 25 Apr 2019 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556235874;
        bh=WY6LG+z5naSmq6Wmx0aKnLfTZ/oqvxKHvm6WtIJ5kRA=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DuioGUJt/2YPCtwbbaffOJ6sjzQ0eWfGBLStVWwTTsTzkUsGcS+F1moRB5Zwg+jVl
         z9noqwZOwEnOG/dmk6UnJeVudNer4IqGGaDLVc8tYFKR/yM/UPsP0fNUy2r94ojiQ3
         y5lRBtgMJSsriuEUw7vl3Ly1XQibMsFhst46qKp0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1556188862-22546-3-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com> <1556188862-22546-3-git-send-email-sugaya.taichi@socionext.com>
Cc:     Takao Orito <orito.takao@socionext.com>,
        Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
        Shinji Kanematsu <kanematsu.shinji@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Sugaya Taichi <sugaya.taichi@socionext.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/3] clock: milbeaut: Add Milbeaut M10V clock controller
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sugaya Taichi <sugaya.taichi@socionext.com>
Message-ID: <155623587387.15276.14839487511493210076@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 16:44:33 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sugaya Taichi (2019-04-25 03:41:01)
> The M10V of the Milbeaut SoCs has an on-chip controller that derive
> mostly clocks from a single external clock, using PLLs, dividers,
> multiplexers and gates. Since the PLLs have already been started and
> will not stop / restart, they are fixed factor. The gates will be added
> in later patch (all of the gates are off state now).
>=20
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---

Applied to clk-next

