Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CDCC76195
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 17:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjC0RuP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 13:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjC0RuO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 13:50:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8112106;
        Mon, 27 Mar 2023 10:50:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D06736145B;
        Mon, 27 Mar 2023 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33617C433D2;
        Mon, 27 Mar 2023 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939410;
        bh=iEBkCyHBRxCPsptsyJpeOitfV6bXqpS4Fosucz4PPqY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S4zS/LRqvNuad3gzhdGoUMi0IxO5La9gxAsZT+W90KTBeFjQD45whS84D8Q6fJaAS
         CGEP8OrbOPUAqGKL9U49Bve1B6TLL9QfKzlnoZKUhf0mXU1qRViFb3RHN/IQYqTpI9
         3NR+D9pbFYKz+mei794QfnxBFBzJt2eiLowszok0z0v/GPjsX/ubvPgFG4A4zveMvj
         c1M38EDfUc85CplkemXG8uLbkGjMYV89kq2cvUD7qpC+UmhPd5rTuaKsSYesmQHD6d
         nOxWTsrg/Gl8wfWBfgMQ/gGhJSWNOdmnt53GBoPMwWc6KDFyn9GR+YDqCSLEeAStAD
         h+FeSsaGxiCPQ==
Message-ID: <ed6ca4e15fe718116d0d22347e5c3c80.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118191521.15544-2-marex@denx.de>
References: <20230118191521.15544-1-marex@denx.de> <20230118191521.15544-2-marex@denx.de>
Subject: Re: [PATCH v3 2/2] clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 27 Mar 2023 10:50:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-01-18 11:15:21)
> Add driver for the Skyworks Si521xx PCIe clock generators. Supported mode=
ls
> are Si52144/Si52146/Si52147, tested model is Si52144. It should be possib=
le
> to add Si5213x series as well.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
