Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2439FC2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D202A2158C
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600803976;
	bh=pBlTkuNhobC76L72n6qoj8asFV3R1OY/PaKo/WqRK60=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=yesJNvHgsIRa8849BDRoLViyfjMi+GBs+kXNMJ9D2hhsdBRNNPn/QJxTMXUrpNBBA
	 e+qXEsNNAzFw7CEGn8Gm+a2N5zi75EElxBUSWFePWWwHwSOayo2KLaRU8fJlaycNhL
	 B/o8dEqIZ7byDkNtNOBYbp+uoDxpWiDVViDOHKUA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVTqQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:46:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVTqQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:46:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4E152084C;
        Tue, 22 Sep 2020 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600803976;
        bh=pBlTkuNhobC76L72n6qoj8asFV3R1OY/PaKo/WqRK60=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ab8GmwLwnhSgebopoOOncnZuF7i9APoLQ74aKIbshWZuuGnxWEs8ATurH5E+D1bVH
         LawcKVLX1riXRQRXvmIyEswPGVxDyy+CaccpzjIqbiDAMrowlWRe1JfcWXlcunTOkS
         30perUZyiIBr4ET52PuxGkgyZsn5E/dOiAoSmGu4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200915020950.4688-1-yuehaibing@huawei.com>
References: <20200915020950.4688-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: socfpga: agilex: Remove unused variable 'cntr_mux'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     dinguyen@kernel.org, mturquette@baylibre.com, yuehaibing@huawei.com
Date:   Tue, 22 Sep 2020 12:46:14 -0700
Message-ID: <160080397454.310579.9907944126510751682@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2020-09-14 19:09:50)
> drivers/clk/socfpga/clk-agilex.c:24:37: warning: =E2=80=98cntr_mux=E2=80=
=99 defined but not used [-Wunused-const-variable=3D]
>  static const struct clk_parent_data cntr_mux[] =3D {
>                                      ^~~~~~~~
>=20
> There is no caller in tree, so can remove it.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next
