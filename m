Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2612C32750
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 00:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 841F820665
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 00:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565742296;
	bh=D7mlPpAl+IcMtvSR+DamEB7orF+KkGajGo7HlqYiiQ0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OXzBA0oaiYBKCyipeFe5Nv8pKTSaN5flLwbVK/UnC4LAXSyaMgMd4KciIEJ583QyZ
	 K/PrEsUvfW0TiBYBDR/jbvqxBDAt564XZc7/ELhK1Uk4c1zBy0QhImJj7DTysupKhe
	 SYmTFfSQxA2L7p/FVx9Yl59nNaxJj9LV9U7IGA3g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfHNAY4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 20:24:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfHNAY4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 20:24:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28F1120665;
        Wed, 14 Aug 2019 00:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565742295;
        bh=D7mlPpAl+IcMtvSR+DamEB7orF+KkGajGo7HlqYiiQ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WLoCIf9B/kBABsm7MiDoT1jLiV28L89XllXoLKilSgxzPJxXJa0rHdY9kI/nlzfEZ
         OHLrzx7olCb+GkUOrqjX5/nl9rhTPxGv8eYcIk+1T5xLGD8kOQ2hne9HLyUvmWK8yJ
         olRNRQvWdvwARU5zeIL2n0xrzmk2WnksVfVsWJHE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190731193517.237136-5-sboyd@kernel.org>
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-5-sboyd@kernel.org>
Subject: Re: [PATCH 4/9] clk: qcom: Don't reference clk_init_data after registration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 13 Aug 2019 17:24:54 -0700
Message-Id: <20190814002455.28F1120665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-07-31 12:35:12)
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>=20
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Andy Gross <agross@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

