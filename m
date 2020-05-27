Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F98C433E1
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD56920873
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 02:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590546152;
	bh=XFj2FYxJwpMCpHcymXaEBTI70gtbDqiofK8eitG2gNw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=V5L/hu3BOAtcBta2O2iZlH3gzG1ZVzy2CNHBmB+DS9i0WaC1KeRArhtgES+GPoHbt
	 3VJ+DGFr46OF+oQdCyN3gfyQhpjaYcniYsrEKh5SRKJIwYR8/wYS+lBhUXnbdTmJR7
	 99jamTQ7/RoDZQ8H31SPiBB4qVh5XlpnwWLN5yjo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgE0CW2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 22:22:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:37530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgE0CW2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 22:22:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79E6020873;
        Wed, 27 May 2020 02:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590546147;
        bh=XFj2FYxJwpMCpHcymXaEBTI70gtbDqiofK8eitG2gNw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PGbEws5OwOS5k0QgQGgs3bh3zZlurDDYLlzy9kvrOZ76JDBOae61Cbt0jaiDdJ9t2
         zuD+qR9fBbBiTxTJRNnlRF/1/y+nALxNTfvvhB3vqhzl4J7AUd7iAAg3aXxE4uqKTB
         YByfvkDuPOoN93Go3CtoaobhJQzoITP2Vz9kMHQw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589709861-27580-4-git-send-email-tdas@codeaurora.org>
References: <1589709861-27580-1-git-send-email-tdas@codeaurora.org> <1589709861-27580-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: gcc: Add support for Secure control source clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 26 May 2020 19:22:26 -0700
Message-ID: <159054614686.88029.846996129102829207@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2020-05-17 03:04:21)
> The secure controller driver requires to request for various frequencies
> on the source clock, thus add support for the same.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
