Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81419C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4593C2146F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555014288;
	bh=GsDACCpTfbqWGhETI7YmHBIAv/urcICvhgOGv/4krgk=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=Cg4MdgJWznQOxW0AV3eZpPXo1HRBVoRMkXf3jouUn5s6OJsCJyABWE64eX5ENJ5G7
	 mSSIp5ieKzNwqCKRE+o3VVRYoyZw0wbEZC0V7e/dxpABKdC5MdcQ/VNAyidXNQMpVW
	 X5AUgMoh8tUCDr9VFEQYJ/biLbr4GilZ9LsjP+hY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfDKUYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:24:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbfDKUYr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:24:47 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2863220850;
        Thu, 11 Apr 2019 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555014287;
        bh=GsDACCpTfbqWGhETI7YmHBIAv/urcICvhgOGv/4krgk=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=zGtvcjEAeyjT4nd0T/gkCn1CrDeSOTRjEPADy3OdVSMa8MaL4o7sb0XNg2aXPRcNn
         HnnFuwgHsaYpXjuQ78hE2lFD3qP4q0/+vHorPYiCxIiCfWiBjQf7PW1onjYZyiSIju
         lHZf46UYnJYCbwzr/F/Den62rBJiRq497hJoniOg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190305050546.23431-11-weiyi.lu@mediatek.com>
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-11-weiyi.lu@mediatek.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 9/9] clk: mediatek: Allow changing PLL rate when it is off
Cc:     James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com, stable@vger.kernel.org,
        Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Message-ID: <155501428642.20095.13010940386938154148@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:24:46 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Weiyi Lu (2019-03-04 21:05:46)
> From: James Liao <jamesjj.liao@mediatek.com>
>=20
> Some modules may need to change its clock rate before turn on it.
> So changing PLL's rate when it is off should be allowed.
> This patch removes PLL enabled check before set rate, so that
> PLLs can set new frequency even if they are off.
>=20
> On MT8173 for example, ARMPLL's enable bit can be controlled by
> other HW. That means ARMPLL may be turned on even if we (CPU / SW)
> set ARMPLL's enable bit as 0. In this case, SW may want and can
> still change ARMPLL's rate by changing its pcw and postdiv settings.
> But without this patch, new pcw setting will not be applied because
> its enable bit is 0.
>=20
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> Acked-by: Michael Turquette <mturuqette@baylibre.com>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---

Applied to clk-next

