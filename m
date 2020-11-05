Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53999C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D119820780
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604544037;
	bh=YJDlIrMK2qyHz2xI1nZtQeYD1mk1WvSapTV23tVc40g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=LIBILOq07fejkf85wu+gpdYuVJVSu54q8PusbHqtO+u1o8UDYgMIKBd+xezuEuwfE
	 QXlGPnBsht9dkP4c797z/d35ZbX35+jaht6P/lPc4GQDUW3kHG+txg1/11JwBfBoAx
	 O22wuu2QBYWEHK75k1n9hjT1rCfgdVZyvtXEqrxs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgKECkh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 21:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgKECkh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 21:40:37 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B01920756;
        Thu,  5 Nov 2020 02:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544036;
        bh=YJDlIrMK2qyHz2xI1nZtQeYD1mk1WvSapTV23tVc40g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=coOMCOSijUsYfXBJz28WfNVXao6QJDMg/dCIomUMt2yrtZSG5gNL2HlGIcAy8LPnr
         fAHDa7iD2ggWDzjET+0KWEedPJah6dnkut24WchXK54UJcHasZtPaJfxCWG2js4s9Q
         rIPkeJTJn+t2CiQJ8AR32FDecVCwdLUIq+mq9u/g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026120221.18984-3-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org> <20201026120221.18984-3-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH v3 2/4] dt-bindings: clock: Add support for LPASS Always ON Controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Wed, 04 Nov 2020 18:40:34 -0800
Message-ID: <160454403493.3965362.5888605653155602340@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Srinivas Kandagatla (2020-10-26 05:02:19)
> Always ON Clock controller is a block inside LPASS which controls
> 1 Glitch free muxes to LPASS codec Macros.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
