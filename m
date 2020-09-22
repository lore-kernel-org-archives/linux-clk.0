Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CEDC4363D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 18:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A6F20756
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600800511;
	bh=O5iPRQ9oEJMZ6gmJkDSuWU3SXo5ofkcBnZvBBSQwI8w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=TBOk/uaS+xaFvC3Vbg/CEjwGcekiRra+QAc4TzUiFbMHSrAKYhA1mDvoj+iAbpGPw
	 UTkPPku7FL4zH74BO86HGrXdwFrDlM6GkX0tFP4jx+TLcFbQxSBeWjLriKB5/PHbap
	 5YQllGwklFZSToeOqbakFIEexFFH3IG91jdSDI7U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgIVSsa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 14:48:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVSsa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 14:48:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1D1C20715;
        Tue, 22 Sep 2020 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800510;
        bh=O5iPRQ9oEJMZ6gmJkDSuWU3SXo5ofkcBnZvBBSQwI8w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=w6ae9RuX6q5Wmq/T7bnWc5sIn1gKTXDeCbltPVU4txnD+vLbX0KJumJDRcKFD5yxp
         3PPhpHlSq/ct3X2XCKYb+CDGkUSsDXNAWSaH/HbTmc1geAj8Q0hJBTVYhR1qjrbWUn
         FL0RyY0FqMLOMSPl8cF7dXGoxMP+zx7OTp3V1xKM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200904030958.13325-3-jonathan@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-3-jonathan@marek.ca>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: add SM8150 QCOM video clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:48:28 -0700
Message-ID: <160080050874.310579.15028745035280994179@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 20:09:51)
> Add device tree bindings for video clock controller for SM8150 SoCs.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

This one should be fine after sorting the lists in the first patch.
