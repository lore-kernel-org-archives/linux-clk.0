Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74654C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 20:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41EEE2075C
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547067277;
	bh=HSeCMvTH6PLAAF+r7riqCq7inEl1zE1eZWUhepenRog=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=L1cyDaHryHqVLkKafsvkZQsjB57u4FqzC7SBprrJVd59LCneEPDdw6ulo19/IUgy7
	 hC3BILkTTCeEyWgJF0qXBk0iga7fH93bOd1XCF0qadICwTuyN6MUDhMpvsyQKYlbME
	 zxxBIB8wH8tmeGkKbCsvcAZ45ihuduiNjYAGxWPo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfAIUyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 15:54:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:56372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727306AbfAIUyg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 15:54:36 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 093F2206B7;
        Wed,  9 Jan 2019 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547067276;
        bh=HSeCMvTH6PLAAF+r7riqCq7inEl1zE1eZWUhepenRog=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=XCobdS4Et/YKZKrQzuoJfS1wa21HoOYntZBtOKDmEqjLwH2pGunoQCrTehENgwxFH
         qNUS71TFnbkGyVBtCB1GGtYks7IjtKokRRuZScosT+9jkizTHrndJesSpHKVeaIORQ
         fWaEngixiJ1TFOA3qZ/qHud2C+dwL2J6uEE/eYPE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: clps711x: Remove board support
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Shiyan <shc_work@mail.ru>
To:     Alexander Shiyan <shc_work@mail.ru>, linux-clk@vger.kernel.org
In-Reply-To: <20181220085433.20334-1-shc_work@mail.ru>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181220085433.20334-1-shc_work@mail.ru>
Message-ID: <154706727514.15366.12152773576581167845@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 12:54:35 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Shiyan (2018-12-20 00:54:33)
> Since board support for the CLPS711X platform was removed,
> remove the board support from the clk-clps711x driver.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---

Applied to clk-next

