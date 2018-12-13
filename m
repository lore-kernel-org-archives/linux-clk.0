Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667E9C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29C3F20873
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544692053;
	bh=2b0LqR8wlggG5+pPiegUxKbxNgPJpexEUA0T9vWR0VE=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=gSQEd5HOWHA3EsR7H6f4jxcW096sjuXXOXx/5mVk5Ag9n7Z/5C0A99zFjE9sr99r3
	 /2Lhi1SlYPiINjdxDYbnkeJRMYdSd+XY1qKC9rZNUpdICd3lEdmt1rsVs6UmJxfJna
	 gDh9JapxLPVr0QgwYiHp0gOBZUuyhy2cZa048zTU=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C3F20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbeLMJHc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:07:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbeLMJHc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 04:07:32 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0935A20870;
        Thu, 13 Dec 2018 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544692052;
        bh=2b0LqR8wlggG5+pPiegUxKbxNgPJpexEUA0T9vWR0VE=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=PlHpiuU4opnOErcZ1QOqzx4lz1eTtRObdcZOLth4Zqw56z4s/9Lg+1Rs87Is1FwoR
         uudP4iU410ziTiu0W8pj+Q2s3lyIcIMEuVECDqThKf1W4hWkhdVUFILc50hGdCBbil
         nje7NXtJ4Iu1FgKfEoYJo3D2Z9JUNV1vnJDTPEjU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4506cbc6-4997-8332-3d34-fe753f480b69@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v4.21, round 2
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
References: <4506cbc6-4997-8332-3d34-fe753f480b69@baylibre.com>
Message-ID: <154469205120.19322.6141642003515686792@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Date:   Thu, 13 Dec 2018 01:07:31 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2018-12-11 07:15:09)
> Dear clock maintainers,
>=20
> Below is a request to pull updates for Amlogic clocks, round 2.
>=20
> It covers essentially Meson8/Meson8b video clocks, a fix for previous rou=
nd
> and helper addition to simplify clock driver input management.
>=20
> Thanks,
> Neil
>=20
> The following changes since commit a7d19b05ce817d60ae672c4c112e77892978dc=
3c:
>=20
>   clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 =
15:11:58 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-2
>=20
> for you to fetch changes up to f03566d0aa79f9e09a288936980741c479a22fdb:
>=20
>   clk: meson: axg-audio: use the clk input helper function (2018-12-11 16=
:07:03 +0100)
>=20

Thanks. Pulled into clk-next.
