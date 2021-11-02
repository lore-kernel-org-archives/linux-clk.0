Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161CBC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  2 Nov 2021 21:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5CE761053
	for <linux-clk@archiver.kernel.org>; Tue,  2 Nov 2021 21:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhKBVcB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Nov 2021 17:32:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230293AbhKBVcA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Nov 2021 17:32:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F01A6109F;
        Tue,  2 Nov 2021 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635888565;
        bh=O4WVtdw7MsxzfwooYBUbadKfmOZgiZoMvGON25O6IsU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iUOBQAik+nvY2oxxYQcONVchJZnU9B3d7+jiHo+UnKfY5OfceXPBpNrlRV8e4ifWL
         SvSM+Mo7q/opCl9Gjd6hfc7cAh8WDS78EUFeerjqBLEsLQ/6hBou57gVSKMETTg3Zh
         qpeM//blz07eelPvTrZ858JHJUHyBwrZgtHFnSOL2HPjlzAsEOvZMAW3zByoMzPp/h
         qA8mkL+Ls4P0cYxhoMKiiOfmrCdHNMCzxbPQ4xcKGwNk06UW/juvhnbH1iimk5eNvk
         vZ5l5SKqSy/nb6nMlJDTQp5FLaGOjY43VBqa9CLKZ+0YpaFHAtx4ZTRf7ZdMsqRZLm
         jIkNdHRktS8OQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913074823.115212-1-renner@efe-gmbh.de>
References: <20210913074823.115212-1-renner@efe-gmbh.de>
Subject: Re: [PATCH] clk: si5351: Update datasheet references
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, renner@efe-gmbh.de
To:     Jens Renner <renner@efe-gmbh.de>, linux-clk@vger.kernel.org
Date:   Tue, 02 Nov 2021 14:29:24 -0700
Message-ID: <163588856413.2993099.815260009572277675@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jens Renner (2021-09-13 00:48:23)
> Silicon Labs is now part of Skyworks Inc. so update the URLs to the
> datasheet and application note.
>=20
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---

Applied to clk-next
