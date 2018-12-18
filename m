Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4C2C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5601218A5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545158512;
	bh=YQ/s3ma261q9/0xAv+9faL1c/s4IV+pu72EQbJfoCIE=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=MsK8HBY9NNnePBf16trV22pIgJJbD7X5JvPeMVvb7h5IKQVtDeKCWlKWc40/ytFOB
	 0Qz3jFkU4cb4ZHCO9rt1bq5x5arpOIfFEYEFnh0IbQEE+laz+msSVUNvcpYNqOVsCC
	 LvP7aWBv/QJPvTGhDV423YuauH83mkPCXuF0kVEk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbeLRSlw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:41:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbeLRSlw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:41:52 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9604218A4;
        Tue, 18 Dec 2018 18:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545158511;
        bh=YQ/s3ma261q9/0xAv+9faL1c/s4IV+pu72EQbJfoCIE=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=hr2bEjVIdtsNSuBL8VEHLSp4awXAULZnWQ6kgp3+jIhxUG4IDnI7xm1JnjiFYCZZc
         A+lIzHGMJ+u+bH8h1dWHfraVbPtrQf8TwX/V4b24ikN9cf+1CTdVH0aaBe6MKRCX3t
         wYXzpWigFdbtdeQCLRx/u8QRuuLpJeACv4LBojcc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-9-josephl@nvidia.com>
Message-ID: <154515851110.238328.11710971689713709806@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-9-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 08/20] clk: tegra: dfll: round down voltages based on alignment
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:41:51 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:20)
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
>=20
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

