Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDFAC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7671161A1D
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:54:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhF1C5M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 22:57:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231984AbhF1C5M (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 22:57:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 963F561A2B;
        Mon, 28 Jun 2021 02:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848887;
        bh=ipU8Hezd19fZfZiFQ4PnhNNeu8J5CoLEi+ZlO2vIjwE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bXFqWHvGRD5Iu8mVM2wKLOXEEVhXcsNSvyBiCO5D8AP7TQv2hdO2uT60sFqYqz/gv
         guIddqisMQj+O1udOKKavZ93a37fbSqYjYIHAa+uf/7XrW9vYbXqdkW0O9a9ou3+3H
         ehFjfNBQZr75BR6YgcJbJnzCAi/OTlx8e/BEYUcjohDJFUSlwAp6GjkSKhwl4062I0
         jRZ6CR8tUWGsMfq/tvGfQaogi93g/hBj6jJcN2+UunQNU3VAcaR+0yx5mOfx2R+4ft
         3IPlEN5JWPGXOrjfdYEGhd70y6ktcgHUwZBh/nUPJfN6EwB3mY/CoqwNVT30SKbK1R
         coIuyq72XnNeQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210331201632.24530-3-avolmat@me.com>
References: <20210331201632.24530-1-avolmat@me.com> <20210331201632.24530-3-avolmat@me.com>
Subject: Re: [PATCH v4 2/7] clk: st: flexgen: embed soc clock outputs within compatible data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
To:     Alain Volmat <avolmat@me.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Jun 2021 19:54:46 -0700
Message-ID: <162484888641.2516444.2579159588901457586@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alain Volmat (2021-03-31 13:16:27)
> In order to avoid relying on the old style description via the DT
> clock-output-names, add compatible data describing the flexgen
> outputs clocks for all STiH407/STiH410 and STiH418 SOCs.
>=20
> In order to ease transition between the two methods, this commit
> introduce the new compatible without removing the old method.
> Once DTs will be fixed, the method relying on DT clock-output-names
> will be removed from this driver as well as old compatibles.
>=20
> Signed-off-by: Alain Volmat <avolmat@me.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---

Applied to clk-next
