Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76598C00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 03:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjJXDaW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 23:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbjJXDaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 23:30:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D161BD7D;
        Mon, 23 Oct 2023 20:30:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4ABC433C7;
        Tue, 24 Oct 2023 03:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698118215;
        bh=5757ZRY1gYQJ4UTUtBjnh/CeAcxG2frUh6o18xDOnRY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OkPGpDWgaBkHyJGw/OoWSqBPdBtxsecczehrPwMhbTaiQ4l1T5DVDnsHNDNa95yVt
         zudgIBeabwyWF8Feoju9zmrYKiO/NsHTNDbAHW14BRUt34PN90eTX1L6iBs7EH+NLV
         Yk23Si0svGaRu9LMN9hNMwEjeAfzpf8f6dIS8w+Ao0Qct3rfO1BbvrsC+0A9sOpeib
         U5PVft6d4ud1kVABOOqURiTye/5IFyU7DGBuCnHgIfBC8Lhr7RDpyeZgUnc/GLzcWv
         0SqRhYxOP0oDiaLgy127lHj3zf+rnWW/7fWjomcdXO2spRgwJZxfTcMRMqrTlhF0JU
         4lQzpbb0LKdXg==
Message-ID: <4027612d371dcb5c7dd2f48f9b74908b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230725004248.381868-1-samuel.holland@sifive.com>
References: <20230725004248.381868-1-samuel.holland@sifive.com>
Subject: Re: [PATCH v2 1/2] clk: analogbits: Allow building the library as a module
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Samuel Holland <samuel.holland@sifive.com>
Date:   Mon, 23 Oct 2023 20:30:13 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Samuel Holland (2023-07-24 17:42:47)
> This library is only used by the SiFive PRCI driver. When that driver is
> built as a module, it makes sense to build this library as a module too.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied to clk-next
