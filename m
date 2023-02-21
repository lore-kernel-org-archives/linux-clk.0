Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9F7C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 22:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBUWjN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 17:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjBUWjM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 17:39:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0ED32E7B
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 14:38:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7434B80F01
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 22:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70001C433D2;
        Tue, 21 Feb 2023 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677019037;
        bh=//oNQAJ0v8bPCZUQEbAdD/q93hvPwkCNsqrz6uPqInc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BiBSeZfrPmVMx9krG+QIjpu1a47FtgLlatsAyNyWkv4XKpdsqZhA7SdOmSlfjWNNC
         6EhyaGb8FJCoDFktdkg0cZMZTXdEDYFJio5jxriWGR78Lb1XT3ZKuaaZvIqM/x0FPN
         trR1vMEPeuDgxMy0QWwF1Mctk8gBPwvoqw0JjGrn67F33Jlvilc4vjmhWvB38u4pZD
         2lLK3K+7voY96UM40DVfFVTLzXD99+G9fdbh9YGW6/Up4gAxwdlXjWuKbzRPNWyLi2
         jxHhDecAbFXD8gmRNqsP+RwMfXFLaWja4HCJbI2wdBIIZugsm4ncvK97/WcgsIWB7y
         iTZixRv7mVdKQ==
Message-ID: <502c532ed6dfa9da0fbe3760f3e90eb8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e5d7afd3-2e1a-ad5a-a455-8882fae9cc47@gmail.com>
References: <e5d7afd3-2e1a-ad5a-a455-8882fae9cc47@gmail.com>
Subject: Re: [PATCH] clk: add devm_add_clk_disable_unprepare
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Tue, 21 Feb 2023 14:37:15 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiner Kallweit (2023-02-18 14:58:54)
> I'm aware that there have been numerous rejected attempts to add a
> devm_clk_prepare_enable(). The advice I've seen was:

See devm_clk_get_optional_enabled()

> If you need this functionality, use devm_add_action_or_reset().
> As a result lots of callers implemented their own action wrapper for
> clk_disable_unprepare(). Just one example: dw8250_clk_disable_unprepare
> This can be avoided with a little bit of cast magic, as used by few
> drivers already.
> Helper devm_add_clk_disable_unprepare() is supposed to reduce the
> code duplication caused by all these individual wrappers.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
