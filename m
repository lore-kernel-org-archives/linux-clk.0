Return-Path: <SRS0=2OLx=EH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF0C2D0A3
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 09:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48D78207F7
	for <linux-clk@archiver.kernel.org>; Sun,  1 Nov 2020 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604222398;
	bh=0cz0N/T/rsg+3fv6C8LRYNPJTOKtFsw4AUUJWmA54Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vxogV39KFJeHQj3fU24ZWB15QAzm5Q3fUh2/WHesdPcZWsJBE1nKcIndHMxhI3RdU
	 6PftH+NAQ1YgDg+47GIfg8sEVjBkN9Miag2hDTIjOUewbioICTdOV0iO9XFeCO6V5y
	 qcJTUKgF1zyUmohTdewQWMzultHOByJ4jXPhiiDM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgKAJT5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Nov 2020 04:19:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:54232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgKAJTx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 1 Nov 2020 04:19:53 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FDF6207F7;
        Sun,  1 Nov 2020 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604222392;
        bh=0cz0N/T/rsg+3fv6C8LRYNPJTOKtFsw4AUUJWmA54Fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+qwWLhwfwEweqpq4o0RqHkGe2+zhOT75WI+Zcoy/3qtEii+FL8I4UBp/O8hFWbFj
         GRGwdPJf1JIxY4iq1gYDcLMoaTigDnKWK2uO3qJaN2jQhekoZzLIwu/tHqisUu7oR3
         0FhYaefBcvVSEbHAYLsLNxiyGgK8khClr/G7W3c8=
Date:   Sun, 1 Nov 2020 17:19:46 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     trix@redhat.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, abel.vesa@nxp.com, peng.fan@nxp.com,
        leonard.crestez@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: remove unneeded semicolon
Message-ID: <20201101091945.GM31601@dragon>
References: <20201027185756.1586607-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027185756.1586607-1-trix@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 27, 2020 at 11:57:56AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A semicolon is not needed after a switch statement.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied, thanks.
