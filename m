Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D2BC10DCE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C27120709
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583529216;
	bh=nAOwzMK7Rru/ZHSGuIHjl7DylWINIp/B+M/RfrJNnm0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=f8G+POnBLHOfagSMcOhyWq4Cgxz+FXob/LTSsVFOLMhi1Id7wrXi4jV08qvRb3AZj
	 p7cfOJ1XFzZrp6mb7Q+/NWbggMP3c+AktTHMasIHmOS+OtUge0JXiNKA8z0H5k/PPj
	 agMnCOA+I6xcC5BVcxwYPrigNMTnX0qrIr8+Jvns=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgCFVNg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:13:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:35254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgCFVNg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Mar 2020 16:13:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4E88206E6;
        Fri,  6 Mar 2020 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583529215;
        bh=nAOwzMK7Rru/ZHSGuIHjl7DylWINIp/B+M/RfrJNnm0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Hh5N9JyeKTS6yWhSqxXXeYVyRIcYvJtkyU/C/xodZ2KQERtD2rCc7UAXr3sV+9+q7
         wVI6bknyhchAGHrsvAuu9i6um7sAUkFB3YpkymgGsMfo//vyn0Q2I+4yvxFfgTjq1F
         ZyUFvRsGL6L6kEc3lySLTWmo2wwe2H3mOWGMZ0v4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
References: <1jy2sfnnee.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] Amlogic clock updates for v5.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Fri, 06 Mar 2020 13:13:34 -0800
Message-ID: <158352921495.174340.8705011338899519608@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-03-05 01:47:53)
> Hi Stephen
>=20
> Here are the amlogic clock updates for this cycle.=20
>=20
> Cheers
> Jerome
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.7-1
>=20
> for you to fetch changes up to 71202c412478d6553281726a6772d0d5510c42fb:
>=20
>   clk: meson: meson8b: set audio output clock hierarchy (2020-02-21 11:44=
:41 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
