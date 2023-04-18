Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548BDC77B75
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 00:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjDRAnn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 20:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDRAnn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 20:43:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AAC40C8
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 17:43:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D546C626E8
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 00:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3644EC433EF;
        Tue, 18 Apr 2023 00:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681778621;
        bh=WyTN1SVmCUgcBWIU3zVdmBtwortcfKwOWfGzLzCromo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Su3twf9VRMoM+6TpeVompWUF43PV0cg/ZLtzB63KQEOLx/+nBwoRrNQ1UCW5CrzCj
         QQ5xsbtWQoEiauQGkYFuOL2yFf5ESEcDHJVtsN60ckVeo8go8BI0W6jPqD8s9oVL3g
         bnRe9s/gCulFE9MtN80p6VsLvwrALyLcryahO+H2l0dJg8X9FjhlSf7koCMX2pDZOC
         yop/ZlYb9tAgVPiAq4and6+57K9vfNI6eUtZukUf1IZLhfJ5vtNQiEM5pOd4/DX33I
         7R8PmAGNi+i2SBw4LevsJarxdmK2i0axWnT1WvuNLFHu6NVMatdWEAtg6qZgUfsxOR
         u2P+RsdGA8KJw==
Message-ID: <efc9ee0c7c790566d242a2561ac55a55.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3935914a-bf12-1040-10d2-c7a94465b37f@gmail.com>
References: <4eb4755b-7a06-6cd9-7c9d-6d088d05ab19@gmail.com> <f336e108d8651f1e317fae39dc058966.sboyd@kernel.org> <3935914a-bf12-1040-10d2-c7a94465b37f@gmail.com>
Subject: Re: [PATCH] clk: change clk_hw_create_clk() to avoid being unable to remove module
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 17 Apr 2023 17:43:39 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiner Kallweit (2023-04-13 23:01:13)
> On 14.04.2023 00:29, Stephen Boyd wrote:
> > Quoting Heiner Kallweit (2023-04-13 14:39:28)
> >> With clk_hw_create_clk() we have the problem that module unloading
> >> is impossible if consumer and provider module owner are the same and
> >> refcount is incremented. See also following comment in __clk_register(=
).
> >=20
> > Do you never call clk_put() on the clk that you get from
> > clk_hw_create_clk()?
>=20
> In my case clk_put() is called from a devm release hook. Same issue
> we'd have if clk_put would be called from the drivers remove callback.
> clk_put would be unreachable because the incremented module refcount
> prevents module removal.
>=20

Ok. You could unbind the device in sysfs though, right?
