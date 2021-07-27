Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65252C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 00:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4790F60F59
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 00:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhG0AQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jul 2021 20:16:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhG0AQM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Jul 2021 20:16:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C99760F41;
        Tue, 27 Jul 2021 00:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627347400;
        bh=2qUREOeWSvtuqiz6a8kcSyj8sZ54CbOSGOPUZeg3FJE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HqPP76VZAkzpjP8cp9vrwG36OnheH/six19yurcfvRRSeJGXvX0yX2gu5aBoGcDnP
         08sqlzoFdJiib69hYoki+ozG+KKSIwwIOnD0edLKeQuPQNqlaVkFROG65zeOcfppmH
         egz5Kx05D+cqestoPW4bIgwl/f//6kODurgMIWixMBiIMJ4e68GBY9K5Ey+zdCf2s8
         CuiTLcXMacvsAbHWnZfub9TN4pQN+GkP2ZHcIl4RihJAlei4E0F2tFWPWqrAemmQpa
         d5Y5E7Q2MAg4VOC6NKiaV5LWN1D9nwFsorOGB8+ORGB5U3Rb16l5LB8I40q1mYPH1i
         IRdxNzQZL5GBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210713144621.605140-2-dinguyen@kernel.org>
References: <20210713144621.605140-1-dinguyen@kernel.org> <20210713144621.605140-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/3] clk: socfpga: agilex: fix up s2f_user0_clk representation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        stable@vger.kernel.org, Kris Chaplin <kris.chaplin@intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Mon, 26 Jul 2021 17:56:39 -0700
Message-ID: <162734739900.2368309.17470062376743652251@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-07-13 07:46:20)
> Correct the s2f_user0_mux clock representation.
>=20
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the Agil=
ex platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kris Chaplin <kris.chaplin@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
