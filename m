Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165BEC4360F
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D762020818
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787370;
	bh=O9eMtfCOYITDql2cXmYSdA9uMK8OryXvw5xa8Xhk1UA=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=dlsa/O4Wy4fNhzbDd/WJGYJRouHBL0NKnoGR/DYfWDwBO3Md+qCRSMmmwm0AZ276h
	 m6J5Y0+A42RHzAASQHv7u0atZVDoQle4aRq2uxlDZbTnfcXhcaDE3I0rh9km1mhfZZ
	 Kw7IidqKbnhndWOCPb84G+T7Kkk++ITtpCsWJLL0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfBUWP4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:15:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:46880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbfBUWPz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:15:55 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EDEE20818;
        Thu, 21 Feb 2019 22:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787355;
        bh=O9eMtfCOYITDql2cXmYSdA9uMK8OryXvw5xa8Xhk1UA=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=U7ot2B9a4XWqXP09maU9jMbEqjQk9NHMFVr5k/4rnWrOdGpS+tyNrxuT9mfYGtw8X
         o94Ev0ifP07W41/cucOLjHGuFt9qGnRcUDOhwQWQkXq2GPgsaTNVvtR0VBtIkhwe2g
         wAGzZhpw9uEHdyUGlAr747mr4xdi8ACOMfsD6V0g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/7] clk: stm32mp1: fix HSI divider flag
Message-ID: <155078735448.77512.10753855683185171369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190214104047.1173-1-gabriel.fernandez@st.com> <20190214104047.1173-6-gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190214104047.1173-6-gabriel.fernandez@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
Date:   Thu, 21 Feb 2019 14:15:54 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-14 02:40:45)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> The divider of HSI (clk-hsi-div) is power of two divider.
>=20
> Fixes: 9bee94e7b7da ("clk: stm32mp1: Introduce STM32MP1 clock driver")
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next

