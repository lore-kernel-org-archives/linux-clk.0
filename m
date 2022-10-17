Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F89AC4167D
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiJQXJq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 19:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbiJQXJ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 19:09:26 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C67A857D4;
        Mon, 17 Oct 2022 16:09:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 452D7CE1911;
        Mon, 17 Oct 2022 23:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79080C433C1;
        Mon, 17 Oct 2022 23:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666048078;
        bh=TYpn+ocE3jRDrV+M5IWSpU59Tk3PCzhOISYQqLftsRs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IYKzvItjlkeW/ebXE2FcS/jtVu9u0ah5kmy2nIDz5slYhjuGkkuw40hYf50MnjFDe
         3UJunz7+FPUtW2BlXyec2bic4OuZrb94tBxk8Oqu0fCScetJvHKtZp+/YpFzBAHAPG
         6IJHBWiYPiQBtCROIqB8zbC0k3rDYeBUvUXuADr28jxPS8CpvC7gXMFaIMEsonELBI
         CzOWdIYYZfBX/Lg614imgSb9cfjQNl6QobbuNXCS4e75p5ZXT2rjM+/mJ1L4k9Jvfe
         r/pRS8NKVO9aJN5OZDFxLFtyKpfzY6T5zCGi67yx1f5AmteeMeBlbcGtNQ5g9ZzPIF
         k6gr7b22vyoLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220913032403.1007902-1-yangyingliang@huawei.com>
References: <20220913032403.1007902-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] clk: bulk: Use dev_err_probe() helper in __clk_bulk_get()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 17 Oct 2022 16:07:55 -0700
User-Agent: alot/0.10
Message-Id: <20221017230758.79080C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2022-09-12 20:24:03)
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
>=20
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-next
