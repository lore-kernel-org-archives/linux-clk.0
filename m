Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604D3C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3677B61051
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 18:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbhICSdW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:33:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230421AbhICSdW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 14:33:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B6060FC0;
        Fri,  3 Sep 2021 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630693942;
        bh=JW2bkfWhcCMn3dI/Qz+LQznqbuZnfNghAuFhbiBJqyk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DxvN1OYsrLl6FTJwLbZGgpiGw8M2rh7SFz8T2qsrYqJETwECnhNd28q5/FYOhOLMG
         JiRcGjKuKG+kHK/Wb2pKsqhCLcsbKTVV6pYYop4ywgtCxi9GC8zc8iwh2vikAMYDAn
         wudjYtnwbmdzYjQaq0AexMHFclZup/ZcO873BSHM9sC+KNO7OT9Rqul3V7Ya2q/EJ0
         1vBVT5JI4xeMqkexTXQODbjhlLlaLrjo3JhzDNVgdADBIZi2i330j4nER0g0GWIQ6E
         dUsUOv3RDGbnFkVZvYH6TOL77ImLdi/pVqDbiDkoXYfEON/irlhSiIEVnsEZTvUJ5v
         owoDwdGCJiJiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210903152615.31453-1-kabel@kernel.org>
References: <20210903152615.31453-1-kabel@kernel.org>
Subject: Re: [PATCH] dt-bindings: clk: fixed-mmio-clock: Convert to YAML
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jan Kotas <jank@cadence.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Marek Behun <kabel@kernel.org>
To:     Marek Behun <kabel@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 03 Sep 2021 11:32:20 -0700
Message-ID: <163069394099.405991.703634222867535029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Behun (2021-09-03 08:26:15)
> Convert the binding documentatoin for fixed-mmio-clock to YAML.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
