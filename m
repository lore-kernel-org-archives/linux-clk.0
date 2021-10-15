Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4598C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 01:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B208F61167
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 01:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhJOBDC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 21:03:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:39736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhJOBDC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Oct 2021 21:03:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77DEC61151;
        Fri, 15 Oct 2021 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259656;
        bh=lGUI9wH5/guP38rhybog+cuLjuWEL/ojIBB1mkKpTzc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E9aTpY7cyvQ/HO3wrh/PHh9E49R8xJb1zTZipV6A5hJ4sePKxQyt5DUaXl3uo0hah
         yyLqctxZgSqacFPUh6SU/+AHHf2Wwp0xZgNGsPGU9EdDsDJakw7icE6TenKdrwGKXO
         sh490MUjSU+0oGBX4uOm5c/MFlvE7gQz1uIg0I5xQ2SvnosgqvrzYr6hJf3I421zJ7
         Mddd820ZDVuuPpruJIVr98tSvEAptdwsuScnOtSg+E6PU6+wb2XnY4N7+k8Pzo82rT
         TJa0xFpJ6mmzGRJtlI0IhTi70k17Kktxkm4LUvoEerr5E2jTJtPhtPtZVI0CUNYLqx
         j0EQzTI1Jq+sA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210901180833.4558932d@endymion>
References: <20210901180833.4558932d@endymion>
Subject: Re: [PATCH 1/2] clk: versatile: Rename ICST to CLK_ICST
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
To:     Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org
Date:   Thu, 14 Oct 2021 18:00:55 -0700
Message-ID: <163425965520.1688384.4803949954545071072@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jean Delvare (2021-09-01 09:08:33)
> For consistency, prefix the ICST config option with CLK as all other
> clock source drivers have.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
