Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3BCC2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 21:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01C5C208C3
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 21:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559943057;
	bh=+8vRQ4YjkZ+4hla3SNxNwixDS9pvt0gb8HQPiBw81iQ=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=gsbKIdGtmSDcDP45unS43VsvaPy7PBpkNsAPUqLXy7HztbBlpgO6+4OTAEAKG6xL7
	 wXARRpVTs8OPELuLQjh4Ph4uXQhZY+X6TmxstbHOTo38T6k7Da7fclQjGtGRneflow
	 7Xh78/Amz9cAQo0di6W2urLSgwsnWjLwpEv+PutQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbfFGVaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 17:30:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:57870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729726AbfFGVaw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Jun 2019 17:30:52 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ADE2208C3;
        Fri,  7 Jun 2019 21:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559943051;
        bh=+8vRQ4YjkZ+4hla3SNxNwixDS9pvt0gb8HQPiBw81iQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=TwexyLcl98YMzgTjjU7pisJh4W9X2FacDHP9gsR7Ez+CGGGOuKFKOP0TBveTn3ysZ
         qfd5B2zVUdST1tnfXKyMXKNQeYehEefWG07caWYXP27aVkgRuZGMVICxggPMMgYuww
         HJCnIXZIlFzsc/QFUmdb7XrBDQ3fTUBVTWFXTnPc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190508223922.5609-1-bjorn.andersson@linaro.org>
References: <20190508223922.5609-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4] clk: gcc-qcs404: Add PCIe resets
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Fri, 07 Jun 2019 14:30:50 -0700
Message-Id: <20190607213051.8ADE2208C3@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bjorn Andersson (2019-05-08 15:39:22)
> Enabling PCIe requires several of the PCIe related resets from GCC, so
> add them all.
>=20
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

