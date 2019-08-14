Return-Path: <SRS0=2ArH=WK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E7EC32750
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 00:25:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A1F420844
	for <linux-clk@archiver.kernel.org>; Wed, 14 Aug 2019 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565742310;
	bh=9ymCfTnOKA7fydJEwi+1ybdfqazuP6HSmN2McK+7i+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=XxNtTSsoeQKgqjm+Sc+sXUTox2VezkSEvFlO7KFj45lI0A5tJhg+xBZjmS3/vbIZs
	 7whqHciul40O81Mnu5CC8Kv0INhN0efFSn0qI97ybNq/oNrJSUrl7uiPSC/+zXcONK
	 myg73A8jVJFjyHB342MXnNAT+pLcSP4eU8SnXFPo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfHNAZJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 20:25:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfHNAZJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 20:25:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8513D20665;
        Wed, 14 Aug 2019 00:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565742308;
        bh=9ymCfTnOKA7fydJEwi+1ybdfqazuP6HSmN2McK+7i+c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cd/Vj9HDsDj0XAFZnsyBJYWNpwkadBTaCYDpDkuTMHgrWOYRAB71eb7bin5h/jJfd
         IkvxIfc7az//LAjxFKpGE6YuOhlqgWrMhncv1gZtxcFIZcnpvjitWIdjk8qHaILus9
         Tz3kUoHxj2jfWz2rNbO8+8UOJgk9rZ+YyRKVUZI4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190731193517.237136-7-sboyd@kernel.org>
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-7-sboyd@kernel.org>
Subject: Re: [PATCH 6/9] clk: socfpga: Don't reference clk_init_data after registration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Dinh Nguyen <dinguyen@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 13 Aug 2019 17:25:07 -0700
Message-Id: <20190814002508.8513D20665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2019-07-31 12:35:14)
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>=20
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

