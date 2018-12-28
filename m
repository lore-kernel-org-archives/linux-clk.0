Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D6C43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58D1C20675
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546024952;
	bh=A9zjn2QfT9jykFi+gy5nC18d8QF7fTaQ4VNSxKAIcNI=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=f/05o+fn7dsYsWAiZU8SubQJ1CkJOtSw3AWLijiyEJ1QcB9eKq8S39/vIDY9zWGKK
	 pmUAPWF27E8wf65yjBnutPsY6CN3DMd01XuSgvnDiiMjJf+kmxsmA72w6GKJZLSKmU
	 sTJpGlvKnb/4k1SBtbBD84ZWy6bwFRPA5vcU6RFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732044AbeL1TWb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 14:22:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:52256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbeL1TWb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 14:22:31 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00D1520675;
        Fri, 28 Dec 2018 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546024951;
        bh=A9zjn2QfT9jykFi+gy5nC18d8QF7fTaQ4VNSxKAIcNI=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=omChSWokYwGhEczZLOrYMsRE4VJXBqR8zQi5zBrkvy1PTXMgxXtok2tU4ibyucDg3
         vtfAETWKMZAEW85R/0Q6tUfZu9wcxzPJQJshcfn67gaOe1EdpwNUdlwGf6u28XAzLz
         mBekWHKFvvB6qKg+EPbw2Ztva7d4CJME34VV+5XQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Yangtao Li <tiny.windzz@gmail.com>, mturquette@baylibre.com
Message-ID: <154602495028.179992.12226187107911687645@swboyd.mtv.corp.google.com>
References: <20181226131442.4462-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH] clk: qoriq: fix refcount leak in clockgen_init()
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <20181226131442.4462-1-tiny.windzz@gmail.com>
Date:   Fri, 28 Dec 2018 11:22:30 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:14:42)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Applied to clk-next

