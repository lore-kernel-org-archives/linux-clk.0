Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BFBC433DF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 19:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7C92072F
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591731906;
	bh=r5ubNta9c7T56fe7MzziZgLkOaPnNqWIBJVyp0fxKys=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=JkpLIM52c2hOXUD0zyKPFJx9EVBttS87xA8hlby+dRr48PY3kitMgXMgOZABY8MFC
	 YVKoSFUerbnZTUCC8svktidIxIweQvj1yb92MQn6EuajHPXdDuOcVwbFR9lJ/TL63v
	 WgT3SSUJ1/z4sfvf+tNrt86uDKjSWe2UsnL9Z4bc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgFITpG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Jun 2020 15:45:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:33392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727966AbgFITpF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Jun 2020 15:45:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFBC8206C3;
        Tue,  9 Jun 2020 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591731905;
        bh=r5ubNta9c7T56fe7MzziZgLkOaPnNqWIBJVyp0fxKys=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VbnNIkjEHExfDVHLexd8TnhAuhKGmDlUiEf0CSUm46vZ+tvs7AF2ZID59ZGoOt7aC
         qsQxXAeW4AS/71+PP99Je3l5Gxc/wPn0WShRYYH5HX5jsUvEPTKSgJuRSH/FUzn5q8
         qSO/ZQFFXhUe3O2NWwckIJd2+lj1jOuWLieFGbUc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609000816.23053-2-sarangmairal@gmail.com>
References: <20200609000816.23053-1-sarangmairal@gmail.com> <20200609000816.23053-2-sarangmairal@gmail.com>
Subject: Re: [PATCH 1/1] clk: add lock protection to clk_hw_round_rate() API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sarang Mairal <sarangmairal@gmail.com>
To:     Sarang Mairal <sarangmairal@gmail.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 09 Jun 2020 12:45:04 -0700
Message-ID: <159173190423.242598.11364508312407434260@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sarang Mairal (2020-06-08 17:08:16)
> clk_hw_round_rate() calls clk_core_round_rate_nolock() which requires
> prepare_lock to be held. It is possible for a clock provider to call
> clk_hw_round_rate() API without holding prepare_lock.

Why is a provider calling clk_hw_round_rate() outside of a clk op like
round_rate or determine_rate? Can you share the callstack here in this
patch?

> In such a scenario,
> lockdep would cause an assertion failure:
> clk_core_round_rate_nolock()
> {
>         lockdep_assert_held(&prepare_lock);
>         ..
> }
>=20
> Close this gap for clk_hw_round_rate() by correctly guarding the call to
> clk_core_round_rate_nolock() with prepare_lock and prepare_unlock.

This is making things worse. By adding the lock here we're making the
prepare lock more recursive which is not intended. Probably the caller
is broken and shouldn't be calling this API from places that aren't
already holding the lock.
