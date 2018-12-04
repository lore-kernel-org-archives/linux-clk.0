Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BD4C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 614E020850
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1WIgm+my"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614E020850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbeLDSlJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 13:41:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:48200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbeLDSlI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 13:41:08 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2190E20672;
        Tue,  4 Dec 2018 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543948868;
        bh=tbHQ6dzeXeqSCDV1A1EfWIAPIRjZMIcLL7d1mcVrSmw=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=1WIgm+myrWqA5hfIH9F+dP3bCRdVeuN+DOHeopBV0mU/+GsOg6FOhvW8BJbEJsJyR
         staYkKwp67BhPDS7HLWKlm25+VDcaEqB+3JlVxtbpSQh6zmJfGw/e56OoSDPirs+rs
         PtsQliCzqSx5PTy6hVNz1KImpXQdpqAls6+cPr1M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181204165248.17572-4-k.konieczny@partner.samsung.com>
Cc:     linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165317eucas1p10bef0207ee57a9420911410ed2a22453@eucas1p1.samsung.com>
 <20181204165248.17572-4-k.konieczny@partner.samsung.com>
Message-ID: <154394886754.88331.4490485856492665936@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 3/5] dt-bindings: clk: exynos5433: document imem clock
Date:   Tue, 04 Dec 2018 10:41:07 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kamil Konieczny (2018-12-04 08:52:46)
> Document DT bindings for imem clock of the Samsung Exynos5433 SSS (Securi=
ty
> SubSystem) and SlimSSS IPs.
> =

> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

