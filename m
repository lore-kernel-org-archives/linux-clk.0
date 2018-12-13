Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C863C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2F50208E7
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544692221;
	bh=Gi6PS8MKv5Fqtnv/XVx85y4jcdxDOTT0kelzeaikZM0=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=mZ8fIPlBXziAMYk/k+QYYwZm3Xua5LwkKTceOSrhDzjW2Tb5AZG77w+qOXbl8YV50
	 3hsjhshIqsRN83R2fIsxLqYglcOAP8Gzd2wwBoIbgmWgmM09PwJv5/KPp4pROFD2UU
	 SDRTset3XxTuD2ZzQy0tqmXU80O0jUpsL7GNWkTo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2F50208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbeLMJKV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 04:10:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:49652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbeLMJKV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 04:10:21 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 841832087F;
        Thu, 13 Dec 2018 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544692220;
        bh=Gi6PS8MKv5Fqtnv/XVx85y4jcdxDOTT0kelzeaikZM0=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=yUJo6+4lXd534tXN25QWtRIOr1XpIWu1yL6rdJY8YdrwkUdWloNky8ZQiuCcpx856
         8X/8yk6yJ8k+BoompCOgj8/R5xFXW8mgAuvWDv1HpZCn1k/7htOreyChHt7XxbO7/P
         4RGoEmzu/OVV23/j5j+SMGcpHoryxKNo37w2UajE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4187870.lCvQibHAte@phil>
Subject: Re: [GIT PULL] Rockchip clock updates for 4.21
To:     Heiko Stuebner <heiko@sntech.de>,
        Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
References: <4187870.lCvQibHAte@phil>
Message-ID: <154469221987.19322.10748651240109737355@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Thu, 13 Dec 2018 01:10:19 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2018-12-11 11:58:26)
> Hi Mike, Stephen,
>=20
> looks I can re-use my introduction from 4.20 - no big changes again this
> time. Some minor clock register fixes, a new critical clock and a new
> clock dt-export.
>=20
> So please pull.
>=20
>=20

Thanks. Pulled into clk-next.

