Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32092C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4F93238A1
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600804775;
	bh=ko86j4eJVn/gqX1GowgA/ZepwfEpTucQ77XDZkPwucU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=h/Fgtq5jjoJo5YoLi2Pr+2J2a4ddJRo4FoT4j1sfYT9tTcrrEv+qBSf0h2iRpyMUi
	 dB3XSZUAwRbK/S9Ehi/2pQLAbRHRnHtTwU3TRC+EMfQU+iDOcSU/2mCWreKp9YpyEY
	 HKabcaiKH14k4/KLTu0wQtL9Dra3Y1R9bEsavV0c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIVT7e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:59:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVT7e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:59:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B718221E8;
        Tue, 22 Sep 2020 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804773;
        bh=ko86j4eJVn/gqX1GowgA/ZepwfEpTucQ77XDZkPwucU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BsFx2w2ERwj/4fd2OPsoOVbjjbtig9ux3fOx0p6aJ+wFulOupGW2c9p0MQb7a9zyB
         HE2ANBrx0ev/RHtBx98azFBSenxF6stYmmD2FEYN2w24MGyeu2rEdNf2qvmhieecgi
         IAXP9dYHigU3buULJ+3T+PTG/9cTXBndAwqkCBa4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907085740.1083-4-t-kristo@ti.com>
References: <20200907085740.1083-1-t-kristo@ti.com> <20200907085740.1083-4-t-kristo@ti.com>
Subject: Re: [PATCH 3/3] clk: keystone: sci-clk: add 10% slack to set_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, ssantosh@kernel.org
Date:   Tue, 22 Sep 2020 12:59:32 -0700
Message-ID: <160080477208.310579.10011892284968417590@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:57:40)
> Currently, we request exact clock rates from the firmware to be set with
> set_rate. Due to some rounding errors and internal functionality of the
> firmware itself, this can fail. Thus, add some slack to the set_rate
> functionality so that we are always guaranteed to pass. The firmware
> always attempts to use frequency as close to the target freq as
> possible despite the slack given here.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
