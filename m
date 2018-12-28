Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4332BC43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A12820869
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546024901;
	bh=bVh4E/igX3RWcIPHEap67iQKLmT2dFBAn+/2D1VK3Ig=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=UTM+etFiC0Moi33QuTA5mAlRidEw7QL7nmL9rEis0G2DM+qYpjIC7Vl8EvzQ8rVz1
	 d3kj11ljz/e1DJDfQQK3+FzFVHCH+eChWT5hDvx7gS8qEXisDOX4Bv5wovFYCFCLOv
	 JnWUpD8e8W8W59qzHOQcYegW8yB0l5HM5P8heP1E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731539AbeL1TVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 14:21:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbeL1TVk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 14:21:40 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0A1F20869;
        Fri, 28 Dec 2018 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546024899;
        bh=bVh4E/igX3RWcIPHEap67iQKLmT2dFBAn+/2D1VK3Ig=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=jcj+SNU5cfqkJXO8Ef6miADLnrkdGALB1cYdg0feXI5UlDALN9a0DRsKjCTNrqia9
         +YAtnDgcWSBUvZMBmSox3C6/b4mxH2FbNEiGxQ6TPE9kwFRfYHHXUOHKsPnyK0PlTS
         pPcaNAMVwQC/3NUjn5ZcKIhcY+2zzDSe9+jW7tPs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Yangtao Li <tiny.windzz@gmail.com>, mturquette@baylibre.com
Message-ID: <154602489883.179992.17248507970741282608@swboyd.mtv.corp.google.com>
References: <20181226131001.4285-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH] clk: highbank: fix refcount leak in hb_clk_init()
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <20181226131001.4285-1-tiny.windzz@gmail.com>
Date:   Fri, 28 Dec 2018 11:21:38 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:10:01)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Applied to clk-next

