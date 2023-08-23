Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C553C3DA6F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Aug 2023 22:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjHWWs7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Aug 2023 18:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbjHWWsh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 18:48:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6687CF1;
        Wed, 23 Aug 2023 15:48:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F79563DA3;
        Wed, 23 Aug 2023 22:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8E8C433C8;
        Wed, 23 Aug 2023 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692830914;
        bh=IhgjCMkYI3n71u3LVYb6mEPmDb3r+oz+bDBe6Sa4pwM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W2d/MxyJVeSzdKDSMu8I9yhHgONxWP9TYV8bKL8sn/lrtJh0bB3yLl0HjV+9KY55d
         gtFvaJnlRv1vBufV6zXDPRmbpn8/OL5EWqO2hguiv20Bc+7ZLBhDwp5uS4f0agrsqL
         KriURdxLxmrPniovEkMeZCUtGpjuKJETr1Ej1qNNCDV7pkPPWy3eg8pA/+R1ZqM7xn
         MlzADOcR6g38hSi0N6xTlpXaOJLDhNg1LQuDmYq1AhQcpsq5A+3jh2tkHES63PQarY
         44hGk7yIlEsEFAlNh82IVCB6xo3Ah5oLM7FhqUI+4A90akzkKQSFs+EwmjjnEyxKq/
         ao6BPxcvcxkKw==
Message-ID: <fe6fc1b91515cb9a57fef6234cbcf372.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230802064100.15793-1-mike.looijmans@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.05b2cfbe-0414-4869-b825-034b9be5bf9a@emailsignatures365.codetwo.com> <20230802064100.15793-1-mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/3] clk: lmk04832: Set missing parent_names for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        Mike Looijmans <mike.looijmans@topic.nl>
To:     Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org
Date:   Wed, 23 Aug 2023 15:48:32 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mike Looijmans (2023-08-01 23:40:58)
> lmk04832_register_clkout forgot to fill in the parent_names, resulting
> in the error message "Must specify parents if num_parents > 0".
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---

Applied to clk-next
