Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7433BC43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:32:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D82C208C3
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567791128;
	bh=nnQz2sGlwFSIgIh2/tAaiNcTw64H4mNgTYudw8L484o=;
	h=In-Reply-To:References:To:From:Subject:Date:List-ID:From;
	b=kiQo1ekuPqJ0ytvXGCWLAd9dx1YoTscYJ8GQndy2n5xAPkeAGrnfTbwnPRvxOt29o
	 1eIWdh0KmHqCz2n9+baF20Jjc2FFtn7RKVASJjWUu3HTDSFFQZrs+fUNogYikgdLpB
	 NU4kHK6UKCISff0t2qwPcZoWjQZ9i7luCphOFIMw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390880AbfIFRcI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:32:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:38598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbfIFRcH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:32:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 50491206A1;
        Fri,  6 Sep 2019 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567791127;
        bh=nnQz2sGlwFSIgIh2/tAaiNcTw64H4mNgTYudw8L484o=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=l1AP+M+RJCMrytb9ugR2J0kVzGiZwwalJENtQCPN63S/m8eK2fb6ZRGNtHZl74Fi3
         YZjOWolqlZg7BKpKh27kucFBydDoFkH+t6l9hxX+Q+e2PyUOzSndd1c4VF+hU/9YxX
         fz+gmHzEo8EDAQM56hbYv8dNmcGa3EslqvPckIGs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1561691950-42154-3-git-send-email-preid@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au> <1561691950-42154-3-git-send-email-preid@electromag.com.au>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        preid@electromag.com.au, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: clk-cdce925: Add regulator support
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:32:06 -0700
Message-Id: <20190906173207.50491206A1@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-06-27 20:19:10)
> The cdce925 power supplies could be controllable on some platforms.
> Enable them before communicating with the cdce925.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

Applied to clk-next

