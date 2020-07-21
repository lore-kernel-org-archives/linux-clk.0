Return-Path: <SRS0=lm+m=BA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64C4C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 00:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCD0421702
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595292131;
	bh=0Vzzc2WL8yErIT2TSICeVJFxNGXmGc+yQnHWxMLFDEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=dVWDicjOeQmsx51f58L3f42dasOU6gLfiVF9qPRcVindx6Dt9mRakFPUSs3GxXSsa
	 O+cjbA6Rg31Yk4u8PfWOb3ST02uslV68GarZycbnkSEjsuQxDVY+BGEaxCqowh0oW2
	 k7KJuGTVmLTflodeFT4haUjojhcnnXwfbFIU51c0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgGUAmL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 20:42:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgGUAmL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Jul 2020 20:42:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D492B208E4;
        Tue, 21 Jul 2020 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595292130;
        bh=0Vzzc2WL8yErIT2TSICeVJFxNGXmGc+yQnHWxMLFDEo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OYe9rhroqRtt9lPtGJc86RXtJqbqu87hNLFWTPYdbRqk9f5ag1E4LPKgHg7O3V/W5
         6IxQ+R5Hc+M7Ntfhzqe6CQnfWBr6oRAmAY1pz3oZ4ry5F9QJwI+WJ9bO9FmkNN5LMw
         IdKdhpBx0dqekhTCmQTpvfxKS3MKadYw0E9riILI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
References: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v6 0/5] msm8996 CPU scaling support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 20 Jul 2020 17:42:10 -0700
Message-ID: <159529213012.3847286.8807565794510072249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2020-07-20 07:02:15)
>=20
> v6:
>     - Add Acked-by Will tag to l2 kryo accessors patch

I got this one.

>     - Fix msm8996,apcc dt binding file (errors reported by dt_binding_che=
ck)

I've already applied v5. Please send incremental patches to fix the
dt_binding_check problem.
