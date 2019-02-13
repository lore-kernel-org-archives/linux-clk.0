Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83724C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56ECF2190A
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550080262;
	bh=ascWrEzuBIrqSmJ9EcN6LJtQC5jsAmWdNAcVbk7fB/Q=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=nqIH+A0XQf3lgkCiFxlMiEKE4TYrFZ3U31CtrO0tO1YSQEf3Z12WitlmlZuxt8CO+
	 GLX4EpKNVZFHpjmqmOmdaS2EjLpjO5V2FFHySqeKAj4BK12EJ6jMO11fF8lk/1UPem
	 OSn6i/QRSXmkSlMkMV0HATEpZj/G7M1sAtHmu1kQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfBMRvC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:51:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:41630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfBMRvB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:51:01 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 245672086C;
        Wed, 13 Feb 2019 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550080261;
        bh=ascWrEzuBIrqSmJ9EcN6LJtQC5jsAmWdNAcVbk7fB/Q=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=XoIargHhURDCYOQYNJfZv6jSfmDFNfRRAX1c8+CM7kiTHZf+HIOVz9buo5HarkPv0
         sD3Hq4qaZfy1hcuMLp5nedhqsxB+/JrpedBxQM/YLT6bVW5eehFA4vYml0ptK+UxJI
         arq4Au7ubsk/Sud7c5cH+jQcTPwDUmrc9tJOVGS8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
In-Reply-To: <20190212135154.2733-2-gabriel.fernandez@st.com>
User-Agent: alot/0.8
Subject: Re: [PATCH 1/7] clk: stm32mp1: parent clocks update
Message-ID: <155008026039.115909.4164384033475100688@swboyd.mtv.corp.google.com>
References: <20190212135154.2733-1-gabriel.fernandez@st.com> <20190212135154.2733-2-gabriel.fernandez@st.com>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:51:00 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-12 05:51:48)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> This patch updates parent clocks for axi, fdcan, sai and adc12.

Why?

