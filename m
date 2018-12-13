Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E02EC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1824520879
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544730561;
	bh=t3RDqqrV482o0CzHb+VigQ+uke1Jd4jLUNCxyjKAjHA=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=EFG+Zt4icIqr9hGrZYeQeOBIH3v0T57Ib3FkXU3TfierLuLpymW3eovaJQpQnQ3eu
	 h7dKQ4Rg+BTIEjchVHjqaFYSYBONZIWDQelcioP7LO/r26CfXjO3gwp2bX8iA4ke31
	 CxqupYJExn9fKBltMuI+8/FLLe4s5UqdusGX4EAI=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1824520879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbeLMTtQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 14:49:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:35356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727754AbeLMTtQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 14:49:16 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A2502086D;
        Thu, 13 Dec 2018 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544730555;
        bh=t3RDqqrV482o0CzHb+VigQ+uke1Jd4jLUNCxyjKAjHA=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=v5DkIBe6obuhAbyVBq4PuldlfHoPUB+tgZXx8XnSaj0ScFRY/Gph1aQjrwVpmcPTG
         9lEvVhGg49LFDayJ/1gwyX+gqqD5e0Mj9E4PLSAfTZeZWWcyCVmnuDscJb6vDjuti7
         4IN/BXJhUN+9k3c8bc5U+MD8TH7uCe1ieFkb3eeE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181206215858.3880-5-sboyd@kernel.org>
Subject: Re: [PATCH 4/8] clk: h8300: Remove usage of CLK_IS_BASIC
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20181206215858.3880-1-sboyd@kernel.org> <20181206215858.3880-5-sboyd@kernel.org>
Message-ID: <154473055484.19322.4455034728383205684@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        uclinux-h8-devel@lists.sourceforge.jp
Date:   Thu, 13 Dec 2018 11:49:14 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2018-12-06 13:58:54)
> This flag doesn't look to be used by any code, just set in various clk
> init structures and then never tested again. Remove it from these
> drivers as it doesn't provide any benefit.
>=20
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: <uclinux-h8-devel@lists.sourceforge.jp>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next

