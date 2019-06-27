Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0F3C004E6
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 20:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50AF8205C9
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561668785;
	bh=6DUV+PIFMrf8iCORnsjlMTylpfnz0MDPQhy6ykxXKyM=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=bddCFUKAg6GgS98jBqlN8V/nSKD5SmUeGtuuklaqmtRVE9GA3KXzAk7yLgtt0qX1y
	 wuwDQ5hS7Ff60D27Oc0CJ3GE+YpzzT9iClX2mHJyxAl9A7eWdyvERCWs3HCsQZVodu
	 69Xaf2VlFiDUWZBmkw5r69aAGwZmdeUV50SREcJw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfF0UxF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 16:53:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:34984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbfF0UxF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 16:53:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00F2E2075E;
        Thu, 27 Jun 2019 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561668443;
        bh=6DUV+PIFMrf8iCORnsjlMTylpfnz0MDPQhy6ykxXKyM=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=itqa6Ah4EHOb3PMxe73umTQ/36BJhc6+G0vsjh1r3fx/70+PBcWybQXvaVvlG9Hcl
         1j3bTnsrLn4m66yztm4uw3Vd6CNtj9wHTxttTSKzZyEXRKs6l0Rpf12K97zfMo78K7
         68qmSSZ2wESgFJQ+4IxN/0NddOKgAtLHm0sZQ1vM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190507135110.27979-1-mike.looijmans@topic.nl>
References: <20190507135110.27979-1-mike.looijmans@topic.nl>
To:     Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: clk-si544: Implement small frequency change support
Cc:     linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 13:47:22 -0700
Message-Id: <20190627204723.00F2E2075E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mike Looijmans (2019-05-07 06:51:10)
> The Si544 supports changing frequencies "on the fly" when the change is
> less than 950 ppm from the current center frequency. The driver now
> uses the small adjustment routine for implementing this.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---

Applied to clk-next

