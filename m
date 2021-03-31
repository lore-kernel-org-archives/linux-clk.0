Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75703C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E099619D8
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhCaCcG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Mar 2021 22:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233410AbhCaCb5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Mar 2021 22:31:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15DB7619C5;
        Wed, 31 Mar 2021 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617157917;
        bh=4mZ4TlGbfXlzEhrpbM8SPL2JdEzjfPwlKgKzkD43eF4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zr2sF7IoXuNKSP7rJOgIc808WqRM7LkftWiF7zJOnWqvv8Vv99Gg6U+Bl8tl+DVuC
         EQq3eIgdFCWwxw2MiDZarPSDHLlHvgZYinjLpgoLBSGKwSoDf78+/r320y/ncLlnNl
         blVS9+Wjet2iY0qcFzMNELZP/HJ+WAh/0RB9utHLbI7nBkjOPqwgr7KFs2wCHuDQlW
         4ljGephLEmKrHVgW8bdsIQyQsCivVYQepE4YPUGdzOJa3v5uIwRw9vK5dyx8mktDQI
         o+29YyDoZ4w11fOdZGBziM5eViKjex0Xp+juyoKvWU+loLtgsxBBNlx5NsM+VVTwBV
         Ut7ub3VtTZChg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210302214151.1333447-2-dinguyen@kernel.org>
References: <20210302214151.1333447-1-dinguyen@kernel.org> <20210302214151.1333447-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/3] clk: socfpga: arria10: convert to use clk_hw
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 30 Mar 2021 19:31:55 -0700
Message-ID: <161715791598.2260335.17297036127669746582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-03-02 13:41:50)
> As recommended by Stephen Boyd, convert the Arria10 clock driver to use
> the clk_hw registration method.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
