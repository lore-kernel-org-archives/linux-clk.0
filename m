Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D458FC7618F
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 21:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA430219BE
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563831209;
	bh=LRjTFf0P+1cadmeWrN32PXo23OKVXtFRMmj+KLXh4PU=;
	h=In-Reply-To:References:Subject:To:Cc:From:Date:List-ID:From;
	b=hlRuEiOFSaQE7Ebszojr4mA4M76dmwZA9UcEJQJkOPzraCx2p+FgrTF04kdpptaPE
	 hatKEOUSoI0EaMDL888uS6yqIqQjKCK+X+WyDekNlqZaww3Mq1X+LTk5eAnYvQjbHE
	 grioAIFl/fycizF1xj5CUcMS1IUPgHKOxIQv5SAM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbfGVVdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jul 2019 17:33:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729004AbfGVVdY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jul 2019 17:33:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 874B121900;
        Mon, 22 Jul 2019 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563831203;
        bh=LRjTFf0P+1cadmeWrN32PXo23OKVXtFRMmj+KLXh4PU=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=Et+11J5o7dtf0jIwThtwUHyzBvrvzsgbckUvSpM1TivPdOHG3Py9lLgsL5BCiVzLH
         g5uHZKRpqKKBAB1L6J5wDwqciKXeX76imwWZCx4TVRhMsPKnDQxu5mZANuE7Lfxt7k
         +HbfBWavPbbOg/gZmWKFtWATaQFHuk5JI8+AtwXk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1561706554-27770-1-git-send-email-weiyi.lu@mediatek.com>
References: <1561706554-27770-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3] clk: mediatek: mt8183: Register 13MHz clock earlier for clocksource
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com, stable@vger.kernel.org,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Dehui Sun <dehui.sun@mediatek.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 22 Jul 2019 14:33:22 -0700
Message-Id: <20190722213323.874B121900@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Weiyi Lu (2019-06-28 00:22:34)
> The 13MHz clock should be registered before clocksource driver is
> initialized. Use CLK_OF_DECLARE_DRIVER() to guarantee.
>=20
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-fixes

