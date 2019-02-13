Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51939C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 228EC2086C
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550080109;
	bh=SS0vbOTs/1srZxpl61yK6HRHGQuJgvxT9uBD1u1g7g8=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=wT1M1Y2WArXVbZgcIANMfpqa4oTpYub1H2UFfjwJFA5tEaaqElPEPpkQ1HpJ7AqRf
	 oBPI2Lo4sR84u2lgDXlzOPdBgVBZbW2nMav7yb2Ur8p42FYUzvSdFMVwe6dNV8jN+R
	 dZOMVO1GjnJpGv+7EvmxF91oSttn2lDa3Jz1/e/U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730885AbfBMRs2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:48:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:40038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728364AbfBMRs2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:48:28 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3DF72190A;
        Wed, 13 Feb 2019 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550080108;
        bh=SS0vbOTs/1srZxpl61yK6HRHGQuJgvxT9uBD1u1g7g8=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=2JL+8D5YIFLBvLVlrvXP6ViyyH7kpowtchdZKoC7pTaEX5l8ECKxZUuFOpphbZaJr
         sa5V8yUdvisv4KUrnfIE0ZrFxyZMqIyfF2vW/OUWPLlWwms4Q5454+NBtcWmXSwejt
         b31B1YZE/2o3che2nLgcPVsdZhsUAJxJQ4W09pEI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
In-Reply-To: <20190212135154.2733-5-gabriel.fernandez@st.com>
User-Agent: alot/0.8
Subject: Re: [PATCH 4/7] clk: stm32mp1: fix mcu divider table
Message-ID: <155008010726.115909.10603966457383347348@swboyd.mtv.corp.google.com>
References: <20190212135154.2733-1-gabriel.fernandez@st.com> <20190212135154.2733-5-gabriel.fernandez@st.com>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:48:27 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-12 05:51:51)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> index 8: ck_mcuss divided by 256 (not 512)
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>

Any Fixes tag?

