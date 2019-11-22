Return-Path: <SRS0=tNAh=ZO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93870C432C0
	for <linux-clk@archiver.kernel.org>; Fri, 22 Nov 2019 17:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67C6A20714
	for <linux-clk@archiver.kernel.org>; Fri, 22 Nov 2019 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574442189;
	bh=jlTkGBmduhW5Z9IkQgZbzzr3Bts6Sjdcdm8LYUYHxC8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LEzrk/ocig4wKPtM9QtnfhAIZxDYhRrlmjLFd0q7PYhsO0tF1xIgjpnYlPPWlN6vW
	 TVGKvjsJhTo4AzHBr1faLxmqM1kmNytsxAR+QbUN5pYLp4OgaEb6ddTXZ1b8qRYAwL
	 xihHksRft9fVRoClJIBeJfIhLslW47FMs7KK4j8w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfKVRDJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Nov 2019 12:03:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:45188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbfKVRDI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Nov 2019 12:03:08 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A42D2068F;
        Fri, 22 Nov 2019 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574442188;
        bh=jlTkGBmduhW5Z9IkQgZbzzr3Bts6Sjdcdm8LYUYHxC8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=reFIdMAgahopPDn/2ncx0UBdxHzH3BHshBxB8Vb0y+rCZLh/jPHT6elYoKPN7Uat4
         AKxtrtY+hLuC6fR2QY5lqwSvW8UXDTloxro43jzY8bIj40aj6FLIU8/XHlTJulBFzV
         0hn8WxcjylMDhPN0ggP4bGD4xWFHqSmcuG/CngsQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191114001925.159276-1-sboyd@kernel.org>
References: <20191114001925.159276-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: ingenic: Allow drivers to be built with COMPILE_TEST
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 09:03:07 -0800
Message-Id: <20191122170308.3A42D2068F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-11-13 16:19:25)
> We don't need the MIPS architecture or even a MIPS compiler to compile
> test these drivers. Let's add a COMPILE_TEST possibility on the
> menuconfig here so that we can build these drivers on more
> configurations.
>=20
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

