Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDA8C43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 396B020869
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546026358;
	bh=24su2YgXUiCMLNJO5xFR0tKK3uFVeOjMSek2EzujDBY=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=NLQnQ44Xy/l2HWdQSisFI2bNbZwyVpue8VJQUrGKKwHhwMkEJp7bx2XPx5BkQ48DD
	 9q0cmdqaD3hQ15/IzKW9HAz8HYG53zdHsPMjE0Zn8oqXIS6F9L5iLkBbcZdc9cWOr/
	 4buo0WCJDKfJsJiMfasXYOmXszrcS3/fWN8YC2yI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387898AbeL1Tp5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 14:45:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:37840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729815AbeL1Tp5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 14:45:57 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1F1020866;
        Fri, 28 Dec 2018 19:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546026357;
        bh=24su2YgXUiCMLNJO5xFR0tKK3uFVeOjMSek2EzujDBY=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=mc2bjEl01kpEnq/LEIYBpvQOo57OeyH9So+SvNlfXCkaVHRJT5MN/kF9IOq69LuOM
         hP8dI6Pnro+JIwfRMCxiUe3m2zZwYcZ7jm4lwzVIRSpAcvj6JCRraSQOZ3MxVywwF5
         lcUG3BQ5dh5S3BSmwqgIeQ+ABqq8XvQcKBQPJUrc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Yangtao Li <tiny.windzz@gmail.com>, gregory.clement@bootlin.com,
        mturquette@baylibre.com
Message-ID: <154602635627.179992.4595472057298041512@swboyd.mtv.corp.google.com>
References: <20181226134805.5447-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH] clk: mv98dx3236: fix refcount leak in mv98dx3236_clk_init()
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <20181226134805.5447-1-tiny.windzz@gmail.com>
Date:   Fri, 28 Dec 2018 11:45:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:48:05)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Applied to clk-next

