Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF89C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FBDF64E56
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhBKTyw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:54:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:37714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230013AbhBKTyU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:54:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAFAA64E15;
        Thu, 11 Feb 2021 19:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073219;
        bh=mySAj0rc1TKfCcTW/kdtcW+UJkJdI1QF9wnVcQEy/G0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ev9BPNS+2hBNJhXSJRX9k147O9iIFMnAWXkiqL7tqLgWTcpPx0z7562Gt/GOOLpi6
         sZ49DdAMMJ9Yws1QPBtV+UyUc9wRwlC25oTOdIU5Z158PkPZuq8ylvzsVIy7qpWlDd
         4P8kJj2MNHW+YmwX0wgyLdwopAatf/MSzNodrlYz1sGyobWSOs66fC7OvFUn9UgAaE
         Rehoy889lL52uY3PkDNcx92uaSVpV7POMLZm460lB6LXiTxtNurl4R6z/l3Cf3AmNJ
         bJ4e6i0JZ38HOGDWxFE0wgYcxuyIeof0Yk5tFkneICZba36HD8LSn0YMEwCtaFYDFh
         tPTDCyxZAvPjw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-21-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-21-lee.jones@linaro.org>
Subject: Re: [PATCH 20/20] clk: zynq: clkc: Remove various instances of an unused variable 'clk'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?utf-8?q?S=C3=B6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:53:38 -0800
Message-ID: <161307321859.1254594.17981174719983685174@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:40)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/zynq/clkc.c: In function =E2=80=98zynq_clk_register_fclk=E2=
=80=99:
>  drivers/clk/zynq/clkc.c:106:14: warning: variable =E2=80=98clk=E2=80=99 =
set but not used [-Wunused-but-set-variable]
>  drivers/clk/zynq/clkc.c: In function =E2=80=98zynq_clk_register_periph_c=
lk=E2=80=99:
>  drivers/clk/zynq/clkc.c:179:14: warning: variable =E2=80=98clk=E2=80=99 =
set but not used [-Wunused-but-set-variable]
>  drivers/clk/zynq/clkc.c: In function =E2=80=98zynq_clk_setup=E2=80=99:
>  drivers/clk/zynq/clkc.c:220:14: warning: variable =E2=80=98clk=E2=80=99 =
set but not used [-Wunused-but-set-variable]
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
