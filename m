Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAA2C48BD6
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D64A320883
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 21:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561499672;
	bh=dztdrZPzf7vyV4Xy6KCFp9Vc0IyqRQ3F7G6u1wNJE9M=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=m8x6OH8v4UNxzQuL77f45H1scZ8FOj8u+9ZXBt2H8QBvXLx7psylFSXeE5qN3wjuo
	 7zrVY1wbw3jFyuV2PzMPjWiqCJCfMR6uhMy8f+JtlI/XILvwY6RuidZ6cDdJQ3mJVd
	 JErPOo7k9P+Rg8kaM85QVpy50GAUgc6a4BA0bebs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFYVyc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 17:54:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfFYVyc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 17:54:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ED6A2080C;
        Tue, 25 Jun 2019 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561499671;
        bh=dztdrZPzf7vyV4Xy6KCFp9Vc0IyqRQ3F7G6u1wNJE9M=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=nlEQHXhMxxE+g/R3LryK8Clyd4JwHRYeLZECcK+r9B3MfJt+2ERzecWVoYkHNNzSZ
         I2xkm+UbtRRpi1zczZJGggytqfCpRjhMLbBM5CNG/GyHZw2W6QWBsVD8ZTKa2Yz/R2
         gK6yD9I7OhthE+2G2TinIGN7yq95tUb2vVP919f4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <82d6e1d63959ecb23bdcd363e93a27d08eee6859.1560164542.git.leonard.crestez@nxp.com>
References: <82d6e1d63959ecb23bdcd363e93a27d08eee6859.1560164542.git.leonard.crestez@nxp.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Leonard Crestez <leonard.crestez@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: Add clk_parent entry in debugfs
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:54:30 -0700
Message-Id: <20190625215431.9ED6A2080C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-06-10 04:06:38)
> This allows to easily determine the parent in shell scripts without
> parsing more complex files.
>=20
> Add the clk_parent file for all clks which can have a parent, not just
> muxes. This way it can be used to determine the clk tree structure
> without parsing more complex files.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>=20
> ---

Applied to clk-next

