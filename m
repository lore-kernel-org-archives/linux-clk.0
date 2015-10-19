Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:36561 "EHLO
	smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbbJSI3K (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2015 04:29:10 -0400
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com [209.85.223.178])
	(Authenticated sender: b93043)
	by smtp.csie.ntu.edu.tw (Postfix) with ESMTPSA id 7225821CD5
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2015 16:29:07 +0800 (CST)
Received: by iofz202 with SMTP id z202so37701460iof.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2015 01:29:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445242139-20965-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1445242139-20965-1-git-send-email-maxime.ripard@free-electrons.com>
 <1445242139-20965-3-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 Oct 2015 16:28:43 +0800
Message-ID: <CAGb2v67c_xkL0b3JXCw7LvnKU8_pYiNRZPWuHXgHMDa9QFoyXQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clk: sunxi: Add a driver for the PLL2
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 19, 2015 at 4:08 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The PLL2 on the A10 and later SoCs is the clock used for all the audio
> related operations.
>
> This clock has a somewhat complex output tree, with three outputs (2X, 4X
> and 8X) with a fixed divider from the base clock, and an output (1X) with a
> post divider.
>
> However, we can simplify things since the 1X divider can be fixed, and we
> end up by having a base clock not exposed to any device (or at least
> directly, since the 4X output doesn't have any divider), and 4 fixed
> divider clocks that will be exposed.
>
> This clock seems to have been introduced, at least in this form, in the
> revision B of the A10, but we don't have any information on the clock used
> on the revision A.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
