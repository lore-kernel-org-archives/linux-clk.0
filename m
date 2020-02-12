Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F89EC352A4
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 739B3206B6
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581550951;
	bh=CtykGB7VELsUvKq+SRSP+kNqfKeQ0TblH4V0at65M6A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=R+TBtn+vN+65qhFpUJgAFTzpiTLRiIo0XbxE4buKEJ7xNzsEkLGjJ0Swv3ZAqPVS2
	 CKDyoKBCl7bxO0sGS/agEIdW1fh6Qr/gqBaH1JOrkL1VCCDBfL3YxVbHBKHFnhxYbi
	 UNvJz/TO3sKDY8qsCldpOScR8h9dkTjAUkbCRq3c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgBLXmb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 18:42:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727117AbgBLXmb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 18:42:31 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C03E206B6;
        Wed, 12 Feb 2020 23:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581550950;
        bh=CtykGB7VELsUvKq+SRSP+kNqfKeQ0TblH4V0at65M6A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yKidZDZIGocrVjsy0mg9iEQfDJBsN6D9aybftS06zHyXna09x0HFID1OtGTclJca1
         ju4Q7tuRpcm2Vpp9nM55b0MLTBq+8UuphRxGQMKMiEJU1+YNRdjASMYa5iUpy4vNpG
         KZhSqzfdt3yB7XD7jrdCpPQ7F/qs7LZ+Fkzwsxp8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200114160726.19771-1-dinguyen@kernel.org>
References: <20200114160726.19771-1-dinguyen@kernel.org>
Subject: Re: [PATCH 1/2] clk: stratix10: use do_div() for 64-bit calculation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Wed, 12 Feb 2020 15:42:29 -0800
Message-ID: <158155094974.184098.16644399342547281259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-01-14 08:07:25)
> do_div() macro to perform u64 division and guards against overflow if
> the result is too large for the unsigned long return type.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
