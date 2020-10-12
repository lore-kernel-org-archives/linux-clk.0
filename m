Return-Path: <SRS0=jyYP=DT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5B3C433E7
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5B1E20776
	for <linux-clk@archiver.kernel.org>; Mon, 12 Oct 2020 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602530780;
	bh=Z2F7hT/rtiFpKHrOdbWSil4FwSFmNrhQsk/IQB1RaAo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=2nB8OD9ZkbO0jwaJSz4gqsCzYpA61PplfKC4IFUsQjTrHq7YCqJtnefkCCwEqN27i
	 crQh57zvuJwDFBiaAVHzaX3CC8nMIH9MtVJM3glGESK0E0D7zJE8lEcfC2peLI9Qkm
	 X5hMK8d8fY58HCPlcAwvvlfbwF7lcVeAD1bglZ8k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389705AbgJLT0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:26:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:34376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387974AbgJLT0Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Oct 2020 15:26:16 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 522602074A;
        Mon, 12 Oct 2020 19:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602530776;
        bh=Z2F7hT/rtiFpKHrOdbWSil4FwSFmNrhQsk/IQB1RaAo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lgced3+Zq1zK+bGA+HzuCC8nqbByms2HTt6BvjcsUEyPmQTMZov/m7G0uWD95MPpq
         ABrfmQGy2MG35o8TFaYHl587ST1XUpOgjCKjllIHdpdpHR0tr6ivSnYGAjla672Ay9
         uft2uj8S8m2ZIwalJ0BygYEvs0A6yT2Ms3tx295s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ba7319ab47bc7e80a57667f700ab677ceaa3ca8c.1602245659.git.mchehab+huawei@kernel.org>
References: <cover.1602245659.git.mchehab+huawei@kernel.org> <ba7319ab47bc7e80a57667f700ab677ceaa3ca8c.1602245659.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: fix broken doc refs due to yaml conversion
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?utf-8?q?J=C3=A9r=C3=B4me?= Pouiller 
        <jerome.pouiller@silabs.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Mon, 12 Oct 2020 12:26:15 -0700
Message-ID: <160253077510.310579.8020430999414158134@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-10-09 05:15:30)
> Several *.txt files got converted to yaml. Update their
> references at MAINTAINERS file accordingly.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
