Return-Path: <SRS0=J300=2J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB877C43603
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 05:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E404227BF
	for <linux-clk@archiver.kernel.org>; Thu, 19 Dec 2019 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576735052;
	bh=im5Slt+kvx16OXvVHYowb2/bwnWWlv8T+37tfqixaFA=;
	h=In-Reply-To:References:Cc:Subject:From:To:Date:List-ID:From;
	b=tpoOnjN/+H7xFh6iC89njqIwMlEmg0ETLwlrLyjrybBRUAReMWI8axvoNg21BimaK
	 /24H+7VmTGlsJyn/mhrlSulKLF1vzWWk+eP/Do9sMbq52iimA4ssRdekd1G/SO0TUB
	 z0d1MGCZz2+SGLMlpyCx3jbc9v5o+0pztIO6k2Ng=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfLSF5c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Dec 2019 00:57:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:51688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSF5c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Dec 2019 00:57:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E87C42146E;
        Thu, 19 Dec 2019 05:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735051;
        bh=im5Slt+kvx16OXvVHYowb2/bwnWWlv8T+37tfqixaFA=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=r9Pqg4s1VfIVRourVDzhNYIoiwqaA8hj3cOi2thR05FQ/QBvtXi5wvrSg/FCCMctL
         ZBMsDduwpHVCeai9b8s6wh5N8U02bIjn3zca+LoasSt/nLNWCkbfWmwC0UsX5CFKgO
         QJ1BpvIE4sAZfGF6GlsC8IetakkEqTHafFO9dZLE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576596003-10093-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org> <1576596003-10093-1-git-send-email-jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v11 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:57:30 -0800
Message-Id: <20191219055730.E87C42146E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 07:20:03)
> Convert the qcom,mmcc-X clock controller binding to DT schema.  Add the
> protected-clocks property to the schema to show that is it explicitly
> allowed, instead of relying on the generic, pre-schema binding.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

