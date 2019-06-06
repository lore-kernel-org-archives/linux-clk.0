Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54ECC04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 16:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EFE420868
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559840147;
	bh=ONiIPJxY8Q2LguVFQEBI0WHxigq9Xew7AeZzN72TLAM=;
	h=In-Reply-To:References:To:Subject:From:Cc:Date:List-ID:From;
	b=0seK/seIsfFalJe/Xoqg8pGpNhTELe2VPSXOVSVXpEPy7q5TAf+y7ttqQ2Bp9Dgdi
	 EL8bWKCYw3nCw02Sug03e9IajzbiBseCC0pkMVEBNZOozM0rgGIrN4QTSd1KSqztjs
	 gULIIs9NnhNroceJdu94QL3OVy6vX+wg5kdK+n58=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbfFFQzr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 12:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729736AbfFFQzr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 12:55:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6675520693;
        Thu,  6 Jun 2019 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559840146;
        bh=ONiIPJxY8Q2LguVFQEBI0WHxigq9Xew7AeZzN72TLAM=;
        h=In-Reply-To:References:To:Subject:From:Cc:Date:From;
        b=rhORb5g6fM+snyJ6isjVq/50SW7yMGkM1imiPi+xcXCwUmAqbry76ZRdsGUrQEAzM
         /YBCYUODpekHjnZUJru8uNhHGVxu+V6d+dHS1MrDXDlOzLuomc/wm+nkmTMsMHUGcf
         Wj8zRSYfFnYHusbjhFFDOcTPISruKDMWgUBuKyKo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190606164443.6991-1-festevam@gmail.com>
References: <20190606164443.6991-1-festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 09:55:45 -0700
Message-Id: <20190606165546.6675520693@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2019-06-06 09:44:43)
> Use devm_platform_ioremap_resource() to simplify the code a bit.=20
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

