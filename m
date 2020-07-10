Return-Path: <SRS0=4xLm=AV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F029AC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jul 2020 23:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCC982077D
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jul 2020 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594424731;
	bh=TSlabevax9vgsluwWsa9bxwUwSSauvPa6NxNc7de55M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=UsrXoM0AawhQH9wccV5JwRDsD0Dez/OIkjm94f6W1WOrEyQwp2KP9r57FcUuC8Mc6
	 PjinLDyrHo3xWp5CrIG2cLd8eGcXkbF39GSz+GR3VD76tLzckphnX1Et9VOzaUSQcm
	 jeAgjYIRLFdjwinZgsS7HEW2PavbWgB7AcHIcicM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgGJXpb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jul 2020 19:45:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726671AbgGJXpa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jul 2020 19:45:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F5CB206A1;
        Fri, 10 Jul 2020 23:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594424730;
        bh=TSlabevax9vgsluwWsa9bxwUwSSauvPa6NxNc7de55M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xxwyj+ubsvUhVxe1V0srgIlYlIgpf6hVkh/Zssn+LkQaQE9cluP5KYjcYT8Gz+Ubj
         3eHnHHqQwNSnsC64EXZJSRdsZ1BnsaML1kJtShWBNcElf+R104DAZ1sF/czZIQqZIJ
         518uVPapWZ69Imh8JTkhzW3G33hJj4M63bBcPgyA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594311873-8683-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1594311873-8683-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 2/2] clk: zynqmp: Fix a memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        git-dev@xilinx.com, linux-clk@vger.kernel.org
Date:   Fri, 10 Jul 2020 16:45:29 -0700
Message-ID: <159442472982.1987609.15250280355379459281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2020-07-09 09:24:33)
> Fix a memory leak of mux.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Any Fixes: tag?

> ---
>  drivers/clk/zynqmp/clk-mux-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
