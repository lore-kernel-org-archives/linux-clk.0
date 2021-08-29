Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42446C432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 07:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EFF860F36
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 07:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhH2HCd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:02:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2HCc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 03:02:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C18F1601FF;
        Sun, 29 Aug 2021 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220500;
        bh=agDUqis0epPq6/tYR+XVQgsr10DPF6Pta7l7x7TShFE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jSn8Hrv6PrwHs3arYP47nZhg5kpUMIzbHXld7/RmMPkk5Uzmh41LoBUhGNIUl49pw
         h4rdsrF1C/0fj/cQenjwVsHcfarw9H1f0RV43NAF/fgVPOI0FddP9zE19V69p8dgvh
         we+gvz82RHr3Jp0WA61XBTb4DZ8JqHogtzxfnIuRlTLlcOgGPIIyA1k8y2lCOETznT
         CKBNQOXaiK5nl/HL2H+iquVJVIV1h7tljGSUPvgl6a1YTLA+dFE6WFy/S5Ct+1fR05
         w1UUAYqgQ2aLrUjtNhWoGmVks4mezGgPck2pnakzqTmuU044szVBgQHPsvmthrmbEz
         Z46tWmNGnkKeg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210809223813.3766204-2-sean.anderson@seco.com>
References: <20210809223813.3766204-1-sean.anderson@seco.com> <20210809223813.3766204-2-sean.anderson@seco.com>
Subject: Re: [PATCH v7 2/3] clk: vc5: Use dev_err_probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:01:39 -0700
Message-ID: <163022049963.2676726.10468635098645692881@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2021-08-09 15:38:12)
> Convert uses of dev_err (+ return) to dev_err_probe.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---

Applied to clk-next
