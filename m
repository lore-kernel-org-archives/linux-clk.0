Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B9CC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 01:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34C63214C6
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 01:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545098084;
	bh=A+y/CrM43BZ3YcOatdxKgpr5Za0vAiDnD7LdkCU9ouQ=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=IH85rYRXUWxbHfE0GaTNOpwSmcR2xZKelW2+5nVtigJHCKdx2m7FTE/Uz07V88HnU
	 Xor1Fopre1Jtf5irnlte8vcU74xTXV68j1po2g3jjIDAmn0jVzZk+0PfrLUZ909sGu
	 MIEEtRSvMx/OANl5MYCLakJkxFBI/kobZ/4IiXCg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbeLRByn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 20:54:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:45356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbeLRByn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 20:54:43 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 022A0214C6;
        Tue, 18 Dec 2018 01:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545098083;
        bh=A+y/CrM43BZ3YcOatdxKgpr5Za0vAiDnD7LdkCU9ouQ=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=W1Rp2h6pPex1nUY4cN+olEH+KSuEuorunhj9goSwozP30bJTKNJ3uyLKAT2ZUx3Ix
         n4woNwaUtmDSjcrPPz4fP340Z6AZhCMBQl0VqLxmjsJ0jKUhfrp040Xns9UjtE128H
         D/BzODoPjyOVnOWzxMzRcNVeSX4VVCLScgE0t7N0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9af950b2-036c-6afd-e31d-7eb2799e56c9@kernel.org>
Subject: Re: [PATCH] clk: socfpga: Don't have get_parent for single parent ops
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20181204163257.32085-1-jbrunet@baylibre.com> <20181204193416.24661-1-sboyd@kernel.org> <154399427706.88331.4744072908182655454@swboyd.mtv.corp.google.com> <266a0a5d-5dfe-0e1c-276f-65163f1cef1b@kernel.org> <154402531604.88331.12202256691796911096@swboyd.mtv.corp.google.com> <9af950b2-036c-6afd-e31d-7eb2799e56c9@kernel.org>
Message-ID: <154509808233.19322.16971841121259793017@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 17 Dec 2018 17:54:42 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2018-12-06 07:16:47)
>=20
>=20
> On 12/5/18 9:55 AM, Stephen Boyd wrote:
> > Quoting Dinh Nguyen (2018-12-05 07:17:41)
> >> Hi Stephen,
> >>
> >> On 12/5/18 1:17 AM, Stephen Boyd wrote:
> >>> (Adding Dinh's korg email)
> >>>
> >>> I also wonder if this driver is even used anymore or maybe we can del=
ete
> >>> it?
> >>>
> >>
> >> The armv7 SoCFPGA platforms are using this driver.
> >>
> >=20
> > Ok and those platforms are booting in kernelci.org as
> > https://kernelci.org/boot/socfpga_cyclone5_de0_sockit/ perhaps?
> >=20
>=20
> Yes that's right.
>=20

Ok. Dinh, can you review this patch? Or test it out? Or do I need to get
someone in kernelci to try it out?

