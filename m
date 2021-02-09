Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E6BC433E6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 00:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F08964E50
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 00:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbhBJA3J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 19:29:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234937AbhBJAG6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 19:06:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FD4A64E0D;
        Tue,  9 Feb 2021 23:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612915147;
        bh=dUdZ4FJi/o+qkXF8GQuhXnnTvzL4rizMwrQnyGj6dis=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aHTV8B+gi4RfxdyfWChMOWe10sP/aKI5jKYwAGoAKkjMNzRG2i/p7GWFVB2v7WpJc
         lf2SLCjiVvR4x3ruSjjErQJxJrXJSuk2+UOboYSmBgv9b337ccJ8ZjKMmDLq5sYaDU
         Akj2tk9oVbICwAkPG+gqZVl4RZZb9HUnhU8NLanTUb5ZJjWYhv4ESXC/p4gczp1XY4
         qz5Z9RQmf27IVXHST0Z3m1294IOGu+q94DV/pIiooGJfvjfilB718LhmIHnkY/jLN+
         8SeH4euN/Ghhif68IMk4e/H9G2UwyvqyB0/ShoOg/tb9eEaHjebD/94+6P25PrFSnP
         0H/4F2Yd1C5AQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com>
References: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 09 Feb 2021 15:59:05 -0800
Message-ID: <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2021-02-09 09:09:52)
> fwnode is an abstraction on the different types of firmware nodes.
> In order to allow clocks to be linked with any type of such node,
> start a conversion to the struct fwnode_handle instead of being
> stuck with struct device_node.

Is ACPI going to support clk hardware? We're "stuck" with device nodes
mostly because there isn't a clk framework for ACPI.
