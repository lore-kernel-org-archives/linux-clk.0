Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3513BC2BB40
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 09:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF3F2233FB
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 09:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgLQJx2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:53:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:43722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgLQJx2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Dec 2020 04:53:28 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608198767;
        bh=ZvjTC0N6aGANPYgw0sbHla2VyTCmCDpP43jXGchdk+w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nVNB2ginNG0JC+quSYAlO1wIQCZSjbVYoaUEpRMuTiwetlTVb3KM5rZS3pNqy2Xk5
         INwP5MqDMsAPMtwL3Y5FLd9lZM2rUhdQq/5dKbQ37LAH7uZAnYvLVl7Z9R88knqLV1
         w3eKngsDKWfngs5gJRNlym7CT3r32uzhT5OCXj3e5582KL4GG+o0aX0ZvviosPFfJL
         NpYXeTfnM54m/vvOYEB7L3DjOdg2bdXwD1tRekbJ1fk5uijJ86AHX5wjyOk0tJDL/5
         dw0jVPMN9zsWRKQOVN07Q7C3+b6HWGbukUWKJM8Ydzg4+bpZ7CTSXPae5tBjoU43jZ
         7SZcf3KMJgkmA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201013143421.84188-1-alexandru.ardelean@analog.com>
References: <20201001085035.82938-1-alexandru.ardelean@analog.com> <20201013143421.84188-1-alexandru.ardelean@analog.com>
Subject: Re: [PATCH v2] dt-bindings: clock: adi,axi-clkgen: convert old binding to yaml format
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     michael.hennerich@analog.com, lars@metafoo.de, mdf@kernel.org,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 17 Dec 2020 01:52:45 -0800
Message-ID: <160819876588.1580929.15985009526095018473@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexandru Ardelean (2020-10-13 07:34:20)
> This change converts the old binding for the AXI clkgen driver to a yaml
> format.
>=20
> As maintainers, added:
>  - Lars-Peter Clausen <lars@metafoo.de> - as original author of driver &
>    binding
>  - Michael Hennerich <michael.hennerich@analog.com> - as supporter of
>    Analog Devices drivers
>=20
> Acked-by: Michael Hennerich <michael.hennerich@analog.com>
> Acked-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---

Applied to clk-next
