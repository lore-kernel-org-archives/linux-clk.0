Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B60BC4727C
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5662A23600
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600801657;
	bh=k3AY4xiVKzdMo94OTDSd61+F+ugh2rG2QE3WMwuqBZ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=NEEsOFkQ4pw6644mdQ+G3hCuxLCObVoKHayqy4D4s20hSYnZrMUv+wCxNdk/AnQNt
	 PjYafklau67E06I1rvgzy4yP8ojgf0R08X8/Z+YZ8WTpDbwotfDWl3renADj6jruud
	 UnCM6EQtTZSc7u9FcpomUicTTGx0GHLu15uQZGTw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVTHc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:07:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVTHb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:07:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 656622311C;
        Tue, 22 Sep 2020 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600801651;
        bh=k3AY4xiVKzdMo94OTDSd61+F+ugh2rG2QE3WMwuqBZ4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B0KLkGRkwJ/hH7sCjBG6h2GkT62TVOrlsmL7+K1CkJYbp+vOZhb4/QSU4A68K/7I+
         9t5fFjrhYOcYVh8NU76XtYf+v79qRgs/4hGHJeTeBZImfMLFdx3hbBB1m2K3FC0iWL
         8gq1Hxryll2Bm8vRQ9gxtCSCv8Xv6+IIgknUua08=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMS8qEUNGV5YgAc1D054JToe2ybPX8o4kPC8zgDc1=O0cqY0_A@mail.gmail.com>
References: <20200922120909.97203-1-konradybcio@gmail.com> <160079963957.310579.17971187414769458107@swboyd.mtv.corp.google.com> <CAMS8qEUNGV5YgAc1D054JToe2ybPX8o4kPC8zgDc1=O0cqY0_A@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Fix wrong parent_map
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 22 Sep 2020 12:07:30 -0700
Message-ID: <160080165013.310579.5646553601425176923@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2020-09-22 11:35:14)
> Sheesh, I cannot stop forgetting these...
>=20
> Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
> driver for SDM660)
>=20

Ok. Applied to clk-next.
