Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F14C43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 19:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 974232077B
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550865056;
	bh=qqLAYFVt4Bd4GjOHC6EQcZOOy0/X2MyINJ4jgLHjpRI=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=j7ihKr+AnrXT+MguuYzaZSr1ESeQpVQoTG+IU14udjvGAbEzyzHaWBUFNuYXfTsnM
	 gwehhFCC9VpbS41VREl5WjtHdRUpHHPlO/e6hv5khzARlP7Ymr4QwKpzYlsYFuXLfk
	 zv7Ng070SFbJ5G44cGBFAb+IfOB9k2s5BpEdRWCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfBVTu4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 14:50:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:39602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbfBVTu4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 14:50:56 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67B432070D;
        Fri, 22 Feb 2019 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550865055;
        bh=qqLAYFVt4Bd4GjOHC6EQcZOOy0/X2MyINJ4jgLHjpRI=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=DH8dovr0q9qF5sRloo7eTzIccSuwsoWR/RFcmbuGSlAT5QIHgYmrMzpePKCmUYI5q
         ztOxA1TDvqB8U8od2Lfcp/gGOtTay9oTeZ/O+cCIhh8OR95hflAqQeZGqmYekz4jrE
         BPgluH3GjjLd3wXrGFA+bE1vkMCHH3sBHxa37K8o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
Message-ID: <155086505454.77512.10530464362384162696@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
Date:   Fri, 22 Feb 2019 11:50:54 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-01-15 01:15:11)
> Hi Stephen,
>=20
> As requested, this series gets rid of CLK_IS_BASIC flag usage from
> TI clock drivers.
>=20
> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a quick
> suspend/resume test on omap3/omap4/am5.
>=20

I'm looking at clk-next now that this is all merged in and I still see
one usage of CLK_IS_BASIC in the omap2 hwmod code.

arch/arm/mach-omap2/omap_hwmod.c:               if (__clk_get_flags(oh->_cl=
k) & CLK_IS_BASIC)

Can that also be removed? If not, what clk types are on this platform?
Maybe I can remove CLK_IS_BASIC from every clk type except for the ones
that this code is checking for.

