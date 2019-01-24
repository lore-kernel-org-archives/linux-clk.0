Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBE1C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 22:53:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09D422082C
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548370411;
	bh=Ui8ZWE7fN8CO+55PYO5U9MRQwmgytGmRGnEAGiLEfRU=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=vRqNJ/uCCbR6iRwPZY/MgmcTi13jX7jymyZHNkXOjva6znWIuJC3ca8IG5v3ZiBVB
	 60SIzMlv6RGQzFZDqdz2wQO+znZuKq2H2pjubVgIfkbg9prUz0kOCSYF5SwLS/94PC
	 hE5u2iLQcvzu9ELYLBvvd5RtcZ9UuOKhWW1aVkkw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfAXWx0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 17:53:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:53586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfAXWxZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 17:53:25 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 178992082C;
        Thu, 24 Jan 2019 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548370405;
        bh=Ui8ZWE7fN8CO+55PYO5U9MRQwmgytGmRGnEAGiLEfRU=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=e9rEqo8FnQTh+81Ljd9OmDML8Ldn/iTpRadoyLuTWZxYlW9Bd+rp8FE/iBELgaquI
         PghDdhEmHSWQQK8AYB43W29CR0A1pwzyJOoYkueAiVcJoGZYfe1fL+8VXPWQpLZbfe
         2GTDVlBuBhfVBfwH5VAGUQdwRbWBxmR7f29pUCPs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: clock: Convert fixed-factor-clock to json-schema
References: <20190110221903.3990-5-robh@kernel.org>
User-Agent: alot/0.8
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190110221903.3990-5-robh@kernel.org>
Message-ID: <154837040437.136743.156861248604123188@swboyd.mtv.corp.google.com>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date:   Thu, 24 Jan 2019 14:53:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rob Herring (2019-01-10 14:19:02)
> Convert the fixed-factor-clock binding to DT schema format using
> json-schema.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

