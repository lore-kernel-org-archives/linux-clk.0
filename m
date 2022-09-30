Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C929AC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 22:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbiI3WPf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 18:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbiI3WPc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 18:15:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F58B3AB28
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 15:15:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2BF66B82A71
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 22:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9394C433C1;
        Fri, 30 Sep 2022 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664576128;
        bh=UG+f1dDRPpHvzbSoSeBJoPgEY+A9sXuQfL3xvhBYOgE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eE2RDOJ3IpWs/ezFIxegHaV+6zeB9xaWbDU2wi7rCv4CUI4YCUlR+9dVK3kJpVNFf
         uOR7p8FUEbuiN+1GCc+tId/2xuQTqZHprl8M02E1znNpPU5IjNlV9Q0ywIDXLKwrtD
         WTYbSfsk6VhuLEJH9Mow37Y38F1c8OakIxNDeqC+lLIOfxkmgtJvuzN1dItTIj9uAw
         AmioBliCaPcjaCfG/qk1+x7pd9Pdu2W0F8/Vb76fa8lld44FsAoecwOCtb91dMZDaJ
         OFF+i3IZojsxRI9V/Bq5K9ftu9mgR5oHqBxIQ1rXGGTmLUlEgXC5Hpw560CSEWHkqb
         aU6Z9PJa5UFIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220719094637.844946-1-lars@metafoo.de>
References: <20220719094637.844946-1-lars@metafoo.de>
Subject: Re: [PATCH 1/2] clk: vc5: Check IO access results
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 30 Sep 2022 15:15:26 -0700
User-Agent: alot/0.10
Message-Id: <20220930221528.C9394C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2022-07-19 02:46:36)
> The devices of the versaclk clock generator family use an I2C control bus.
> IO access on an I2C bus can fail for various reasons.
>=20
> The driver currently ignores the return value of most IO operations. This
> results in silent failure. To avoid this check the return value and in ca=
se
> of an error abort the operation and propagate the error code to the calle=
r.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
