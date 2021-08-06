Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843A7C4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DE4C61186
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 01:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242461AbhHFBK0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236758AbhHFBK0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Aug 2021 21:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D291610E7;
        Fri,  6 Aug 2021 01:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628212211;
        bh=cZWXeNfKB+516Uk3yS8cebYSUBZ3yLUsh4a3ISh4MSE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X1Q+P737/kIojTY1y7StFtkruO1s/rjTOVibz01fmmGSbxhuHd/Jk+yckXXPs6m+h
         Gufc7gWnV26U6oUruweSqq/ArhAmy1DfHVKs8Mn2cY1hKB9qRudYq5h4KDlNAFcll8
         sgsxg4JtkbJHotp0BunBvZ8pKKKj5d1mimxlZD/MEdtj7DlD2y5p7fVMwuImvxr0Q/
         lH73rjVfB/kLf05BKx3SZCysVxW+kxu1m6qKoe7YL1nepQ1ouBrWSxffnaBgtfE/L7
         P07jwn/ITE7JqGQn7DaTPyYCn6fHdOzbTmsPb2V8eYxGNFSmLVrd7lNjuaCV4MgFUo
         s2Azrwvamitqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702225145.2643303-2-martin.blumenstingl@googlemail.com>
References: <20210702225145.2643303-1-martin.blumenstingl@googlemail.com> <20210702225145.2643303-2-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 1/6] clk: divider: Implement and wire up .determine_rate by default
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 05 Aug 2021 18:10:10 -0700
Message-ID: <162821221001.19113.3440053309060770787@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-07-02 15:51:40)
> .determine_rate is meant to replace .round_rate. The former comes with a
> benefit which is especially relevant on 32-bit systems: since
> .determine_rate uses an "unsigned long" (compared to a "signed long"
> which is used by .round_rate) the maximum value on 32-bit systems
> increases from 2^31 (or approx. 2.14GHz) to 2^32 (or approx. 4.29GHz).
>=20
> Implement .determine_rate in addition to .round_rate so drivers that are
> using clk_divider_{ro_,}ops can benefit from this by default. Keep the
> .round_rate callback for now since some drivers rely on
> clk_divider_ops.round_rate being implemented.
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
