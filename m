Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D9BC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3DEF20836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550785718;
	bh=gXPgVC1drdiwat/q9UpDLdfvvZBzgovUIIFissx019M=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=Oo3tFtRpGxZMBTYS1qjbXQ/7JDkjJ9sOSFpIz3RKO6cZaFBSYJUSw51zDV/ZK+vIK
	 tnTtMc+/Kr5Z9jtB88vOF9CM29nL792klbt9Kbscpb80K9Wjifsp3KZQ/CuHEzip0l
	 GVkG4//O1c7rn0XjA0d3yjpcxRwOBmSuIazEMddw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfBUVsh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 16:48:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfBUVsh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 16:48:37 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D81BE2080F;
        Thu, 21 Feb 2019 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550785717;
        bh=gXPgVC1drdiwat/q9UpDLdfvvZBzgovUIIFissx019M=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=haxSBo1kbhH2pk2D/DATWbxAAka+KJdg6yd+DQg/gVtUfrc1nW8yIb4vLIMWG0Osf
         hgRBFr4ZBjD6mibmO4YnJckBn1da4k2h83sacUxEpvts7BDRCZcJ4/NRjT8ZY95RDw
         nJtdjkX+K+qlp6oNBkfVDBoQhhuJF5OFIelGmcnU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] clk: ti: updates for v5.1
Message-ID: <155078571607.77512.12268241822646115038@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <64201386-3f8d-6f0b-3e4a-447a78722a41@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <64201386-3f8d-6f0b-3e4a-447a78722a41@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>
Date:   Thu, 21 Feb 2019 13:48:36 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-02-15 11:18:11)
> Hi Stephen, Mike,
>=20
> Please pull these late TI clock driver changes towards v5.1 merge=20
> window. Contains one patch against hwmod core, which has been acked by=20
> the maintainer.
>=20

Thanks. Pulled into clk-next.
