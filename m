Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5990FC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E32E61613
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhF1DI4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:08:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:33078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231815AbhF1DI4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:08:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AF7561984;
        Mon, 28 Jun 2021 03:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849591;
        bh=Yol1WOyGdtl/K8uUJab1YEArblm92Sqcuc9K8JBBW4I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JjY6XSXAE+cupCXZnKscqpfFUwSfYnQmnluEydVuiBhaTGmFb8S1P20VhrQ5NlNn8
         GAF6lWLQtVV1RcqAlCj3tuPzq8XaQc0AqhrypIjcjq16X529Mp4kLMXUANEQ+Nj9vs
         vXCJi7ruE14akEc+vXjmGaMU8ENtQ/GgBQSsIoN0oX39F6revzJsecWLZuornsKwN4
         rMzXFeQ4ljIEYp37YeYG/LpRRLoWbB6eS0IpLh3c5w9yUwKfqdQSAor6bFd5nCQfYO
         B5emQzEDw+8xMkXQXm0Dqir3RZcZGBi2bc2p1R7SBzinPSVKkubljLjL5H/woE/QhT
         55n8WgSODSLQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616498973-47067-3-git-send-email-gengdongjiu1@gmail.com>
References: <1616498973-47067-1-git-send-email-gengdongjiu1@gmail.com> <1616498973-47067-3-git-send-email-gengdongjiu1@gmail.com>
Subject: Re: [PATCH v8 2/2] clk: hisilicon: Add clock driver for hi3559A SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>
To:     devicetree@vger.kernel.org, gengdongjiu1@gmail.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Sun, 27 Jun 2021 20:06:30 -0700
Message-ID: <162484959011.2516444.7382814724138856354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dongjiu Geng (2021-03-23 04:29:33)
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>=20
> Add clock drivers for hi3559A SoC, this driver
> controls the SoC registers to supply different
> clocks to different IPs in the SoC.
>=20
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---

Applied to clk-next
