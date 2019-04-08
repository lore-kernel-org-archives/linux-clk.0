Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D6AC10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 20:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A33D2148E
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554754358;
	bh=g4bO8v2UP3YEdIEgMgrotlGpLG4j0/B5hvlmYf6SHrY=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=e+SLeqBf5mNfEwHFKYY9uklJzJ5DEopiT5BvydIg+esy5UMPQr/79CodoSl0LoIOk
	 FqdmPgTYgcVZSCdc0OzSGmNuU8auigKGz8oI2r9zbs5M0V0BtVEhX0EooV6kwDnfml
	 XI+LjJtWzkjHYKX54v1jx6h59RUiD1DBDkvSu1rw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfDHUMi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 16:12:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:36992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbfDHUMh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Apr 2019 16:12:37 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4851C2084F;
        Mon,  8 Apr 2019 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554754357;
        bh=g4bO8v2UP3YEdIEgMgrotlGpLG4j0/B5hvlmYf6SHrY=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=z8CxYuQt05iDTjya+Pt27E5lgJ6Af0nPzpWxY8bXDo/a0MbhwXVEGdtAh9YsBdVjB
         0vPo0Co1epFU9HdmeEU5+XXFNMB/dyreI6DbwlEL6vEfZKlMBlaxT9EEAGpi8tDBPg
         /yeDXN3+hc2a3DzB9WMqmmaJxVchBhUaz94V7J/o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190408102039.6366-2-jonas.gorski@gmail.com>
References: <20190408102039.6366-1-jonas.gorski@gmail.com> <20190408102039.6366-2-jonas.gorski@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFC/RFT 1/6] clk: core: add support for generic big endian accesses
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155475435645.20095.12989201302431823558@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Mon, 08 Apr 2019 13:12:36 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-08 03:20:34)
> Add a generic flag to mark a clock as big endian register based, and add
> accessors following these.

I like the idea of getting rid of clk_readl() and clk_writel(), but I'd
rather see that this flag is per-basic clk type instead of global to all
clks. Mostly because I don't see it as a clk property that's applicable
in general. So we would either have a flag for dividers and gates that
goes into the respective CLK_{GATE,DIVIDER}_* flag space, or some
wrapper functions like:

	clk_gate_register_be()
	clk_divider_register_be()

that passes this information through to the basic clk types somehow.
Then if there's no other user left of clk_readl() and clk_writel() I'd
just slam in a patch to all the files that use it to convert them to
readl() and writel(). After that, it would be great to drop the io.h
include from clk-provider.h and push that include out to any code that's
relying on it implicitly.

