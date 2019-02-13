Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08658C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD5B5222B1
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550080119;
	bh=6AmCtmnGNJ3L2GipYDhIPyDm6V003oBndPdtARin9yk=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=dKvvK2i/8JOC/AVNURoIqpnbkfjsU+yEcWe/dxttk8+EqrGfmt9G1x8bjXbD5pJv/
	 CYZ31iyZt1V8j0VTF4DyAwDOjA9glSMFRta96fQ3mzJcep/neR8IBRkUNGathBBAjB
	 uWx6Kl/6mBCPDT7xJK/SuFAh9rDX3x/KOX5zkYwQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfBMRsj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:48:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:40168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfBMRsj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:48:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DB6C2086C;
        Wed, 13 Feb 2019 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550080118;
        bh=6AmCtmnGNJ3L2GipYDhIPyDm6V003oBndPdtARin9yk=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=bVsc3OG0SnP0/SpS0+/TYYzuHsCrOhzE9pW8IvqE4KD1RylEPJUMKBsHq9jZc+mtX
         nHhe8XfmS0W0E12WcyHo8hS4JNlQ+JT3XlFQrgTGLa1c4uRe//kQ+k/pXKppA79dyj
         OgvOTTnotsm2YCSboeVEGInwcsHuvINc+qbPd+P4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
In-Reply-To: <20190212135154.2733-6-gabriel.fernandez@st.com>
User-Agent: alot/0.8
Subject: Re: [PATCH 5/7] clk: stm32mp1: fix HSI divider flag
Message-ID: <155008011784.115909.1034676212834412799@swboyd.mtv.corp.google.com>
References: <20190212135154.2733-1-gabriel.fernandez@st.com> <20190212135154.2733-6-gabriel.fernandez@st.com>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:48:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-12 05:51:52)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> The divider of HSI (clk-hsi-div) is power of two divider.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>

Any Fixes tag?

