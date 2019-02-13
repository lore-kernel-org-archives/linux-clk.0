Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECE3C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03E972190A
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550080373;
	bh=Gihc3fmkYKu/C7mgar+ypPMVHeAY3PyKF6QaZhfNYYk=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=VhGXpR2VUmdmpfe3NJK2JaTnL8eu4EsAnVoUjB3eyfGSnUccKB4p/Yn8Hxc8q4wg/
	 U0KxZMhxo88fFp5zf68G3UGwukVPG0bx12sa+EZazABDnL+XhDD4dV+U10HEeLpZy5
	 vgRiDOjhxqClmO57MW0psG6wA8HL8DPsLdTBs88Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393386AbfBMRww (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:52:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:43306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391376AbfBMRww (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:52:52 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE5A02086C;
        Wed, 13 Feb 2019 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550080371;
        bh=Gihc3fmkYKu/C7mgar+ypPMVHeAY3PyKF6QaZhfNYYk=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=Uh256Um577Uxcyuq67gjHB3YDv7hYIyItqpKomHcH97lzzNVqxTnUeZ1nnGXPAUaa
         J25RkSh+hyREIkm6Ezx0xy8Zregz28KQUMHswVmzCOJnQSPm4DWpLBakuG2arXrwgN
         jLVcIYl7G4G4mjysHtZd4+UD4vwmzPeYqESxYQqM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
In-Reply-To: <20190208104519.2ix2ujxrpmhqrwlf@flea>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] Allwinner clock fixes for 5.0
Message-ID: <155008037100.115909.17240340756688940476@swboyd.mtv.corp.google.com>
References: <20190208104519.2ix2ujxrpmhqrwlf@flea>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:52:51 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-02-08 02:45:19)
> Hi Mike, Stephen,
>=20
> Please pull the following PR for the current release.
>=20

Ok. It's sort of late but I'll try to send it off this coming Friday.

