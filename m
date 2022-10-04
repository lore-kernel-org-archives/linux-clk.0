Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D00C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 03:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJDDvS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 23:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiJDDvM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 23:51:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B194320BFB;
        Mon,  3 Oct 2022 20:51:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5CDD61215;
        Tue,  4 Oct 2022 03:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F3EC433D6;
        Tue,  4 Oct 2022 03:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664855469;
        bh=ehU3pSePbzri0KePyWSjjBINxgWQpiYhH7V/OSm5Wng=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DxP8ve9dumPXSvnxKkAyDtoSsIbSkeCTYoXBZ9dFCJjXT2skD7D4TF6h7sVlsKkCT
         i37VjHqo/V9vPmMZPF2HTEYj6ECmIbg4nPRD6VHed67pQsqZBqhNEZds+t/zkKvkSC
         NCHIW1CHF0V00BTf0xiIkHSNZH5kCu4rAuGiLToIKDuMKKv71om5aphmVxuRfZUWa0
         5lzW07I/Z6XwJfGwn54S4+CsSdy5s7pz86UHkZYuYK9mqL7XVqBIklY7l6FTjnhYej
         kcm/R/ABfLZ6KYXCs+rYEhPcCVr/dEcqYITRcCHPEzftEpUcE8z+z5fIeR+UaSEB3u
         4IJVggGvyYFzg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220914144743.17369-1-ansuelsmth@gmail.com>
References: <20220914144743.17369-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: introduce (devm_)hw_register_mux_parent_data_table API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 03 Oct 2022 20:51:07 -0700
User-Agent: alot/0.10
Message-Id: <20221004035109.42F3EC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Christian Marangi (2022-09-14 07:47:42)
> Introduce (devm_)hw_register_mux_parent_data_table new API. We have
> basic support for clk_register_mux using parent_data but we lack any API
> to provide a custom parent_map. Add these 2 new API to correctly handle
> these special configuration instead of using the generic
> __(devm_)clk_hw_register_mux API.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next
