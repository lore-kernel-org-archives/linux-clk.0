Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AF7C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 04:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3367E20723
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 04:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590725251;
	bh=UZKGsMHoRTCUxYj44XYyE1RuxSoMSD6kQH1W+kIDIhU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=GfJvVZmgoOjkcpAa96oV4IeJcWpYw4/16Yp6Kt69ga5LJFNXJtvKwSZPHsX5YJdO7
	 tUtq0o2gt24tr1OEYVEHEegoDAj4oOatzLGlqQZjqdeyXtc1VShWb2SBmi89oeOlYi
	 6JJ5exMDEPowwctjB+IaqMcsjsDWuwTF2MvbDcY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgE2EH3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 00:07:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgE2EH1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 May 2020 00:07:27 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22B7620723;
        Fri, 29 May 2020 04:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590725247;
        bh=UZKGsMHoRTCUxYj44XYyE1RuxSoMSD6kQH1W+kIDIhU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uODfEoK4QcZIZYSfP0ytkPrcmiCmgeSYmg46w3rpGlhqR9RbvjK5ga4rTg1QyyGib
         HaZ3SQrU3Smz/dn3dgf63RE4B8sY0ieuzM/vHaOdxJuPi8GPSrk6XGJCcU74pyApVh
         u2KJ8jFL+zb3rjqca/OCNTA8c1VYaAD2kvzrefJY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200311134115.13257-3-Eugeniy.Paltsev@synopsys.com>
References: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com> <20200311134115.13257-3-Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 2/3] CLK: HSDK: CGU: support PLL bypassing
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 28 May 2020 21:07:26 -0700
Message-ID: <159072524643.69627.17142536778465322331@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Eugeniy Paltsev (2020-03-11 06:41:14)
> Support setting PLL to bypass mode to support output frequency
> equal to input one.
>=20
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---

Applied to clk-next
