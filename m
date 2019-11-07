Return-Path: <SRS0=fLRh=Y7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CDBC43331
	for <linux-clk@archiver.kernel.org>; Thu,  7 Nov 2019 21:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B935B2166E
	for <linux-clk@archiver.kernel.org>; Thu,  7 Nov 2019 21:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573163045;
	bh=ogDmmVJdhHcqMKGnCV3ieEKxbdnDkVZcDWMpMM+zo/w=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=s0Av1GO90lGdcADHlHrYjZS0Fzgqbv2/NOaBk4Gbc2gdel7YZAtIWu2ehlph6sKoc
	 6KrZDPeYFCZNKeZXwFnPd0/a2TMcvZ0ecPTLwo5tXPlYg/npK54XoQU7eWffOP4A9U
	 AxBrn44sCjkR3T0jzORRQxH/oP/rQIzJB6oFZs3Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfKGVoC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Nov 2019 16:44:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVoB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Nov 2019 16:44:01 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C0C12166E;
        Thu,  7 Nov 2019 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163041;
        bh=ogDmmVJdhHcqMKGnCV3ieEKxbdnDkVZcDWMpMM+zo/w=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=mbRoCj3ZIZBuBNE+n47AQzvThDe7Gwlgb0WQXascyDi8gAwtfuIEazb9f+lSL4+Fl
         Eo+7Mk5HrhCHp/Oy6/pVQGLp54OrvoOFhUm7QhRHoNmB3HnjlUpOW0OkX1tzBP5hnk
         yCN6u5gj0wYB1c4heRTQgOWWLQUv/s8jqB1iseZg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191031185733.15553-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com> <20191031185733.15553-1-jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v5 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:44:00 -0800
Message-Id: <20191107214401.1C0C12166E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-31 11:57:33)
> The GPUCC manages the clocks for the Adreno GPU found on MSM8998.
>=20
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---

Applied to clk-next

