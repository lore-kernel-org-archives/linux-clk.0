Return-Path: <SRS0=7yfQ=5G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3FCC4332B
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3B2920B80
	for <linux-clk@archiver.kernel.org>; Sat, 21 Mar 2020 00:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584752177;
	bh=IQX1YjLnbhrv4UbjVL16ZTihWmyyk8E2S7LF3aN/Yxc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ftIG28YDlpE4p/qvsUtNG6MAP1YkPqNQIQGoHbOOa687YShbNUaWubysFgVh8Lkz+
	 Tn9XHo5r1yN3Ngu9aZ48blxff2X2liHAaxMMFXueaB7UJPTNYsBP18X5w/6qbp18tm
	 e0SXvh2FTorQUAOXTiL2Loe6PhlL6L9d1I20xRss=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCUA4R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Mar 2020 20:56:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUA4R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 20:56:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB447208DB;
        Sat, 21 Mar 2020 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584752176;
        bh=IQX1YjLnbhrv4UbjVL16ZTihWmyyk8E2S7LF3aN/Yxc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xqbrp4J7oyGpE4uvFRyonFVCMKD97AD06EyG4uj/Dcc9dGCvEtq0SDJc+wUSsntay
         tSKDQjazowz3WqPH930nxAZRaDkgjgcdqxAn6oMeUCCa1W5eN8pnOiZ0HqBIeBj6Fw
         NOgUX33qg2e+AlzmHcrDtHukOq1WPklokmO9VNEo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219103326.81120-3-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org> <20200219103326.81120-3-linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3 v3] clk: versatile: Add device tree probing for IM-PD1 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 20 Mar 2020 17:56:16 -0700
Message-ID: <158475217607.125146.14794957853451322086@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-02-19 02:33:26)
> As we want to move these clocks over to probe from the device
> tree we add a device tree probing path.
>=20
> The old platform data path will be deleted once we have the
> device tree overall code in place.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
