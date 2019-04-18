Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069EFC10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 20:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDB30217D7
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555619543;
	bh=6AsPH5iyvIGfXDXCsgAUrXVj3RcDiK3cmlRoICT7AdI=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=17zRvSuU/B3PQIzGIvgVSdWbRDqp+mWpFkX4lb5KRKsaOs5ptaWF88uy7t148g+6w
	 3OBc7CE5GqW3Ag+x1krRHm4eq2AddCG2NBT+ZrrOS83/d8cd6to4wALpETrzQ7rqFg
	 myQ2KvrTECwJRQ4Luhi8wIlbDy3P4NC6YNmN5h6g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389759AbfDRUcX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:32:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731565AbfDRUcX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 16:32:23 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 869C1214C6;
        Thu, 18 Apr 2019 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555619542;
        bh=6AsPH5iyvIGfXDXCsgAUrXVj3RcDiK3cmlRoICT7AdI=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=EBi18Tn9XMAQ/Pfg270jZfslw/M0fcepdQDF/jCzHqmM1K9oTBbGtzLLWIVaJwhcX
         R0u8i5DVf11yD8BPdYxotKKBzwS1JUD72wf40cdPg1O2ZFDjQut6W5HYj97uwVneMT
         8twdl0wjLua1BF4XrX+iClu5PW8KJxDplUkhj1W4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
References: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: 2nd update for v5.2
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155561954176.15276.5102897303800246681@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 13:32:21 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-04-18 02:46:36)
> Dear clock maintainers,
>=20
> Below is a request to pull another round of update for amlogic clocks.
>=20
> The main purpose of this pull request is to add the g12a SoC family
> support in the axg audio clock controller driver. It applies on top of
> our previous PR.
>=20

Thanks. Pulled into clk-next.
