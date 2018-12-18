Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B3DC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3905121871
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545156156;
	bh=XS2Iq1EE7xmM1VcdA+EDxDbufNmjZCIgGKzAgmBU4kU=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=d87DAAPBAaIBbl00bz62MwvLp8vPFCZ6jKyQTf4bl5AOsC0GlmefSVRcXCiWWlDqb
	 O+P8yRvs7x328EakCaXkgFm2ldyE9cB+jEohNYbjgVLCuId+jgxGVVWFCjXBAk5PG7
	 gP2fHP0RaErD1/Jq+GebWxED/Bm+4jb7X4T3bpRk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbeLRSCg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:02:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbeLRSCf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:02:35 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21A5621873;
        Tue, 18 Dec 2018 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545156155;
        bh=XS2Iq1EE7xmM1VcdA+EDxDbufNmjZCIgGKzAgmBU4kU=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=lFiq+egOnuIrwZDlfNjKi3rfSZasfA3AAA/1wuXAnam+qloR2jgH3q5liJFki6x6w
         U6uPi9vNvGb1maOPf/fD7MLy7wDtMk/hzEt4P1tSvLbBCkcQptIIpG+Ux5j699TKTU
         PvqUkO6z6jVM5KoQidffDcs8sniVXPLzuY9IOzhA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-7-josephl@nvidia.com>
Message-ID: <154515615441.238328.4772784503885584522@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-7-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 06/20] clk: tegra: dfll: CVB calculation alignment with the regulator
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:02:34 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:18)
> The CVB table contains calibration data for the CPU DFLL based on
> process characterization. The regulator step and offset parameters depend
> on the regulator supplying vdd-cpu, not on the specific Tegra SKU.
>=20
> When using a PWM controlled regulator, the voltage step and offset are
> determined by the regulator type in use. This is specified in DT. When
> using an I2C controlled regulator, we can retrieve them from CPU regulator
> Then pass this information to the CVB table calculation function.
>=20
> Based on the work done of "Peter De Schrijver <pdeschrijver@nvidia.com>"
> and "Alex Frid <afrid@nvidia.com>".
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

