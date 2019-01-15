Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C76C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32EED20657
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547585916;
	bh=Rx0qiZtog8BCPjZLAX5LDzkG2UCKKjd17i/blePRzxU=;
	h=Subject:In-Reply-To:References:Cc:To:From:Date:List-ID:From;
	b=rk5G9MFTaMAjWgANaKxf8uWACaVNSDVtr5Z6yq3y//fXN7nYXOFz7wNUWNZtzMPbw
	 60QNwkMEKl/7z9uM/HPrZp/lzybS+7pZaVPmNbuv5NVu6SRkD4b8AZmQ6nV8KoYvHw
	 cJjjtGPwxZEWwCJTXbntEbNgdNNmy8yUkdrdxO5Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730109AbfAOU6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 15:58:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:48336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730050AbfAOU6f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Jan 2019 15:58:35 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0435220657;
        Tue, 15 Jan 2019 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547585915;
        bh=Rx0qiZtog8BCPjZLAX5LDzkG2UCKKjd17i/blePRzxU=;
        h=Subject:In-Reply-To:References:Cc:To:From:Date:From;
        b=UlnTuxM843fmOAsHUbEZAkBRCsLQmphssvTH8VhrK2TbMaV5BRamEk/0fmJv3mbQ8
         UttoNPX8l1GmhERcLxFXOWkQM6v01WnPoMWKPgIB/XUCjtLsLqHKrBW1wnw1AlL27R
         zqE84OPdmc1ojuvIZrLp+a4VBzD5pqS+waO2G3rY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 1/2] clk: socfpga: stratix10: fix naming convention for the fixed-clocks
User-Agent: alot/0.8
In-Reply-To: <178e0501-5e75-20b0-4650-08b1d0e80f3e@kernel.org>
References: <20190102145932.26423-1-dinguyen@kernel.org> <178e0501-5e75-20b0-4650-08b1d0e80f3e@kernel.org>
Cc:     mturquette@baylibre.com, linux-stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Message-ID: <154758591408.169631.9077378038122404988@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 15 Jan 2019 12:58:34 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2019-01-14 07:45:57)
> Hi Stephen,
>=20
> You've already applied 2/2 of this patch series[1] to clk-fixes, but can
> you also apply this patch as well?
>=20

Hmm ok.
