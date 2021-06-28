Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA379C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1A0961C17
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 00:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhF1ADx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 20:03:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231709AbhF1ADw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 20:03:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02FB5619C4;
        Mon, 28 Jun 2021 00:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838488;
        bh=C0mM8kBMd3VD7tttt8n24YWpksKW/HJK/MIIwHcYnPE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SP94FDHKX61G+nO78JNdsdU2/txiIVAKcIJH6JQlcT6YdeH62uUpMGv8Hg4wNkOeh
         H6/Ts6WjZMG5i+G4EUvd0VsYFaH6bFYbQegFiVzFuNg6nlPd1t21h8/Rju0Tkp4CTb
         ve4BsphcIeG/Jym9WxOOV++SyqM13ROxi1Q+KEYEOENK3+TvaDveJITDWTT8YulkZ0
         wG3Hp5K6u6B8wYFMgl9whr1sWOkOz71FikABh7pDJ4vvCE4i+XNKN+4TwfKlU8EZEB
         uwoYaN3wB4FV2N5+SEnOSf6fuNq5WAbggiOe/kKVROFaqOpgEkEuLyITKNE81YPwCo
         pMS5FZQYJJEvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210418122909.71434-3-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl> <20210418122909.71434-3-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH v2 2/5] clk: qcom: gcc: Add support for Global Clock controller found on MSM8226
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:01:26 -0700
Message-ID: <162483848682.3259633.12714299318722524172@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bartosz Dudziak (2021-04-18 05:29:06)
> Modify existing MSM8974 driver to support MSM8226 SoC. Override frequenci=
es
> which are different in this older chip. Register all the clocks to the
> framework for the clients to be able to request for them.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---

Applied to clk-next
