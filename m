Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBC8C43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C5A62077C
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 23:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556235859;
	bh=p+ILp1FzrlhcubzbtdTYn+bFuS1poZ52CTIZ5+oY4Hs=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=KQ5w4JCFiuCjV7vB6+bwgnLe4Z/4GKkeVGTn2IDthQWc+eRM9lgi9PAlQPbdyqQN+
	 ayxUl50uaVOcF7nwGa/nuoRro96s/lwr34vzVK4LmsJmTK+gPJ3DqMRqXIiWRJScql
	 s4Y/OVXrn6AIfPiIBb9vR7/Uc//h/v/eYbGGwMR0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfDYXoS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 19:44:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbfDYXoS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 19:44:18 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C877D206C1;
        Thu, 25 Apr 2019 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556235857;
        bh=p+ILp1FzrlhcubzbtdTYn+bFuS1poZ52CTIZ5+oY4Hs=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=q26HyubJK/I3tR9AIy1VXT27On/CJCHDGTTfmiAOoiU46Vtv45pEKglMxxHvjnEqu
         LGxaGmOn81lYqS1XagVq9J4s8czzGnhSsAa1swu4IL3Qjgf1tFVfxlpKmRVDAEjYg3
         GExddhCw/4JyuNH3b3IO/TMwjR6BmM9yDK8VjlGQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1556188862-22546-2-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com> <1556188862-22546-2-git-send-email-sugaya.taichi@socionext.com>
Cc:     Takao Orito <orito.takao@socionext.com>,
        Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
        Shinji Kanematsu <kanematsu.shinji@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Sugaya Taichi <sugaya.taichi@socionext.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: milbeaut: add Milbeaut clock description
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sugaya Taichi <sugaya.taichi@socionext.com>
Message-ID: <155623585676.15276.9805099483132406926@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 16:44:16 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sugaya Taichi (2019-04-25 03:41:00)
> Add DT bindings document for Milbeaut clock.
>=20
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---

Applied to clk-next

