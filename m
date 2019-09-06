Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E93C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8395208C3
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567791124;
	bh=ROPvMwvXtBE5KWErcYrY1l0Okjxnl7qkHNliYe5cHZg=;
	h=In-Reply-To:References:To:From:Subject:Date:List-ID:From;
	b=IK2ny/C7AvPs8ipyXb1qGoUZ+dX7uGntWgM8e4gRb0MFPH4/nkrGhenPsFEI+ktKs
	 FU+4E0ZMD3NeqoweIR+z5vM+S/RpjYFf9AX610e9P5t4rPiAUu1di6Ze9EDYUpPv99
	 Ev8oOIZxAa6Jriga4WjkZ6vaUGJ15iSVkB5285k0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390478AbfIFRcE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:32:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbfIFRcE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:32:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB6C9206A1;
        Fri,  6 Sep 2019 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567791123;
        bh=ROPvMwvXtBE5KWErcYrY1l0Okjxnl7qkHNliYe5cHZg=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=11VjID2yQics4zqINjUe7vNLY2qFf2lW8nf05gyftPx7PJm05ChSkc9RBhrWEhOnE
         gdaMg0t6/eKxvlNIgE5Wc8DupXzXNo7Unz9fwYWQpHPdna4EMWqwD963xbmfTt6y/P
         Wu32SMvAibuL87/FsqOTfYUnDBqSfnWs/ZOsqQYI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1561691950-42154-2-git-send-email-preid@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au> <1561691950-42154-2-git-send-email-preid@electromag.com.au>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        preid@electromag.com.au, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: cdce925: Add regulator documentation
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:32:02 -0700
Message-Id: <20190906173203.BB6C9206A1@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-06-27 20:19:09)
> The cdce925 has two separate supply pins. Document the bindings
> for them.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

Applied to clk-next

